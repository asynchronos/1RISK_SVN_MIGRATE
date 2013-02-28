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
using SME.UserSystem.Core.Profile;

namespace SME.UserSystem.Core.Workflow
{
    public sealed partial class GetProfilePropertiesWorkflow : SequentialWorkflowActivity
    {
        public GetProfilePropertiesWorkflow()
        {
            InitializeComponent();
        }

        public SettingsPropertyCollection SettingsCollection { get; set; }

        public Guid ApplicationGuid { get; set; }

        public string ApplicationName { get; set; }

        public string UserName { get; set; }

        public static DependencyProperty ProfileSettingsProperty = DependencyProperty.Register("ProfileSettings", typeof(SettingsPropertyValueCollection), typeof(GetProfilePropertiesWorkflow));

        public static DependencyProperty UserProfileProperty = DependencyProperty.Register("UserProfile", typeof(UserProfileBase), typeof(GetProfilePropertiesWorkflow));

        [DescriptionAttribute("UserProfile")]
        [CategoryAttribute("UserProfile Category")]
        [BrowsableAttribute(true)]
        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        public UserProfileBase UserProfile
        {
            get
            {
                return ((UserProfileBase)(base.GetValue(GetProfilePropertiesWorkflow.UserProfileProperty)));
            }
            set
            {
                base.SetValue(GetProfilePropertiesWorkflow.UserProfileProperty, value);
            }
        }

        [DescriptionAttribute("ProfileSettings")]
        [CategoryAttribute("ProfileSettings Category")]
        [BrowsableAttribute(true)]
        [DesignerSerializationVisibilityAttribute(DesignerSerializationVisibility.Visible)]
        public SettingsPropertyValueCollection ProfileSettings
        {
            get
            {
                return ((SettingsPropertyValueCollection)(base.GetValue(GetProfilePropertiesWorkflow.ProfileSettingsProperty)));
            }
            set
            {
                base.SetValue(GetProfilePropertiesWorkflow.ProfileSettingsProperty, value);
            }
        }

        private void InitializePropertyCollection_ExecuteCode(object sender, EventArgs e)
        {
            //SettingsPropertyValueCollection values = new SettingsPropertyValueCollection();
            ProfileSettings = new SettingsPropertyValueCollection();
            IEnumerable<SettingsProperty> _collection = SettingsCollection.Cast<SettingsProperty>();
            foreach (SettingsProperty sp in _collection)
            {
                SettingsPropertyValue value = new SettingsPropertyValue(sp);
                ProfileSettings.Add(value);
            }
        }

        private void GetUserProfile_ExecuteCode(object sender, EventArgs e)
        {
            using (UserBL bl = new UserBL())
            {
                UserProfile = new UserProfileBase(bl.GetUserProfileDTO(UserName, ApplicationName));
            }
        }

        private void PopulatePropertyValues_ExecuteCode(object sender, EventArgs e)
        {
            if (null != UserProfile)
            {
                IEnumerable<SettingsProperty> _collection = SettingsCollection.Cast<SettingsProperty>();
                Type type = UserProfile.GetType();
                foreach (SettingsProperty sp in _collection)
                {
                    SettingsPropertyValue value = ProfileSettings[sp.Name];
                    if (null != value)
                    {
                        if (value.UsingDefaultValue)
                            value.PropertyValue = Convert.ChangeType(value.Property.DefaultValue, value.Property.PropertyType);

                        PropertyInfo pi = type.GetProperty(sp.Name);
                        object pv = pi.GetValue(UserProfile, null);

                        if (null != pv && !(pv is DBNull))
                            value.PropertyValue = pv;

                        value.IsDirty = false;
                        value.Deserialized = true;
                    }
                }
                // Usually, LastActivityDate field in the aspnet_Users table is updated after a read.
            }
        }
    }
}