using System;
using SME.UserSystem.Core.Profile;

namespace SME.UserSystem.Core.DAL
{
    public interface IUserProfileRepository : IDisposable
    {
        void Save();

        UserProfileBase CreateProfileForUser(string username, string ApplicationName);

        UserProfileBase GetUserProfile(string empId, string appDesc);

        void UpdateUserProfile(UserProfileBase profile, string appDesc);

        APP_PROFILE GetAppProfile(string empId, string appDesc);

        APP_PROFILE GetAppProfile(string empId, int appKey);

        void DeleteAppProfile(string empId, string appDesc);

        void UpdateActivity(string empId, string appDesc, string activity);

        USER_DATA GetUserData(string empId);

        void AddUserData(USER_DATA user, TB_EMPLOYEE emp);

        void DeleteUserData(string empId);

        TB_EMPLOYEE GetEmployee(string empId);
    }
}