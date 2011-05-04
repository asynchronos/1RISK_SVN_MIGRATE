<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" 
CodeBehind="FACILITY_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.FACILITY_INFORMATION" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
    <asp:Label ID="Label1" runat="server" Text="FACILITY INFORMATION" 
            style="font-weight: 700"></asp:Label>
    </h1>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="CIF,DefaultDate,LIMITNO" 
        DataSourceID="SqlDataSourceFacility" DefaultMode="Edit"  
        PagerSettings-Mode="Numeric" RowStyle-Wrap="true"
        EnableModelValidation="True" Height="38px" Width="465px">
        <Fields>
            <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                SortExpression="CIF" />
            <asp:BoundField DataField="DefaultDate" HeaderText="DefaultDate" 
                ReadOnly="True" SortExpression="DefaultDate" />
            <asp:TemplateField HeaderText="APP_ID" SortExpression="APP_ID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceAppID" DataTextField="APP_ID" 
                        DataValueField="APP_ID" SelectedValue='<%# Bind("APP_ID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("APP_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LIMITTYP_A" SortExpression="LIMITTYP_A">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceLimitType" DataTextField="LIMITTYP_A" 
                        DataValueField="LIMITTYP_A" SelectedValue='<%# Bind("LIMITTYP_A") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LIMITTYP_A") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LIMITNO" HeaderText="LIMITNO" ReadOnly="True" 
                SortExpression="LIMITNO" />
            <asp:BoundField DataField="LimitAtD" HeaderText="LimitAtD" 
                SortExpression="LimitAtD" />
            <asp:BoundField DataField="LimitAtD1" HeaderText="LimitAtD1" 
                SortExpression="LimitAtD1" />
            <asp:TemplateField HeaderText="FacilityPurposeDescription" 
                SortExpression="FacilityPurposeDescription">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSourcePurpose" DataTextField="FACILITY_PURPOSE" 
                        DataValueField="FACILITY_PURPOSE" 
                        SelectedValue='<%# Bind("FacilityPurposeDescription") %>' AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("FacilityPurposeDescription") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("FacilityPurposeDescription") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NatureofFacility" 
                SortExpression="NatureofFacility">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="SqlDataSourceNature" DataTextField="FACILITY_NATURE" 
                        DataValueField="FACILITY_NATURE_CODE" 
                        SelectedValue='<%# Bind("NatureofFacility") %>' 
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("NatureofFacility") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("NatureofFacility") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Seniority" SortExpression="Seniority">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="SqlDataSourceSiniority" DataTextField="Seniority_CODE" 
                        DataValueField="Seniority_CODE" SelectedValue='<%# Bind("Seniority") %>'
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Seniority") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Seniority") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="BaselCommittedIndicator" 
                HeaderText="BaselCommittedIndicator" SortExpression="BaselCommittedIndicator" />
            <asp:BoundField DataField="MaturityDate" HeaderText="MaturityDate" 
                SortExpression="MaturityDate" />
            <asp:TemplateField HeaderText="PrincipalRepaymentCurrencyCode" 
                SortExpression="PrincipalRepaymentCurrencyCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" 
                        DataSourceID="SqlDataSourceCurrency" DataTextField="Description" 
                        DataValueField="Code"      AppendDataBoundItems="True" 
                        SelectedValue='<%# Bind("PrincipalRepaymentCurrencyCode") %>'>      
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentCurrencyCode") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentCurrencyCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PrincipalRepaymentAmount" 
                HeaderText="PrincipalRepaymentAmount" 
                SortExpression="PrincipalRepaymentAmount" />
            <asp:TemplateField HeaderText="PrincipalRepaymentCycle" 
                SortExpression="PrincipalRepaymentCycle">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" 
                        DataSourceID="SqlDataSourceCycle" DataTextField="CYCLE" DataValueField="CYCLE" 
                        SelectedValue='<%# Bind("PrincipalRepaymentCycle") %>'      
                        AppendDataBoundItems="True" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                  
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentCycle") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" 
                        Text='<%# Bind("PrincipalRepaymentCycle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CompoundingFrequencyofInterest" 
                SortExpression="CompoundingFrequencyofInterest">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList8" runat="server" 
                        DataSourceID="SqlDataSourceFrequency" DataTextField="FREQUENCY_CODE" 
                        DataValueField="FREQUENCY_CODE" 
                        SelectedValue='<%# Bind("CompoundingFrequencyofInterest") %>'      
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                  
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" 
                        Text='<%# Bind("CompoundingFrequencyofInterest") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" 
                        Text='<%# Bind("CompoundingFrequencyofInterest") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SharingLimitwithCIF1" 
                SortExpression="SharingLimitwithCIF1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList9" runat="server" 
                        DataSourceID="SqlDataSourceCIF" DataTextField="CIF" DataValueField="CIF" 
                        SelectedValue='<%# Bind("SharingLimitwithCIF1") %>'      AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                  
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SharingLimitwithCIF2" 
                SortExpression="SharingLimitwithCIF2">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList10" runat="server" 
                        DataSourceID="SqlDataSourceCIF" DataTextField="CIF" DataValueField="CIF" 
                        SelectedValue='<%# Bind("SharingLimitwithCIF2") %>'      AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                  
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SharingLimitwithCIF3" 
                SortExpression="SharingLimitwithCIF3">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList11" runat="server" 
                        DataSourceID="SqlDataSourceCIF" DataTextField="CIF" DataValueField="CIF" 
                        SelectedValue='<%# Bind("SharingLimitwithCIF3") %>'       
                        AppendDataBoundItems="true" >
                    <asp:ListItem Value="">...Please Select...</asp:ListItem>
                  
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF3") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" 
                        Text='<%# Bind("SharingLimitwithCIF3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>

<RowStyle Wrap="True"></RowStyle>
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
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAppID" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_APP_ID_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLimitType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="LIMIT_TYPE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePurpose" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_PURPOSE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceNature" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_NATURE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSiniority" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_SENIORITY_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCurrency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="L_CURRENCY_CODE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceFrequency" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_FREQUENCY_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCycle" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="FACILITY_CYCLE_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCIF" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="GROUP_CIF_SELECT" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>
