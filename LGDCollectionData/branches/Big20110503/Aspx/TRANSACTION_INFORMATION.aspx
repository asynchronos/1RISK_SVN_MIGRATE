<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="TRANSACTION_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.TRANSACTION_INFORMATION" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="TRANSACTION_INFORMATION_DetailsView" runat="server" AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="CIF,Default_Date,BRAN,ACCGL,ACCNO,CONTNO,SEQNO"
        DataSourceID="TRANSACTION_INFORMATION_SqlDataSource" EnableModelValidation="True"
        ForeColor="#333333" GridLines="None" AllowPaging="True" DefaultMode="Edit">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" ReadOnly="True"
                SortExpression="Default_Date" />
            <asp:BoundField DataField="BRAN" HeaderText="BRAN" ReadOnly="True" SortExpression="BRAN" />
            <asp:BoundField DataField="ACCGL" HeaderText="ACCGL" ReadOnly="True" SortExpression="ACCGL" />
            <asp:BoundField DataField="ACCNO" HeaderText="ACCNO" ReadOnly="True" SortExpression="ACCNO" />
            <asp:BoundField DataField="CONTNO" HeaderText="CONTNO" ReadOnly="True" SortExpression="CONTNO" />
            <asp:BoundField DataField="SEQNO" HeaderText="SEQNO" ReadOnly="True" SortExpression="SEQNO" />
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" SortExpression="LIMITNO" />
            <asp:BoundField DataField="FCY_TYPE_Original_Currency_Code" HeaderText="FCY_TYPE_Original_Currency_Code"
                SortExpression="FCY_TYPE_Original_Currency_Code" />
            <asp:BoundField DataField="Currency_Code" HeaderText="Currency_Code"
                SortExpression="Currency_Code" />
            <asp:BoundField DataField="LNSTYPE" HeaderText="LNSTYPE" SortExpression="LNSTYPE" />
            <asp:BoundField DataField="Total_Interest_Rate_Prior_to_Default" HeaderText="Total_Interest_Rate_Prior_to_Default"
                SortExpression="Total_Interest_Rate_Prior_to_Default" />
            <asp:BoundField DataField="Interest_Rate_Index_Prior_to_Default" HeaderText="Interest_Rate_Index_Prior_to_Default"
                SortExpression="Interest_Rate_Index_Prior_to_Default" />
            <asp:BoundField DataField="Interest_Rate_Spread_Prior_to_Default_Percentage" HeaderText="Interest_Rate_Spread_Prior_to_Default_Percentage"
                SortExpression="Interest_Rate_Spread_Prior_to_Default_Percentage" />
            <asp:BoundField DataField="Rate_Sign" HeaderText="Rate_Sign"
                SortExpression="Rate_Sign" />
            <asp:BoundField DataField="OS_AT_D_Principal" HeaderText="OS_AT_D_Principal"
                SortExpression="OS_AT_D_Principal" />
            <asp:BoundField DataField="OS_AT_D_Accrued" HeaderText="OS_AT_D_Accrued"
                SortExpression="OS_AT_D_Accrued" />
            <asp:BoundField DataField="OS_AT_D_Suspense" HeaderText="OS_AT_D_Suspense"
                SortExpression="OS_AT_D_Suspense" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Principal" HeaderText="OS_AT_D_MINUS_1_Principal"
                SortExpression="OS_AT_D_MINUS_1_Principal" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Accrued"
                HeaderText="OS_AT_D_MINUS_1_Accrued" SortExpression="OS_AT_D_MINUS_1_Accrued" />
            <asp:BoundField DataField="OS_AT_D_MINUS_1_Suspense"
                HeaderText="OS_AT_D_MINUS_1_Suspense"
                SortExpression="OS_AT_D_MINUS_1_Suspense" />
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="TRANSACTION_INFORMATION_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="P_TRANSACTION_INFORMATION_SELECT" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="cif" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>