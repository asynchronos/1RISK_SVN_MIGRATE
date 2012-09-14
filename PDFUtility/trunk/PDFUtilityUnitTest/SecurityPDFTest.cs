using System.IO;
using iTextSharp.text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PDFUtility;

namespace PDFUtilityUnitTest
{
    /// <summary>
    ///This is a test class for ModifyPDFTest and is intended
    ///to contain all ModifyPDFTest Unit Tests
    ///</summary>
    [TestClass()]
    public class SecurityPDFTest
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
        ///A test for ApplySecurity
        ///</summary>
        [TestMethod()]
        public void ApplySecurityTest()
        {
            string source = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Source\d66306-354208.pdf"; // TODO: Initialize to an appropriate value
            string destination = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Destination\d66306-354208.pdf"; // TODO: Initialize to an appropriate value

            source = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Source\test_pdf.pdf"; // TODO: Initialize to an appropriate value
            destination = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Destination\test_pdf.pdf"; // TODO: Initialize to an appropriate value

            source = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Source\Menu2 Servicedesk_IMACD_UserGuide_11Oct.pdf"; // TODO: Initialize to an appropriate value
            destination = @"D:\workspaces\2012\PDFUtility\PDFUtilityUnitTest\Destination\Menu2 Servicedesk_IMACD_UserGuide_11Oct.pdf";

            FileInfo m = new FileInfo(source);
            Assert.AreEqual(true, m.Exists);

            using (SecurityPDF target = new SecurityPDF(source, destination))
            {
                target.SetWatermarkText("088088 นางจริยาพร ภวภูตานนท์ ณ มหาสารคาม 088088 นางจริยาพร ภวภูตานนท์ ณ มหาสารคาม")
                    .SetWatermarkFontColor(BaseColor.RED)
                    //.SetWatermarkRotation(45f)
                    .SetFontSize(65f)
                    .SetUserPassword("249888")
                    .SetOwnerPassword("1234");
                target.ApplySecurity();
            }

            m = new FileInfo(destination);
            Assert.AreEqual(true, m.Exists);
        }
    }
}