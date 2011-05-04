<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="SELECT_FORM.aspx.cs"
    Inherits="LGDCollectionData.Aspx.SELECT_FORM" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="FORM_NAME_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="LIST_OF_DEFAULT_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:Label ID="Label3" runat="server" Text="MAIN" Style="font-weight: 700; font-size: large"></asp:Label>
    <br />
    <br />
    <%--<asp:UpdatePanel ID="UP1" runat="server">
        <ContentTemplate>--%>
    <asp:Label ID="Label2" runat="server" Text="CIF :"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="SqlDataSource2"
        DataTextField="CIF" DataValueField="CIF" MaxLength="0" Style="display: inline;"
        AppendDataBoundItems="true">
        <asp:ListItem></asp:ListItem>
    </asp:ComboBox>
    <%--<asp:TextBox ID="TextBoxCIF" runat="server"></asp:TextBox>
            <asp:AutoCompleteExtender ID="TextBoxCIF_AutoCompleteExtender" runat="server" DelimiterCharacters=""
                Enabled="True" ServicePath="" ServiceMethod="GetCompletionList" TargetControlID="TextBoxCIF"
                UseContextKey="True">
            </asp:AutoCompleteExtender>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <br />
    <asp:Label ID="Label1" runat="server" Text="FORM: "></asp:Label>
    <asp:DropDownList ID="DropDownListFormName" runat="server" DataSourceID="SqlDataSource1"
        DataTextField="FORM_NAME" DataValueField="FORM_URL">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Button ID="ButtonOpenForm" runat="server" Text="OPEN FORM" OnClick="ButtonOpenForm_Click" />
</asp:Content>