using System.Globalization;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SME.DebtSummary.Core.DAL;
using SME.DebtSummary.Core.Model;

namespace SME.DebtSummary.Core.UnitTests
{
    /// <summary>
    ///This is a test class for ByCusCIFRespositoryTest and is intended
    ///to contain all ByCusCIFRespositoryTest Unit Tests
    ///</summary>
    [TestClass()]
    public class ByCusCIFRespositoryTest
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
        ///A test for GetByCusCIFSMEsProjected
        ///</summary>
        [TestMethod()]
        public void GetByCusCIFSMEsProjectedTest()
        {
            ByCusCIFRespository target = new ByCusCIFRespository(); // TODO: Initialize to an appropriate value
            string rootEmpId = "119016"; // TODO: Initialize to an appropriate value
            string misCustSizeId = null;
            string misStatusId = null;
            string customerClass = null;
            //IQueryable<CustomerDebtViewModel> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<CustomerDebtViewModel> actual;
            actual = target.GetByCusCIFSMEsProjected(rootEmpId, misCustSizeId, misStatusId, customerClass);

            Assert.IsNotNull(actual);
            //Assert.AreEqual(typeof(CustomerDebtViewModel), actual.ElementType);

            CustomerDebtViewModel cif18 = null;

            int count = 0;
            foreach (CustomerDebtViewModel c in actual)
            {
                if (c.CIF == 18)
                {
                    cif18 = c;
                }

                count++;
            }
            Assert.AreEqual(2506, count);
            Assert.AreEqual((decimal)22587600.11, cif18.Principal);

            rootEmpId = "204263";
            actual = target.GetByCusCIFSMEsProjected(rootEmpId, misCustSizeId, misStatusId, customerClass);
            Assert.AreEqual(532, actual.ToList().Count);

            rootEmpId = "All";
            misCustSizeId = "All";
            actual = target.GetByCusCIFSMEsProjected(rootEmpId, misCustSizeId, misStatusId, customerClass);
            Assert.AreEqual(25673, actual.ToList().Count);

            //rootEmpId = "119016";
            misCustSizeId = "1";
            actual = target.GetByCusCIFSMEsProjected(rootEmpId, misCustSizeId, misStatusId, customerClass);
            Assert.AreEqual(517, actual.ToList().Count);

            misCustSizeId = "4";
            actual = target.GetByCusCIFSMEsProjected(rootEmpId, misCustSizeId, misStatusId, customerClass);
            Assert.AreEqual(471, actual.ToList().Count);
        }

        ///// <summary>
        /////A test for GetByCusCIFSMEs
        /////</summary>
        //[TestMethod()]
        //public void GetByCusCIFSMEsTest()
        //{
        //    ByCusCIFRespository target = new ByCusCIFRespository(); // TODO: Initialize to an appropriate value
        //    IQueryable<ByCus_CIF> expected = null; // TODO: Initialize to an appropriate value
        //    IQueryable<ByCus_CIF> actual;
        //    actual = target.GetByCusCIFSMEs();
        //    Assert.AreEqual(expected, actual);
        //    Assert.Inconclusive("Verify the correctness of this test method.");
        //}

        ///// <summary>
        /////A test for GetByCusCIFs
        /////</summary>
        //[TestMethod()]
        //public void GetByCusCIFsTest()
        //{
        //    ByCusCIFRespository target = new ByCusCIFRespository(); // TODO: Initialize to an appropriate value
        //    IQueryable<ByCus_CIF> expected = null; // TODO: Initialize to an appropriate value
        //    IQueryable<ByCus_CIF> actual;
        //    actual = target.GetByCusCIFs();
        //    Assert.AreEqual(expected, actual);
        //    Assert.Inconclusive("Verify the correctness of this test method.");
        //}

        /// <summary>
        ///A test for GetCustomerSMEs
        ///</summary>
        [TestMethod()]
        public void GetCustomerSMEsTest()
        {
            ByCusCIFRespository target = new ByCusCIFRespository(); // TODO: Initialize to an appropriate value
            //IQueryable<CUSTOMER_SME> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<CUSTOMER_SME> actual;
            actual = target.GetCustomerSMEs();
            Assert.AreEqual(25673, actual.ToList().Count);
        }

        /// <summary>
        ///A test for GetCustomerSMEs
        ///</summary>
        [TestMethod()]
        public void GetCustomerSMEsWithEmpIdTest()
        {
            ByCusCIFRespository target = new ByCusCIFRespository(); // TODO: Initialize to an appropriate value
            string empId = "119016"; // TODO: Initialize to an appropriate value
            //IQueryable<CUSTOMER_SME> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<CUSTOMER_SME> actual;
            actual = target.GetCustomerSMEs(empId);

            Assert.IsNotNull(actual);
            Assert.AreEqual(typeof(CUSTOMER_SME), actual.ElementType);

            CUSTOMER_SME cif18 = null;

            int count = 0;
            foreach (CUSTOMER_SME c in actual)
            {
                if (c.CIF == 18)
                {
                    cif18 = c;
                }

                count++;
            }
            Assert.AreEqual(2506, count);
            Assert.IsNotNull(cif18);
            Assert.AreEqual("093732", cif18.CM_CODE);
            Assert.AreEqual(18, cif18.RATING_KEY);
            Assert.AreEqual("2011-11-07", cif18.RATING_UPDATE_DATE.Value.ToString("yyyy-MM-dd", new CultureInfo("en-US")));

            empId = "204263";
            actual = target.GetCustomerSMEs(empId);
            Assert.AreEqual(532, actual.ToList().Count);
        }
    }
}