<%@ Page Language="VB" AutoEventWireup="true" CodeFile="UploadFile.aspx.vb"  Inherits="_UploadFile" %>
<html>
<head>
    </head>
<body style="margin-top:0; margin-left:0; background-color:">
<form id="formUploadFile"  runat="server" style="background-color: #F7F6F3">
<table>
	<tr><td >
		<asp:Label ID="lblSearchVar" runat="server" Text="Filter ( เลือก)" Font-Bold="True"></asp:Label>
        &nbsp;<asp:DropDownList ID="ddlSearch" runat="server"  AutoPostBack="True">
        </asp:DropDownList>&nbsp;
		<asp:Button ID="btnAddNew" runat="server" Text="Add File (เพิ่มไฟล์)"  BackColor="#C0FFFF" BorderStyle="Outset" Font-Bold="True" />
        &nbsp;&nbsp;
        <br />
        <asp:Label ID="message" runat="server"  ForeColor="Maroon" Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
	<tr><td>
        <asp:Panel ID="Panel1" runat="server" Height="415px" ScrollBars="Auto" 
            Wrap="False" Width="970px">
<asp:GridView ID="GridUploadFile" runat="server" AutoGenerateColumns="False"  BorderStyle="Dashed" BorderWidth="1"
                CellPadding="1" CellSpacing="1" ForeColor="#333333" GridLines="None"   BorderColor="ActiveBorder"
                DataKeyNames="id" Width="100%">
	<Columns>
	 <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                            ToolTip="Edit item" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table >
                            <tr>
                                <td >
                                    <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                        ToolTip="Save item" /></td>
                                <td  >
                                    <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                        ToolTip="Cancel item" /></td>
                                <td >
                                    <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                        ToolTip="Delete item"   /></td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:TemplateField>   
             <asp:TemplateField HeaderText="ID">
            <EditItemTemplate>
                   <asp:Label ID="lblFileID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="File upload">
            <EditItemTemplate>
            <asp:HyperLink ID="linkPath" runat="server"  target='_blank'  text='<%#EVAL("Path") %>' NavigateUrl='<%#  ".../../FileUpload/"  & EVAL("FILE_TYPE")  & "/" &  EVAL("PATH") %>'>HyperLink</asp:HyperLink>
                <asp:FileUpload ID="upFile1" runat="server"   />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="linkPath" runat="server"  target='_blank'  text='<%#EVAL("Path") %>' NavigateUrl='<%#  "../../FileUpload/" & EVAL("FILE_TYPE")  & "/" &  EVAL("PATH") %>'>HyperLink</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Remark/Description">
            <EditItemTemplate>
                <asp:TextBox ID="tbFileRemark" runat="server" Text='<%# Bind("REMARK") %>' ></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Height="4px" Text='<%# Bind("REMARK") %>'
                   ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File type">
            <EditItemTemplate>
                <asp:DropDownList ID="ddlFileFILE_TYPE" runat="server"  >
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TYPE") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Coll ID">
            <EditItemTemplate>
                <asp:TextBox ID="tbFileColl_id" runat="server" Text='<%# Bind("COLL_ID") %>' ></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Bind("COLL_ID") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Create Date">
            <EditItemTemplate>
                <asp:TextBox ID="tbFileCreate_date" runat="server" Text='<%# Bind("CREATE_DATE") %>'
                   ></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label9" runat="server" Text='<%# Bind("CREATE_DATE","{0:d MMMM yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
   
        <asp:TemplateField HeaderText="Annals ID">
            <EditItemTemplate>
                <asp:TextBox ID="tbFileAnnals_ID" runat="server" Text='<%# Bind("ANNALS_ID") %>'
                    ></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ANNALS_ID") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="User ID">
            <EditItemTemplate>
                <asp:TextBox ID="tbFileUser_ID" runat="server" Text='<%# Bind("USER_ID") %>' ></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblFileUser_id" runat="server" Text='<%# Bind("USER_ID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Code">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
     
	</Columns>
	<EmptyDataTemplate>
	    Don&#39;t have data
	</EmptyDataTemplate>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <EditRowStyle BackColor="#999999" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
	</asp:GridView>
        </asp:Panel>
        * หลังจาก upload ไฟล์แล้ว สามารถแก้ไขได้โดยกดปุ่ม
        <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                            ToolTip="Edit item" />&nbsp; ** ไฟล์และข้อมูลจะบันทึกหลังจากกดปุ่ม
        <asp:ImageButton ID="BtnUpdate0" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                        ToolTip="Save item" /></td></tr>
	</table>
</form>
</body>
</html>
<script type="text/javascript" >
function confirm_delete()
{
  if (confirm("Are you sure you want to delete this file and data?")==true)
    return true;
  else
    return false;
}

function confirm_update()
{
  if (confirm("Are you sure you want to update this file and data?")==true)
    return true;
  else
    return false;
}
</script>
