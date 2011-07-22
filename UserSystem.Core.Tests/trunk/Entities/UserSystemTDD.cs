using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using UserSystem.Core.Entities;

namespace UserSystem.Core.Tests.Entities
{
    [TestFixture]
    public class UserSystemTDD
    {
        [Test]
        public void CanCreateEntities()
        {
            using (UserSystemEntities en = new UserSystemEntities())
            {
                Assert.IsNotNull(en);
                Assert.AreEqual("name=UserSystemEntities", en.Connection.ConnectionString);
            }
        }

        [Test]
        public void GetUserData249888()
        {
            using (UserSystemEntities en = new UserSystemEntities())
            {
                Object u;
                en.TryGetObjectByKey(new System.Data.EntityKey("UserSystemEntities.USER_DATA", "EMP_ID", "249888"), out u);
                Assert.IsNotNull(u);
                Assert.AreEqual("249888", ((USER_DATA)u).EMP_ID);
            }
        }
    }
}
