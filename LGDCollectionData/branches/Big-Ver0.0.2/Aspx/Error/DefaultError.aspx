<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DefaultError.aspx.cs" Inherits="LGDCollectionData.Aspx.Error.DefaultError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Error_Label" runat="server" Text="Label" ForeColor="Red"></asp:Label>
</asp:Content>