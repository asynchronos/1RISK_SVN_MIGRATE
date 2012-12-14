<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FinancialCal.aspx.vb" Inherits="aspx_smes_FinancialCal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT * FROM [SME_S].[FINANCIAL_CAL]"></asp:SqlDataSource>
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True">
            <EditItemTemplate>
                SMES_ID:
                <asp:Label ID="SMES_IDLabel1" runat="server" Text='<%# Eval("SMES_ID") %>' />
                <br />
                CASH_BOND:
                <asp:TextBox ID="CASH_BONDTextBox" runat="server" 
                    Text='<%# Bind("CASH_BOND") %>' />
                <br />
                ACCOUNT_RECEIVABLE:
                <asp:TextBox ID="ACCOUNT_RECEIVABLETextBox" runat="server" 
                    Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                <br />
                INVENTORY:
                <asp:TextBox ID="INVENTORYTextBox" runat="server" 
                    Text='<%# Bind("INVENTORY") %>' />
                <br />
                TOTAL_CURRENT_ASSETS:
                <asp:TextBox ID="TOTAL_CURRENT_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                <br />
                MACHINERY_EQUIPMENT:
                <asp:TextBox ID="MACHINERY_EQUIPMENTTextBox" runat="server" 
                    Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                <br />
                PROPERTY_PLANT_BUILDING:
                <asp:TextBox ID="PROPERTY_PLANT_BUILDINGTextBox" runat="server" 
                    Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                <br />
                OTHER_FIXED_ASSETS:
                <asp:TextBox ID="OTHER_FIXED_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                <br />
                ASSETS_FROM_CREDIT:
                <asp:TextBox ID="ASSETS_FROM_CREDITTextBox" runat="server" 
                    Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                <br />
                TOTAL_FIXED_ASSETS:
                <asp:TextBox ID="TOTAL_FIXED_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                <br />
                TOTAL_ASSETS:
                <asp:TextBox ID="TOTAL_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_ASSETS") %>' />
                <br />
                AC_PAYABLE:
                <asp:TextBox ID="AC_PAYABLETextBox" runat="server" 
                    Text='<%# Bind("AC_PAYABLE") %>' />
                <br />
                CURRENT_LIABILITY_BAY:
                <asp:TextBox ID="CURRENT_LIABILITY_BAYTextBox" runat="server" 
                    Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                <br />
                OTHER_CURRENT_LIABILITY:
                <asp:TextBox ID="OTHER_CURRENT_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                <br />
                TOTAL_CURRENT_LIABILITY:
                <asp:TextBox ID="TOTAL_CURRENT_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                <br />
                LONG_TERM_LIABILITY_BAY:
                <asp:TextBox ID="LONG_TERM_LIABILITY_BAYTextBox" runat="server" 
                    Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                <br />
                OTHER_LONG_TERM_LIABILITY:
                <asp:TextBox ID="OTHER_LONG_TERM_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                <br />
                TOTAL_LIABILITY:
                <asp:TextBox ID="TOTAL_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_LIABILITY") %>' />
                <br />
                LOANS_REL_CO_DIRECTORS:
                <asp:TextBox ID="LOANS_REL_CO_DIRECTORSTextBox" runat="server" 
                    Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                <br />
                EQUITY:
                <asp:TextBox ID="EQUITYTextBox" runat="server" Text='<%# Bind("EQUITY") %>' />
                <br />
                LIABILITY_EQUITY:
                <asp:TextBox ID="LIABILITY_EQUITYTextBox" runat="server" 
                    Text='<%# Bind("LIABILITY_EQUITY") %>' />
                <br />
                EBIDA_PERCENT:
                <asp:TextBox ID="EBIDA_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("EBIDA_PERCENT") %>' />
                <br />
                EBIDA:
                <asp:TextBox ID="EBIDATextBox" runat="server" Text='<%# Bind("EBIDA") %>' />
                <br />
                DE_BEFORE_LOAN:
                <asp:TextBox ID="DE_BEFORE_LOANTextBox" runat="server" 
                    Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                <br />
                DSCR_BEFORE_LOAN:
                <asp:TextBox ID="DSCR_BEFORE_LOANTextBox" runat="server" 
                    Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                <br />
                AR_DAY:
                <asp:TextBox ID="AR_DAYTextBox" runat="server" Text='<%# Bind("AR_DAY") %>' />
                <br />
                INVENTORY_DAY:
                <asp:TextBox ID="INVENTORY_DAYTextBox" runat="server" 
                    Text='<%# Bind("INVENTORY_DAY") %>' />
                <br />
                WORKING_CAPITAL_NEED:
                <asp:TextBox ID="WORKING_CAPITAL_NEEDTextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                <br />
                LOAN_NEED:
                <asp:TextBox ID="LOAN_NEEDTextBox" runat="server" 
                    Text='<%# Bind("LOAN_NEED") %>' />
                <br />
                OWNERS_EQUITY_PERCENT:
                <asp:TextBox ID="OWNERS_EQUITY_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY_PERCENT") %>' />
                <br />
                OWNERS_EQUITY:
                <asp:TextBox ID="OWNERS_EQUITYTextBox" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY") %>' />
                <br />
                FIXED_INTEREST_PERCENT:
                <asp:TextBox ID="FIXED_INTEREST_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' />
                <br />
                PAYMENT_PERIOD:
                <asp:TextBox ID="PAYMENT_PERIODTextBox" runat="server" 
                    Text='<%# Bind("PAYMENT_PERIOD") %>' />
                <br />
                AVERAGE_PAYMENT_PERIOD:
                <asp:TextBox ID="AVERAGE_PAYMENT_PERIODTextBox" runat="server" 
                    Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                <br />
                WORKING_CAPITAL_APPROVE:
                <asp:TextBox ID="WORKING_CAPITAL_APPROVETextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                <br />
                LOAN_APPROVE:
                <asp:TextBox ID="LOAN_APPROVETextBox" runat="server" 
                    Text='<%# Bind("LOAN_APPROVE") %>' />
                <br />
                INTEREST_RATE_PERCENT:
                <asp:TextBox ID="INTEREST_RATE_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT") %>' />
                <br />
                INTEREST_RATE_PERCENT_USED:
                <asp:TextBox ID="INTEREST_RATE_PERCENT_USEDTextBox" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' />
                <br />
                CONTRACT_YEAR:
                <asp:TextBox ID="CONTRACT_YEARTextBox" runat="server" 
                    Text='<%# Bind("CONTRACT_YEAR") %>' />
                <br />
                DSCR_THIS_TIME:
                <asp:TextBox ID="DSCR_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME") %>' />
                <br />
                DSCR_THIS_TIME_PERCENT:
                <asp:TextBox ID="DSCR_THIS_TIME_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' />
                <br />
                DE_THIS_TIME:
                <asp:TextBox ID="DE_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("DE_THIS_TIME") %>' />
                <br />
                LTV_THIS_TIME:
                <asp:TextBox ID="LTV_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME") %>' />
                <br />
                LTV_THIS_TIME_PERCENT:
                <asp:TextBox ID="LTV_THIS_TIME_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME_PERCENT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT:
                <asp:TextBox ID="WORKING_CAPITAL_DEFAULTTextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                <br />
                LOAN_DEFAULT:
                <asp:TextBox ID="LOAN_DEFAULTTextBox" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT_APPROVE:
                <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVETextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                <br />
                LOAN_DEFAULT_APPROVE:
                <asp:TextBox ID="LOAN_DEFAULT_APPROVETextBox" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                CASH_BOND:
                <asp:TextBox ID="CASH_BONDTextBox" runat="server" 
                    Text='<%# Bind("CASH_BOND") %>' />
                <br />
                ACCOUNT_RECEIVABLE:
                <asp:TextBox ID="ACCOUNT_RECEIVABLETextBox" runat="server" 
                    Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                <br />
                INVENTORY:
                <asp:TextBox ID="INVENTORYTextBox" runat="server" 
                    Text='<%# Bind("INVENTORY") %>' />
                <br />
                TOTAL_CURRENT_ASSETS:
                <asp:TextBox ID="TOTAL_CURRENT_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                <br />
                MACHINERY_EQUIPMENT:
                <asp:TextBox ID="MACHINERY_EQUIPMENTTextBox" runat="server" 
                    Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                <br />
                PROPERTY_PLANT_BUILDING:
                <asp:TextBox ID="PROPERTY_PLANT_BUILDINGTextBox" runat="server" 
                    Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                <br />
                OTHER_FIXED_ASSETS:
                <asp:TextBox ID="OTHER_FIXED_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                <br />
                ASSETS_FROM_CREDIT:
                <asp:TextBox ID="ASSETS_FROM_CREDITTextBox" runat="server" 
                    Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                <br />
                TOTAL_FIXED_ASSETS:
                <asp:TextBox ID="TOTAL_FIXED_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                <br />
                TOTAL_ASSETS:
                <asp:TextBox ID="TOTAL_ASSETSTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_ASSETS") %>' />
                <br />
                AC_PAYABLE:
                <asp:TextBox ID="AC_PAYABLETextBox" runat="server" 
                    Text='<%# Bind("AC_PAYABLE") %>' />
                <br />
                CURRENT_LIABILITY_BAY:
                <asp:TextBox ID="CURRENT_LIABILITY_BAYTextBox" runat="server" 
                    Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                <br />
                OTHER_CURRENT_LIABILITY:
                <asp:TextBox ID="OTHER_CURRENT_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                <br />
                TOTAL_CURRENT_LIABILITY:
                <asp:TextBox ID="TOTAL_CURRENT_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                <br />
                LONG_TERM_LIABILITY_BAY:
                <asp:TextBox ID="LONG_TERM_LIABILITY_BAYTextBox" runat="server" 
                    Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                <br />
                OTHER_LONG_TERM_LIABILITY:
                <asp:TextBox ID="OTHER_LONG_TERM_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                <br />
                TOTAL_LIABILITY:
                <asp:TextBox ID="TOTAL_LIABILITYTextBox" runat="server" 
                    Text='<%# Bind("TOTAL_LIABILITY") %>' />
                <br />
                LOANS_REL_CO_DIRECTORS:
                <asp:TextBox ID="LOANS_REL_CO_DIRECTORSTextBox" runat="server" 
                    Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                <br />
                EQUITY:
                <asp:TextBox ID="EQUITYTextBox" runat="server" Text='<%# Bind("EQUITY") %>' />
                <br />
                LIABILITY_EQUITY:
                <asp:TextBox ID="LIABILITY_EQUITYTextBox" runat="server" 
                    Text='<%# Bind("LIABILITY_EQUITY") %>' />
                <br />
                EBIDA_PERCENT:
                <asp:TextBox ID="EBIDA_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("EBIDA_PERCENT") %>' />
                <br />
                EBIDA:
                <asp:TextBox ID="EBIDATextBox" runat="server" Text='<%# Bind("EBIDA") %>' />
                <br />
                DE_BEFORE_LOAN:
                <asp:TextBox ID="DE_BEFORE_LOANTextBox" runat="server" 
                    Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                <br />
                DSCR_BEFORE_LOAN:
                <asp:TextBox ID="DSCR_BEFORE_LOANTextBox" runat="server" 
                    Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                <br />
                AR_DAY:
                <asp:TextBox ID="AR_DAYTextBox" runat="server" Text='<%# Bind("AR_DAY") %>' />
                <br />
                INVENTORY_DAY:
                <asp:TextBox ID="INVENTORY_DAYTextBox" runat="server" 
                    Text='<%# Bind("INVENTORY_DAY") %>' />
                <br />
                WORKING_CAPITAL_NEED:
                <asp:TextBox ID="WORKING_CAPITAL_NEEDTextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                <br />
                LOAN_NEED:
                <asp:TextBox ID="LOAN_NEEDTextBox" runat="server" 
                    Text='<%# Bind("LOAN_NEED") %>' />
                <br />
                OWNERS_EQUITY_PERCENT:
                <asp:TextBox ID="OWNERS_EQUITY_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY_PERCENT") %>' />
                <br />
                OWNERS_EQUITY:
                <asp:TextBox ID="OWNERS_EQUITYTextBox" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY") %>' />
                <br />
                FIXED_INTEREST_PERCENT:
                <asp:TextBox ID="FIXED_INTEREST_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' />
                <br />
                PAYMENT_PERIOD:
                <asp:TextBox ID="PAYMENT_PERIODTextBox" runat="server" 
                    Text='<%# Bind("PAYMENT_PERIOD") %>' />
                <br />
                AVERAGE_PAYMENT_PERIOD:
                <asp:TextBox ID="AVERAGE_PAYMENT_PERIODTextBox" runat="server" 
                    Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                <br />
                WORKING_CAPITAL_APPROVE:
                <asp:TextBox ID="WORKING_CAPITAL_APPROVETextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                <br />
                LOAN_APPROVE:
                <asp:TextBox ID="LOAN_APPROVETextBox" runat="server" 
                    Text='<%# Bind("LOAN_APPROVE") %>' />
                <br />
                INTEREST_RATE_PERCENT:
                <asp:TextBox ID="INTEREST_RATE_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT") %>' />
                <br />
                INTEREST_RATE_PERCENT_USED:
                <asp:TextBox ID="INTEREST_RATE_PERCENT_USEDTextBox" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' />
                <br />
                CONTRACT_YEAR:
                <asp:TextBox ID="CONTRACT_YEARTextBox" runat="server" 
                    Text='<%# Bind("CONTRACT_YEAR") %>' />
                <br />
                DSCR_THIS_TIME:
                <asp:TextBox ID="DSCR_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME") %>' />
                <br />
                DSCR_THIS_TIME_PERCENT:
                <asp:TextBox ID="DSCR_THIS_TIME_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' />
                <br />
                DE_THIS_TIME:
                <asp:TextBox ID="DE_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("DE_THIS_TIME") %>' />
                <br />
                LTV_THIS_TIME:
                <asp:TextBox ID="LTV_THIS_TIMETextBox" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME") %>' />
                <br />
                LTV_THIS_TIME_PERCENT:
                <asp:TextBox ID="LTV_THIS_TIME_PERCENTTextBox" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME_PERCENT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT:
                <asp:TextBox ID="WORKING_CAPITAL_DEFAULTTextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                <br />
                LOAN_DEFAULT:
                <asp:TextBox ID="LOAN_DEFAULTTextBox" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT_APPROVE:
                <asp:TextBox ID="WORKING_CAPITAL_DEFAULT_APPROVETextBox" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                <br />
                LOAN_DEFAULT_APPROVE:
                <asp:TextBox ID="LOAN_DEFAULT_APPROVETextBox" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                SMES_ID:
                <asp:Label ID="SMES_IDLabel" runat="server" Text='<%# Eval("SMES_ID") %>' />
                <br />
                CASH_BOND:
                <asp:Label ID="CASH_BONDLabel" runat="server" Text='<%# Bind("CASH_BOND") %>' />
                <br />
                ACCOUNT_RECEIVABLE:
                <asp:Label ID="ACCOUNT_RECEIVABLELabel" runat="server" 
                    Text='<%# Bind("ACCOUNT_RECEIVABLE") %>' />
                <br />
                INVENTORY:
                <asp:Label ID="INVENTORYLabel" runat="server" Text='<%# Bind("INVENTORY") %>' />
                <br />
                TOTAL_CURRENT_ASSETS:
                <asp:Label ID="TOTAL_CURRENT_ASSETSLabel" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_ASSETS") %>' />
                <br />
                MACHINERY_EQUIPMENT:
                <asp:Label ID="MACHINERY_EQUIPMENTLabel" runat="server" 
                    Text='<%# Bind("MACHINERY_EQUIPMENT") %>' />
                <br />
                PROPERTY_PLANT_BUILDING:
                <asp:Label ID="PROPERTY_PLANT_BUILDINGLabel" runat="server" 
                    Text='<%# Bind("PROPERTY_PLANT_BUILDING") %>' />
                <br />
                OTHER_FIXED_ASSETS:
                <asp:Label ID="OTHER_FIXED_ASSETSLabel" runat="server" 
                    Text='<%# Bind("OTHER_FIXED_ASSETS") %>' />
                <br />
                ASSETS_FROM_CREDIT:
                <asp:Label ID="ASSETS_FROM_CREDITLabel" runat="server" 
                    Text='<%# Bind("ASSETS_FROM_CREDIT") %>' />
                <br />
                TOTAL_FIXED_ASSETS:
                <asp:Label ID="TOTAL_FIXED_ASSETSLabel" runat="server" 
                    Text='<%# Bind("TOTAL_FIXED_ASSETS") %>' />
                <br />
                TOTAL_ASSETS:
                <asp:Label ID="TOTAL_ASSETSLabel" runat="server" 
                    Text='<%# Bind("TOTAL_ASSETS") %>' />
                <br />
                AC_PAYABLE:
                <asp:Label ID="AC_PAYABLELabel" runat="server" 
                    Text='<%# Bind("AC_PAYABLE") %>' />
                <br />
                CURRENT_LIABILITY_BAY:
                <asp:Label ID="CURRENT_LIABILITY_BAYLabel" runat="server" 
                    Text='<%# Bind("CURRENT_LIABILITY_BAY") %>' />
                <br />
                OTHER_CURRENT_LIABILITY:
                <asp:Label ID="OTHER_CURRENT_LIABILITYLabel" runat="server" 
                    Text='<%# Bind("OTHER_CURRENT_LIABILITY") %>' />
                <br />
                TOTAL_CURRENT_LIABILITY:
                <asp:Label ID="TOTAL_CURRENT_LIABILITYLabel" runat="server" 
                    Text='<%# Bind("TOTAL_CURRENT_LIABILITY") %>' />
                <br />
                LONG_TERM_LIABILITY_BAY:
                <asp:Label ID="LONG_TERM_LIABILITY_BAYLabel" runat="server" 
                    Text='<%# Bind("LONG_TERM_LIABILITY_BAY") %>' />
                <br />
                OTHER_LONG_TERM_LIABILITY:
                <asp:Label ID="OTHER_LONG_TERM_LIABILITYLabel" runat="server" 
                    Text='<%# Bind("OTHER_LONG_TERM_LIABILITY") %>' />
                <br />
                TOTAL_LIABILITY:
                <asp:Label ID="TOTAL_LIABILITYLabel" runat="server" 
                    Text='<%# Bind("TOTAL_LIABILITY") %>' />
                <br />
                LOANS_REL_CO_DIRECTORS:
                <asp:Label ID="LOANS_REL_CO_DIRECTORSLabel" runat="server" 
                    Text='<%# Bind("LOANS_REL_CO_DIRECTORS") %>' />
                <br />
                EQUITY:
                <asp:Label ID="EQUITYLabel" runat="server" Text='<%# Bind("EQUITY") %>' />
                <br />
                LIABILITY_EQUITY:
                <asp:Label ID="LIABILITY_EQUITYLabel" runat="server" 
                    Text='<%# Bind("LIABILITY_EQUITY") %>' />
                <br />
                EBIDA_PERCENT:
                <asp:Label ID="EBIDA_PERCENTLabel" runat="server" 
                    Text='<%# Bind("EBIDA_PERCENT") %>' />
                <br />
                EBIDA:
                <asp:Label ID="EBIDALabel" runat="server" Text='<%# Bind("EBIDA") %>' />
                <br />
                DE_BEFORE_LOAN:
                <asp:Label ID="DE_BEFORE_LOANLabel" runat="server" 
                    Text='<%# Bind("DE_BEFORE_LOAN") %>' />
                <br />
                DSCR_BEFORE_LOAN:
                <asp:Label ID="DSCR_BEFORE_LOANLabel" runat="server" 
                    Text='<%# Bind("DSCR_BEFORE_LOAN") %>' />
                <br />
                AR_DAY:
                <asp:Label ID="AR_DAYLabel" runat="server" Text='<%# Bind("AR_DAY") %>' />
                <br />
                INVENTORY_DAY:
                <asp:Label ID="INVENTORY_DAYLabel" runat="server" 
                    Text='<%# Bind("INVENTORY_DAY") %>' />
                <br />
                WORKING_CAPITAL_NEED:
                <asp:Label ID="WORKING_CAPITAL_NEEDLabel" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_NEED") %>' />
                <br />
                LOAN_NEED:
                <asp:Label ID="LOAN_NEEDLabel" runat="server" Text='<%# Bind("LOAN_NEED") %>' />
                <br />
                OWNERS_EQUITY_PERCENT:
                <asp:Label ID="OWNERS_EQUITY_PERCENTLabel" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY_PERCENT") %>' />
                <br />
                OWNERS_EQUITY:
                <asp:Label ID="OWNERS_EQUITYLabel" runat="server" 
                    Text='<%# Bind("OWNERS_EQUITY") %>' />
                <br />
                FIXED_INTEREST_PERCENT:
                <asp:Label ID="FIXED_INTEREST_PERCENTLabel" runat="server" 
                    Text='<%# Bind("FIXED_INTEREST_PERCENT") %>' />
                <br />
                PAYMENT_PERIOD:
                <asp:Label ID="PAYMENT_PERIODLabel" runat="server" 
                    Text='<%# Bind("PAYMENT_PERIOD") %>' />
                <br />
                AVERAGE_PAYMENT_PERIOD:
                <asp:Label ID="AVERAGE_PAYMENT_PERIODLabel" runat="server" 
                    Text='<%# Bind("AVERAGE_PAYMENT_PERIOD") %>' />
                <br />
                WORKING_CAPITAL_APPROVE:
                <asp:Label ID="WORKING_CAPITAL_APPROVELabel" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_APPROVE") %>' />
                <br />
                LOAN_APPROVE:
                <asp:Label ID="LOAN_APPROVELabel" runat="server" 
                    Text='<%# Bind("LOAN_APPROVE") %>' />
                <br />
                INTEREST_RATE_PERCENT:
                <asp:Label ID="INTEREST_RATE_PERCENTLabel" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT") %>' />
                <br />
                INTEREST_RATE_PERCENT_USED:
                <asp:Label ID="INTEREST_RATE_PERCENT_USEDLabel" runat="server" 
                    Text='<%# Bind("INTEREST_RATE_PERCENT_USED") %>' />
                <br />
                CONTRACT_YEAR:
                <asp:Label ID="CONTRACT_YEARLabel" runat="server" 
                    Text='<%# Bind("CONTRACT_YEAR") %>' />
                <br />
                DSCR_THIS_TIME:
                <asp:Label ID="DSCR_THIS_TIMELabel" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME") %>' />
                <br />
                DSCR_THIS_TIME_PERCENT:
                <asp:Label ID="DSCR_THIS_TIME_PERCENTLabel" runat="server" 
                    Text='<%# Bind("DSCR_THIS_TIME_PERCENT") %>' />
                <br />
                DE_THIS_TIME:
                <asp:Label ID="DE_THIS_TIMELabel" runat="server" 
                    Text='<%# Bind("DE_THIS_TIME") %>' />
                <br />
                LTV_THIS_TIME:
                <asp:Label ID="LTV_THIS_TIMELabel" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME") %>' />
                <br />

                LTV_THIS_TIME_PERCENT:
                <asp:Label ID="LTV_THIS_TIME_PERCENTLabel" runat="server" 
                    Text='<%# Bind("LTV_THIS_TIME_PERCENT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT:
                <asp:Label ID="WORKING_CAPITAL_DEFAULTLabel" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT") %>' />
                <br />
                LOAN_DEFAULT:
                <asp:Label ID="LOAN_DEFAULTLabel" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT") %>' />
                <br />
                WORKING_CAPITAL_DEFAULT_APPROVE:
                <asp:Label ID="WORKING_CAPITAL_DEFAULT_APPROVELabel" runat="server" 
                    Text='<%# Bind("WORKING_CAPITAL_DEFAULT_APPROVE") %>' />
                <br />
                LOAN_DEFAULT_APPROVE:
                <asp:Label ID="LOAN_DEFAULT_APPROVELabel" runat="server" 
                    Text='<%# Bind("LOAN_DEFAULT_APPROVE") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
