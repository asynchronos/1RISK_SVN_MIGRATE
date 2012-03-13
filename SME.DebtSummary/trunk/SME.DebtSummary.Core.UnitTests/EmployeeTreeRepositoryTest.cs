using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.DebtSummary.Core.DAL;

namespace SME.DebtSummary.Core.UnitTests
{
    /// <summary>
    ///This is a test class for EmployeeTreeRepositoryTest and is intended
    ///to contain all EmployeeTreeRepositoryTest Unit Tests
    ///</summary>
    [TestClass()]
    public class EmployeeTreeRepositoryTest
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

        /// <summary>
        ///A test for GetEmployeeTree
        ///</summary>
        [TestMethod()]
        public void GetEmployeeTreeTest()
        {
            EmployeeTreeRepository target = new EmployeeTreeRepository(); // TODO: Initialize to an appropriate value
            List<GetEmployeeTree_Result> expected = null; // TODO: Initialize to an appropriate value
            List<GetEmployeeTree_Result> actual;
            actual = target.GetEmployeeTree();
            Assert.IsNotNull(actual);
            Assert.AreEqual(typeof(List<GetEmployeeTree_Result>), actual.GetType());

            int i = 0;
            foreach (GetEmployeeTree_Result r in actual)
            {
                i++;
            }
            Assert.AreEqual(130, i);

            Assert.AreEqual("นายยุกต์ ศุทธรัตน์", actual.FirstOrDefault().CATEGORY_DESC);
            Assert.AreEqual("นายยุกต์ ศุทธรัตน์", actual.FirstOrDefault().CATEGORY_DESC_TH);

            Assert.AreEqual("------Mr Kattagrit Pragobphol", actual.LastOrDefault().CATEGORY_DESC);
            Assert.AreEqual("------นาย คตกฤษ ประกอบผล", actual.LastOrDefault().CATEGORY_DESC_TH);
        }

        /// <summary>
        ///A test for GetEmployeeTree
        ///</summary>
        [TestMethod()]
        public void GetEmployeeTreeWithEmpFilterTest()
        {
            EmployeeTreeRepository target = new EmployeeTreeRepository(); // TODO: Initialize to an appropriate value
            string rootEmpId = "119016"; // TODO: Initialize to an appropriate value
            List<GetEmployeeTree_Result> expected = null; // TODO: Initialize to an appropriate value
            List<GetEmployeeTree_Result> actual;
            actual = target.GetEmployeeTree(rootEmpId);
            Assert.IsNotNull(actual);
            Assert.AreEqual(typeof(List<GetEmployeeTree_Result>), actual.GetType());
            Assert.AreEqual(22, actual.Count);

            bool hasEmp = false;
            foreach (GetEmployeeTree_Result r in actual)
            {
                if (r.CATEGORY_VALUE.Equals("315077"))
                {
                    hasEmp = true;
                }
            }

            Assert.IsTrue(hasEmp);

            rootEmpId = "204263";
            actual = target.GetEmployeeTree(rootEmpId);
            Assert.AreEqual(6, actual.Count);

            rootEmpId = "245191";
            actual = target.GetEmployeeTree(rootEmpId);
            Assert.AreEqual(1, actual.FirstOrDefault().TREE_LEVEL);

            Assert.AreEqual("นายภาคิไนย ณ เชียงใหม่", actual.FirstOrDefault().CATEGORY_DESC);
            Assert.AreEqual("นายภาคิไนย ณ เชียงใหม่", actual.FirstOrDefault().CATEGORY_DESC_TH);

            Assert.AreEqual("---Mr Kattagrit Pragobphol", actual.LastOrDefault().CATEGORY_DESC);
            Assert.AreEqual("---นาย คตกฤษ ประกอบผล", actual.LastOrDefault().CATEGORY_DESC_TH);
        }

        /// <summary>
        ///A test for ClearCache
        ///</summary>
        [TestMethod()]
        public void ClearCacheTest()
        {
            EmployeeTreeRepository target = new EmployeeTreeRepository(); // TODO: Initialize to an appropriate value
            target.GetEmployeeTree();
            Assert.IsTrue(target.Cache.IsSet(EmployeeTreeRepository.CACHE_NAME));
            target.ClearCache();
            Assert.IsFalse(target.Cache.IsSet(EmployeeTreeRepository.CACHE_NAME));
        }
    }
}