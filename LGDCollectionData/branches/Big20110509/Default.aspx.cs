﻿using System;

namespace LGDCollectionData
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/Aspx/SELECT_FORM.aspx");
        }
    }
}