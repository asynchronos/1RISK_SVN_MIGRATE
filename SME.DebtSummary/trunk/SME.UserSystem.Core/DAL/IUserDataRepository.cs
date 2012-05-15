using System;

namespace SME.UserSystem.Core.DAL
{
    public interface IUserDataRepository : IDisposable
    {
        USER_DATA GetUserByEmpId(string empId);

        void UpdateActivity(string empId);

        void Save();
    }
}