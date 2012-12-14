<%@ Page Language="VB" AutoEventWireup="false" CodeFile="criteriaValidateByCif.aspx.vb" Inherits="aspx_stop_criteriaValidateByCif" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="CriteriaValidateFV" runat="server" DataKeyNames="CIF" 
            DataSourceID="CriteriaValidateDS">
            <EditItemTemplate>
                CIF:
                <asp:Label ID="CIFLabel1" runat="server" Text='<%# Eval("CIF") %>' />
                <br />
                AGING_CRITERIA_CHK:
                <asp:DropDownList ID="AGING_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("AGING_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                CLASS_CRITERIA_CHK:
                <asp:DropDownList ID="CLASS_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("CLASS_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                TDR_CRITERIA_CHK:
                <asp:DropDownList ID="TDR_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("TDR_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                OD_UTILIZE_CRITERIA_CHK:
                <asp:DropDownList ID="OD_UTILIZE_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("OD_UTILIZE_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                JUDGEMENT_CRITERIA_CHK:
                <asp:DropDownList ID="JUDGEMENT_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("JUDGEMENT_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                BUSINESS_CRITERIA_CHK:
                <asp:DropDownList ID="BUSINESS_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("BUSINESS_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                CIF:
                <asp:TextBox ID="CIFTextBox" runat="server" Text='<%# Bind("CIF") %>' />
                <br />
                AGING_CRITERIA_CHK:
                <asp:DropDownList ID="AGING_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("AGING_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                CLASS_CRITERIA_CHK:
                <asp:DropDownList ID="CLASS_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("CLASS_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                TDR_CRITERIA_CHK:
                <asp:DropDownList ID="TDR_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("TDR_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                OD_UTILIZE_CRITERIA_CHK:
                <asp:DropDownList ID="OD_UTILIZE_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("OD_UTILIZE_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                JUDGEMENT_CRITERIA_CHK:
                <asp:DropDownList ID="JUDGEMENT_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("JUDGEMENT_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                BUSINESS_CRITERIA_CHK:
                <asp:DropDownList ID="BUSINESS_CRITERIA_CHK_DDL" runat="server" 
                    SelectedValue='<%# Bind("BUSINESS_CRITERIA_CHK") %>'>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                CIF:
                <asp:Label ID="CIFLabel" runat="server" Text='<%# Eval("CIF") %>' />
                <br />
                AGING_CRITERIA_CHK:
                <asp:Label ID="AGING_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("AGING_CRITERIA_CHK") %>' />
                <br />
                CLASS_CRITERIA_CHK:
                <asp:Label ID="CLASS_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("CLASS_CRITERIA_CHK") %>' />
                <br />
                TDR_CRITERIA_CHK:
                <asp:Label ID="TDR_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("TDR_CRITERIA_CHK") %>' />
                <br />
                OD_UTILIZE_CRITERIA_CHK:
                <asp:Label ID="OD_UTILIZE_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("OD_UTILIZE_CRITERIA_CHK") %>' />
                <br />
                JUDGEMENT_CRITERIA_CHK:
                <asp:Label ID="JUDGEMENT_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("JUDGEMENT_CRITERIA_CHK") %>' />
                <br />
                BUSINESS_CRITERIA_CHK:
                <asp:Label ID="BUSINESS_CRITERIA_CHKLabel" runat="server" 
                    Text='<%# Bind("BUSINESS_CRITERIA_CHK") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" Text="Edit" CommandName="edit" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="CriteriaValidateDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
            SelectCommand="S11_SELECT_CRITERIA_VALIDATE_BY_CIF" 
            SelectCommandType="StoredProcedure" 
            UpdateCommand="S12_UPDATE_CRITERIA_VALIDATE_BY_CIF" 
            UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CIF" Type="Int32" />
                <asp:Parameter Name="AGING_CRITERIA_CHK" Type="String" />
                <asp:Parameter Name="CLASS_CRITERIA_CHK" Type="String" />
                <asp:Parameter Name="TDR_CRITERIA_CHK" Type="String" />
                <asp:Parameter Name="OD_UTILIZE_CRITERIA_CHK" Type="String" />
                <asp:Parameter Name="JUDGEMENT_CRITERIA_CHK" Type="String" />
                <asp:Parameter Name="BUSINESS_CRITERIA_CHK" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
