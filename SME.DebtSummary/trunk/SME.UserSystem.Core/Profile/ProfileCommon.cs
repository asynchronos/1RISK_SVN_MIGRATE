using System;
using log4net;

namespace SME.UserSystem.Core.Profile
{
    [Serializable]
    public class ProfileCommon : UserProfileBase
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public virtual ProfileCommon GetProfile(string username)
        {
            return (ProfileCommon)UserProfileBase.Create(username);
        }
    }
}