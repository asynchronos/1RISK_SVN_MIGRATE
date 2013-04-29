using System.Configuration;
using System.Web.Security;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.UserSystem.Core.Providers;

namespace SME.UserSystem.Core.UnitTest
{
    /// <summary>
    ///This is a test class for AsynchronosMembershipProviderTest and is intended
    ///to contain all AsynchronosMembershipProviderTest Unit Tests
    ///</summary>
    [TestClass()]
    public class AsynchronosMembershipProviderTest
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
        private string testPassword = "big#7426";

        /// <summary>
        ///A test for AsynchronosMembershipProvider Constructor
        ///</summary>
        [TestMethod()]
        public void AsynchronosMembershipProviderConstructorTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider();
            Assert.IsNotNull(target);
        }

        /// <summary>
        ///A test for ChangePassword
        ///</summary>
        [TestMethod()]
        public void ChangePasswordTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            string oldPassword = string.Empty; // TODO: Initialize to an appropriate value
            string newPassword = string.Empty; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.ChangePassword(username, oldPassword, newPassword);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ChangePasswordQuestionAndAnswer
        ///</summary>
        [TestMethod()]
        public void ChangePasswordQuestionAndAnswerTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            string password = string.Empty; // TODO: Initialize to an appropriate value
            string newPasswordQuestion = string.Empty; // TODO: Initialize to an appropriate value
            string newPasswordAnswer = string.Empty; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.ChangePasswordQuestionAndAnswer(username, password, newPasswordQuestion, newPasswordAnswer);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CreateUser
        ///</summary>
        [TestMethod()]
        public void CreateUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = "TestCreate"; // TODO: Initialize to an appropriate value
            string password = "test"; // TODO: Initialize to an appropriate value
            string email = "test@mail.com"; // TODO: Initialize to an appropriate value
            string passwordQuestion = string.Empty; // TODO: Initialize to an appropriate value
            string passwordAnswer = string.Empty; // TODO: Initialize to an appropriate value
            bool isApproved = false; // TODO: Initialize to an appropriate value
            object providerUserKey = null; // TODO: Initialize to an appropriate value
            MembershipCreateStatus status = new MembershipCreateStatus(); // TODO: Initialize to an appropriate value
            MembershipCreateStatus statusExpected = MembershipCreateStatus.Success; // TODO: Initialize to an appropriate value
            //MembershipUser expected = null; // TODO: Initialize to an appropriate value
            MembershipUser actual;
            actual = target.CreateUser(username, password, email, passwordQuestion, passwordAnswer, isApproved, providerUserKey, out status);

            Assert.AreEqual(statusExpected, status);
            Assert.IsInstanceOfType(actual, typeof(AsynchronosMembershipUser));

            AsynchronosMembershipUser castActual = (AsynchronosMembershipUser)actual;

            Assert.AreEqual(username, castActual.UserName);
            Assert.AreEqual(password, castActual.PASSWD);
            Assert.AreEqual(email, castActual.Email);
            Assert.AreEqual(passwordQuestion, castActual.PasswordQuestion);
            Assert.AreEqual(password, castActual.GetPassword(passwordAnswer));
            Assert.AreEqual(isApproved, castActual.IsApproved);
            Assert.AreEqual(username, castActual.ProviderUserKey);
        }

        /// <summary>
        ///A test for DeleteUser
        ///</summary>
        [TestMethod()]
        public void DeleteUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            bool deleteAllRelatedData = false; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.DeleteUser(username, deleteAllRelatedData);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FindUsersByEmail
        ///</summary>
        [TestMethod()]
        public void FindUsersByEmailTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string emailToMatch = string.Empty; // TODO: Initialize to an appropriate value
            int pageIndex = 0; // TODO: Initialize to an appropriate value
            int pageSize = 0; // TODO: Initialize to an appropriate value
            int totalRecords = 0; // TODO: Initialize to an appropriate value
            int totalRecordsExpected = 0; // TODO: Initialize to an appropriate value
            MembershipUserCollection expected = null; // TODO: Initialize to an appropriate value
            MembershipUserCollection actual;
            actual = target.FindUsersByEmail(emailToMatch, pageIndex, pageSize, out totalRecords);
            Assert.AreEqual(totalRecordsExpected, totalRecords);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FindUsersByName
        ///</summary>
        [TestMethod()]
        public void FindUsersByNameTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string usernameToMatch = string.Empty; // TODO: Initialize to an appropriate value
            int pageIndex = 0; // TODO: Initialize to an appropriate value
            int pageSize = 0; // TODO: Initialize to an appropriate value
            int totalRecords = 0; // TODO: Initialize to an appropriate value
            int totalRecordsExpected = 0; // TODO: Initialize to an appropriate value
            MembershipUserCollection expected = null; // TODO: Initialize to an appropriate value
            MembershipUserCollection actual;
            actual = target.FindUsersByName(usernameToMatch, pageIndex, pageSize, out totalRecords);
            Assert.AreEqual(totalRecordsExpected, totalRecords);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetAllUsers
        ///</summary>
        [TestMethod()]
        public void GetAllUsersTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int pageIndex = 0; // TODO: Initialize to an appropriate value
            int pageSize = 0; // TODO: Initialize to an appropriate value
            int totalRecords = 0; // TODO: Initialize to an appropriate value
            int totalRecordsExpected = 0; // TODO: Initialize to an appropriate value
            MembershipUserCollection expected = null; // TODO: Initialize to an appropriate value
            MembershipUserCollection actual;
            actual = target.GetAllUsers(pageIndex, pageSize, out totalRecords);
            Assert.AreEqual(totalRecordsExpected, totalRecords);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetNumberOfUsersOnline
        ///</summary>
        [TestMethod()]
        public void GetNumberOfUsersOnlineTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.GetNumberOfUsersOnline();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetPassword
        ///</summary>
        [TestMethod()]
        public void GetPasswordTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            string answer = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.GetPassword(username, answer);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUser
        ///</summary>
        [TestMethod()]
        public void GetUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            bool userIsOnline = false; // TODO: Initialize to an appropriate value
            MembershipUser expected = null; // TODO: Initialize to an appropriate value
            MembershipUser actual;
            actual = target.GetUser(username, userIsOnline);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUser
        ///</summary>
        [TestMethod()]
        public void GetUserTest1()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            object providerUserKey = null; // TODO: Initialize to an appropriate value
            bool userIsOnline = false; // TODO: Initialize to an appropriate value
            MembershipUser expected = null; // TODO: Initialize to an appropriate value
            MembershipUser actual;
            actual = target.GetUser(providerUserKey, userIsOnline);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        

        /// <summary>
        ///A test for GetUserNameByEmail
        ///</summary>
        [TestMethod()]
        public void GetUserNameByEmailTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string email = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.GetUserNameByEmail(email);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ResetPassword
        ///</summary>
        [TestMethod()]
        public void ResetPasswordTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = string.Empty; // TODO: Initialize to an appropriate value
            string answer = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = target.ResetPassword(username, answer);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for UnlockUser
        ///</summary>
        [TestMethod()]
        public void UnlockUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string userName = string.Empty; // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.UnlockUser(userName);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for UpdateUser
        ///</summary>
        [TestMethod()]
        public void UpdateUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            MembershipUser user = null; // TODO: Initialize to an appropriate value
            target.UpdateUser(user);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for ValidateUser
        ///</summary>
        [TestMethod()]
        public void ValidateUserTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string username = "249888"; // TODO: Initialize to an appropriate value
            string password = "big#7426"; // TODO: Initialize to an appropriate value
            bool expected = true; // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.ValidateUser(username, password);
            Assert.AreEqual(expected, actual);
            //Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ApplicationName
        ///</summary>
        [TestMethod()]
        public void ApplicationNameTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string expected = ConfigurationManager.AppSettings["APPLICATION_NAME"]; // TODO: Initialize to an appropriate value
            string actual;
            //no set method
            //target.ApplicationName = expected;
            actual = target.ApplicationName;
            Assert.AreEqual(expected, actual);
        }

        /// <summary>
        ///A test for EnablePasswordReset
        ///</summary>
        [TestMethod()]
        public void EnablePasswordResetTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.EnablePasswordReset;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for EnablePasswordRetrieval
        ///</summary>
        [TestMethod()]
        public void EnablePasswordRetrievalTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.EnablePasswordRetrieval;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for MaxInvalidPasswordAttempts
        ///</summary>
        [TestMethod()]
        public void MaxInvalidPasswordAttemptsTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.MaxInvalidPasswordAttempts;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for MinRequiredNonAlphanumericCharacters
        ///</summary>
        [TestMethod()]
        public void MinRequiredNonAlphanumericCharactersTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.MinRequiredNonAlphanumericCharacters;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for MinRequiredPasswordLength
        ///</summary>
        [TestMethod()]
        public void MinRequiredPasswordLengthTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.MinRequiredPasswordLength;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordAttemptWindow
        ///</summary>
        [TestMethod()]
        public void PasswordAttemptWindowTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            int actual;
            actual = target.PasswordAttemptWindow;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordFormat
        ///</summary>
        [TestMethod()]
        public void PasswordFormatTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            MembershipPasswordFormat actual;
            actual = target.PasswordFormat;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordStrengthRegularExpression
        ///</summary>
        [TestMethod()]
        public void PasswordStrengthRegularExpressionTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            string actual;
            actual = target.PasswordStrengthRegularExpression;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RequiresQuestionAndAnswer
        ///</summary>
        [TestMethod()]
        public void RequiresQuestionAndAnswerTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.RequiresQuestionAndAnswer;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RequiresUniqueEmail
        ///</summary>
        [TestMethod()]
        public void RequiresUniqueEmailTest()
        {
            AsynchronosMembershipProvider target = new AsynchronosMembershipProvider(); // TODO: Initialize to an appropriate value
            bool actual;
            actual = target.RequiresUniqueEmail;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}