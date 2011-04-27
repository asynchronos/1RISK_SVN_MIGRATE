<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NPA_RECORD.aspx.cs" Inherits="LGDCollectionData.Aspx.NPA_RECORD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        /*input, textarea,select {
            border: 3px solid #d69;
            background: #999;
            float: right ;
            font: 1.2em monospace;
            clear: left;
            width: 250px;
            margin: 10px 0;
            padding: 10px 1px 1px 1px;
            
            color: #fc3;
            letter-spacing: .07em;*/
        } 
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
             EnableModelValidation="True" 
            onpageindexchanging="FormView1_PageIndexChanging" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DefaultMode="Edit" GridLines="Both" 
            OnPreRender="FormView_PreRender" Width="573px">
            <EditItemTemplate>
                CIF:
                <asp:TextBox ID="CIFTextBox" runat="server" Text='<%# Bind("CIF") %>' />
                <br />
                Default_Date:
                <asp:TextBox ID="Default_DateTextBox" runat="server" 
                    Text='<%# Bind("Default_Date") %>' />
                <br />
                NPA_Collateral_ID:
                <asp:TextBox ID="NPA_Collateral_IDTextBox" runat="server" 
                    Text='<%# Bind("NPA_Collateral_ID") %>' />
                <br />
                Collateral_Type:
                <asp:TextBox ID="Collateral_TypeTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Type") %>' />
                <br />
                COS_Collateral_ID:
                <asp:TextBox ID="COS_Collateral_IDTextBox" runat="server" 
                    Text='<%# Bind("COS_Collateral_ID") %>' />
                <br />
                Collateral_Sale_Price_Currency:
                <asp:TextBox ID="Collateral_Sale_Price_CurrencyTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price_Currency") %>' />
                <br />
                Collateral_Sale_Price:
                <asp:TextBox ID="Collateral_Sale_PriceTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price") %>' />
                <br />
                Collateral_Sale_Date:
                <asp:TextBox ID="Collateral_Sale_DateTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Date") %>' />
                <br />
                Collateral_Description:
                <asp:TextBox ID="Collateral_DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Description") %>' />
                <br />
                District_of_Property:
                <asp:TextBox ID="District_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("District_of_Property") %>' />
                <br />
                Amphur_of_Property:
                <asp:TextBox ID="Amphur_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("Amphur_of_Property") %>' />
                <br />
                Province_of_Property:
                <asp:TextBox ID="Province_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("Province_of_Property") %>' />
                <br />
                Title_Deed_Number:
                <asp:TextBox ID="Title_Deed_NumberTextBox" runat="server" 
                    Text='<%# Bind("Title_Deed_Number") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                     />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <EmptyDataTemplate>
                <asp:HiddenField ID="CIF_HiddenField" runat="server" />
            </EmptyDataTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                CIF:
                <asp:TextBox ID="CIFTextBox" runat="server" Text='<%# Bind("CIF") %>' />
                <br />
                Default_Date:
                <asp:TextBox ID="Default_DateTextBox" runat="server" 
                    Text='<%# Bind("Default_Date") %>' />
                <br />
                NPA_Collateral_ID:
                <asp:TextBox ID="NPA_Collateral_IDTextBox" runat="server" 
                    Text='<%# Bind("NPA_Collateral_ID") %>' />
                <br />
                Collateral_Type:
                <asp:TextBox ID="Collateral_TypeTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Type") %>' />
                <br />
                COS_Collateral_ID:
                <asp:TextBox ID="COS_Collateral_IDTextBox" runat="server" 
                    Text='<%# Bind("COS_Collateral_ID") %>' />
                <br />
                Collateral_Sale_Price_Currency:
                <asp:TextBox ID="Collateral_Sale_Price_CurrencyTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price_Currency") %>' />
                <br />
                Collateral_Sale_Price:
                <asp:TextBox ID="Collateral_Sale_PriceTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price") %>' />
                <br />
                Collateral_Sale_Date:
                <asp:TextBox ID="Collateral_Sale_DateTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Date") %>' />
                <br />
                Collateral_Description:
                <asp:TextBox ID="Collateral_DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Collateral_Description") %>' />
                <br />
                District_of_Property:
                <asp:TextBox ID="District_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("District_of_Property") %>' />
                <br />
                Amphur_of_Property:
                <asp:TextBox ID="Amphur_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("Amphur_of_Property") %>' />
                <br />
                Province_of_Property:
                <asp:TextBox ID="Province_of_PropertyTextBox" runat="server" 
                    Text='<%# Bind("Province_of_Property") %>' />
                <br />
                Title_Deed_Number:
                <asp:TextBox ID="Title_Deed_NumberTextBox" runat="server" 
                    Text='<%# Bind("Title_Deed_Number") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                CIF:
                <asp:Label ID="CIFLabel" runat="server" Text='<%# Bind("CIF") %>' />
                <br />
                Default_Date:
                <asp:Label ID="Default_DateLabel" runat="server" 
                    Text='<%# Bind("Default_Date") %>' />
                <br />
                NPA_Collateral_ID:
                <asp:Label ID="NPA_Collateral_IDLabel" runat="server" 
                    Text='<%# Bind("NPA_Collateral_ID") %>' />
                <br />
                Collateral_Type:
                <asp:Label ID="Collateral_TypeLabel" runat="server" 
                    Text='<%# Bind("Collateral_Type") %>' />
                <br />
                COS_Collateral_ID:
                <asp:Label ID="COS_Collateral_IDLabel" runat="server" 
                    Text='<%# Bind("COS_Collateral_ID") %>' />
                <br />
                Collateral_Sale_Price_Currency:
                <asp:Label ID="Collateral_Sale_Price_CurrencyLabel" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price_Currency") %>' />
                <br />
                Collateral_Sale_Price:
                <asp:Label ID="Collateral_Sale_PriceLabel" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Price") %>' />
                <br />
                Collateral_Sale_Date:
                <asp:Label ID="Collateral_Sale_DateLabel" runat="server" 
                    Text='<%# Bind("Collateral_Sale_Date") %>' />
                <br />
                Collateral_Description:
                <asp:Label ID="Collateral_DescriptionLabel" runat="server" 
                    Text='<%# Bind("Collateral_Description") %>' />
                <br />
                District_of_Property:
                <asp:Label ID="District_of_PropertyLabel" runat="server" 
                    Text='<%# Bind("District_of_Property") %>' />
                <br />
                Amphur_of_Property:
                <asp:Label ID="Amphur_of_PropertyLabel" runat="server" 
                    Text='<%# Bind("Amphur_of_Property") %>' />
                <br />
                Province_of_Property:
                <asp:Label ID="Province_of_PropertyLabel" runat="server" 
                    Text='<%# Bind("Province_of_Property") %>' />
                <br />
                Title_Deed_Number:
                <asp:Label ID="Title_Deed_NumberLabel" runat="server" 
                    Text='<%# Bind("Title_Deed_Number") %>' />
                <br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:FormView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
            InsertCommand="NPA_RECORD_INSERT" InsertCommandType="StoredProcedure" 
            SelectCommand="NPA_RECORD_SELECT" SelectCommandType="StoredProcedure" 
            OnInserting="InsertRecord" 
            UpdateCommand="NPA_RECORD_UPDATE" 
            UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="CIF" Type="String" />
                <asp:Parameter Name="Default_Date" Type="DateTime" />
                <asp:Parameter Name="NPA_Collateral_ID" Type="String" />
                <asp:Parameter Name="Collateral_Type" Type="String" />
                <asp:Parameter Name="COS_Collateral_ID" Type="String" />
                <asp:Parameter Name="Collateral_Sale_Price_Currency" Type="String" />
                <asp:Parameter Name="Collateral_Sale_Price" Type="Double" />
                <asp:Parameter Name="Collateral_Sale_Date" Type="DateTime" />
                <asp:Parameter Name="Collateral_Description" Type="String" />
                <asp:Parameter Name="District_of_Property" Type="String" />
                <asp:Parameter Name="Amphur_of_Property" Type="String" />
                <asp:Parameter Name="Province_of_Property" Type="String" />
                <asp:Parameter Name="Title_Deed_Number" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CIF" Type="String" />
                <asp:Parameter Name="Default_Date" Type="DateTime" />
                <asp:Parameter Name="NPA_Collateral_ID" Type="String" />
                <asp:Parameter Name="Collateral_Type" Type="String" />
                <asp:Parameter Name="COS_Collateral_ID" Type="String" />
                <asp:Parameter Name="Collateral_Sale_Price_Currency" Type="String" />
                <asp:Parameter Name="Collateral_Sale_Price" Type="Double" />
                <asp:Parameter Name="Collateral_Sale_Date" Type="DateTime" />
                <asp:Parameter Name="Collateral_Description" Type="String" />
                <asp:Parameter Name="District_of_Property" Type="String" />
                <asp:Parameter Name="Amphur_of_Property" Type="String" />
                <asp:Parameter Name="Province_of_Property" Type="String" />
                <asp:Parameter Name="Title_Deed_Number" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
