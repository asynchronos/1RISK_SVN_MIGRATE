<%@ Control Language="C#" CodeBehind="ForeignKey.ascx.cs" Inherits="UserSystem.ForeignKeyField" %>

<asp:HyperLink ID="HyperLink1" runat="server"
    Text="<%# GetDisplayString() %>"
    NavigateUrl="<%# GetNavigateUrl() %>"  />

