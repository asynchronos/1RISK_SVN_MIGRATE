<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PLEDGE_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.PLEDGE_INFORMATION" Culture="th-TH" UICulture="th-TH" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" >
    </asp:ToolkitScriptManager>
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="PLEDGE INFORMATION"></asp:Label>
    </h2>
<table>
    <tr>
        <td>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" 
        DataKeyNames="CIF,Default_Date,APPS_ID,PLED_ID,PLED_SEQ" 
        DataSourceID="SqlDataSourcePLEDGE_INFO" EnableModelValidation="True" 
        Height="50px" Width="313px"
        OnDataBound="DetailsView_Databound"
        OnPageIndexChanged="DetailsView_PageIndexChanged"
        OnPreRender="DetailsView_Prerender" DefaultMode="Edit">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default_Date" DataFormatString="{0:d}"
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:BoundField DataField="APPS_ID" HeaderText="APPS_ID" ReadOnly="True" 
                SortExpression="APPS_ID" />
            <asp:BoundField DataField="PLED_ID" HeaderText="PLED_ID" ReadOnly="True" 
                SortExpression="PLED_ID" />
            <asp:BoundField DataField="PLED_SEQ" HeaderText="PLED_SEQ" ReadOnly="True" 
                SortExpression="PLED_SEQ" />
            <asp:CheckBoxField DataField="Pledge_to_All_Facilities" 
                HeaderText="Pledge_to_All_Facilities" 
                SortExpression="Pledge_to_All_Facilities" />
            <asp:BoundField DataField="Facility_Pledged" HeaderText="Facility_Pledged" 
                SortExpression="Facility_Pledged" />
            <asp:TemplateField HeaderText="Collateral_Currency_Code" 
                SortExpression="Collateral_Currency_Code">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("Collateral_Currency_Code")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Collateral_Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Collateral_Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation_Amount_D" 
                SortExpression="Valuation_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Valuation_Amount_D","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("Valuation_Amount_D") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Valuation_Amount_D") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation_Date_D" 
                SortExpression="Valuation_Date_D">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Valuation_Date_D","{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                        TargetControlID="TextBox1">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Valuation_Date_D") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Valuation_Date_D","{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation_Amount_D1" 
                SortExpression="Valuation_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("Valuation_Amount_D1","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("Valuation_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" 
                        Text='<%# Bind("Valuation_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Valuation_Date_D1" 
                SortExpression="Valuation_Date_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Valuation_Date_D1","{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                        TargetControlID="TextBox2">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Valuation_Date_D1","{0:d}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Valuation_Date_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Prior_Claim_by_Other_Bank" 
                HeaderText="Prior_Claim_by_Other_Bank" 
                SortExpression="Prior_Claim_by_Other_Bank" />
            <asp:TemplateField HeaderText="Prior_Claim_Amount" 
                SortExpression="Prior_Claim_Amount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("Prior_Claim_Amount","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" 
                        Text='<%# Bind("Prior_Claim_Amount") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("Prior_Claim_Amount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledge_Amount_D" 
                SortExpression="Pledge_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Pledge_Amount_D","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Pledge_Amount_D") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Pledge_Amount_D") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Limitation_Amount_D" 
                SortExpression="Limitation_Amount_D">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("Limitation_Amount_D","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Limitation_Amount_D") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Limitation_Amount_D") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pledge_Amount_D1" 
                SortExpression="Pledge_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Pledge_Amount_D1","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("Pledge_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Pledge_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Limitation_Amount_D1" 
                SortExpression="Limitation_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("Limitation_Amount_D1","{0:n2}") %>' Width="150px" style="text-align:right"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" 
                        Text='<%# Bind("Limitation_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" 
                        Text='<%# Bind("Limitation_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE_USER" SortExpression="UPDATE_USER">
                <EditItemTemplate>
                    <%--<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:TextBox>--%>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE_DATE" SortExpression="UPDATE_DATE">
                <EditItemTemplate>
                    <%--<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:TextBox>--%>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourcePLEDGE_INFO" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="PLEDGE_INFORMATION_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="PLEDGE_INFORMATION_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="PLEDGE_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure"
        OnUpdated="SqlDataSource1_Updated">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APPS_ID" Type="String" />
            <asp:Parameter Name="PLED_ID" Type="String" />
            <asp:Parameter Name="PLED_SEQ" Type="Int16" />
            <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
            <asp:Parameter Name="Facility_Pledged" Type="String" />
            <asp:Parameter Name="Collateral_Currency_Code" Type="String" />
            <asp:Parameter Name="Valuation_Amount_D" Type="Double" />
            <asp:Parameter Name="Valuation_Date_D" Type="DateTime" />
            <asp:Parameter Name="Valuation_Amount_D1" Type="Double" />
            <asp:Parameter Name="Valuation_Date_D1" Type="DateTime" />
            <asp:Parameter Name="Prior_Claim_by_Other_Bank" Type="Boolean" />
            <asp:Parameter Name="Prior_Claim_Amount" Type="Double" />
            <asp:Parameter Name="Pledge_Amount_D" Type="Double" />
            <asp:Parameter Name="Limitation_Amount_D" Type="Double" />
            <asp:Parameter Name="Pledge_Amount_D1" Type="Double" />
            <asp:Parameter Name="Limitation_Amount_D1" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APPS_ID" Type="String" />
            <asp:Parameter Name="PLED_ID" Type="String" />
            <asp:Parameter Name="PLED_SEQ" Type="Int16" />
            <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
            <asp:Parameter Name="Facility_Pledged" Type="String" />
            <asp:Parameter Name="Collateral_Currency_Code" Type="String" />
            <asp:Parameter Name="Valuation_Amount_D" Type="Double" />
            <asp:Parameter Name="Valuation_Date_D" Type="DateTime" />
            <asp:Parameter Name="Valuation_Amount_D1" Type="Double" />
            <asp:Parameter Name="Valuation_Date_D1" Type="DateTime" />
            <asp:Parameter Name="Prior_Claim_by_Other_Bank" Type="Boolean" />
            <asp:Parameter Name="Prior_Claim_Amount" Type="Double" />
            <asp:Parameter Name="Pledge_Amount_D" Type="Double" />
            <asp:Parameter Name="Limitation_Amount_D" Type="Double" />
            <asp:Parameter Name="Pledge_Amount_D1" Type="Double" />
            <asp:Parameter Name="Limitation_Amount_D1" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>"
        SelectCommand="L_CURRENCY_CODE_SELECT" EnableCaching="True" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
            <asp:HiddenField ID="HiddenFieldAPPS_ID" runat="server" />
            <asp:HiddenField ID="HiddenFieldPLED_ID" runat="server" />
            <asp:HiddenField ID="HiddenFieldPLED_SEQ" runat="server" />
        </td>
        <td valign="top">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="600px" Wrap="False">
            <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            EnableModelValidation="True"
            OnRowDataBound="GridView1_OnRowDataBound" 
            BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Horizontal" 
            EmptyDataText="There are no data records to display">
            <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="COLL_ID" HeaderText="COLL_ID" 
                        SortExpression="COLL_ID" />
                    <asp:BoundField DataField="Collateral Type" HeaderText="Collateral Type" 
                        SortExpression="Collateral Type" />
                    <asp:BoundField DataField="Property Type" HeaderText="Property Type" 
                        SortExpression="Property Type" />
                    <asp:BoundField DataField="Collateral Description" 
                        HeaderText="Collateral Description" SortExpression="Collateral Description" />
                    <asp:BoundField DataField="District of Property" 
                        HeaderText="District of Property" SortExpression="District of Property" />
                    <asp:BoundField DataField="Amphur of Property" HeaderText="Amphur of Property" 
                        SortExpression="Amphur of Property" />
                    <asp:BoundField DataField="Province of Property" 
                        HeaderText="Province of Property" SortExpression="Province of Property" />
                    <asp:BoundField DataField="Located Country of Property" 
                        HeaderText="Located Country of Property" 
                        SortExpression="Located Country of Property" />
                    <asp:BoundField DataField="Collateral Provider" 
                        HeaderText="Collateral Provider" SortExpression="Collateral Provider" />
                    <asp:CheckBoxField DataField="Property Under Construction" 
                        HeaderText="Property Under Construction" 
                        SortExpression="Property Under Construction" />
                    <asp:BoundField DataField="Leasehold Period" HeaderText="Leasehold Period" 
                        SortExpression="Leasehold Period" />
                    <asp:BoundField DataField="Leasehold Start Date"
                        HeaderText="Leasehold Start Date" SortExpression="Leasehold Start Date" />
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:GridView>
            </asp:Panel>

            <asp:SqlDataSource ID="SqlDataSourceCOLLATERAL_INFO" runat="server">
            </asp:SqlDataSource>
<%--            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSourceCOLLATERAL_INFO0" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="COLL_ID" HeaderText="COLL_ID" 
                        SortExpression="COLL_ID" />
                    <asp:BoundField DataField="PLED_ID" HeaderText="PLED_ID" 
                        SortExpression="PLED_ID" />
                    <asp:BoundField DataField="PLED_SEQ" HeaderText="PLED_SEQ" 
                        SortExpression="PLED_SEQ" />
                    <asp:BoundField DataField="APPS_ID" HeaderText="APPS_ID" 
                        SortExpression="APPS_ID" />
                    <asp:BoundField DataField="APPS_DATE" HeaderText="APPS_DATE" 
                        SortExpression="APPS_DATE" />
                    <asp:BoundField DataField="Collateral Type" HeaderText="Collateral Type" 
                        SortExpression="Collateral Type" />
                    <asp:BoundField DataField="Property Type" HeaderText="Property Type" 
                        SortExpression="Property Type" />
                    <asp:BoundField DataField="Collateral Description" 
                        HeaderText="Collateral Description" SortExpression="Collateral Description" />
                    <asp:BoundField DataField="District of Property" 
                        HeaderText="District of Property" SortExpression="District of Property" />
                    <asp:BoundField DataField="Amphur of Property" HeaderText="Amphur of Property" 
                        SortExpression="Amphur of Property" />
                    <asp:BoundField DataField="Province of Property" 
                        HeaderText="Province of Property" SortExpression="Province of Property" />
                    <asp:BoundField DataField="Located Country of Property" 
                        HeaderText="Located Country of Property" 
                        SortExpression="Located Country of Property" />
                    <asp:BoundField DataField="Collateral Provider" 
                        HeaderText="Collateral Provider" SortExpression="Collateral Provider" />
                    <asp:CheckBoxField DataField="Property Under Construction" 
                        HeaderText="Property Under Construction" 
                        SortExpression="Property Under Construction" />
                    <asp:BoundField DataField="Leasehold Period" HeaderText="Leasehold Period" 
                        SortExpression="Leasehold Period" />
                    <asp:BoundField DataField="Leasehold Start Date" 
                        HeaderText="Leasehold Start Date" SortExpression="Leasehold Start Date" />
                    <asp:BoundField DataField="UPDATE_USER" HeaderText="UPDATE_USER" 
                        SortExpression="UPDATE_USER" />
                    <asp:BoundField DataField="UPDATE_DATE" HeaderText="UPDATE_DATE" 
                        SortExpression="UPDATE_DATE" />
                </Columns>
            </asp:GridView>--%>
        </td>
    </tr>
</table>


</asp:Content>
