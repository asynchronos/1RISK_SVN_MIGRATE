<%@ Page Title="Employee Filter" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="empFilter.aspx.vb" Inherits="aspx.role.empFilter" %>

<%@ Register Src="../../Controls/Role/RoleMenuControl.ascx" TagName="RoleMenuControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:RoleMenuControl ID="RoleMenuControl1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                EMP FILTER:
                <asp:TextBox ID="TextBox_EmpFilter" runat="server"></asp:TextBox>
                <asp:Button ID="Butt_Search" runat="server" Text="Search" />
                <asp:HiddenField ID="Hidd_EmpFilter" runat="server" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GV_EmpInRoleFilter" runat="server" CellPadding="4" ForeColor="#333333"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
        DataSourceID="DS_EmpInRoleFilter">
        <PagerSettings Mode="NumericFirstLast" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" Visible="False" />
            <asp:TemplateField HeaderText="EMP ID" SortExpression="EMP_ID">
                <ItemTemplate>
                    <asp:Label ID="Label_EmpId" runat="server" Text='<%# Bind("EMP_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EMP NAME" SortExpression="EMPNAME">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButt_EmpName" runat="server" Text='<%# Bind("EMPNAME") %>'
                        ToolTip="Manage Role" OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/empManageRole.aspx") + "&#39;,&#39;empId=" + (Eval("EMP_ID")).ToString() + "&#39;);return false;" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ROLE ID" SortExpression="ROLE_ID" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label_RoleId" runat="server" Text='<%# Bind("ROLE_ID") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ROLE NAME" SortExpression="ROLE_NAME">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButt_RoleName" runat="server" Text='<%# Bind("ROLE_NAME") %>'
                        OnClick="LinkButt_RoleName_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="DS_EmpInRoleFilter" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
        SelectCommand="SP_Role_Get_EmpInRole_By_Filter" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Hidd_EmpFilter" Name="Filter" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
