<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" 
CodeBehind="FACILITY_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.FACILITY_INFORMATION" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="../UserControls/SelectFormWebUserControl.ascx" tagname="SelectFormWebUserControl" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true">
    </asp:ToolkitScriptManager>

    <uc1:SelectFormWebUserControl ID="SelectFormWebUserControl1" runat="server" />
    <h2>
    <asp:Label ID="Label1" runat="server" Text="FACILITY INFORMATION"></asp:Label>
    </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,DefaultDate,LIMITNO" 
        DataSourceID="SqlDataSourceFacility" DefaultMode="Edit"  
        PagerSettings-Mode="Numeric" RowStyle-Wrap="true"
        EnableModelValidation="True" Height="38px" Width="577px" 
        OnDataBound="DetailsView_Databound" 
         OnPreRender="DetailsView_OnPreRender"
        CellPadding="4" ForeColor="#333333" GridLines="None"
        >
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:TemplateField HeaderText="Default Date" SortExpression="DefaultDate">
                <EditItemTemplate>
                    <asp:Label ID="LabelDefaultDate" runat="server" 
                        Text='<%# Eval("DefaultDate", "{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListAPP_ID" runat="server" 
                        DataSourceID="SqlDataSourceAppID" DataTextField="APP_ID" 
                        DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMIT TYP_A" SortExpression="LIMITTYP_A">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListLIMITTYP_A" runat="server" 
                        DataSourceID="SqlDataSourceLimitType" DataTextField="LIMITTYP_A" 
                        DataValueField="LIMITTYP_A" SelectedValue='<%# Bind("LIMITTYP_A") %>'
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMIT NO" 
                ReadOnly="True" SortExpression="LIMITNO"/>
             <asp:TemplateField HeaderText="Limit @ D" 
                SortExpression="LimitAtD">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLimitAtD" runat="server" Text='<%# Bind("LimitAtD","{0:N}") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Limit @ D1" 
                SortExpression="LimitAtD1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxLimitAtD1" runat="server" Text='<%# Bind("LimitAtD1","{0:N}") %>'>
                    </asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Facility Purpose Description" 
                SortExpression="FacilityPurposeDescription">
                <EditItemTemplate>
                    <asp:ComboBox  ID="DropDownListFACILITY_PURPOSE" runat="server" 
                        DataSourceID="SqlDataSourcePurpose" DataTextField="FACILITY_PURPOSE" 
                        DataValueField="FACILITY_PURPOSE" 
                        SelectedValue='<%# Bind("FacilityPurposeDescription") %>' AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:ComboBox>
                      <asp:Label ID="LabelStarFac" runat="server" Text="  " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nature of Facility" 
                SortExpression="NatureofFacility">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListFACILITY_NATURE_CODE" runat="server" 
                        DataSourceID="SqlDataSourceNature" DataTextField="FACILITY_NATURE" 
                        DataValueField="FACILITY_NATURE_CODE" 
                        SelectedValue='<%# Bind("NatureofFacility") %>' 
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                      <asp:Label ID="LabelStarNature" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Seniority" SortExpression="Seniority">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListSeniority_CODE" runat="server" 
                        DataSourceID="SqlDataSourceSiniority" DataTextField="Seniority_CODE" 
                        DataValueField="Seniority_CODE" SelectedValue='<%# Bind("Seniority") %>'
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                      <asp:Label ID="LabelStarSec" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="BaselCommittedIndicator" 
                HeaderText="Basel Committed Indicator" SortExpression="BaselCommittedIndicator" />

            <asp:TemplateField HeaderText="Maturity Date" 
                SortExpression="MaturityDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaturityDate" runat="server" Text='<%# Bind("MaturityDate","{0:d MMMM yyyy}") %>'>
                    </asp:TextBox>
                    <asp:Label ID="LabelStar2" runat="server" Text=" " ForeColor="Red"></asp:Label>
                    <asp:CalendarExtender ID="TextBoxMaturityDate_CalendarExtender" 
                        runat="server" TargetControlID="TextBoxMaturityDate"  Format="d MMMM yyyy" >
                    </asp:CalendarExtender>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Principal Repayment Currency Code" 
                SortExpression="PrincipalRepaymentCurrencyCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListPrincipalRepaymentCurrencyCode" runat="server" 
                        DataSourceID="SqlDataSourceCurrency" DataTextField="Description" 
                        DataValueField="Code"      AppendDataBoundItems="True" 
                        SelectedValue='<%# Bind("PrincipalRepaymentCurrencyCode") %>'>      
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                      <asp:Label ID="LabelStarPrin" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Principal Repayment Amount" 
                SortExpression="PrincipalRepaymentAmount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentAmount","{0:N}") %>'></asp:TextBox>
                 <asp:Label ID="LabelStarRepayment" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentAmount") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentAmount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Principal Repayment Cycle" 
                SortExpression="PrincipalRepaymentCycle">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListPrincipalRepaymentCycle" runat="server" 
                        DataSourceID="SqlDataSourceCycle" DataTextField="CYCLE" DataValueField="CYCLE" 
                        SelectedValue='<%# Bind("PrincipalRepaymentCycle") %>'      
                        AppendDataBoundItems="True" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                   <asp:Label ID="LabelStarCyc" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Compounding Frequency of Interest" 
                SortExpression="CompoundingFrequencyofInterest">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListFREQUENCY_CODE" runat="server" 
                        DataSourceID="SqlDataSourceFrequency" DataTextField="FREQUENCY_CODE" 
                        DataValueField="FREQUENCY_CODE" 
                        SelectedValue='<%# Bind("CompoundingFrequencyofInterest") %>'      
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                     </asp:DropDownList>
                      <asp:Label ID="LabelStarQue" runat="server" Text=" " ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sharing Limit with CIF 1"   SortExpression="SharingLimitwithCIF1">
                      <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF1" Text='<%# Bind("SharingLimitwithCIF1") %>'></asp:TextBox>
                        <asp:Label ID="LabelStar3" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sharing Limit with CIF 2"               SortExpression="SharingLimitwithCIF2">
                      <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF2" Text='<%# Bind("SharingLimitwithCIF2") %>'></asp:TextBox>
                        <asp:Label ID="LabelStar4" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sharing Limit with CIF 3"                 SortExpression="SharingLimitwithCIF3">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF3" Text='<%# Bind("SharingLimitwithCIF3") %>'></asp:TextBox>
                        <asp:Label ID="LabelStar5" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
           
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Sharing Limit with CIF 4"   SortExpression="SharingLimitwithCIF4">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF4" Text='<%# Bind("SharingLimitwithCIF4") %>'></asp:TextBox>
                        <asp:Label ID="LabelStar6" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sharing Limit with CIF 5"   SortExpression="SharingLimitwithCIF5">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF5" Text='<%# Bind("SharingLimitwithCIF5") %>'></asp:TextBox>
                        <asp:Label ID="LabelStar7" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Sharing Limit with CIF 6"   SortExpression="SharingLimitwithCIF6">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="tbSharingCIF6" Text='<%# Bind("SharingLimitwithCIF6") %>'></asp:TextBox>
                        <asp:Label ID="LabelStarCIF6" runat="server" Text=" " ForeColor="Red"></asp:Label>
                   </EditItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Update User" SortExpression="UPDATE_USER">
                <EditItemTemplate>
                    <asp:Label ID="LabelUserId" runat="server" Text='<%# Bind("UPDATE_USER") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Update Date" SortExpression="UPDATE_DATE">
                <EditItemTemplate>
                    <asp:Label ID="LabelDate" runat="server" Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>

        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />

