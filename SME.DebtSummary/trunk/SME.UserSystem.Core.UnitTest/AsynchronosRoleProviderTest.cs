using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.UserSystem.Core.Providers;

namespace SME.UserSystem.Core.UnitTest
{
    /// <summary>
    ///This is a test class for AsynchronosRoleProviderTest and is intended
    ///to contain all AsynchronosRoleProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class AsynchronosRoleProviderTest
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
        //
        //Use ClassCleanup to run code after all tests in a class have run
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

        private string testUsername = "249888";
        private string testPassword = "big@7426";

        /// <summary>
        ///A test for AsynchronosRoleProvider Constructor
        ///</summary>
        [TestMethod()]
        public void AsynchronosRoleProviderConstructorTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider();
            //Assert.Inconclusive("TODO: Implement code to verify target");
            Assert.IsNotNull(target);
        }

        /// <summary>
        ///A test for AddUsersToRoles
        ///</summary>
        [TestMethod()]
        public void AddUsersToRolesTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string[] usernames = { "TestCreate" }; // TODO: Initialize to an appropriate value
            string[] roleNames = { "1100", "1165" }; // TODO: Initialize to an appropriate value

            target.AddUsersToRoles(usernames, roleNames);

            AsynchronosRoleProvider provider = new AsynchronosRoleProvider();
            string[] categories = provider.GetRolesForUser(usernames[0]);

            Assert.AreEqual(roleNames.Length, categories.Length);

            for (int i = 0; i < categories.Length; i++)
            {
                Assert.AreEqual(roleNames[i], categories[i]);
            }
        }

        /// <summary>
        ///A test for CreateRole
        ///</summary>
        [TestMethod()]
        [ExpectedException(typeof(System.NotImplementedException))]

        public void CreateRoleTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string roleName = string.Empty; // TODO: Initialize to an appropriate value
            target.CreateRole(roleName);
            //Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for DeleteRole
        ///</summary>
        [TestMethod()]
        public void DeleteRoleTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string roleName = string.Empty; // TODO: Initialize to an appropriate value
            bool throwOnPopulatedRole = false; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.DeleteRole(roleName, throwOnPopulatedRole);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FindUsersInRole
        ///</summary>
        [TestMethod()]
        public void FindUsersInRoleTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string roleName = string.Empty; // TODO: Initialize to an appropriate value
            string usernameToMatch = string.Empty; // TODO: Initialize to an appropriate value
            string[] expected = null; // TODO: Initialize to an appropriate value
            string[] actual;
            actual = target.FindUsersInRole(roleName, usernameToMatch);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetAllRoles
        ///</summary>
        [TestMethod()]
        public void GetAllRolesTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string[] expected = null; // TODO: Initialize to an appropriate value
            string[] actual;
            actual = target.GetAllRoles();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetRolesForUser
        ///</summary>
        [TestMethod()]
        public void GetRolesForUserTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string username = testUsername; // TODO: Initialize to an appropriate value
            string[] expected = { "1165" }; // TODO: Initialize to an appropriate value
            string[] actual;
            actual = target.GetRolesForUser(username);

            Assert.AreEqual(expected.Length, actual.Length);

            for (int i = 0; i < expected.Length; i++)
            {
                Assert.AreEqual(expected[i], actual[i]);
            }
            //Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUsersInRole
        ///</summary>
        [TestMethod()]
        public void GetUsersInRoleTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string roleName = string.Empty; // TODO: Initialize to an appropriate value
            string[] expected = null; // TODO: Initialize to an appropriate value
            string[] actual;
            actual = target.GetUsersInRole(roleName);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for IsUserInRole
        ///</summary>
        [TestMethod()]
        public void IsUserInRoleTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string username = testUsername; // TODO: Initialize to an appropriate value
            string roleName = "1165"; // TODO: Initialize to an appropriate value
            bool expected = true; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.IsUserInRole(username, roleName);
            Assert.AreEqual(expected, actual);
            //Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RemoveUsersFromRoles
        ///</summary>
        [TestMethod()]
        public void RemoveUsersFromRolesTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string[] usernames = null; // TODO: Initialize to an appropriate value
            string[] roleNames = null; // TODO: Initialize to an appropriate value
            target.RemoveUsersFromRoles(usernames, roleNames);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for RoleExists
        ///</summary>
        [TestMethod()]
        public void RoleExistsTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string roleName = string.Empty; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.RoleExists(roleName);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ApplicationName
        ///</summary>
        [TestMethod()]
        public void ApplicationNameTest()
        {
            AsynchronosRoleProvider target = new AsynchronosRoleProvider(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.ApplicationName = expected;
            actual = target.ApplicationName;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}