using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Collections;
using System.Drawing;
using System.Reflection;
using System.Workflow.ComponentModel.Compiler;
using System.Workflow.ComponentModel.Serialization;
using System.Workflow.ComponentModel;
using System.Workflow.ComponentModel.Design;
using System.Workflow.Runtime;
using System.Workflow.Activities;
using System.Workflow.Activities.Rules;

namespace SME.UserSystem.Core.Workflow
{
    partial class SetProfilePropertiesWorkflow
    {
        #region Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCode]
        private void InitializeComponent()
        {
            this.CanModifyActivities = true;
            System.Workflow.Activities.CodeCondition codecondition1 = new System.Workflow.Activities.CodeCondition();
            this.CreateNewUserProfile = new System.Workflow.Activities.CodeActivity();
            this.UpdateUserProfile = new System.Workflow.Activities.CodeActivity();
            this.ifUserNotFound = new System.Workflow.Activities.IfElseBranchActivity();
            this.ifUserFound = new System.Workflow.Activities.IfElseBranchActivity();
            this.TestUserValue = new System.Workflow.Activities.IfElseActivity();
            this.GetUser = new System.Workflow.Activities.CodeActivity();
            // 
            // CreateNewUserProfile
            // 
            this.CreateNewUserProfile.Name = "CreateNewUserProfile";
            this.CreateNewUserProfile.ExecuteCode += new System.EventHandler(this.CreateNewUserProfile_ExecuteCode);
            // 
            // UpdateUserProfile
            // 
            this.UpdateUserProfile.Name = "UpdateUserProfile";
            this.UpdateUserProfile.ExecuteCode += new System.EventHandler(this.UpdateUserProfile_ExecuteCode);
            // 
            // ifUserNotFound
            // 
            this.ifUserNotFound.Activities.Add(this.CreateNewUserProfile);
            this.ifUserNotFound.Name = "ifUserNotFound";
            // 
            // ifUserFound
            // 
            this.ifUserFound.Activities.Add(this.UpdateUserProfile);
            codecondition1.Condition += new System.EventHandler<System.Workflow.Activities.ConditionalEventArgs>(this.UserFoundCondition);
            this.ifUserFound.Condition = codecondition1;
            this.ifUserFound.Name = "ifUserFound";
            // 
            // TestUserValue
            // 
            this.TestUserValue.Activities.Add(this.ifUserFound);
            this.TestUserValue.Activities.Add(this.ifUserNotFound);
            this.TestUserValue.Name = "TestUserValue";
            // 
            // GetUser
            // 
            this.GetUser.Name = "GetUser";
            this.GetUser.ExecuteCode += new System.EventHandler(this.GetUser_ExecuteCode);
            // 
            // SetProfilePropertiesWorkflow
            // 
            this.Activities.Add(this.GetUser);
            this.Activities.Add(this.TestUserValue);
            this.Name = "SetProfilePropertiesWorkflow";
            this.CanModifyActivities = false;

        }

        #endregion

        private IfElseBranchActivity ifUserNotFound;
        private IfElseBranchActivity ifUserFound;
        private IfElseActivity TestUserValue;
        private CodeActivity CreateNewUserProfile;
        private CodeActivity UpdateUserProfile;
        private CodeActivity GetUser;






    }
}