<RowStyle Wrap="True" BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceFacility" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_INFORMATION_SELECT"  SelectCommandType="StoredProcedure" 
        UpdateCommand="FACILITY_INFORMATION_UPDATE" UpdateCommandType="StoredProcedure">
        <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CIF" Type="String" />
            <asp:Parameter Name="DefaultDate" Type="DateTime" />
            <asp:Parameter Name="APP_ID" Type="String" />
            <asp:Parameter Name="LIMITTYP_A" Type="String" />
            <asp:Parameter Name="LIMITNO" Type="String" />
            <asp:Parameter Name="LimitAtD" Type="Double" />
            <asp:Parameter Name="LimitAtD1" Type="Double" />
            <asp:Parameter Name="FacilityPurposeDescription" Type="String" />
            <asp:Parameter Name="NatureofFacility" Type="String" />
            <asp:Parameter Name="Seniority" Type="String" />
            <asp:Parameter Name="BaselCommittedIndicator" Type="Boolean" />
            <asp:Parameter Name="MaturityDate" Type="DateTime" />
            <asp:Parameter Name="PrincipalRepaymentCurrencyCode" Type="String" />
            <asp:Parameter Name="PrincipalRepaymentAmount" Type="Double" />
            <asp:Parameter Name="PrincipalRepaymentCycle" Type="String" />
            <asp:Parameter Name="CompoundingFrequencyofInterest" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF1" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF2" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF3" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF4" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF5" Type="String" />
            <asp:Parameter Name="SharingLimitwithCIF6" Type="String" />
            <asp:Parameter Name="UPDATE_USER" Type="String" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAppID" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="FALSE">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLimitType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="LIMIT_TYPE_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePurpose" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_PURPOSE_SELECT" 
        SelectCommandType="StoredProcedure" EnableCaching="False">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceNature" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_NATURE_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSiniority" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_SENIORITY_SELECT" 
        SelectCommandType="StoredProcedure" EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCurrency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceFrequency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_FREQUENCY_SELECT" 
        SelectCommandType="StoredProcedure" EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCycle" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_CYCLE_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="True">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCIF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="GROUP_CIF_SELECT" SelectCommandType="StoredProcedure" 
        EnableCaching="True">
    </asp:SqlDataSource>
<asp:Button  runat="server" ID="BtnLinkToLimitStructure" 
        Text="Link To Limit Structure" onclick="BtnLinkToLimitStructure_Click"/>
</asp:Content>
