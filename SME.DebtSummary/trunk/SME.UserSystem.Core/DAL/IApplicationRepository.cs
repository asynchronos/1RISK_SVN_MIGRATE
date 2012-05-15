using System;
using System.Collections.Generic;

namespace SME.UserSystem.Core.DAL
{
    public interface IApplicationRepository : IDisposable
    {
        IEnumerable<APPLICATION> GetApplications();

        APPLICATION GetApplicationByAppKey(int appKey);

        APPLICATION GetApplicationByAppDesc(string appDesc);

        void Save();
    }
}