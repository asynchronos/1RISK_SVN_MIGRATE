using log4net;

namespace SME.UserSystem.Core.DAL
{
    public class ApplicationRepository : GenericRespository<APPLICATION>, IApplicationRepository
    {
        private static readonly ILog log = LogManager.GetLogger(
    System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        public ApplicationRepository(UserSystemEntities context)
            : base(context)
        {
            this.context = context;
        }
    }
}