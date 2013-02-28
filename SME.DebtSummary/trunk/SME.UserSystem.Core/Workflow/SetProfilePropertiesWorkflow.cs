using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Workflow.Activities;
using System.Workflow.ComponentModel;
using SME.UserSystem.Core.BL;
using SME.UserSystem.Core.DTO;
using SME.UserSystem.Core.Exceptions;
using SME.UserSystem.Core.Profile;

namespace SME.UserSystem.Core.Workflow
{
    public sealed partial class SetProfilePropertiesWorkflow : SequentialWorkflowActivity
    {
        public SetProfilePropertiesWorkflow()
        {
            InitializeComponent();
        }

        public Guid ApplicationGuid { get; set; }

        public string ApplicationName { get; set; }

        public string UserName { get; set; }

        public bool isUserAuthenticated { get; set; }

        public static DependencyProperty UserEntityProperty = DependencyProperty.Register("UserEntity", typeof(USER_DATA), typeof(SetProfilePropertiesWorkflow));

        [DescriptionAttribute("UserEntity")]
        [CategoryAttribute("UserEntity Category")]
        [BrowsableAttribute(true)]
        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        public USER_DATA UserEntity
        {
            get
            {
                return ((USER_DATA)(base.GetValue(SetProfilePropertiesWorkflow.UserEntityProperty)));
            }
            set
            {
                base.SetValue(SetProfilePropertiesWorkflow.UserEntityProperty, value);
            }
        }

        public static DependencyProperty ProfileSettingsProperty = DependencyProperty.Register("ProfileSettings", typeof(SettingsPropertyValueCollection), typeof(SetProfilePropertiesWorkflow));

        [DescriptionAttribute("ProfileSettings")]
        [CategoryAttribute("ProfileValueCollection Category")]
        [BrowsableAttribute(true)]
        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        public SettingsPropertyValueCollection ProfileSettings
        {
            get
            {
                return ((SettingsPropertyValueCollection)(base.GetValue(SetProfilePropertiesWorkflow.ProfileSettingsProperty)));
            }
            set
            {
                base.SetValue(SetProfilePropertiesWorkflow.ProfileSettingsProperty, value);
            }
        }

        private void GetUser_ExecuteCode(object sender, EventArgs e)
        {
            using (UserBL bl = new UserBL())
            {
                UserEntity = bl.GetUserData(UserName);
            }
        }

        private void UserFoundCondition(object sender, ConditionalEventArgs e)
        {
            e.Result = (UserEntity != null) ? true : false;
        }

        private static class EntityConverter<T>
        {
            public static void CopyValues(SettingsPropertyValueCollection source, T target)
            {
                IEnumerable<SettingsPropertyValue> _source = source.Cast<SettingsPropertyValue>();
                foreach (SettingsPropertyValue sv in _source)
                {
                    PropertyInfo pi = target.GetType().GetProperty(sv.Name);
                    if (null != pi && sv.IsDirty)//set only properties that changed.
                    {
                        if (sv.Deserialized && null == sv.PropertyValue) //incase value could be deserialized properly
                            pi.SetValue(target, DBNull.Value, null);
                        else
                            pi.SetValue(target, sv.PropertyValue, null);
                    }
                }
            }
        }

        private void UpdateUserProfile_ExecuteCode(object sender, EventArgs e)
        {
            using (UserBL bl = new UserBL())
            {
                IUserProfileDTO profile = new UserProfileBase(bl.GetUserProfileDTO(UserName, ApplicationName));
                //bool isOrphanUser = false;

                //incase we have an orphan user record with no profile. Might happen if we delete
                //a profile without deleting the corresponding user record.
                if (null == profile)
                {
                    throw new UserProfileException(UserName + " no user data.");
                    //profile = new UserProfileBase();
                    //isOrphanUser = true;
                }

                //Note:
                //Using reflection to populate values, might entail enforcing some validation logic
                //when setting properties for the Entities inside the DataContext using Partial Methods.
                EntityConverter<IUserProfileDTO>.CopyValues(ProfileSettings, profile);

                profile.LAST_ACTIVITY = "UpdateUserProfile";
                profile.LAST_ACTIVITY_DATE = DateTime.Now;
                profile.LAST_SIGN_ON_DATE = DateTime.Now;
                int t = bl.GetApplication(ApplicationName).APP_KEY;
                bl.UpdateUserProfileDTO(profile, bl.GetApplication(ApplicationName).APP_KEY);
            }
        }

        private void CreateNewUserProfile_ExecuteCode(object sender, EventArgs e)
        {
            using (UserBL bl = new UserBL())
            {
                IUserProfileDTO profile = new UserProfileBase(bl.GetUserProfileDTO(UserName, ApplicationName));

                if (null == profile)
                {
                    throw new UserProfileException(UserName + " no user data.");
                    //profile = new UserProfileBase();
                    //isOrphanUser = true;
                }

                EntityConverter<IUserProfileDTO>.CopyValues(ProfileSettings, profile);

                profile.APP_KEY = bl.GetApplication(ApplicationName).APP_KEY;
                profile.EMP_ID = UserName;
                profile.IS_AUTHENTICATED = isUserAuthenticated;
                profile.LAST_ACTIVITY = "UpdateUserProfile";
                profile.LAST_ACTIVITY_DATE = DateTime.Now;
                profile.LAST_SIGN_ON_DATE = DateTime.Now;
                int t = bl.GetApplication(ApplicationName).APP_KEY;
                bl.UpdateUserProfileDTO(profile, bl.GetApplication(ApplicationName).APP_KEY);
            }
        }
    }
}