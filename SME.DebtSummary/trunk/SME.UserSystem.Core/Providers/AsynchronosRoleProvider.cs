using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Web.Security;
using log4net;
using SME.UserSystem.Core.DAL;
using SME.UserSystem.Core.Exceptions;

namespace SME.UserSystem.Core.Providers
{
    public class AsynchronosRoleProvider : RoleProvider
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

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
                using (DbTransaction tran = uow.Context.Connection.BeginTransaction())
                {
                    try
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
                                    CATE_AND_APP cateAndApp = uow.CateAndAppRepo
                                        .FindBy(caa => caa.DEL_FLAG != true
                                            && caa.APPLICATION.APP_DESC == ApplicationName
                                            && caa.CATEGORY_KEY == int.Parse(roleName)
                                            && caa.CATEGORY.DEL_FLAG != true
                                        ).FirstOrDefault<CATE_AND_APP>();

                                    cateAndApp.CATEGORY.CATE_AND_EMP
                                        .FirstOrDefault<CATE_AND_EMP>()
                                        .USER_DATAReference.Attach(user);
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
            }
            throw new System.NotImplementedException();
        }

        /// <summary>
        /// Get ApplicationName from AppSetting Config
        /// APP_DESC in DB
        /// </summary>
        public override string ApplicationName
        {
            get
            {
                return ConfigurationManager.AppSettings["APPLICATION_NAME"];
            }
            set
            {
                throw new System.NotImplementedException();
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
                        CATEGORY category = uow.CategoryRepo
                                    .FindBy(c => c.DEL_FLAG != true
                                        && c.CATEGORY_KEY == int.Parse(roleName)
                                        && c.CATE_AND_APP
                                            .Any(caa => caa.APPLICATION
                                                .APP_DESC == ApplicationName
                                                && caa.DEL_FLAG != true))
                                    .FirstOrDefault<CATEGORY>();

                        //CATEGORY category = uow.CategoryRepo
                        //    .FindBy(c => c.CATEGORY_KEY == int.Parse(roleName))
                        //    .FirstOrDefault<CATEGORY>();

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
                result = uow.CateAndEMPRepo
                            .FindBy(cae => cae.DEL_FLAG != true
                                && cae.CATEGORY_KEY == int.Parse(roleName)
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
                    .Select(caa => caa.CATEGORY_KEY.ToString()).ToArray<string>();
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
            string[] result = null;

            using (UnitOfWork uow = new UnitOfWork())
            {
                result = uow.CateAndEMPRepo
                            .FindBy(cae => cae.DEL_FLAG != true
                                && cae.EMP_ID == username
                                && cae.CATEGORY.DEL_FLAG != true
                                && cae.CATEGORY.CATE_AND_APP
                                    .Any(caa =>
                                        caa.APPLICATION.APP_DESC == ApplicationName
                                        && caa.DEL_FLAG != true))
                            .Select(cae => cae.CATEGORY_KEY.ToString()).ToArray<string>();

                //result = uow.CateAndEMPRepo.FindBy(cae => cae.EMP_ID == username)
                //    .Select(cae => cae.CATEGORY_KEY.ToString()).ToArray<string>();
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
                result = uow.CateAndEMPRepo
                            .FindBy(cae => cae.DEL_FLAG != true
                                && cae.CATEGORY_KEY == int.Parse(roleName)
                                && cae.CATEGORY.DEL_FLAG != true
                                && cae.CATEGORY.CATE_AND_APP
                                    .Any(caa =>
                                        caa.APPLICATION.APP_DESC == ApplicationName
                                        && caa.DEL_FLAG != true))
                            .Select(cae => cae.EMP_ID).ToArray<string>();

                //result = uow.CateAndEMPRepo
                //    .FindBy(cae => cae.CATEGORY_KEY == int.Parse(roleName))
                //    .Select(cae => cae.EMP_ID).ToArray<string>();
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

            using (UnitOfWork uow = new UnitOfWork())
            {
                count = uow.CategoryRepo
                            .FindBy(c => c.DEL_FLAG != true
                                && c.CATEGORY_KEY == int.Parse(roleName)
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
                                category = uow.CategoryRepo
                                    .FindBy(c => c.DEL_FLAG != true
                                        && c.CATEGORY_KEY == int.Parse(rolename)
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
                CATE_AND_APP cateAndApp = uow.CateAndAppRepo
                    .FindBy(caa => caa.CATEGORY_KEY == int.Parse(roleName)
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
    }
}