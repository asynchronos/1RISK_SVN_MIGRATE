<%@ Page Title="" Language="VB" MasterPageFile="~/IframePopup.master" AutoEventWireup="false"
    CodeFile="CLSListByCA.aspx.vb" Inherits="CLSListByCA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../theme/MyStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .showDetial
        {
            display: block;
        }
        .hideDetial
        {
            display: none;
        }
        .clsRootRow
        {
            background-color: White;
        }
        .clsLineRow
        {
            background-color: #EFF3FB;
        }
        .clsProductRow
        {
            background-color: #FFFBD6;
            color: #333333;
        }
        .clsDummyRow
        {
            background-color: #FFEEFF;
            color: #007700;
        }
        .clsLimitChanged
        {
            color: #007700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderPopupBody" runat="Server">
    <asp:GridView ID="GridViewLimitByCA" runat="server" CellPadding="4" ForeColor="#333333"
        AutoGenerateColumns="False" 
        OnRowDataBound="GridViewLimitByCA_RowDataBound" DataSourceID="ObjectDataSource_CLSSubGrid"
        Width="100%" DataKeyNames="ID_KEY">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" Visible="false"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID_KEY" HeaderText="ID_KEY" SortExpression="ID_KEY" Visible="false">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="LIMIT NO" SortExpression="LIMIT_NO" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_NO" runat="server" Text='<%# Eval("LIMIT_NO") %>' Visible="false"></asp:Label>
                    <asp:Label ID="LabelLIMIT_NOShow" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TYPE" SortExpression="LIMIT_TYPE">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_TYPE" runat="server" Text='<%# Eval("LIMIT_TYPE") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="LIMIT_STATUS" HeaderText="STATUS" SortExpression="LIMIT_STATUS" ReadOnly="true">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ACCOUNT_NO" HeaderText="ACCOUNT NO" SortExpression="ACCOUNT_NO" ReadOnly="true">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="PRODUCT_NAME" HeaderText="PRODUCT" SortExpression="PRODUCT_NAME" ReadOnly="true">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="CIF_LIST" HeaderText="CIF LIST" SortExpression="CIF_LIST" ReadOnly="true">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="AMOUNT" SortExpression="LIMIT_AMOUNT">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_AMOUNT" runat="server" Text='<%# Eval("LIMIT_AMOUNT","{0:#,###.##}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLIMIT_AMOUNT" runat="server" Width="12ex" style="text-align:right;"
                        Text='<%# Bind("LIMIT_AMOUNT") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CHANGE" SortExpression="LIMIT_CHANGE">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_CHANGE" runat="server" Text='<%# Eval("LIMIT_CHANGE","{0:#,###.##}") %>'
                        CssClass='<%# IIF(IsNothing(Eval("LIMIT_CHANGE")),"","clsLimitChanged") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLIMIT_CHANGE" runat="server" Width="12ex" style="text-align:right;"
                        Text='<%# Bind("LIMIT_CHANGE") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CHANGE DATE" SortExpression="LIMIT_CHANGE_DATE">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_CHANGE_DATE" runat="server" Text='<%# Eval("LIMIT_CHANGE_DATE","{0:dd/MM/yyyy}") %>'
                        CssClass='<%# IIF(IsNothing(Eval("LIMIT_CHANGE_DATE")),"","clsLimitChanged") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLIMIT_CHANGE_DATE" runat="server" Width="10ex"
                        Text='<%# Eval("LIMIT_CHANGE_DATE","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                    <cc1:CalendarExtender ID="TextBoxLIMIT_CHANGE_DATE_CalendarExtender" runat="server"
                        TargetControlID="TextBoxLIMIT_CHANGE_DATE">
                    </cc1:CalendarExtender>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MAP" SortExpression="MAPPING_STATUS">
                <ItemTemplate>
                    <asp:Label ID="LabelMAPPING_STATUS" runat="server" Text='<%# Eval("MAPPING_STATUS") %>'
                        CssClass='<%# IIF(IsNothing(Eval("MAPPING_STATUS")),"","clsLimitChanged") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListMAPPING_STATUS" runat="server" 
                        SelectedValue='<%# Bind("MAPPING_STATUS") %>'>
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                        <asp:ListItem Value="U" Text="Unknown"></asp:ListItem>
                        <asp:ListItem Value="N" Text="New Limit"></asp:ListItem>
                        <asp:ListItem Value="L" Text="Limit Change"></asp:ListItem>
                        <asp:ListItem Value="S" Text="Status Change"></asp:ListItem>
                        <asp:ListItem Value="R" Text="Relate Map"></asp:ListItem>
                        <asp:ListItem Value="E" Text="Expire(3 Month)"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="LIMIT_PRODUCT_EFFECT_DATE" HeaderText="EFFECT DATE" SortExpression="LIMIT_PRODUCT_EFFECT_DATE"
                DataFormatString="{0:dd/MM/yyyy}" Visible="False">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LIMIT_PRODUCT_EXPIRE_DATE" HeaderText="EXPIRE DATE" SortExpression="LIMIT_PRODUCT_EXPIRE_DATE"
                DataFormatString="{0:dd/MM/yyyy}" Visible="False">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="CA NO" SortExpression="LIMIT_PRODUCT_CA_NO">
                <ItemTemplate>
                    <asp:Label ID="LabelLIMIT_PRODUCT_CA_NO" runat="server" Text='<%# Eval("LIMIT_PRODUCT_CA_NO") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLIMIT_PRODUCT_CA_NO" runat="server" Width="24ex"
                        Text='<%# Bind("LIMIT_PRODUCT_CA_NO") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMIT_PRODUCT_CA_DATE" HeaderText="CA DATE" SortExpression="LIMIT_PRODUCT_CA_DATE"
                DataFormatString="{0:dd/MM/yyyy}" Visible="False">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LIMIT_PRODUCT_APPV_DATE" HeaderText="APPROVE DATE" SortExpression="LIMIT_PRODUCT_APPV_DATE"
                DataFormatString="{0:dd/MM/yyyy}" Visible="false">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LIMIT_PRODUCT_APPV_AUTH_UNIT" HeaderText="APPROVE AUTH UNIT"
                SortExpression="LIMIT_PRODUCT_APPV_AUTH_UNIT" Visible="false">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="LIMIT_PRODUCT_PREVIOUS_CA_NO" HeaderText="PREVIOUS CA NO"
                SortExpression="LIMIT_PRODUCT_PREVIOUS_CA_NO" Visible="false">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
            No Limit
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource_CLSSubGrid" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="getSP_P_CLS_SELECT_BY_CA" TypeName="CheckDrawn.business.CheckDrawnBO"
        DataObjectTypeName="CheckDrawn.linq.P_CLS_SELECT_BY_CAResult" 
        UpdateMethod="updateCLS_WHEN_APPROVE" >
        <SelectParameters>
            <asp:QueryStringParameter Name="leader1CAOldId" 
                QueryStringField="leader1CAOldId" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
