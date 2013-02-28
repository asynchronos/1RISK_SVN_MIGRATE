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
    partial class GetProfilePropertiesWorkflow
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
            this.PopulatePropertyValues = new System.Workflow.Activities.CodeActivity();
            this.GetUserProfile = new System.Workflow.Activities.CodeActivity();
            this.InitializePropertyCollection = new System.Workflow.Activities.CodeActivity();
            // 
            // PopulatePropertyValues
            // 
            this.PopulatePropertyValues.Name = "PopulatePropertyValues";
            this.PopulatePropertyValues.ExecuteCode += new System.EventHandler(this.PopulatePropertyValues_ExecuteCode);
            // 
            // GetUserProfile
            // 
            this.GetUserProfile.Name = "GetUserProfile";
            this.GetUserProfile.ExecuteCode += new System.EventHandler(this.GetUserProfile_ExecuteCode);
            // 
            // InitializePropertyCollection
            // 
            this.InitializePropertyCollection.Name = "InitializePropertyCollection";
            this.InitializePropertyCollection.ExecuteCode += new System.EventHandler(this.InitializePropertyCollection_ExecuteCode);
            // 
            // GetProfilePropertiesWorkflow
            // 
            this.Activities.Add(this.InitializePropertyCollection);
            this.Activities.Add(this.GetUserProfile);
            this.Activities.Add(this.PopulatePropertyValues);
            this.Name = "GetProfilePropertiesWorkflow";
            this.CanModifyActivities = false;

        }

        #endregion

        private CodeActivity GetUserProfile;
        private CodeActivity InitializePropertyCollection;
        private CodeActivity PopulatePropertyValues;











    }
}
