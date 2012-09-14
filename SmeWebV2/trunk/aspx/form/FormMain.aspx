<%@ Page Language="VB" AutoEventWireup="true" CodeFile="FormMain.aspx.vb"    Inherits="aspx_form_FormMain"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<html>
<head id="Head1" runat="server" >
<style id="Style1" runat="server">
    .LabelinnerTable {font-size:small; color: black;}
    </style>
</head>
<body style=" font-size:8;margin-top:0; margin-left:0; background-color:InactiveBorder;">  
<form id="formUploadFile"  runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True"/>

        <asp:Label ID="LabelShow" runat="server"  
            text ="Program Quick Form  Version 0.1 "  ForeColor="Maroon" Font-Bold="True" 
            Font-Size="Medium" style="color: #000000"></asp:Label>

  <br />

  <br />

        <asp:Label ID="LabelDesc" runat="server"  
            text ="List of form/project "  ForeColor="Maroon" Font-Bold="True" 
            Font-Size="Medium" style="color: #0033CC; font-size: small;"></asp:Label>

  <asp:Button ID="btnAddNew" runat="server" Text="Create New Form "  BackColor="#FFFFF" BorderStyle="Outset" Font-Bold="True" />

<asp:GridView ID="GridForm" runat="server" AutoGenerateColumns="False" 
         CellPadding="4"  ForeColor="Black"
                                    GridLines="Vertical" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                style="font-family: Tahoma; font-size: small">
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <FooterStyle BackColor="#CCCC99" />
	<Columns>
	 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                            ToolTip="Edit item" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table style="width:50">
                            <tr>
                                <td >
                                    <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                        ToolTip="Save item" /></td>
                                <td >
                                    <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                        ToolTip="Cancel item" /></td>
                                <td >
                                    <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                        ToolTip="Delete item"   /></td>
                            </tr>
                            <tr><td colspan="3">
                                <asp:Label ID="LblMsgEdit" runat="server" Text="" ForeColor="Red"></asp:Label></td></tr>
                        </table>
                    </EditItemTemplate>
                </asp:TemplateField>   
    
               <asp:TemplateField HeaderText="Form name"  HeaderStyle-Width="250" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
                  <EditItemTemplate>
                   <asp:HiddenField   ID="Form_ID" runat="server" value='<%# Bind("Form_ID") %>' />
                   <asp:TextBox ID="tbForm_Name" runat="server" Text='<%# Bind("Form_Name") %>'  
                          Width="250" MaxLength="50"></asp:TextBox>
                </EditItemTemplate>
                 <ItemTemplate>
                   <asp:HiddenField   ID="Form_ID" runat="server" value='<%# Bind("Form_ID") %>' />
                   <asp:Label ID="lblForm_Name" runat="server" Text='<%# Bind("Form_Name") %>'></asp:Label>     
                  </ItemTemplate>
                 <HeaderStyle Wrap="False" />
              <ItemStyle Width="250px" />
       </asp:TemplateField>
       
               <asp:TemplateField HeaderText="Form description"  HeaderStyle-Width="250" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
                  <EditItemTemplate>
                   <asp:TextBox ID="tbForm_Desc" runat="server" Text='<%# Bind("Form_Desc") %>'  
                          Width="250" MaxLength="50"></asp:TextBox>
                </EditItemTemplate>
                 <ItemTemplate>
                   <asp:Label ID="lblForm_Desc" runat="server" Text='<%# Bind("Form_Desc") %>'></asp:Label>     
                  </ItemTemplate>
                 <HeaderStyle Wrap="False" />
              <ItemStyle Width="250px" />
       </asp:TemplateField>
       
              
       <asp:TemplateField HeaderText="Show Data Query "   HeaderStyle-Width="200"
         ItemStyle-Width="200" ItemStyle-Wrap="true"   HeaderStyle-Wrap="false">
            <EditItemTemplate>
                          <asp:TextBox ID="tbTb_SQL" runat="server" Text='<%# Bind("TB_SQL") %>'  
                         TextMode="MultiLine"   Rows="5"  Width="300"></asp:TextBox>
                          <br />
            </EditItemTemplate>
            <ItemTemplate>
                  <asp:Label ID="lblTb_SQL" runat="server" Text='<%# Bind("TB_SQL") %>'></asp:Label>     
            </ItemTemplate>
               <HeaderStyle Wrap="False" />
               <ItemStyle Wrap="False" />
        </asp:TemplateField>
     
       
         <asp:TemplateField HeaderText="Key of  Form"  HeaderStyle-Width="150" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
                  <EditItemTemplate>
                   <asp:TextBox ID="tbTb_Name_Key" runat="server" 
                          Text='<%# Bind("TB_Name_Key") %>'  Width="150" MaxLength="20"></asp:TextBox>
                </EditItemTemplate>
                 <ItemTemplate>
                   <asp:Label ID="lblTb_Name_Key" runat="server" 
                         Text='<%# Bind("TB_Name_Key") %>'></asp:Label>     
                  </ItemTemplate>
                 <HeaderStyle Wrap="False" />
              <ItemStyle Width="200px" />
       </asp:TemplateField>
     
         <asp:TemplateField HeaderText="Key of  Query"  HeaderStyle-Width="150" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
                  <EditItemTemplate>
                   <asp:TextBox ID="tbTB_QUERY_Key" runat="server" 
                          Text='<%# Bind("TB_QUERY_Key") %>'  Width="150" MaxLength="20"></asp:TextBox>
                </EditItemTemplate>
                 <ItemTemplate>
                   <asp:Label ID="tbTB_SQL_Key" runat="server" 
                         Text='<%# Bind("TB_QUERY_Key") %>'></asp:Label>     
                  </ItemTemplate>
                 <HeaderStyle Wrap="False" />
              <ItemStyle Width="200px" />
       </asp:TemplateField>
       
             <asp:TemplateField HeaderText=" Query  Value"  HeaderStyle-Width="150" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
                  <EditItemTemplate>
                   <asp:TextBox ID="tbTB_QUERY_KEY_VALUE" runat="server" 
                          Text='<%# Bind("TB_QUERY_KEY_VALUE") %>'  Width="150" MaxLength="20"></asp:TextBox>
                </EditItemTemplate>
                 <ItemTemplate>
                   <asp:Label ID="tbTB_QUERY_KEY_VALUE" runat="server" 
                         Text='<%# Bind("TB_QUERY_KEY_VALUE") %>'></asp:Label>     
                  </ItemTemplate>
                 <HeaderStyle Wrap="False" />
              <ItemStyle Width="200px" />
       </asp:TemplateField>
         
   
   
	</Columns>
	<EmptyDataTemplate>
	    Don&#39;t have data
	</EmptyDataTemplate>
            <RowStyle BackColor="#F7F7DE" />
                                <EditRowStyle  VerticalAlign="Top" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" Font-Size="Smaller" 
                                        ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                                        Font-Size="Smaller" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  
                                        Font-Size="Smaller"/>
                                <AlternatingRowStyle BackColor="White" Font-Size="Smaller" />
                                <RowStyle Font-Size="Smaller" />
                   	</asp:GridView>

&nbsp;&nbsp; 



</form>

</body>
</html>
<script type="text/javascript" >
function confirm_delete()
{
  if (confirm(" กรุณายืนยันการลบข้อมูล ")==true)
    return true;
  else
    return false;
}

function confirm_update()
{
  if (confirm("กรุณายืนยันการบันทึกข้อมูล ")==true)
    return true;
  else
    return false;
}

function chkDeadLineValue(obj, targetid) {
    if (obj.checked) {
        document.getElementById(targetid).value = '';
        document.getElementById(targetid).disabled = true;
    } else {
       document.getElementById(targetid).disabled = false;
    }
  }
</script>
