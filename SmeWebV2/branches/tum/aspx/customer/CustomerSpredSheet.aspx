<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerSpredSheet.aspx.vb" Inherits="aspx_customer_CustomerSpredSheet"  MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type="text/css">
         .fixedHeader
         {
            overflow: auto;
            height: 150px;
         }
  table th
  {   
     border-width: 1px;
     border-color: Black;
     background-color: Gray;
     position: relative;
     top: expression(this.parentNode.parentNode.parentNode.scrollTop-1);

  }
  #GridView1 {
   border-collapse:collapse;
  }
</style>


<body style=" margin-left:0;margin-top:0; font-size:8">
    <form id="form1" runat="server">
     <div class="fixedHeader" style="width:2100px; height:700px; overflow-y:scroll;">

    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            OldValuesParameterFormatString="original_{0}" 
           SelectCommand="SELECT * FROM [CIF_GROUP_SHEET] order by CM_CODE " 
            DeleteCommand="DELETE FROM [CIF_GROUP_SHEET] WHERE [CIF] = @original_CIF" 
            InsertCommand="INSERT INTO [CIF_GROUP_SHEET] ([CIF], [CUSTOMER_NAME], [GROUP_ID], [CM_CODE], [CM_NAME], [OLD_CM_CODE], [OLD_CM_NAME], [BRANCH_ID], [BRANCH_NAME], [Id_Region], [Region_Name], [GROUP_SIZE_ID], [GROUP_SIZE_DETAIL], [A], [AP], [P], [C], [Balance_Sheet_CIF], [CIF_Balance_Sheet]) VALUES (@CIF, @CUSTOMER_NAME, @GROUP_ID, @CM_CODE, @CM_NAME, @OLD_CM_CODE, @OLD_CM_NAME, @BRANCH_ID, @BRANCH_NAME, @Id_Region, @Region_Name, @GROUP_SIZE_ID, @GROUP_SIZE_DETAIL, @A, @AP, @P, @C, @Balance_Sheet_CIF, @CIF_Balance_Sheet,@Remark,getdate())" 
            UpdateCommand="UPDATE [CIF_GROUP_SHEET] SET [CUSTOMER_NAME] = @CUSTOMER_NAME, [GROUP_ID] = @GROUP_ID, [CM_CODE] = @CM_CODE, [CM_NAME] = @CM_NAME, [OLD_CM_CODE] = @OLD_CM_CODE, [OLD_CM_NAME] = @OLD_CM_NAME, [BRANCH_ID] = @BRANCH_ID, [BRANCH_NAME] = @BRANCH_NAME, [Id_Region] = @Id_Region, [Region_Name] = @Region_Name, [GROUP_SIZE_ID] = @GROUP_SIZE_ID, [GROUP_SIZE_DETAIL] = @GROUP_SIZE_DETAIL, [A] = @A, [AP] = @AP, [P] = @P, [C] = @C, [Balance_Sheet_CIF] = @Balance_Sheet_CIF, [CIF_Balance_Sheet] = @CIF_Balance_Sheet ,Remark=@Remark,Update_date=getdate() WHERE [CIF] = @original_CIF" >
            <DeleteParameters>
                <asp:Parameter Name="original_CIF" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
                <asp:Parameter Name="GROUP_ID" Type="Int32" />
                <asp:Parameter Name="CM_CODE" Type="String" />
                <asp:Parameter Name="CM_NAME" Type="String" />
                <asp:Parameter Name="OLD_CM_CODE" Type="String" />
                <asp:Parameter Name="OLD_CM_NAME" Type="String" />
                <asp:Parameter Name="BRANCH_ID" Type="Int32" />
                <asp:Parameter Name="BRANCH_NAME" Type="String" />
                <asp:Parameter Name="Id_Region" Type="Int32" />
                <asp:Parameter Name="Region_Name" Type="String" />
                <asp:Parameter Name="GROUP_SIZE_ID" Type="Int32" />
                <asp:Parameter Name="GROUP_SIZE_DETAIL" Type="String" />
                <asp:Parameter Name="A" Type="Boolean" />
                <asp:Parameter Name="AP" Type="Boolean" />
                <asp:Parameter Name="P" Type="Boolean" />
                <asp:Parameter Name="C" Type="Boolean" />
                <asp:Parameter Name="Balance_Sheet_CIF" Type="String" />
                <asp:Parameter Name="CIF_Balance_Sheet" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
                <asp:Parameter Name="original_CIF" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CIF" Type="String" />
                <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
                <asp:Parameter Name="GROUP_ID" Type="Int32" />
                <asp:Parameter Name="CM_CODE" Type="String" />
                <asp:Parameter Name="CM_NAME" Type="String" />
                <asp:Parameter Name="OLD_CM_CODE" Type="String" />
                <asp:Parameter Name="OLD_CM_NAME" Type="String" />
                <asp:Parameter Name="BRANCH_ID" Type="Int32" />
                <asp:Parameter Name="BRANCH_NAME" Type="String" />
                <asp:Parameter Name="Id_Region" Type="Int32" />
                <asp:Parameter Name="Region_Name" Type="String" />
                <asp:Parameter Name="GROUP_SIZE_ID" Type="Int32" />
                <asp:Parameter Name="GROUP_SIZE_DETAIL" Type="String" />
                <asp:Parameter Name="A" Type="Boolean" />
                <asp:Parameter Name="AP" Type="Boolean" />
                <asp:Parameter Name="P" Type="Boolean" />
                <asp:Parameter Name="C" Type="Boolean" />
                <asp:Parameter Name="Balance_Sheet_CIF" Type="String" />
                <asp:Parameter Name="Remark" Type="String" />
                <asp:Parameter Name="CIF_Balance_Sheet" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CIF" 
            DataSourceID="SqlDataSource1" Font-Overline="False" Font-Size="10pt" 
            ForeColor="#333333" GridLines="None" style="margin-top: 0px" >
            <FooterStyle BackColor="#5D7B9D" Font-Size="10" Font-Bold="True"  
            ForeColor="White" Height="10" Wrap="true" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                              <asp:TemplateField HeaderText="CIF" SortExpression="CIF">
                    <ItemTemplate>
                        <asp:Label ID="lblCif" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CUSTOMER_NAME" SortExpression="CUSTOMER_NAME">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' Width="180"></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GROUP_ID" SortExpression="GROUP_ID">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("GROUP_ID") %>'></asp:Label>
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CM_CODE" SortExpression="CM_CODE">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CM_CODE") %>'></asp:Label>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CM_NAME" SortExpression="CM_NAME">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("CM_NAME") %>' Width="180"></asp:Label>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Region_Name" SortExpression="Region_Name">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Region_Name") %>' Width="160"></asp:Label>
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SIZE_ID" SortExpression="GROUP_SIZE_ID">
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("GROUP_SIZE_ID") %>'></asp:Label>
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GROUP_SIZE_DETAIL" 
                    SortExpression="GROUP_SIZE_DETAIL">
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("GROUP_SIZE_DETAIL") %>'></asp:Label>
                    </ItemTemplate>
                 
                </asp:TemplateField>
                <asp:TemplateField HeaderText="A-Audited" SortExpression="A">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("A") %>'  />
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AP-Audited Proforma" SortExpression="AP">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("AP") %>'  />
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="P-Proforma" SortExpression="P">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("P") %>'   />
                    </ItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText="C-Consolidate" SortExpression="C">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("C") %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Selected Balance Sheet" 
                    SortExpression="Balance_Sheet_CIF">
                    <ItemTemplate>
                            <asp:DropDownList ID="Balance_Sheet_CIF" runat="server" 
                             SelectedValue='<%# Bind("Balance_Sheet_CIF") %>'>
                            <asp:ListItem Value="">Please select</asp:ListItem>
                            <asp:ListItem Value="A">A (Audited)</asp:ListItem>
                            <asp:ListItem Value="AP">AP (Audited Proforma)</asp:ListItem>
                            <asp:ListItem Value="P">P (Proforma)</asp:ListItem>
                            <asp:ListItem Value="C">C (Consolidate)</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CIF Link To Selected Balance Sheet" 
                    SortExpression="CIF_Balance_Sheet">
                    <ItemTemplate>
                     <asp:TextBox ID="TextBox14" runat="server" 
                            Text='<%# Bind("CIF_Balance_Sheet") %>'></asp:TextBox>
                    </ItemTemplate>
                    <EditItemTemplate>
                     
                    </EditItemTemplate>
                    
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Remark">
                       <ItemTemplate>
                     <asp:TextBox ID="TextBox15" runat="server" 
                            Text='<%# Bind("Remark") %>'></asp:TextBox>
                    </ItemTemplate>
                 </asp:TemplateField>
                  <asp:TemplateField>
                 <ItemTemplate>
                     <asp:ImageButton runat="server" src="../../images/qmv_bb_save.gif" ID="btnEdit"  CommandName="Update" />
                 </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
