<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LIMIT_STRUCTURE.aspx.cs" Inherits="LGDCollectionData.Aspx.LIMIT_STRUCTURE" Culture="en-US" UICulture="en-US"%>
<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function popupAlert(msg) {
        alert(msg);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="BtnLinktoFacility" text="Link To Facility Information" 
        runat="server" onclick="BtnLinktoFacility_Click" />
    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
        <asp:Label ID="FormName_Label" runat="server" Text="LIMIT STRUCTURE"></asp:Label>
    </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,Default_Date,LIMITNO" 
        DataSourceID="SqlDataSourceLIMIT_STRUCTURE" EnableModelValidation="True" 
        Height="50px" Width="526px" DefaultMode="Edit"
        OnDataBound="DetailsView_Databound" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="Default_Date" HeaderText="Default Date" DataFormatString="{0:d MMMM yyyy}"
                ReadOnly="True" SortExpression="Default_Date" />
            <asp:TemplateField HeaderText="APP ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListAPP" runat="server" 
                        DataSourceID="SqlDataSourceAPP" DataTextField="APP_ID" DataValueField="APP_ID"
                        SelectedValue='<%# Bind("APP_ID")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITTYPE A" SortExpression="LIMITTYP_A">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListLIMITTYPE" runat="server" 
                        DataSourceID="SqlDataSourceLIMIT_TYPE" DataTextField="LIMITTYP_A" 
                        DataValueField="LIMITTYP_A"
                        SelectedValue='<%# Bind("LIMITTYP_A")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMIT NO." ReadOnly="True" 
                SortExpression="LIMITNO" />
            <asp:TemplateField HeaderText="Limit D1" SortExpression="Limit_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Limit_D1","{0:n2}") %>' style="text-align:right;"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Input Limit_D1" ControlToValidate="TextBox1" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Limit_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Limit_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit ID @ D-1" 
                SortExpression="One_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input One_Level_Up_Limit_ID_D1" ControlToValidate="TextBox2" ValidationGroup="UpdateValidation" Text="*" ></asp:RequiredFieldValidator>--%>
                    <span>*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit Currency @ D-1" 
                SortExpression="One_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency1" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("One_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="One Level Up Limit Amount @ D-1" 
                SortExpression="One_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Amount_D1") %>'>
                    </asp:TextBox>
                    <span>*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" 
                        Text='<%# Bind("One_Level_Up_Limit_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit ID @ D-1" 
                SortExpression="Two_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                        <span>*</span>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit Currency @ D-1" 
                SortExpression="Two_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency2" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Two_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Two Level Up Limit Amount @ D-1" 
                SortExpression="Two_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" 
                        Text='<%# Bind("Two_Level_Up_Limit_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit ID @ D-1" 
                SortExpression="Three_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit Currency @ D-1" 
                SortExpression="Three_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency3" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Three_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Three Level Up Limit Amount @ D-1" 
                SortExpression="Three_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" 
                        Text='<%# Bind("Three_Level_Up_Limit_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit ID @ D-1" 
                SortExpression="Four_Level_Up_Limit_ID_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_ID_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit Currency @ D-1" 
                SortExpression="Four_Level_Up_Limit_Currency_D1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListCurrency4" runat="server"
                    DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                    DataValueField="Code"
                    SelectedValue='<%# Bind("Four_Level_Up_Limit_Currency_D1")%>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Currency_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Currency_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Four Level Up Limit Amount @ D-1" 
                SortExpression="Four_Level_Up_Limit_Amount_D1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Amount_D1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" 
                        Text='<%# Bind("Four_Level_Up_Limit_Amount_D1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UPDATE USER" SortExpression="UPDATE_USER">
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
            <asp:TemplateField HeaderText="UPDATE DATE" SortExpression="UPDATE_DATE">
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
                    <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="Update" Text="Update" ValidationGroup="UpdateValidation"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="true" ValidationGroup="UpdateValidation" ShowSummary="False" />
    <asp:SqlDataSource ID="SqlDataSourceLIMIT_STRUCTURE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        InsertCommand="LIMIT_STRUCTURE_INSERT" InsertCommandType="StoredProcedure" 
        SelectCommand="LIMIT_STRUCTURE_SELECT" SelectCommandType="StoredProcedure" 
        UpdateCommand="LIMIT_STRUCTURE_UPDATE" UpdateCommandType="StoredProcedure"
        OnUpdated="SqlDataSource1_Updated" >
        <InsertParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
            <asp:QueryStringParameter Name="Default_Date" QueryStringField="Default_Date"  Type="DateTime" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="Default_Date" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="Limit_D1" Type="Double" />
            <asp:Parameter Name="One_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="One_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Two_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Two_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Three_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Three_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="Four_Level_Up_Limit_ID_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Currency_D1" Type="String" />
            <asp:Parameter Name="Four_Level_Up_Limit_Amount_D1" Type="Double" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceAPP" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceLIMIT_TYPE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="LIMIT_TYPE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
    
</asp:Content>
