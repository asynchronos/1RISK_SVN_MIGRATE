using System.Collections.Generic;

namespace UserSystem.WebServices.ReturnModel
{
    //[System.Runtime.Serialization.DataContractAttribute(IsReference = false)]
    [System.Serializable]
    public class AuthenticateResult : Core.Entities.USER_DATA
    {
        public const string DELIMITER = "|";

        public AuthenticateResult()
        {
        }

        public AuthenticateResult(Core.Entities.USER_DATA user)
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

        private IList<Core.Entities.CATEGORY> _categoriesList = new List<Core.Entities.CATEGORY>();

        [System.Runtime.Serialization.DataMemberAttribute()]
        public IList<Core.Entities.CATEGORY> CategoriesList
        {
            get
            {
                return new List<Core.Entities.CATEGORY>(_categoriesList).AsReadOnly();
            }
            protected set
            {
                this._categoriesList = value;
            }
        }

        public void AddCategory(Core.Entities.CATEGORY category)
        {
            if (category != null && !_categoriesList.Contains(category))
            {
                _categoriesList.Add(category);
            }
        }

        public void RemoveCategory(Core.Entities.CATEGORY category)
        {
            if (category != null && _categoriesList.Contains(category))
            {
                _categoriesList.Remove(category);
            }
        }

        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CategoriesKeyString
        {
            get
            {
                string result = string.Empty;

                foreach (Core.Entities.CATEGORY category in this.CategoriesList)
                {
                    result = result + DELIMITER + category.CATEGORY_KEY;
                }

                return result.Substring(1);
            }
        }

        /// <summary>
        /// Hash code should ONLY contain the "business value signature" of the object and not the ID
        /// </summary>
        public override int GetHashCode()
        {
            int hash = 7;
            //hash = 31 * hash + num;//case data is int
            hash = 31 * hash + (null == EMAIL ? 0 : EMAIL.GetHashCode());
            hash = 31 * hash + (null == EMP_NAME ? 0 : EMP_NAME.GetHashCode());
            hash = 31 * hash + (null == EMP_SURNAME ? 0 : EMP_SURNAME.GetHashCode());

            return hash;
        }

        public override bool Equals(object obj)
        {
            if (this == obj) return true;
            if ((obj == null) || (obj.GetType() != this.GetType())) return false;
            //object must be test at this point
            AuthenticateResult test = (AuthenticateResult)obj;
            return (EMAIL == test.EMAIL || (EMAIL != null && EMAIL.Equals(test.EMAIL))) &&
                (EMP_NAME == test.EMP_NAME || (EMP_NAME != null && EMP_NAME.Equals(test.EMP_NAME))) &&
                (EMP_SURNAME == test.EMP_SURNAME || (EMP_SURNAME != null && EMP_SURNAME.Equals(test.EMP_SURNAME)));
        }
    }
}