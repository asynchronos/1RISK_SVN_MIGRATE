using System;
using System.Configuration;
using log4net;
using SME.UserSystem.Core.AD;

namespace TestLDapConsole
{
    public class Program
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private static void Main(string[] args)
        {
            //prepare parameter
            string ldapServer = ConfigurationManager.AppSettings["LDAP_SERVER"];//domain name
            string ldapPort = ConfigurationManager.AppSettings["LDAP_PORT"];
            string username = ConfigurationManager.AppSettings["LDAP_USERNAME"];//domain name
            string password = ConfigurationManager.AppSettings["LDAP_PASSWORD"];
            string wrongPassword = ConfigurationManager.AppSettings["LDAP_WRONG_PASSWORD"];

            Console.WriteLine("Start Test LDAP.");
            Console.WriteLine("");

            Console.WriteLine("Test Parameter");
            Console.WriteLine("LDAP_SERVER : " + ldapServer);
            Console.WriteLine("LDAP_PORT : " + ldapPort);
            Console.WriteLine("LDAP_USERNAME : " + username);
            Console.WriteLine("LDAP_PASSWORD : " + password);
            Console.WriteLine("LDAP_WRONG_PASSWORD : " + wrongPassword);
            Console.WriteLine("");

            LdapAuthentication target = new LdapAuthentication(ldapServer); // TODO: Initialize to an appropriate value

            Console.WriteLine("Test wrong password.");
            try
            {
                Console.WriteLine("Authen : " + target.IsAuthenticated(username, wrongPassword));
                target.IsAuthenticated(username, wrongPassword);
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Logon failure: unknown user name or bad password."))
                {
                    Console.WriteLine("Test Pass >> Authen fail.");
                }
                else
                {
                    Console.WriteLine("Have Exception.");
                    Console.WriteLine(ex.Message);
                }
            }

            Console.WriteLine("");
            Console.WriteLine("Test right password.");
            try
            {
                if (target.IsAuthenticated(username, password))
                {
                    Console.WriteLine("Test Pass >> Authen success.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Have Exception.");
                Console.WriteLine(ex.Message);
            }

            Console.WriteLine("");
            Console.WriteLine("End Test LDAP.");
            Console.ReadLine();
        }
    }
}