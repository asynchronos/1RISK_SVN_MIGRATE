<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectFormWebUserControl.ascx.cs"
    Inherits="LGDCollectionData.UserControls.SelectFormWebUserControl" %>
<div id="LinkDiv" runat="server" style="float: right; white-space: nowrap; display: inline;">
    <%--CIF :
    <asp:ComboBox ID="CIF_ComboBox" runat="server" AutoCompleteMode="SuggestAppend" DataSourceID="CIFList_SqlDataSource"
        DataTextField="CIF" DataValueField="CIF" MaxLength="0" Style="display: inline;"
        AppendDataBoundItems="true">
        <asp:ListItem>
        </asp:ListItem>
    </asp:ComboBox>--%>
    <asp:DropDownList ID="Form_DropDownList" runat="server" DataSourceID="FormList_SqlDataSource"
        DataTextField="FORM_NAME" DataValueField="FORM_URL" AppendDataBoundItems="true">
        <asp:ListItem>------- Please Select Form -------</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="GoTo_Button" runat="server" Text="Go" OnClick="GoTo_Button_Click" />
    <asp:SqlDataSource ID="CIFList_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="LIST_OF_DEFAULT_SELECT" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="FormList_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="FORM_NAME_SELECT" SelectCommandType="StoredProcedure" EnableCaching="True">
    </asp:SqlDataSource>
</div>
