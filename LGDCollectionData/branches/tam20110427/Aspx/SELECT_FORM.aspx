<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" 
   CodeBehind="SELECT_FORM.aspx.cs" 
   Inherits="LGDCollectionData.Aspx.SELECT_FORM"
   %>
   
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
            SelectCommand="FORM_NAME_SELECT" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    
        <asp:Label ID="Label2" runat="server" Text="CIF :"></asp:Label>
        <asp:TextBox ID="TextBoxCIF" runat="server"></asp:TextBox>
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="FORM: "></asp:Label>
        <asp:DropDownList ID="DropDownListFormName" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="FORM_NAME" 
            DataValueField="FORM_URL">
        </asp:DropDownList>
    
        <br />
        <asp:Button ID="ButtonOpenForm" runat="server" Text="OPEN FORM" 
            onclick="ButtonOpenForm_Click" />
    
 </asp:Content>
    
    
