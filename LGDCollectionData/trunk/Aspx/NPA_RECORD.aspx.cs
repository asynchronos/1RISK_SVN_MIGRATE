﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Globalization;
using log4net;

namespace LGDCollectionData.Aspx
{
    public partial class NPA_RECORD_NEW : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger(
System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //MessageBox.Show(e.AffectedRows.ToString());
            if (e.AffectedRows.ToString() == "-1")
            {
                //MessageBox.Show("aaa1");
                // Perform any additional processing, such as sending an e-mail notification.
                //Label1.Text = Request.LogonUserIdentity.Name + " changed user information sucessfully!";

                string Message = "Update Successed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";

                //MessageBox.Show(sb.ToString());
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);

            }
            else
            {
                //Label1.Text = "No data updated!";
                string Message = "Update Failed";
                string sb = "<script language='javascript'>" +
                                     "popupAlert('" + Message + "');" +
                                     "</script>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ajax", sb.ToString(), false);
            }
        }

        protected void DetailsView_Databound(Object sender, EventArgs e)
        {

            if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
            {
                System.Web.UI.WebControls.Label userId = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelUserId");
                System.Web.UI.WebControls.Label dateLabel = (System.Web.UI.WebControls.Label)DetailsView1.FindControl("LabelDate");
                if (userId != null)
                    userId.Text = User.Identity.Name.ToString();
                if (dateLabel != null)
                    dateLabel.Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
            }
        }

        protected void DetailsView_OnPreRender(object sender, EventArgs e)
        {
            DetailsView dv = (DetailsView)sender;
            if (dv.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)myDetailsView.FindControl("TextBox2")).Text = DateTime.Now.ToString("g");
                if (dv.Rows.Count > 0)
                {
                    dv.ChangeMode(DetailsViewMode.Edit);
                }
                else
                {
                    dv.ChangeMode(DetailsViewMode.Insert);
                    ((Label)dv.FindControl("LabelCif_Insert")).Text = Request.QueryString.Get("CIF");
                    ((Label)dv.FindControl("LabelUserId_Insert")).Text = User.Identity.Name.ToString();
                    ((Label)dv.FindControl("LabelDate_Insert")).Text = string.Format("{0:d MMMM yyyy}", DateTime.Now);
                }
            }
        }

        protected void Collateral_Sale_Date_TextBox_ServerValidate(object source, ServerValidateEventArgs args)
        {
            ITextControl t = (((CustomValidator)source).Parent.FindControl("Default_Date_Label") != null) ? (ITextControl)((CustomValidator)source).Parent.FindControl("Default_Date_Label") : (ITextControl)((CustomValidator)source).Parent.FindControl("TextBoxDefault_Date_Insert");

            CalendarExtender cal = ((CalendarExtender)((CustomValidator)source).Parent.FindControl("Collateral_Sale_Date_TextBox_CalendarExtender"));

            CultureInfo cul = new CultureInfo("en-US");
            DateTime inputDate = DateTime.ParseExact(args.Value, cal.Format, cul);
            DateTime compareDate = DateTime.ParseExact(t.Text, cal.Format, cul);

            args.IsValid = (inputDate.CompareTo(compareDate) == 1) ? true : false;
        }

        protected void DetailsView_PageIndexChanging(Object sender, EventArgs e)
        {
            ((System.Web.UI.WebControls.DetailsView)sender).UpdateItem(false);
        }

        protected virtual void DetailsView_ItemUpdating(object sender, System.Web.UI.WebControls.DetailsViewUpdateEventArgs e)
        {
            bool hasChanged = false;
            for (int i = 0; i < e.OldValues.Count; i++)
            {
                if (e.OldValues[i] == null && e.NewValues[i] == null)
                {
                    if (isDebugEnabled)
                    {
                        log.Debug("Parameter[" + i + "]:both null");
                    }
                    //do nothing
                }
                else if (e.OldValues[i] != null && e.NewValues[i] != null)
                {
                    if (isDebugEnabled)
                    {
                        log.Debug("Parameter[" + i + "]:both not null");
                    }

                    if (!e.OldValues[i].Equals(e.NewValues[i]))
                    {
                        log.Debug("   OldValues" + e.OldValues[i].ToString());
                        log.Debug("   NewValues" + e.NewValues[i].ToString());
                        hasChanged = true;
                        break;
                    }
                }
                else //null one value
                {
                    if (isDebugEnabled)
                    {
                        log.Debug("Parameter[" + i + "]:null one");
                    }

                    hasChanged = true;
                    break;
                }
            }

            if (isDebugEnabled)
            {
                log.Debug("hasChanged:" + hasChanged.ToString());
            }

            if (!hasChanged)
            {
                e.Cancel = true;
            }
            else
            {
                e.NewValues["UpdateUser"] = User.Identity.Name;
                e.NewValues["UpdateDate"] = DateTime.Now;
            }
        }

    }
}