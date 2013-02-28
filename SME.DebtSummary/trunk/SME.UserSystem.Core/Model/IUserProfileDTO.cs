using System;
using System.Collections.Generic;

namespace SME.UserSystem.Core.DTO
{
    public interface IUserProfileDTO
    {
        #region USER_DATA Properties

        string EMP_ID { get; set; }

        string EMP_FULLNAME { get; set; }

        string EMP_FULLNAME_E { get; set; }

        string PASSWD { get; set; }

        string EMAIL { get; set; }

        DateTime? LAST_SIGN_ON_DATE { get; set; }

        bool? USER_DATA_DEL_FLAG { get; set; }

        DateTime? EXPIRE_DATE { get; set; }

        #endregion USER_DATA Properties

        #region APP_PROFILE Properties

        int? APP_KEY { get; set; }

        String APP_DESC { get; set; }

        string LAST_ACTIVITY { get; set; }

        DateTime? LAST_ACTIVITY_DATE { get; set; }

        bool? IS_AUTHENTICATED { get; set; }

        #endregion APP_PROFILE Properties

        #region Category (Role)

        string CATEGORIES_STR { get; set; }

        List<CATEGORY> CATEGORY_LIST { get; set; }

        #endregion Category (Role)
    }
}