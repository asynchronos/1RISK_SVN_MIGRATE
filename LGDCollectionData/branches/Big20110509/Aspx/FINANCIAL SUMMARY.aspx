<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FINANCIAL SUMMARY.aspx.cs" Inherits="LGDCollectionData.Aspx.FINANCIAL_SUMMARY" Culture="th-TH" UICulture="th-TH" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FINANCIAL_SUMMARY_SELECT" 
        SelectCommandType="StoredProcedure" 
        InsertCommand="ADDITIONAL_DRAWDOWN_SELECT" InsertCommandType="StoredProcedure" 
        UpdateCommand="FINANCIAL_SUMMARY_UPDATE" UpdateCommandType="StoredProcedure"
        OnUpdated="SqlDataSource1_Updated">
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Financial_Data_Date" Type="DateTime" />
            <asp:Parameter Name="Total_Assets" Type="Int32" />
            <asp:Parameter Name="Total_Liabilities" Type="Int32" />
            <asp:Parameter Name="Total_Revenue" Type="Int32" />
            <asp:Parameter Name="Financial_Currency_Code" Type="String" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="Financial_Data_Date" Type="DateTime" />
            <asp:Parameter Name="Total_Assets" Type="Int32" />
            <asp:Parameter Name="Total_Liabilities" Type="Int32" />
            <asp:Parameter Name="Total_Revenue" Type="Int32" />
            <asp:Parameter Name="Financial_Currency_Code" Type="String" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date" 
        DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" Height="50px" 
        Width="340px" DefaultMode="Edit"
        OnDataBound="DetailsView_Databound">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" DataFormatString="{0:d}" HeaderText="Default_Date" 
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:TemplateField HeaderText="Financial_Data_Date" 
                SortExpression="Financial_Data_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxFinancial_Data_Date" runat="server" Text='<%# Bind("Financial_Data_Date","{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBoxFinancial_Data_Date_CalendarExtender" 
                        runat="server" TargetControlID="TextBoxFinancial_Data_Date" >
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Financial_Data_Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Financial_Data_Date","{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Assets" SortExpression="Total_Assets">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total_Assets") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input Total Assets" Text="*" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Total_Assets") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Total_Assets","{0:n2}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Liabilities" 
                SortExpression="Total_Liabilities">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Total_Liabilities") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please input Total Liabilities" Text="*" ControlToValidate="TextBox3" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Total_Liabilities") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total_Liabilities") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total_Revenue" SortExpression="Total_Revenue">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Total_Revenue") %>' style="text-align:right;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please input Total Revenue" Text="*" ControlToValidate="TextBox4" ValidationGroup="UpdateValidation"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Total_Revenue") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Total_Revenue") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Financial_Currency_Code" 
                SortExpression="Financial_Currency_Code">
                <EditItemTemplate>
<%--                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:TextBox>--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("Financial_Currency_Code")%>'>
                    </asp:DropDownList>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Financial_Currency_Code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE_USER" SortExpression="UPDATE_USER">
                <EditItemTemplate>
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
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("UPDATE_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
<%--                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="if(confirm('Are you sure to update this item?') == false){return false;}"
CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>--%>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="true" CommandName="Update" Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>                  
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ValidationGroup="UpdateValidation" ShowSummary="False" />
      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
    </asp:Content>
