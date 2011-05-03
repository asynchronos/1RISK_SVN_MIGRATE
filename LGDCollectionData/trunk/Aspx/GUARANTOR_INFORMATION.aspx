<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GUARANTOR_INFORMATION.aspx.cs" Inherits="LGDCollectionData.Aspx.GUARANTOR_INFORMATION" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table>
    <tr>
        <td>
            <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataSourceID="SqlDataSourceGur_Info" 
                EnableModelValidation="True" Height="50px" Width="408px" 
                DefaultMode="Edit">
                <Fields>
                    <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>--%>
                            <asp:Label ID="CIFLabel1" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CIF") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Default_Date" SortExpression="Default_Date">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Default_Date") %>'></asp:TextBox>--%>
                            <asp:Label ID="Default_DateLabel2" runat="server" Text='<%# Bind("Default_Date") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Default_Date") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Default_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PLED_ID" SortExpression="PLED_ID">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:TextBox>--%>
                            <asp:Label ID="PLED_IDLabel3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PLED_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Guarantee_Title" HeaderText="Guarantee_Title" 
                        SortExpression="Guarantee_Title" />
                    <asp:CheckBoxField DataField="Pledge_to_All_Facilities" 
                        HeaderText="Pledge_to_All_Facilities" 
                        SortExpression="Pledge_to_All_Facilities" />
                    <asp:BoundField DataField="Facility_Pledged" HeaderText="Facility_Pledged" 
                        SortExpression="Facility_Pledged" />
                    <asp:TemplateField HeaderText="Guarantee_Amount_D" 
                        SortExpression="Guarantee_Amount_D">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Guarantee_Amount_D","{0:n2}") %>' Style="text-align:right;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_D") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Guarantee_Amount_D") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee_Amount_D1" 
                        SortExpression="Guarantee_Amount_D1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Guarantee_Amount_D1","{0:n2}") %>' Style="text-align:right;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_D1") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Guarantee_Amount_D1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee_Amount_Currency_Code" 
                        SortExpression="Guarantee_Amount_Currency_Code">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_Currency_Code") %>'></asp:TextBox>--%>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceCurrentcy" DataTextField="Description" 
                        DataValueField="Code"
                        SelectedValue='<%# Bind("Guarantee_Amount_Currency_Code")%>'>
                    </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_Currency_Code") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" 
                                Text='<%# Bind("Guarantee_Amount_Currency_Code") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guarantee_Indemnity_Source_ID" 
                        SortExpression="Guarantee_Indemnity_Source_ID">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox5" runat="server" 
                                Text='<%# Bind("Guarantee_Indemnity_Source_ID") %>'></asp:TextBox>--%>
                    <asp:DropDownList ID="DropDownListGuarantee_Indemnity" runat="server" 
                        DataSourceID="SqlDataSourceGar_Ind" DataTextField="Column1" 
                        DataValueField="Column1"
                        SelectedValue='<%# Bind("Guarantee_Indemnity_Source_ID") %>'>
                    </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" 
                                Text='<%# Bind("Guarantee_Indemnity_Source_ID") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" 
                                Text='<%# Bind("Guarantee_Indemnity_Source_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Internal_Rating_D" 
                        SortExpression="Internal_Rating_D">
                        <EditItemTemplate>
                            <asp:TextBox ID="Internal_Rating_DTextBox" runat="server" 
                                Text='<%# Bind("Internal_Rating_D") %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorInternal_Rating" runat="server" ErrorMessage="*" ControlToValidate="Internal_Rating_DTextBox"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" 
                                Text='<%# Bind("Internal_Rating_D") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Internal_Rating_D") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
      <asp:SqlDataSource ID="SqlDataSourceCurrentcy" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                        SelectCommand="L_CURRENCY_CODE_SELECT" 
        EnableCaching="True" SelectCommandType="StoredProcedure">
                    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGur_Info" runat="server" 
                ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
                InsertCommand="GUARANTOR_INFORMATION_INSERT" 
                InsertCommandType="StoredProcedure" 
                SelectCommand="GUARANTOR_INFORMATION_SELECT" 
                SelectCommandType="StoredProcedure" 
                UpdateCommand="GUARANTOR_INFORMATION_UPDATE" 
                UpdateCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="PLED_ID" Type="String" />
                    <asp:Parameter Name="Guarantee_Title" Type="String" />
                    <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                    <asp:Parameter Name="Facility_Pledged" Type="String" />
                    <asp:Parameter Name="Guarantee_Amount_D" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_D1" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_Currency_Code" Type="String" />
                    <asp:Parameter Name="Guarantee_Indemnity_Source_ID" Type="String" />
                    <asp:Parameter Name="Internal_Rating_D" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CIF" Type="String" />
                    <asp:Parameter Name="Default_Date" Type="DateTime" />
                    <asp:Parameter Name="PLED_ID" Type="String" />
                    <asp:Parameter Name="Guarantee_Title" Type="String" />
                    <asp:Parameter Name="Pledge_to_All_Facilities" Type="Boolean" />
                    <asp:Parameter Name="Facility_Pledged" Type="String" />
                    <asp:Parameter Name="Guarantee_Amount_D" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_D1" Type="Double" />
                    <asp:Parameter Name="Guarantee_Amount_Currency_Code" Type="String" />
                    <asp:Parameter Name="Guarantee_Indemnity_Source_ID" Type="String" />
                    <asp:Parameter Name="Internal_Rating_D" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGar_Ind" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        SelectCommand="GUARANTOR_INFORMATION_INDEMNITY_SELECT" 
        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </td>
    </tr>
</table>

    </asp:Content>
