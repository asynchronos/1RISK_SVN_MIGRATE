using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Web.Security;
using log4net;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.Exceptions;
using System.Data.Objects;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosRoleProvider : RoleProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        private string _appName;
        private string _providerName;

        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");

            if (config["applicationName"] == null || config["applicationName"].Trim() == "")
            {
                _appName = ConfigurationManager.AppSettings["APPLICATION_NAME"];
            }
            else
            {
                _appName = config["applicationName"];
            }

            if (name == null || name.Length == 0)
                name = "AsynchronosRoleProvider";
            if (string.IsNullOrEmpty(name))
                name = "AsynchronosRoleProvider";
            _providerName = name;

            base.Initialize(name, config);
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="usernames">EMP_ID</param>
        /// <param name="roleNames">CATEGORY_KEY</param>
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            foreach (string rolename in roleNames)
            {
                if (rolename == null || rolename == "")
                    throw new AsynchronosProviderException("Role name cannot be empty or null.");
                if (!RoleExists(rolename))
                    throw new AsynchronosProviderException("Role name not found.");
            }

            foreach (string username in usernames)
            {
                if (username == null || username == "")
                    throw new AsynchronosProviderException("User name cannot be empty or null.");
                if (username.Contains(","))
                    throw new ArgumentException("User names cannot contain commas.");

                foreach (string rolename in roleNames)
                {
                    if (IsUserInRole(username, rolename))
                        throw new AsynchronosProviderException("User is already in role.");
                }
            }

            using (UnitOfWork uow = new UnitOfWork())
            {
                foreach (string username in usernames)
                {
                    foreach (string roleName in roleNames)
                    {
                        USER_DATA user = uow.UserDataRepo
                            .FindBy(u => u.EMP_ID == username
                                && u.DEL_FLAG != true)
                            .FirstOrDefault<USER_DATA>();

                        if (null != user)
                        {
                            int categoryKey = this.ParseRoleName(roleName);

                            CATE_AND_EMP cateAndEmp = new CATE_AND_EMP();
                            cateAndEmp.EMP_ID = user.EMP_ID;
                            cateAndEmp.CATEGORY_KEY = categoryKey;
                            cateAndEmp.DEL_FLAG = false;

                            user.CATE_AND_EMP.Add(cateAndEmp);
                            uow.CategoryRepo.FindBy(c => c.CATEGORY_KEY == categoryKey)
                                .FirstOrDefault<CATEGORY>()
                                .CATE_AND_EMP.Add(cateAndEmp);
                        }
                        else
                        {
                            throw new AsynchronosProviderException(
                                "Can't not fine username " + username
                                + "for add to role " + roleName + "."
                                );
                        }
                    }
                }
                uow.Save();
            }
        }

        /// <summary>
        /// Get ApplicationName from AppSetting Config
        /// APP_DESC in DB
        /// </summary>
        public override string ApplicationName
        {
            get
            {
                return _appName;
            }
            set
            {
                throw new System.NotImplementedException();
            }
        }

        public override string Name
        {
            get
            {
                return _providerName;
            }
        }

        /// <summary>
        /// must use other method
        /// Role must use
        ///     category name
        ///     category value
        ///     category type key
        /// </summary>
        /// <param name="roleName"></param>
        public override void CreateRole(string roleName)
        {
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// mark delete flag on category
        /// </summary>
        /// <param name="roleName">CATEGORY_KEY</param>
        /// <param name="throwOnPopulatedRole">always false for this structure.(use for check exists user in role)</param>
        /// <returns>true if success.</returns>
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            if (!RoleExists(roleName))
            {
                throw new AsynchronosProviderException("Role does not exist.");
            }

            //if (throwOnPopulatedRole && GetUsersInRole(rolename).Length > 0)
            //{
            //    throw new AsynchronosProviderException("Cannot delete a populated role.");
            //}

            using (UnitOfWork uow = new UnitOfWork())
            {
                using (DbTransaction tran = uow.Context.Connection.BeginTransaction())
                {
                    try
                    {
                        int categoryKey = this.ParseRoleName(roleName);
                        CATEGORY category = uow.CategoryRepo
                                    .FindBy(c => c.DEL_FLAG != true
                                        && c.CATEGORY_KEY == categoryKey
                                        && c.CATE_AND_APP
                                            .Any(caa => caa.APPLICATION
                                                .APP_DESC == ApplicationName
                                                && caa.DEL_FLAG != true))
                                    .FirstOrDefault<CATEGORY>();

                        if (null != category)
                        {
                            category.DEL_FLAG = true;
                            category.CATE_AND_APP
                                .FirstOrDefault<CATE_AND_APP>().DEL_FLAG = true;

                            List<CATE_AND_EMP> cateAndEmpList = category.CATE_AND_EMP.ToList<CATE_AND_EMP>();

                            foreach (CATE_AND_EMP cae in cateAndEmpList)
                            {
                                cae.DEL_FLAG = true;
                            }
                        }
                        else
                        {
                            throw new AsynchronosProviderException("Role does not exist.");
                        }
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        throw ex;
                    }
                    finally
                    {
                        tran.Dispose();
                    }
                }

                uow.Save();
            }

            return true;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="roleName">CATEGORY_KEY</param>
        /// <param name="usernameToMatch">empnameToMatch</param>
        /// <returns>EMP_ID</returns>
        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            string[] result = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                int categoryKey = this.ParseRoleName(roleName);
                result = uow.CateAndEMPRepo
                            .FindBy(cae => cae.DEL_FLAG != true
                                && cae.CATEGORY_KEY == categoryKey
                                && cae.CATEGORY.DEL_FLAG != true
                                && cae.CATEGORY.CATE_AND_APP
                                    .Any(caa => caa.APPLICATION.APP_DESC == ApplicationName
                                        && caa.DEL_FLAG != true)
                                && cae.USER_DATA.EMP_NAME.Contains(usernameToMatch)
                                && cae.USER_DATA.DEL_FLAG != true)
                            .Select(cae => cae.EMP_ID).ToArray<string>();
            }

            return result;
        }

        /// <summary>
        ///
        /// </summary>
        /// <returns>CATEGORY_KEY LIST</returns>
        public override string[] GetAllRoles()
        {
            string[] result = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                result = uow.CateAndAppRepo
                    .FindBy(caa => caa.DEL_FLAG != true
                            && caa.APPLICATION.APP_DESC == ApplicationName)
                    .Select(caa => caa.CATEGORY_KEY)
                    .AsEnumerable<int?>()
                    .Select(key => key.ToString())
                    .ToArray<string>();
            }

            return result;
        }

        /// <summary>
        /// retrun CATEGORY_KEY
        /// </summary>
        /// <param name="username">EMP_ID</param>
        /// <returns>CATEGORY_KEY LIST</returns>
        public override string[] GetRolesForUser(string username)
        {
            if (isDebugEnabled)
                log.Debug("Invoke " + System.Reflection.MethodBase.GetCurrentMethod().Name);

            string[] result = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                //get application key
                IQueryable<APPLICATION> appQuery = uow.ApplicationRepo
                    .FindBy(a => a.DEL_FLAG == false
                        && a.APP_DESC == ApplicationName);
                if (isDebugEnabled) log.Debug(((ObjectQuery)appQuery).ToTraceString());
                int appKey = appQuery.Select(a => a.APP_KEY).FirstOrDefault();
                if (isDebugEnabled) log.Debug("Application Key:" + appKey);

                //get category can use this application
                IQueryable<CATE_AND_APP> cateAndAppQuery = uow.CateAndAppRepo
                    .FindBy(caa => caa.DEL_FLAG == false
                        && caa.APP_KEY == appKey);
                if (isDebugEnabled) log.Debug(((ObjectQuery)cateAndAppQuery).ToTraceString());
                List<int> listOfExistsCateAndAppCategory = cateAndAppQuery.Select(c => c.CATEGORY_KEY.Value).ToList<int>();
                if (isDebugEnabled)
                {
                    log.Debug("Total listOfExistsCateAndAppCategory records: " + listOfExistsCateAndAppCategory.Count);

                    foreach (int categoryKey in listOfExistsCateAndAppCategory)
                    {
                        log.Debug(categoryKey);
                    }
                }

                //get exists catagory
                IQueryable<CATEGORY> categoryQuery = uow.CategoryRepo
                    .FindBy(c => c.DEL_FLAG == false
                        && listOfExistsCateAndAppCategory.Contains(c.CATEGORY_KEY));
                if (isDebugEnabled) log.Debug(((ObjectQuery)categoryQuery).ToTraceString());
                List<int> listOfExistsCategory = categoryQuery.Select(c => c.CATEGORY_KEY).ToList<int>();
                if (isDebugEnabled)
                {
                    log.Debug("Total listOfExistsCategory records: " + listOfExistsCategory.Count);

                    foreach (int categoryKey in listOfExistsCategory)
                    {
                        log.Debug(categoryKey);
                    }
                }

                //get exists category for user
                IQueryable<CATE_AND_EMP> cateAndEmpQuery = uow.CateAndEMPRepo
                    .FindBy(cae => cae.DEL_FLAG == false
                        && cae.EMP_ID == username
                        && listOfExistsCategory.Contains(cae.CATEGORY_KEY));
                //write log
                if (isDebugEnabled) log.Debug(((ObjectQuery)cateAndEmpQuery).ToTraceString());
                List<int> listOfExistsCateAndEmpCategory = cateAndEmpQuery.Select(c => c.CATEGORY_KEY).ToList<int>();
                if (isDebugEnabled)
                {
                    log.Debug("Total listOfExistsCateAndEmpCategory records: " + listOfExistsCateAndEmpCategory.Count);

                    foreach (int categoryKey in listOfExistsCateAndEmpCategory)
                    {
                        log.Debug(categoryKey);
                    }
                }

                result = listOfExistsCateAndEmpCategory
                    .Select(key => key.ToString())
                    .ToArray<string>();               

                //result = uow.CateAndEMPRepo
                //            .FindBy(cae => cae.DEL_FLAG == false
                //                && cae.EMP_ID == username
                //                && cae.CATEGORY.DEL_FLAG == false
                //                && cae.CATEGORY.CATE_AND_APP
                //                    .Any(caa =>
                //                        caa.APPLICATION.APP_DESC == ApplicationName
                //                        && caa.DEL_FLAG == false))
                //            .Select(cae => cae.CATEGORY_KEY)
                //            .AsEnumerable<int>()
                //            .Select(key => key.ToString())
                //            .ToArray<string>();
            }

            if (isDebugEnabled)
            {
                log.Debug("Total Roles: "+ result.Length);

                foreach (string role in result)
                {
                    log.Debug(role);
                }
            }

            return result;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="roleName">CATEGORY_KEY</param>
        /// <returns>EMP_ID LIST</returns>
        public override string[] GetUsersInRole(string roleName)
        {
            string[] result = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                int categoryKey = this.ParseRoleName(roleName);
                result = uow.CateAndEMPRepo
                            .FindBy(cae => cae.DEL_FLAG != true
                                && cae.CATEGORY_KEY == categoryKey
                                && cae.CATEGORY.DEL_FLAG != true
                                && cae.CATEGORY.CATE_AND_APP
                                    .Any(caa =>
                                        caa.APPLICATION.APP_DESC == ApplicationName
                                        && caa.DEL_FLAG != true))
                            .Select(cae => cae.EMP_ID).ToArray<string>();
            }

            return result;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="username">EMP_ID</param>
        /// <param name="roleName">CATEGORY_KEY</param>
        /// <returns>true if user is in category.</returns>
        public override bool IsUserInRole(string username, string roleName)
        {
            int count = 0;

            int categoryKey = this.ParseRoleName(roleName);

            using (UnitOfWork uow = new UnitOfWork())
            {
                count = uow.CategoryRepo
                            .FindBy(c => c.DEL_FLAG != true
                                && c.CATEGORY_KEY == categoryKey
                                && c.CATE_AND_APP
                                    .Any(caa =>
                                        caa.APPLICATION.APP_DESC == ApplicationName
                                        && caa.DEL_FLAG != true)
                                && c.CATE_AND_EMP
                                    .Any(cae => cae.EMP_ID == username
                                    && cae.DEL_FLAG != true)
                            ).Count();
            }

            return count > 0 ? true : false;
        }

        /// <summary>
        /// mark delete flag to CATE_AND_APP & CATE_AND_EMP table
        /// </summary>
        /// <param name="usernames">EMP_ID</param>
        /// <param name="roleNames">CATEGORY_KEY</param>
        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            foreach (string rolename in roleNames)
            {
                if (rolename == null || rolename == "")
                    throw new AsynchronosProviderException("Role name cannot be empty or null.");
                if (!RoleExists(rolename))
                    throw new AsynchronosProviderException("Role name not found.");
            }

            foreach (string username in usernames)
            {
                if (username == null || username == "")
                    throw new AsynchronosProviderException("User name cannot be empty or null.");

                foreach (string rolename in roleNames)
                {
                    if (!IsUserInRole(username, rolename))
                        throw new AsynchronosProviderException("User is not in role.");
                }
            }

            CATEGORY category = null;
            using (UnitOfWork uow = new UnitOfWork())
            {
                using (DbTransaction tran = uow.Context.Connection.BeginTransaction())
                {
                    try
                    {
                        foreach (string username in usernames)
                        {
                            foreach (string rolename in roleNames)
                            {
                                int categoryKey = this.ParseRoleName(rolename);

                                category = uow.CategoryRepo
                                    .FindBy(c => c.DEL_FLAG != true
                                        && c.CATEGORY_KEY == categoryKey
                                        && c.CATE_AND_APP
                                            .Any(caa => caa.APPLICATION
                                                .APP_DESC == ApplicationName
                                                && caa.DEL_FLAG != true)
                                        && c.CATE_AND_EMP
                                            .Any(cae => cae.EMP_ID == username
                                                && cae.DEL_FLAG != true))
                                    .FirstOrDefault();

                                //mark delete 2 table
                                category.CATE_AND_APP
                                    .FirstOrDefault<CATE_AND_APP>().DEL_FLAG = true;
                                category.CATE_AND_EMP
                                    .FirstOrDefault<CATE_AND_EMP>().DEL_FLAG = true;
                            }
                        }
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        throw ex;
                    }
                    finally
                    {
                        tran.Dispose();
                    }
                }

                uow.Save();
            }
        }

        /// <summary>
        /// check user category list have exist on this app
        /// </summary>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public override bool RoleExists(string roleName)
        {
            bool result = false;

            using (UnitOfWork uow = new UnitOfWork())
            {
                int categoryKey = this.ParseRoleName(roleName);
                CATE_AND_APP cateAndApp = uow.CateAndAppRepo
                    .FindBy(caa => caa.CATEGORY_KEY == categoryKey
                        && caa.APPLICATION.APP_DESC == ApplicationName
                        && caa.DEL_FLAG != true)
                    .FirstOrDefault<CATE_AND_APP>();

                if (null != cateAndApp)
                {
                    result = true;
                }
            }

            return result;
        }

        private int ParseRoleName(string roleName)
        {
            int result = 0;

            if (!int.TryParse(roleName, out result))
            {
                AsynchronosProviderException ex
                    = new AsynchronosProviderException
                        ("RoleName(Category Key) must be integer");
                log.Error(ex);
                throw ex;
            }

            return result;
        }
    }
}