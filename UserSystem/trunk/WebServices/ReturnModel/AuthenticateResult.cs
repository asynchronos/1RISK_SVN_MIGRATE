using System.Collections.Generic;

namespace UserSystem.WebServices.ReturnModel
{
    //[System.Runtime.Serialization.DataContractAttribute(IsReference = false)]
    [System.Serializable]
    public class AuthenticateResult : MyEntities.USER_DATA
    {
        public const string DELIMITER = "|";

        public AuthenticateResult()
        {
        }

        public AuthenticateResult(MyEntities.USER_DATA user)
        {
            this.CATE_AND_EMP = user.CATE_AND_EMP;
            this.CREATE_DATE = user.CREATE_DATE;
            this.DEL_FLAG = user.DEL_FLAG;
            this.EMAIL = user.EMAIL;
            this.EMP_ID = user.EMP_ID;
            this.EMP_ID_DISPLAY = user.EMP_ID_DISPLAY;
            this.EMP_NAME = user.EMP_NAME;
            this.EMP_NAME_E = user.EMP_NAME_E;
            this.EMP_SURNAME = user.EMP_SURNAME;
            this.EMP_SURNAME_E = user.EMP_SURNAME_E;
            this.EMP_TITLE = user.EMP_TITLE;
            this.EMP_TITLE_E = user.EMP_TITLE_E;
            //this.EntityKey = user.EntityKey;
            this.EXPIRE_DATE = user.EXPIRE_DATE;
            this.LAST_CHANGE_PASS_DATE = user.LAST_CHANGE_PASS_DATE;
            this.LAST_SIGN_ON_DATE = user.LAST_SIGN_ON_DATE;
            this.PASSWD = user.PASSWD;
            this.PHONE_HOME = user.PHONE_HOME;
            this.PHONE_MOBILE = user.PHONE_MOBILE;
            this.PHONE_OFFICE = user.PHONE_OFFICE;
            this.UPDATE_DATE = user.UPDATE_DATE;
        }

        [System.Runtime.Serialization.DataMemberAttribute()]
        public string FullNameEng
        {
            get
            {
                return this.EMP_TITLE_E + this.EMP_NAME_E + " " + this.EMP_SURNAME_E;
            }
        }

        [System.Runtime.Serialization.DataMemberAttribute()]
        public string FullNameThai
        {
            get
            {
                return this.EMP_TITLE + this.EMP_NAME + " " + this.EMP_SURNAME;
            }
        }

        private List<MyEntities.CATEGORY> _categoriesList;

        [System.Runtime.Serialization.DataMemberAttribute()]
        public List<MyEntities.CATEGORY> CategoriesList
        {
            get
            {
                return this._categoriesList;
            }
            set
            {
                this._categoriesList = value;
            }
        }

        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CategoriesKeyString
        {
            get
            {
                string result = string.Empty;

                foreach (MyEntities.CATEGORY category in this.CategoriesList)
                {
                    result = result + DELIMITER + category.CATEGORY_KEY;
                }

                return result.Substring(1);
            }
        }

        public bool IsNullCategoryList()
        {
            return (null != this.CategoriesList) ? false : true;
        }
    }
}