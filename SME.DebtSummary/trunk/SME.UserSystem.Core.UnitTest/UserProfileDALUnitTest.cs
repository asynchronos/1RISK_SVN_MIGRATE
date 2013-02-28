using System;
using System.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.UserSystem.Core.BL;
using SME.UserSystem.Core.DTO;

namespace SME.UserSystem.Core.UnitTest
{
    /// <summary>
    /// Summary description for AsynchronousProfileUnitTest
    /// </summary>
    [TestClass]
    public class UserProfileDALUnitTest
    {
        public UserProfileDALUnitTest()
        {
            //
            // TODO: Add constructor logic here
            //
        }

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
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //

        #endregion Additional test attributes

        [TestMethod]
        public void TestGetAndUpdateUserProfile()
        {
            string empId = "249888";
            string appName = ConfigurationManager.AppSettings["APPLICATION_NAME"]; ;

            IUserProfileDTO profile;

            using (IUserBL bl = new UserBL())
            {
                profile = bl.GetUserProfileDTO(empId, appName);
                profile.LAST_ACTIVITY = "TestGetAndUpdateUserProfile";
                profile.LAST_ACTIVITY_DATE = DateTime.Now;
                profile.LAST_SIGN_ON_DATE = DateTime.Now;

                bl.UpdateUserProfileDTO(profile, profile.APP_KEY.Value);
                bl.Save();
            }

            Assert.IsNotNull(profile);

            Assert.IsNotNull(profile.CATEGORIES_STR);
            Assert.AreNotEqual(string.Empty, profile.CATEGORIES_STR);
            Assert.AreEqual("249888", profile.EMP_ID);
            Assert.AreEqual("นายประกิต สิริศักดิ์สถาพร", profile.EMP_FULLNAME);
            Assert.AreEqual("Mr.Prakit Sirisaksathaporn", profile.EMP_FULLNAME_E);
            Assert.IsNotNull(profile.CATEGORY_LIST);
            Assert.AreEqual(2, profile.CATEGORY_LIST.Count);
        }

        //[TestMethod]
        //public void TestInsertUpdateDeleteUserProfile()
        //{
        //    string empId = "249987";
        //    string appName = ConfigurationManager.AppSettings["APPLICATION_NAME"];

        //    UserProfileBase profile;

        //    //test case already exists in USER_DATA

        //    using (UserSystemEntities context = new UserSystemEntities())
        //    {
        //        using (IUserProfileRepository userRepo = new UserProfileRepository(context))
        //        {
        //            profile = userRepo.GetUserProfile(empId, appName);
        //            if (null == profile)
        //            {
        //                profile = userRepo.CreateProfileForUser(empId, appName);
        //            }

        //            userRepo.Save();
        //        }
        //    }

        //    Assert.IsNotNull(profile);

        //    Assert.IsNotNull(profile.CATEGORIES_STR);
        //    Assert.AreNotEqual(string.Empty, profile.CATEGORIES_STR);
        //    Assert.AreEqual("249987", profile.EMP_ID);
        //    Assert.AreEqual("นายพิชยา ประสาทพร", profile.EMP_FULLNAME);
        //    Assert.AreEqual("Mr.Pichaya Prasartporn", profile.EMP_FULLNAME_E);
        //    Assert.IsNotNull(profile.CATEGORY_LIST);
        //    Assert.AreEqual(2, profile.CATEGORY_LIST.Count);

        //    //test case not exists in USER_DATA but exists in TB_EMPLOYEE
        //    empId = "000372";
        //    UserProfileBase backupProfile = null;
        //    USER_DATA backupUserData = null;

        //    using (UserSystemEntities context = new UserSystemEntities())
        //    {
        //        using (IUserProfileRepository userRepo = new UserProfileRepository(context))
        //        {
        //            //back up profile if exists
        //            backupProfile = userRepo.GetUserProfile(empId, appName);
        //            if (null != backupProfile)
        //            {
        //                //delete app profile
        //                userRepo.DeleteAppProfile(empId, appName);
        //            }

        //            backupUserData = userRepo.GetUserData(empId);
        //            if (null != backupUserData)
        //            {
        //                //delete user data
        //                userRepo.DeleteUserData(empId);
        //            }

        //            userRepo.Save();
        //            //save before test

        //            USER_DATA userData = userRepo.GetUserData(empId);
        //            Assert.IsNull(userData);
        //            profile = userRepo.GetUserProfile(empId, appName);

        //            Assert.IsNull(profile);
        //            if (null == profile)//must alway true
        //            {
        //                profile = userRepo.CreateProfileForUser(empId, appName);
        //            }

        //            userRepo.Save();
        //        }
        //    }

        //    Assert.IsNotNull(profile);

        //    if (null != backupProfile)
        //    {
        //        Assert.AreNotEqual(string.Empty, profile.CATEGORIES_STR);
        //        Assert.AreEqual(backupProfile.EMP_ID, profile.EMP_ID);
        //        Assert.AreEqual(backupProfile.EMP_FULLNAME, profile.EMP_FULLNAME);
        //        Assert.AreEqual(backupProfile.EMP_FULLNAME_E, profile.EMP_FULLNAME_E);
        //        Assert.IsNull(profile.CATEGORY_LIST);
        //    }

        //    if (null != backupUserData)
        //    {
        //        Assert.AreEqual(backupUserData.EMP_ID, profile.EMP_ID);
        //        Assert.AreEqual(backupUserData.PASSWD, profile.PASSWD);
        //        Assert.AreEqual(backupUserData.EMAIL, profile.EMAIL);
        //        Assert.AreEqual(backupUserData.LAST_SIGN_ON_DATE, profile.LAST_SIGN_ON_DATE);
        //    }
        //}
    }
}