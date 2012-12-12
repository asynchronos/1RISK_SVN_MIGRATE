using System.Configuration;
using System.DirectoryServices;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.UserSystem.Core.AD;

namespace SME.UserSystem.Core.UnitTest
{
    /// <summary>
    ///This is a test class for LdapAuthenticationTest and is intended
    ///to contain all LdapAuthenticationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class LdapAuthenticationTest
    {
        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes

        //
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}

        ////Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}

        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //

        #endregion Additional test attributes

        /// <summary>
        ///A test for GetGroups
        ///</summary>
        //[TestMethod()]
        //public void GetGroupsTest()
        //{
        //    string path = string.Empty; // TODO: Initialize to an appropriate value
        //    LdapAuthentication target = new LdapAuthentication(path); // TODO: Initialize to an appropriate value
        //    string expected = string.Empty; // TODO: Initialize to an appropriate value
        //    string actual;
        //    //actual = target.GetGroups();
        //    //Assert.AreEqual(expected, actual);
        //    //Assert.Inconclusive("Verify the correctness of this test method.");
        //}

        [TestMethod]
        [ExpectedException(typeof(DirectoryServicesCOMException),
           "Logon failure: unknown user name or bad password.")]
        public void AuthenticatedFailureTest()
        {
            string ldapServer = ConfigurationManager.AppSettings["LDAP_SERVER_UAT"];//domain name
            string ldapPort = ConfigurationManager.AppSettings["LDAP_PORT"];

            string path = "LDAP://" + ldapServer + ":" + ldapPort;

            LdapAuthentication target = new LdapAuthentication(path); // TODO: Initialize to an appropriate value
            string username = "136143"; // TODO: Initialize to an appropriate value
            string pwd = "test"; // TODO: Initialize to an appropriate value

            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.IsAuthenticated(username, pwd, ldapServer);
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///A test for IsAuthenticated
        ///</summary>
        [TestMethod()]
        public void IsAuthenticatedTest()
        {
            string ldapServer = ConfigurationManager.AppSettings["LDAP_SERVER_UAT"];//domain name
            string ldapPort = ConfigurationManager.AppSettings["LDAP_PORT"];
            Assert.AreEqual("172.19.60.112", ldapServer);

            string path = "LDAP://" + ldapServer + ":" + ldapPort;
            LdapAuthentication target = new LdapAuthentication(path); // TODO: Initialize to an appropriate value
            string username = "136143"; // TODO: Initialize to an appropriate value
            string pwd = "P@ssw0rd"; // TODO: Initialize to an appropriate value

            bool expected = true; // TODO: Initialize to an appropriate value
            bool actual;
            //actual = target.IsAuthenticated(username, pwd, ldapServer);
            //Assert.AreEqual(expected, actual);

            //production server
            ldapServer = ConfigurationManager.AppSettings["LDAP_SERVER"];
            Assert.AreEqual("bayad.co.th", ldapServer);

            path = "LDAP://" + ldapServer + ":" + ldapPort;

            username = "249888";
            pwd = "big(7426";

            expected = true;
            target = new LdapAuthentication(path);
            actual = target.IsAuthenticated(username, pwd, ldapServer);
            Assert.AreEqual(expected, actual);
        }
    }
}