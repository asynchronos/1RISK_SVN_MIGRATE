using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.UserSystem.Core.AD;
using SME.UserSystem.Core.Exceptions;

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

        //private bool MakeLockedUser(string username)
        //{
        //    LdapAuthentication target = new LdapAuthentication(); // TODO: Initialize to an appropriate value
        //    for (int i = 1; i <= 6; i++)
        //    {
        //        try
        //        {
        //            target.IsAuthenticated(username, "12345678");
        //        }
        //        catch (LDAPInfoException ldapEx)
        //        {
        //            //ignore
        //        }
        //        catch (System.Runtime.InteropServices.COMException ComEx)
        //        {
        //            Assert.AreEqual(6, i);
        //            //if (ComEx.Message.Equals("Logon failure: unknown user name or bad password."))
        //            //{
        //            //    //ignore
        //            //}
        //            //else
        //            //{
        //            //    throw new System.Exception("i:" + i + "-" + ComEx.Message);
        //            //}
        //        }
        //    }

        //    return true;
        //}

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
        [ExpectedException(typeof(LDAPInfoException),
           "Logon failure: unknown user name or bad password.")]
        public void AuthenticatedFailureTest()
        {
            LdapAuthentication target = new LdapAuthentication(); // TODO: Initialize to an appropriate value
            string username = "249888"; // TODO: Initialize to an appropriate value
            string pwd = "test"; // TODO: Initialize to an appropriate value

            target.IsAuthenticated(username, pwd);
        }

        /// <summary>
        ///A test for IsAuthenticated
        ///</summary>
        [TestMethod()]
        public void AuthenticatedSuccessTest()
        {
            string username = "249888";
            string pwd = "big#7426";

            bool expected = true;
            LdapAuthentication target = new LdapAuthentication();
            bool actual = target.IsAuthenticated(username, pwd);
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        [ExpectedException(typeof(LDAPInfoException),
           "Username 338251 in not exists.")]
        public void NotFoundUserTest()
        {
            //string ldapServer = ConfigurationManager.AppSettings["LDAP_SERVER_UAT"];//domain name
            //Assert.AreEqual("172.19.60.112", ldapServer);
            //LdapAuthentication target = new LdapAuthentication(ldapServer); // TODO: Initialize to an appropriate value

            LdapAuthentication target = new LdapAuthentication(); // TODO: Initialize to an appropriate value
            string username = "338251"; // TODO: Initialize to an appropriate value
            string pwd = "P@ssw0rd"; // TODO: Initialize to an appropriate value

            bool actual;
            actual = target.IsAuthenticated(username, pwd);
        }

        //[TestMethod]
        //[ExpectedException(typeof(SME.UserSystem.Core.Exceptions.LDAPInfoException),
        //   "Username 249888 in AD is Locked.")]
        //public void UserLockedTest(string username)
        //{
        //    LdapAuthentication target = new LdapAuthentication(); // TODO: Initialize to an appropriate value
        //    //string username = "249888"; // TODO: Initialize to an appropriate value
        //    string pwd = "big@7426"; // TODO: Initialize to an appropriate value

        //    if (MakeLockedUser("249888"))
        //    {
        //        try
        //        {
        //            target.IsAuthenticated(username, pwd);
        //        }
        //        catch (System.Exception ex)
        //        {
        //            Assert.AreEqual("Username 249888 in AD is Locked.", ex.Message);
        //        }
        //    }
        //}

        //[TestMethod]
        //public void UserUnlockedTest()
        //{
        //    LdapAuthentication target = new LdapAuthentication(); // TODO: Initialize to an appropriate value
        //    string username = "249888"; // TODO: Initialize to an appropriate value
        //    string pwd = "big@7426"; // TODO: Initialize to an appropriate value

        //    try
        //    {
        //        this.UserLockedTest(username);
        //    }
        //    catch (Exception ex)
        //    {
        //        //ignore
        //    }

        //    Assert.IsTrue(target.IsUserLocked(username));
        //    target.UnlockedUser(username);
        //    Assert.IsFalse(target.IsUserLocked(username));
        //}
    }
}