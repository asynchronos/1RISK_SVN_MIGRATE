using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using UserSystem.Core.Entities;

namespace UserSystem.Core.Tests.BO
{
    [TestFixture]
    public class UserSystemBOTDD
    {
        [Test]
        public void AuthenticateAndAuthorizeByKey()
        {
            using (UserSystemEntities en = new UserSystemEntities())
            {
                Object u;
                en.TryGetObjectByKey(new System.Data.EntityKey("UserSystemEntities.USER_DATA", "EMP_ID", "249888"), out u);
                Assert.IsNotNull(u);
                Assert.AreEqual("249888", ((USER_DATA)u).EMP_ID);
                Assert.AreEqual(2, ((USER_DATA)u).CATE_AND_EMP.Count);

                IList<CATE_AND_EMP> categories = ((USER_DATA)u).CATE_AND_EMP.ToList<CATE_AND_EMP>();
                Assert.AreEqual(1165, categories[0].CATEGORY_KEY);
                Assert.AreEqual("SME MIS SECTION", categories[0].CATEGORY.CATEGORY_DESC);
                Assert.AreEqual(698, categories[1].CATEGORY_KEY);
                Assert.AreEqual("SME MIS Section", categories[1].CATEGORY.CATEGORY_DESC);
            }
        }

        [Test]
        public void AuthenticateAndAuthorizeByLinq()
        {
            using (UserSystemEntities en = new UserSystemEntities())
            {
                USER_DATA userData = null;

                var query = from u in en.USER_DATA
                            join ce in en.CATE_AND_EMP
                            on u.EMP_ID equals ce.EMP_ID
                            join cate in en.CATEGORies
                            on ce.CATEGORY_KEY equals cate.CATEGORY_KEY
                            where u.EMP_ID == "249888"
                            && u.EXPIRE_DATE >= DateTime.Now
                            && u.DEL_FLAG == false
                            && ce.DEL_FLAG == false
                            && cate.DEL_FLAG == false
                            select new CATE_AND_EMP{
                                USER_DATA = ce.USER_DATA,
                                CATEGORY = ce.CATEGORY
                            };

                if ((userData = query.FirstOrDefault<USER_DATA>()) != null)
                {
                    foreach (CATE_AND_EMP cateAndEmp in userData.CATE_AND_EMP)
                    {

                    }
                }                
            }
        }
    }
}
