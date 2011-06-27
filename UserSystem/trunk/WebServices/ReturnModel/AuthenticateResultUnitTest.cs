using NUnit.Framework;

namespace UserSystem.WebServices.ReturnModel
{
    [TestFixture]
    public class AuthenticateResultUnitTest
    {
        AuthenticateResult r;

        [SetUp]
        public void Init()
        {
            r = new AuthenticateResult();
        }

        [Test]
        public void TestInherit()
        {
            Assert.IsNotNull(r.EMP_ID_DISPLAY);
            Assert.AreEqual("249887", r.EMP_ID_DISPLAY);
        }
    }
}