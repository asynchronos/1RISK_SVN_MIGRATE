<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true"
    CodeBehind="UnAuthorized.aspx.cs" Inherits="UserSystem.WebPages.Error.UnAuthorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        You do not have permission to visit the page or perform the operation you requested.
    </div>
</asp:Content>