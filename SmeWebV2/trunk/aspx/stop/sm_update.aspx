<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sm_update.aspx.vb" Inherits="aspx_stop_sm_update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 163px;
        }
        .style2
        {
            width: 220px;
        }
    </style>
<script type="text/javascript" >
    function ClosePage() {
//        var _PopupModal = getValueFromQueryString("PopupModal");
//        window.parent.$find(_PopupModal).hide();
        //        window.parent.location.replace(window.parent.location);

        // window.close();
        this.close(); 
    }    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
             SelectCommand ="SM.P_SM_HISTORY_SELECT_BY_IDEN"    SelectCommandType="StoredProcedure"
             UpdateCommand="SM.P_SM_HISTORY_UPDATE"  UpdateCommandType="StoredProcedure"   
             DeleteCommand="SM.P_SM_HISTORY_DELETE"  DeleteCommandType ="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="IDEN" QueryStringField="IDEN" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="IDEN" QueryStringField="IDEN" Type="Int32" />
                <asp:FormParameter Name="COMMENT" Type="String" />
            </UpdateParameters>    
        
            
        </asp:SqlDataSource>
    
    </div>
    <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
         DefaultMode="Edit"
        DataKeyNames="IDEN" Height="216px" Width="546px" CellPadding="4" 
        ForeColor="#333333">
        <EditItemTemplate>
         <table>
         <tr>
                <td>   IDEN: </td>
                <td class="style1">  <asp:Label ID="IDENLabel1" runat="server" Text='<%# Bind("IDEN") %>' /> </td>
                <td>DateIn:</td>
                <td class="style2"><asp:TextBox ID="DateInTextBox" runat="server" Text='<%# Eval("DateIn") %>'  Enabled="false"/></td>
 
         </tr>
         <tr>
                <td>CIF:</td>
                <td class="style1"> <asp:TextBox ID="CIFTextBox" runat="server" Text='<%# Eval("CIF") %>'  Enabled="false"/> </td>
                 <td>Name:</td>
                <td class="style2"> <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Eval("CIFNAME") %>' Height="24px" Width="309px"  Enabled="false" /> </td>

         </tr>
         <tr>
                 <td> CustomerSize:</td>
                 <td class="style1">    
                     <asp:TextBox ID="CustomerSizeTextBox" runat="server"  Enabled="false"
                Text='<%# Eval("CustomerSize") %>'  Width="83px" /></td>
                 <td>DPD:</td>
                 <td class="style2">  <asp:TextBox ID="DPDTextBox" runat="server" Text='<%# Eval("DPD") %>'  Enabled="false"/></td>
         </tr>
          <tr>
                 <td>Prin:</td>
                 <td class="style1"><asp:TextBox ID="PrinTextBox" runat="server" Text='<%# Eval("Prin") %>'  Enabled="false" /></td>
                   <td> MoveForm:</td>
                 <td class="style2">   <asp:TextBox ID="MoveFormTextBox" runat="server" 
                Text='<%# Eval("MoveForm") %>'  Enabled="false" /></td>
         </tr>

        <tr>
                <td> COMMENT:</td>
                <td colspan="3"><asp:TextBox ID="COMMENTTextBox" TextMode="MultiLine" 
                         Rows="8" Width="500px"
                        runat="server" Text='<%# Bind("COMMENT") %>' 
                        style="font-size: medium; font-family: Tahoma" />
                
                </td>
        </tr>
         </table>
            <asp:Button  ID = "UpdateButton" runat="server" CommandName="Update" Text="Update Data"/>
           <asp:Button  ID = "DeleteButton"  OnClientClick="return confirm('Do you want to delete this data ?');"
              runat="server" CommandName="Delete" 
              Text="Delete Data"/>
        </EditItemTemplate>
  
        
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
  
        
    </asp:FormView>
    <asp:SqlDataSource ID="SQLhistory" runat="server"   
       ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        SelectCommand       ="SM.P_SM_HISTORY_SELECT_BY_CIF"    
        SelectCommandType="StoredProcedure"
    >
        <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="CIF" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SQLhistory" 
        EnableModelValidation="True" AutoGenerateColumns="False" CellPadding="4" CellSpacing="1"
        ForeColor="#333333" GridLines="None" style="font-size: small">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
           <asp:BoundField DataField="IDEN" HeaderText="IDEN" InsertVisible="False"  HeaderStyle-HorizontalAlign="Center"
                    ReadOnly="True" SortExpression="IDEN" Visible="false"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
            </asp:BoundField>
                <asp:BoundField DataField="DateIn" HeaderText="Date In" 
                    SortExpression="DateIn" />
                  <asp:TemplateField  HeaderText="Comment" >
                       <ItemTemplate>
                            <asp:Label ID="lbComment" runat="server" Text='<%# Eval("COMMENT") %>'/>
                        </ItemTemplate>
                </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <br />
    </form>
</body>
</html>
