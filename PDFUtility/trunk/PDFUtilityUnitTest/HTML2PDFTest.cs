using System.IO;
using System.Net;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PDFUtility;

namespace PDFUtilityUnitTest
{
    /// <summary>
    ///This is a test class for HTML2PDFTest and is intended
    ///to contain all HTML2PDFTest Unit Tests
    ///</summary>
    [TestClass()]
    public class HTML2PDFTest
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
        ///A test for Convert2PDF
        ///</summary>
        [TestMethod()]
        public void Convert2PDFTest()
        {
            string htmlText = string.Empty; // TODO: Initialize to an appropriate value
            string destination = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Destination\Converted.pdf"; // TODO: Initialize to an appropriate value

            using (WebClient wc = new WebClient())
            {
                htmlText = wc.DownloadString("http://leader1/desktop/desktop.html");
                wc.Dispose();
            }

            HTML2PDF.Convert2PDF(htmlText, destination);

            FileInfo m = new FileInfo(destination);
            Assert.AreEqual(true, m.Exists);
        }
    }
}