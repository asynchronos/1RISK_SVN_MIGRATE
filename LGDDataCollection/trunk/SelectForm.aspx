<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelectForm.aspx.cs" Inherits="SelectForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LGDCollectiondataConn %>" 
            SelectCommand="FORM.GET_FORM_NAME" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        Data Inputter:<asp:Label ID="LabelEmpID" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Choose Form:"></asp:Label>

        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="FORM_NAME" 
            DataValueField="FORM_URL">
        </asp:DropDownList>
        <br />

        <asp:Label ID="Label1" runat="server" Text="CIF:"></asp:Label>
        <asp:TextBox ID="TextBoxCIF" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Open Form" />
        <br />
</asp:Content>

