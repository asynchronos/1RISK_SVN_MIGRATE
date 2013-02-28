using System;
using System.Collections.Generic;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.DTO;

namespace SME.UserSystem.Core.BL
{
    public interface IUserBL : IDisposable
    {
        UnitOfWork UOW { get; }

        void Save();

        IUserProfileDTO GetUserProfileDTO(string empId, string appDesc);

        IUserProfileDTO GetUserProfileDTO(string empId, int appKey);

        USER_DATA GetUserData(string empId);

        void UpdateUserProfileDTO(IUserProfileDTO userProfile, int appKey);

        APPLICATION GetApplication(int appKey);

        APPLICATION GetApplication(string appName);

        IEnumerable<APP_PROFILE> GetAllAppProfile();

        //void InsertAppProfile(APP_PROFILE appProfile);
    }
}