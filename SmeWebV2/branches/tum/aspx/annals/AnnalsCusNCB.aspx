<%@ Page Language="VB" AutoEventWireup="true" CodeFile="AnnalsCusNCB.aspx.vb"    Inherits="_AnnalsCusNCB"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<html>
<head title="NCB DATA" id="Head1" runat="server" >
<script src="../../js/jquery.js" type="text/javascript"></script>
<style type="text/css" runat="server">
    .LabelinnerTable {font-size:small; color: black;}
    .textarea { font-size:10pt; font-family:Verdana; }
    .ajax__calendar_dayname   
    {
         z-index:9999;
         position:relative ;
     }
 </style>

</head>
<body style=" font-size:8;margin-top:0; margin-left:0; background-color:InactiveBorder;">  
<form id="formUploadFile"  runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True"/>

<table style="width: 739px">
	<tr><td >
		&nbsp;<asp:Button ID="btnClose" runat="server" Text="ปิดหน้านี้  "  BackColor="#FF3355" BorderStyle="Outset" Font-Bold="True"  OnClientClick="window.close();"/>
	    &nbsp;&nbsp;
		<asp:Button ID="btnAddNew" runat="server" Text="เพิ่มรายการ "  BackColor="#FFFFF" BorderStyle="Outset" Font-Bold="True" />
	    &nbsp;&nbsp;<asp:Label ID="msg" runat="server" Text=""></asp:Label>
        &nbsp;<br />
        <asp:Label ID="Label1" runat="server"  
            text ="กรุณาระบุข้อมูลการตรวจสอบ NCB จากรายชื่อลูกค้าใน C/A" ForeColor="Maroon" Font-Bold="True" 
            Font-Size="Medium" style="color: #0033CC"></asp:Label></td></tr>

        <asp:Label ID="message" runat="server"  ForeColor="Maroon" Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
	<tr><td>
 <asp:GridView ID="GridCusNcb" runat="server" AutoGenerateColumns="False" 
         CellPadding="1"  ForeColor="#333333" DataKeyNames="CIF"
                                    GridLines="None" CellSpacing="1" Width="882px">
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
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
                            <tr><td colspan="3"><asp:Label ID="LblMsgEdit" runat="server" Text="" ForeColor="Red"></asp:Label></td></tr>
                        </table>
                    </EditItemTemplate>
                </asp:TemplateField>   
             <asp:TemplateField HeaderText="CIF"  HeaderStyle-Width="200" 
             ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
             <EditItemTemplate>
                   <table style="background-color:#E2DED6">
                        <tr><td >
                                      <asp:Label ID="Label3" runat="server" Text='CIF' style="width:120"></asp:Label>
                               </td>
                                <td colspan="3">
                                <asp:TextBox ID="tbCIF" runat="server" Text='<%# Bind("CIF") %>'  MaxLength="10" Width="70"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server"  CommandName="SearchCIF"
                                          ImageUrl="~/images/Magnifying Glass.gif" />
                                   <asp:Label ID="lblCIFName" runat="server" Text='<%# Bind("CIFNAME") %>' Width="200" ></asp:Label>
                                </td>              
                          </tr>
                          <tr>
                                <td><asp:Label ID="LabelCustype" runat="server" Text='ประเภทลูกค้า' style="width:120"></asp:Label></td>
                                <td colspan="3"><asp:DropDownList ID="ddlCustype" runat="server" ></asp:DropDownList></td>
              
                         </tr>
                         <tr>
                             </tr>
                         <tr>
                                <td><asp:Label ID="Label2" runat="server" Text='หน่วยงาน' ></asp:Label></td>
                                <td colspan="3"><asp:DropDownList ID="ddlDept" runat="server" ></asp:DropDownList></td>
                         </tr>
                         <tr>
                                <td><asp:Label   ID="LabelCusNcbType" runat="server" Text="ประเภท"></asp:Label></td>
                                <td colspan="3"><asp:DropDownList ID="ddlCusNcbType" runat="server"  
                                OnSelectedIndexChanged="SearchCusNcbTypeDetail" AutoPostBack="true"></asp:DropDownList></td>
                         </tr>
                         <tr>
                                <td>
                                        <asp:Label   ID="LabelCusNcbTypeDetail" runat="server" Text="เหตุผล"></asp:Label>
                                </td>
                                <td colspan="3">
                                        <asp:DropDownList ID="ddlCusNcbTypeDetail" runat="server" ></asp:DropDownList>
                                </td>
                         </tr>
                         <tr>
                                <td> <asp:Label   ID="Label6" runat="server" Text="หมายเหตุ"></asp:Label></td>
                                <td colspan="3"><asp:TextBox ID="tbDetail" runat="server" Text='<%# Bind("Detail") %>'  CssClass="textarea"
                                             TextMode="MultiLine"  Rows="3"  Width="300">
                                        </asp:TextBox>
                                </td>
                                    </tr>
                         <tr>
                                <td><asp:Label   ID="LabelAuth1" runat="server" Text="ผู้อนุมัติ 1"></asp:Label></td>
                                <td colspan="3"><asp:DropDownList ID="ddlAuth1" runat="server" ></asp:DropDownList></td>
                        </tr>
                         <tr>
                               <td><asp:Label   ID="LabelAuth2" runat="server" Text="ผู้อนุมัติ 2"></asp:Label></td>
                                <td> <asp:DropDownList ID="ddlAuth2" runat="server" ></asp:DropDownList></td>
                                <td><asp:Label   ID="LabelApproveDate" runat="server" Text="Approve date / วันที่ดำเนินการ" Width="200"></asp:Label></td>
                                <td> <asp:Textbox ID="tbCUS_NCB_DATE" runat="server"  Width="100px"  
                                      Text='<%# Bind("CUS_NCB_DATE") %>' Height="22px"/>
                                    <cc2:calendarextender id="CalendarExtender1" runat="server" format="dd/MM/yyyy" 
                                            targetcontrolid="tbCUS_NCB_DATE"
                                             PopupPosition="BottomLeft"></cc2:calendarextender>  
                                </td>
            
                         </tr>
                   </table>
             </EditItemTemplate>
             <ItemTemplate>
                  (<asp:Label ID="lblCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>)     
                  <asp:Label ID="lblCIFName" runat="server" Text='<%# Bind("CIFNAME") %>'></asp:Label>
             </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="การเช็ค NCB" ItemStyle-Wrap="false">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelCusNcbType" runat="server" Text='<%# Bind("CUS_NCB_TYPE") %>'></asp:Label>
                <asp:Label ID="LabelCusTypeDetail" runat="server" Text='<%# Bind("CUS_NCB_TYPE_DETAIL") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Dept / Section"  ItemStyle-Wrap="false">
            <EditItemTemplate>
             </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelDept" runat="server" Text='<%# Bind("DEPT") %>'></asp:Label>
              </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="สถานะลูกค้า"  ItemStyle-Wrap="false">
             <EditItemTemplate>
             </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelCustype" runat="server" Text='<%# Bind("CUS_TYPE") %>'></asp:Label>
              </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Authorized 1"  ItemStyle-Wrap="false">
             <EditItemTemplate>
             </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelAuth1" runat="server" Text='<%# Bind("AUTH_1_NAME") %>'></asp:Label>
              </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Authorized 2"  ItemStyle-Wrap="false">
            <EditItemTemplate>
             </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="LabelAuth2" runat="server" Text='<%# Bind("AUTH_2_NAME") %>'></asp:Label>
              </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="วันที่ดำเนินการ" ItemStyle-Wrap="false"  HeaderStyle-Wrap="false">
              <EditItemTemplate>
               </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblNCB_DATE" runat="server"  Text='<%# Bind("CUS_NCB_DATE") %>'/>
             </ItemTemplate>
                 <HeaderStyle Wrap="False" />
                 <ItemStyle Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Remark"  HeaderStyle-Width="200"
         ItemStyle-Width="200" ItemStyle-Wrap="true"   HeaderStyle-Wrap="false">
            <EditItemTemplate>
           </EditItemTemplate>
            <ItemTemplate>
                   <asp:TextBox ID="tbDetail" runat="server" Text='<%# Bind("Detail") %>'  
                        TextMode="MultiLine" Width="300" BorderStyle="None"  BorderWidth="0"   ReadOnly="true">
                   </asp:TextBox>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle Wrap="False" />
        </asp:TemplateField>   

   </Columns>
	<EmptyDataTemplate>
	    Don&#39;t have data
	</EmptyDataTemplate>
                              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EditRowStyle BackColor="#999999"  VerticalAlign="Top" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" Font-Size="Smaller" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Font-Size="Smaller" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  Font-Size="Smaller"/>
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Size="Smaller" />
                                <RowStyle Font-Size="Smaller" />
                   	</asp:GridView>
   * สามารถแก้ไขได้โดยกดปุ่ม
        <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                            ToolTip="Edit item" />&nbsp; ** ข้อมูลจะบันทึกหลังจากกดปุ่ม
        <asp:ImageButton ID="BtnUpdate0" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                        ToolTip="Save item" /></td></tr>
	</table>

  <asp:SqlDataSource ID="CusTypeSqlDataSource" runat="server" 
      ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
      SelectCommand="ANNALS_NCB_CUSTYPE_SELECT" 
      SelectCommandType="StoredProcedure" EnableCaching="True"></asp:SqlDataSource>
  <asp:SqlDataSource ID="DeptSqlDataSource" runat="server" 
      ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
      SelectCommand="ANNALS_NCB_DEPT_SELECT" SelectCommandType="StoredProcedure" 
      EnableCaching="True"></asp:SqlDataSource>
<asp:SqlDataSource ID="Auth1SqlDatasource" runat="server" 
      ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
      EnableCaching="True"     CacheDuration="200"    CacheExpirationPolicy="Sliding"
      SelectCommand="ANNALS_NCB_AUTH1_SELECT" 
      SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="Auth2SqlDatasource" runat="server" 
      ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
      EnableCaching="True"     CacheDuration="200"    CacheExpirationPolicy="Sliding"
      SelectCommand="ANNALS_NCB_AUTH2_SELECT" 
      SelectCommandType="StoredProcedure"></asp:SqlDataSource>

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

function chkVisible(obj,targetid,lbl) {

    var id = obj.options[obj.selectedIndex].value;
    //alert(lbl);
    if (id=='3') {
        document.getElementById(targetid).style.visibility = "visible";
        document.getElementById(lbl).style.visibility = "visible";
    } else {         
           document.getElementById(targetid).value = '';
           document.getElementById(targetid).style.visibility = "hidden";
           document.getElementById(lbl).style.visibility = "hidden";
    }
  }
</script>
