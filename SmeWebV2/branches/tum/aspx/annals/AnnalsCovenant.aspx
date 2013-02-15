<%@ Page Language="VB" AutoEventWireup="true" CodeFile="AnnalsCovenant.aspx.vb" Inherits="_AnnalsCovenant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<html>
<head id="Head1" runat="server">
    <script src="../../js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($(".ddlCovenantAction").val() == 3) {
                $(".PanelBrench").show();
            } else {
                $(".PanelBrench").hide();
            }
            $(".ddlCovenantAction").change(function () {
                if ($(this).val() == 3) {   // ผิดเงื่อนไข
                    $(".PanelBrench").show()
                } else {
                    $(".PanelBrench").hide()

                }
            });
        });
    </script>
    <style runat="server">
        .LabelinnerTable
        {
            font-size: small;
            color: black;
        }
        .PanelBrench
        {
            font-size: 10px;
        }
    </style>
</head>
<body style="font-size: 8; margin-top: 0; margin-left: 0; background-color: InactiveBorder;">
    <form id="formUploadFile" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True" />
    <table>
        <tr>
            <td>
                &nbsp;<asp:Button ID="btnClose" runat="server" Text="ปิดหน้านี้  " BackColor="#FF3355"
                    BorderStyle="Outset" Font-Bold="True" OnClientClick="window.close();" />
                &nbsp;&nbsp;
                <asp:Button ID="btnAddNew" runat="server" Text="เพิ่ม Covenant " BackColor="#FFFFF"
                    BorderStyle="Outset" Font-Bold="True" />
                &nbsp;&nbsp;<asp:Label ID="msg" runat="server" Text=""></asp:Label>
                &nbsp;<br />
                <asp:Label ID="Label1" runat="server" Text="Covenant  ( กำหนดสิ่งที่ต้องดำเนินการ )"
                    ForeColor="Maroon" Font-Bold="True" Font-Size="Medium" Style="color: #0033CC"></asp:Label>
            </td>
        </tr>
        <asp:Label ID="message" runat="server" ForeColor="Maroon" Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Height="768" ScrollBars="Auto" Wrap="False">
                    <asp:GridView ID="GridCovenant" runat="server" AutoGenerateColumns="False" CellPadding="1"
                        ForeColor="#333333" GridLines="None" CellSpacing="1">
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
                                    <table style="width: 50">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="BtnUpdate" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                                                    ToolTip="Save item" />
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="BtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/images/qmv_r_button_undo_hover.gif"
                                                    ToolTip="Cancel item" />
                                            </td>
                                            <td>
                                                <asp:ImageButton ID="BtnDelete" runat="server" CommandName="Delete" ImageUrl="~/images/qmv_bb_delete.gif"
                                                    ToolTip="Delete item" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="LblMsgEdit" runat="server" Text="" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CIF" HeaderStyle-Width="200" ItemStyle-Wrap="false"
                                HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbCIF" runat="server" Text='<%# Bind("CIF") %>' Width="70" MaxLength="10"></asp:TextBox>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandName="SearchCIF" ImageUrl="~/images/Magnifying Glass.gif" />
                                    <br />
                                    <asp:Label ID="lblCIFName" runat="server" Text='<%# Bind("CIFNAME") %>' Width="200"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCIF" runat="server" Text='<%# Bind("CIF") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblCIFName" runat="server" Text='<%# Bind("CIFNAME") %>' Width="200"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Covenant">
                                <EditItemTemplate>
                                    <asp:Label CssClass="LabelinnerTable" ID="lblcovenant" runat="server" Text="ประเภท"></asp:Label><br />
                                    <asp:DropDownList ID="ddlCOVENANT_TYPE" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SearchCovenant">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Label CssClass="LabelinnerTable" ID="lblcovenantdt" runat="server" Text="Covenant"></asp:Label><br />
                                    <asp:DropDownList ID="ddlCOVENANT_DETAIL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PutCovenant">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCOVENANT_TYPE" runat="server" Text='<%# Bind("COVENANT_TYPE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="รายละเอียด" HeaderStyle-Width="200" ItemStyle-Width="200"
                                ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbDetail" runat="server" Text='<%# Bind("Detail") %>' TextMode="MultiLine"
                                        Width="300" Font-Names="Tahoma">
                                    </asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbDetail" runat="server" Text='<%# Bind("Detail") %>' TextMode="MultiLine"
                                        Width="300" Font-Names="Tahoma" BorderStyle="None" BorderWidth="0" ReadOnly="true">
                                    </asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="กำหนดช้าสุดที่ต้องปฏิบัติ" ItemStyle-Wrap="false"
                                HeaderStyle-Wrap="false" Visible="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbDEADLINE_DATE" runat="server" Width="100px" Text='<%# Bind("DEADLINE_DATE","{0:dd/MM/yyyy}") %>'
                                        Height="22px" />
                                    <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                        OnClientClick="return false;" />
                                    <cc2:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" PopupButtonID="CalImageBt"
                                        TargetControlID="tbDEADLINE_DATE">
                                    </cc2:CalendarExtender>
                                    <br />
                                    <asp:CheckBox ID="chkNoDEADLINE_DATE" runat="server" Text="ไม่กำหนดระยะเวลา" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDEADLINE_DATE" runat="server" Text='<%# Bind("DEADLINE_DATE","{0:dd/MM/yyyy}") %>' />
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="หมายเหตุ / การแก้ไข" HeaderStyle-Width="200" ItemStyle-Width="200"
                                ItemStyle-Wrap="true" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbRemark" runat="server" Text='<%# Bind("REMARK") %>' TextMode="MultiLine"
                                        Width="300" Font-Names="Tahoma"></asp:TextBox><br />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbRemark" runat="server" Text='<%# Bind("REMARK") %>' TextMode="MultiLine"
                                        Width="300" BorderStyle="None" Font-Names="Tahoma" BorderWidth="0" ReadOnly>
                                    </asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="การดำเนินการล่าสุด" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCovenantAction" runat="server" class="ddlCovenantAction">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Panel ID="PanelBrench" runat="server" CssClass="PanelBrench">
                                        <table width="400px">
                                            <tr>
                                                <td>
                                                    วันที่ผิดเงื่อนไข (Branch Date)
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbBreach_DATE" runat="server" Width="100" Text='<%# Bind("BREACH_DATE","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                    <asp:ImageButton ID="BreachImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                                        OnClientClick="return false;" />
                                                    <cc2:CalendarExtender ID="BreachCalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                        PopupButtonID="BreachImageBt" TargetControlID="tbBreach_DATE">
                                                    </cc2:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    มีการขอยกเว้น (Wave Flag)
                                                </td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="ddlWAVE_FLAG">
                                                        <asp:ListItem Text="...ระบุ..." Value=""></asp:ListItem>
                                                        <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    วันที่ขอยกเว้น(Wave Date)
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbWAVE_DATE" runat="server" Width="100" Text='<%# Bind("WAVE_DATE","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                    <asp:ImageButton ID="WaveImageButton2" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                                        OnClientClick="return false;" />
                                                    <cc2:CalendarExtender ID="WaveCalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                        PopupButtonID="WaveImageButton2" TargetControlID="tbWAVE_DATE">
                                                    </cc2:CalendarExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCOVENANT_ACTION" runat="server" Text='<%# Bind("COVENANT_ACTION") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่ดำเนินการ" Visible="false" ItemStyle-Wrap="false"
                                HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbACTION_DATE" runat="server" Width="100" Text='<%# Bind("ACTION_DATE","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                    <asp:ImageButton ID="CalImageBt2" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                        OnClientClick="return false;" />
                                    <cc2:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" PopupButtonID="CalImageBt2"
                                        TargetControlID="tbACTION_DATE">
                                    </cc2:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblACTION_DATE" runat="server" Width="50" Text='<%# Bind("ACTION_DATE","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="การดำเนินการครั้้งต่อไป" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlNextCovenantAction" runat="server">
                                    </asp:DropDownList>
                                    <br />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNEXT_COVENANT_ACTION" runat="server" Text='<%# Bind("NEXT_COVENANT_ACTION") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่ตรวจสอบครั้งต่อไป" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbNEXT_ACTION_DATE" runat="server" Width="100" Text='<%# Bind("NEXT_ACTION_DATE","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                    <asp:ImageButton ID="CalImageBtNext" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                        OnClientClick="return false;" />
                                    <cc2:CalendarExtender ID="CalendarExtenderNext" runat="server" Format="dd/MM/yyyy"
                                        PopupButtonID="CalImageBtNext" TargetControlID="tbNEXT_ACTION_DATE">
                                    </cc2:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNEXT_ACTION_DATE" runat="server" Width="50" Text='<%# Bind("NEXT_ACTION_DATE","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ผู้บันทึก" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbEMP_NAME" runat="server" Text='<%# Bind("EMP_NAME") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEMP_NAME" runat="server" Text='<%# Bind("EMP_NAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่บันทึกรายการ" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbUSER_UPDATE_DATE" runat="server" Text='<%# Bind("USER_UPDATE_DATE") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblUSER_UPDATE_DATE" runat="server" Text='<%# Bind("USER_UPDATE_DATE","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เลขที่หนังสือ" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbID" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                                    <asp:HiddenField ID="lblIDEN" runat="server" Value='<%# Bind("IDEN") %>' />
                                    <asp:HiddenField ID="tbUser_ID" runat="server" Value='<%# Bind("User_ID") %>' />
                                    <asp:HiddenField ID="hdfCREATE_DATE" runat="server" Value='<%# Bind("CREATE_DATE") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    <asp:HiddenField ID="lblIDEN" runat="server" Value='<%# Bind("IDEN") %>' />
                                    <asp:HiddenField ID="tbUser_ID" runat="server" Value='<%# Bind("User_ID") %>' />
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Don&#39;t have data
                        </EmptyDataTemplate>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" VerticalAlign="Top" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" Font-Size="Smaller" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Font-Size="Smaller" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Size="Smaller" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" Font-Size="Smaller" />
                        <RowStyle Font-Size="Smaller" />
                    </asp:GridView>
                </asp:Panel>
                * สามารถแก้ไขได้โดยกดปุ่ม
                <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ImageUrl="~/images/qmv_bb_preview.gif"
                    ToolTip="Edit item" />&nbsp; ** ข้อมูลจะบันทึกหลังจากกดปุ่ม
                <asp:ImageButton ID="BtnUpdate0" runat="server" CommandName="Update" ImageUrl="~/images/qmv_bb_save.gif"
                    ToolTip="Save item" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
<script type="text/javascript">
    function confirm_delete() {
        if (confirm(" กรุณายืนยันการลบข้อมูล ") == true)
            return true;
        else
            return false;
    }

    function confirm_update() {
        if (confirm("กรุณายืนยันการบันทึกข้อมูล ") == true)
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
