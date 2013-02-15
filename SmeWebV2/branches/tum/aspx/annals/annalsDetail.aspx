<%@ Page Language="VB" AutoEventWireup="false" CodeFile="annalsDetail.aspx.vb" Inherits="aspx_annals_annalsDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Annals</title>
    <script type="text/javascript" id="commonJs" src="../../js/common.js"></script>
    <script type="text/javascript">
        function validateAnnalsType(sender, args){
            var result = true;
            
            if (args.Value == 0){
                result = false;
            }
            
            args.IsValid = result;
        }
        
        function createCredit(){
            if(window.opener){
                window.opener.location = "annalscredit.aspx?annals_id=" + getValueFromQueryString("type") + getValueFromQueryString("seq") + getValueFromQueryString("year");
            }else{
                window.top.location = "annalscredit.aspx?annals_id=" + getValueFromQueryString("type") + getValueFromQueryString("seq") + getValueFromQueryString("year");
            }
        }
        
        function showHideTextBox(textboxId){
            var textboxObj = ele(textboxId);
             //show hide textbox
            if (textboxObj.value == "เรื่องอื่นๆ"){
                textboxObj.value = "";
                if (ns4) textboxObj.style.visibility = "show";
                else textboxObj.style.visibility = "visible";
            }else{
                if (ns4) textboxObj.style.visibility = "hide";
                else textboxObj.style.visibility = "hidden";
            }
        }
    </script>
    <style type="text/css">
        .tableRowBorder{
            background-color:khaki;
        }
    </style>
</head>
<body style="text-align:left;margin-top:0;margin-left:0;margin-right:0;margin-bottom:0;">
    <form id="annalsDetailForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:Label ID="ErrorLabel" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        
        <div style="text-align:center;">
            <asp:FormView ID="AnnalsFormView" runat="server" CellPadding="4" ForeColor="#333333" DataKeyNames="ANNALS_TYPE,ANNALS_SEQ_NO,ANNALS_YEAR" DataSourceID="AnnalsDS" DefaultMode="Insert" Width="100%">
                <PagerSettings Mode="NumericFirstLast" />
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    <table style="text-align:left;vertical-align:middle;border-bottom-width:thin;">                        
                        <tr>
                            <td>
                                ANNALS_TYPE<br />
                                <asp:Label ID="ANNALS_TYPE_DESC_Label" runat="server" Text="(ประเภทหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ANNALS_TYPEDropDownList" runat="server" DataTextField="ANNALS_DESC" 
                                    DataValueField="ANNALS_TYPE" DataSourceID="AnnalsTypeDS" SelectedIndex='<%# Bind("ANNALS_TYPE") %>'>
                                </asp:DropDownList>
                                <b style="color:Red">*</b><br />
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validateAnnalsType"
                                    ControlToValidate="ANNALS_TYPEDropDownList" ErrorMessage="กรุณาเลือกประเภทหนังสือ" ValidationGroup="annalsValidate" Font-Bold="False" Display="Dynamic"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_FULL_SEQ<br />
                                <asp:Label ID="ANNALS_FULL_SEQ_DESC_Label" runat="server" Text="(เลขที่หนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="FULL_SEQ_NOLabel" runat="server" Text="Auto Generate"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DATE_IN_ANNALS<br />
                                <asp:Label ID="DATE_IN_ANNALS_DESC_Label" runat="server" Text="(วันที่ในหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DATE_IN_ANNALS_TextBox" runat="server" Text='<%# Bind("DATE_IN_ANNALS","{0:d MMMM yyyy}") %>' onfocus="this.blur();"></asp:TextBox>
                                <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:calendarextender id="CalendarExtender1" runat="server" format="d MMMM yyyy"
                                    popupbuttonid="CalImageBt" targetcontrolid="DATE_IN_ANNALS_TextBox"></cc1:calendarextender>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DATE_IN_ANNALS_TextBox"
                                    ErrorMessage="กรุณาระบุวันที่ในหนังสือ" ValidationGroup="annalsValidate" Font-Bold="False" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SEND TO<br />
                                <asp:Label ID="RECIEVER_DESC_Label" runat="server" Text="(ผู้รับ)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="RECIVERTextBox" runat="server" Text='<%# Bind("RECIVER") %>' Font-Size="Medium" TextMode="MultiLine" Wrap="False"></asp:TextBox>
                                <asp:Image ID="ReciverSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="ReciverSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RECIVERTextBox"
                                    ErrorMessage="กรุณาระบุผู้รับหนังสือ" ValidationGroup="annalsValidate" Font-Bold="False" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SUBJECT<br />
                                <asp:Label ID="HEADER_DESC_Label" runat="server" Text="(ชื่อเรื่อง)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="SubjectDropDownList" runat="server" OnLoad="SubjectDropDownList_Load">
                                    <asp:ListItem>เรื่องหนังสือเวียน</asp:ListItem>
                                    <asp:ListItem>เรื่องคำสั่ง</asp:ListItem>
                                    <asp:ListItem Enabled="true">เรื่องเกี่ยวกับสินเชื่อ</asp:ListItem>
                                    <asp:ListItem>เรื่องอื่นๆ</asp:ListItem>
                                </asp:DropDownList>
                                <b style="color:Red">*</b>
                                <asp:TextBox ID="HEADERTextBox" runat="server" Text='<%# Bind("HEADER") %>' OnLoad="HEADERTextBox_Load"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="HEADERTextBox"
                                    ErrorMessage="กรุณาระบุชื่อเรื่อง" ValidationGroup="annalsValidate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                REFERENCE<br />
                                <asp:Label ID="REFERENCE_DESC_Label" runat="server" Text="(อ้างถึงหนังสือเลขที่)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="REFERENCETextBox" runat="server" Text='<%# Bind("REFERENCE") %>'></asp:TextBox>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="กรุณาระบุเลขที่หนังสือ" Display="Dynamic" ControlToValidate="REFERENCETextBox" ValidationGroup="annalsValidate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DETAIL<br />
                                <asp:Label ID="DETAIL_DESC_Label" runat="server" Text="(รายละเอียด)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DETAILTextBox" runat="server" Font-Size="Medium" TextMode="MultiLine" Wrap="False" Text='<%# Bind("DETAIL") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                RECEIVE FROM<br />
                                <asp:Label ID="SENDER_DESC_Label" runat="server" Text="(ผู้ส่ง)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="SENDERTextBox" runat="server" Text='<%# Bind("SENDER") %>' 
                                    OnLoad="SENDERTextBox_Load" Font-Size="Medium" TextMode="MultiLine" 
                                    Wrap="False"></asp:TextBox>
                                <asp:Image ID="SenderSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="SenderSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SENDERTextBox"
                                    ErrorMessage="กรุณาระบุผู้ส่งหนังสือ" ValidationGroup="annalsValidate" Font-Bold="False" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DEPART REFERENCE<br />
                                <asp:Label ID="DEPART_REFER_DESC_Label" runat="server" Text="(รับจากฝ่าย/ส่งถึงฝ่าย)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DEPART_REFERTextBox" runat="server" Text='<%# Bind("DEPART_REFER") %>'></asp:TextBox>
                                <asp:Image ID="DepartSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="DepartSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="DEPART_REFERTextBox"
                                    Display="Dynamic" ErrorMessage="รหัสฝ่ายต้องเป็นตัวเลขเท่านั้น" ValidationExpression="\d*" ValidationGroup="annalsValidate"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"
                                    ValidationGroup="annalsValidate" OnPreRender="InsertButton_PreRender"/>
                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" UseSubmitBehavior="False" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table style="text-align:left;vertical-align:middle;">
                        <tr>
                            <td>
                                ANNALS_TYPE<br />
                                <asp:Label ID="ANNALS_TYPE_DESC_Label" runat="server" Text="(ประเภทหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ANNALS_TYPEDropDownList" runat="server" DataTextField="ANNALS_DESC" 
                                    DataValueField="ANNALS_TYPE" 
                                    Enabled="False" DataSourceID="AnnalsTypeDS" SelectedIndex='<%# Eval("ANNALS_TYPE") %>'>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_FULL_SEQ<br />
                                <asp:Label ID="ANNALS_FULL_SEQ_DESC_Label" runat="server" Text="(เลขที่หนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="FULL_SEQ_NOLabel" runat="server" Text='<%# Eval("ANNALS_TYPE")& Eval("ANNALS_SEQ_NO")& "/"& (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DATE_IN_ANNALS<br />
                                <asp:Label ID="DATE_IN_ANNALS_DESC_Label" runat="server" Text="(วันที่ในหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DATE_IN_ANNALS_TextBox" runat="server" Text='<%# Bind("DATE_IN_ANNALS","{0:d MMMM yyyy}") %>'></asp:TextBox>
                                <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:calendarextender id="CalendarExtender1" runat="server" format="d MMMM yyyy"
                                    popupbuttonid="CalImageBt" targetcontrolid="DATE_IN_ANNALS_TextBox"></cc1:calendarextender>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DATE_IN_ANNALS_TextBox"
                                    ErrorMessage="กรุณาระบุวันที่ในหนังสือ" ValidationGroup="annalsValidate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SEND TO<br />
                                <asp:Label ID="RECIEVER_DESC_Label" runat="server" Text="(ผู้รับ)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="RECIVERTextBox" runat="server" Text='<%# Bind("RECIVER") %>' Font-Size="Medium" TextMode="MultiLine" Wrap="False"></asp:TextBox>
                                <asp:Image ID="ReciverSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="ReciverSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RECIVERTextBox"
                                    ErrorMessage="กรุณาระบุผู้รับหนังสือ" ValidationGroup="annalsValidate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SUBJECT<br />
                                <asp:Label ID="HEADER_DESC_Label" runat="server" Text="(ชื่อเรื่อง)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="SubjectDropDownList" runat="server" OnLoad="SubjectDropDownList_Load">
                                    <asp:ListItem>เรื่องหนังสือเวียน</asp:ListItem>
                                    <asp:ListItem>เรื่องคำสั่ง</asp:ListItem>
                                    <asp:ListItem Enabled="true">เรื่องเกี่ยวกับสินเชื่อ</asp:ListItem>
                                    <asp:ListItem>เรื่องอื่นๆ</asp:ListItem>
                                </asp:DropDownList>
                                <b style="color:Red">*</b>
                                <asp:TextBox ID="HEADERTextBox" runat="server" Text='<%# Bind("HEADER") %>' OnDataBinding="HEADERTextBox_DataBinding"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="HEADERTextBox"
                                    ErrorMessage="กรุณาระบุชื่อเรื่อง" ValidationGroup="annalsValidate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                REFERENCE<br />
                                <asp:Label ID="REFERENCE_DESC_Label" runat="server" Text="(อ้างถึงหนังสือเลขที่)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="REFERENCETextBox" runat="server" Text='<%# Bind("REFERENCE") %>'></asp:TextBox>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="กรุณาระบุเลขที่หนังสือ" Display="Dynamic" ControlToValidate="REFERENCETextBox" ValidationGroup="annalsValidate"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DETAIL<br />
                                <asp:Label ID="DETAIL_DESC_Label" runat="server" Text="(รายละเอียด)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DETAILTextBox" runat="server" Font-Size="Medium" TextMode="MultiLine" Wrap="False" Text='<%# Bind("DETAIL") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                RECEIVE FROM<br />
                                <asp:Label ID="SENDER_DESC_Label" runat="server" Text="(ผู้ส่ง)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="SENDERTextBox" runat="server" Text='<%# Bind("SENDER") %>' Font-Size="Medium" TextMode="MultiLine" Wrap="False"></asp:TextBox>
                                <asp:Image ID="SenderSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="SenderSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="SENDERTextBox"
                                    ErrorMessage="กรุณาระบุผู้ส่งหนังสือ" ValidationGroup="annalsValidate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DEPART REFERENCE<br />
                                <asp:Label ID="DEPART_REFER_DESC_Label" runat="server" Text="(รับจากฝ่าย/ส่งถึงฝ่าย)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DEPART_REFERTextBox" runat="server" Text='<%# Bind("DEPART_REFER") %>'></asp:TextBox>
                                <asp:Image ID="DepartSearchImage" runat="server" ImageUrl="~/images/Magnifying Glass.gif" OnLoad="DepartSearchImage_Load"/>
                                <b style="color:Red">*</b><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DEPART_REFERTextBox"
                                    Display="Dynamic" ErrorMessage="รหัสฝ่ายต้องเป็นตัวเลขเท่านั้น" ValidationExpression="\d*" ValidationGroup="annalsValidate"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_CREATE_DATE<br />(วันที่สร้างหนังสือ)
                            </td>
                            <td>
                                <asp:TextBox ID="ANNALS_CREATE_DATETextBox" runat="server" Text='<%# Eval("ANNALS_CREATE_DATE","{0:d MMMM yyyy}") %>' Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_UPDATE_DATE<br />(วันที่อัพเดตหนังสือ)
                            </td>
                            <td>
                                <asp:TextBox ID="ANNALS_UPDATE_DATETextBox" runat="server" Text='<%# Eval("ANNALS_UPDATE_DATE","{0:d MMMM yyyy}") %>' Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                                    ValidationGroup="annalsValidate" OnPreRender="UpdateButton_PreRender"/>
                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel" UseSubmitBehavior="False" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>                
                <ItemTemplate>
                    <table style="text-align:left;vertical-align:middle;">
                        <tr>
                            <td>
                                ANNALS_TYPE<br />
                                <asp:Label ID="ANNALS_TYPE_DESC_Label" runat="server" Text="(ประเภทหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ANNALS_TYPEDropDownList" runat="server" DataTextField="ANNALS_DESC" 
                                    DataValueField="ANNALS_TYPE"
                                    Enabled="False" DataSourceID="AnnalsTypeDS" SelectedIndex='<%# Eval("ANNALS_TYPE") %>'>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_FULL_SEQ<br />
                                <asp:Label ID="ANNALS_FULL_SEQ_DESC_Label" runat="server" Text="(เลขที่หนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="FULL_SEQ_NOLabel" runat="server" Text='<%# Eval("ANNALS_TYPE")& Eval("ANNALS_SEQ_NO")& "/"& (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                                <br />
                                <asp:Button ID="CopyButton" runat="server" Text="Copy to clipboard" OnLoad="CopyButton_Load"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DATE_IN_ANNALS<br />
                                <asp:Label ID="DATE_IN_ANNALS_DESC_Label" runat="server" Text="(วันที่ในหนังสือ)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="DATE_IN_ANNALSLabel" runat="server" Text='<%# Eval("DATE_IN_ANNALS","{0:d MMMM yyyy}") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SEND TO<br />
                                <asp:Label ID="RECIEVER_DESC_Label" runat="server" Text="(ผู้รับ)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="RECIVERTextBox" runat="server" Font-Size="Medium" TextMode="MultiLine" Wrap="False" Enabled="false" Text='<%# Eval("RECIVER") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                SUBJECT<br />
                                <asp:Label ID="HEADER_DESC_Label" runat="server" Text="(ชื่อเรื่อง)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="HEADERLabel" runat="server" Text='<%# Eval("HEADER") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                REFERENCE<br />
                                <asp:Label ID="REFERENCE_DESC_Label" runat="server" Text="(อ้างถึงหนังสือเลขที่)"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="REFERENCELabel" runat="server" Text='<%# Eval("REFERENCE") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DETAIL<br />
                                <asp:Label ID="DETAIL_DESC_Label" runat="server" Text="(รายละเอียด)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DETAILTextBox" runat="server" Font-Size="Medium" TextMode="MultiLine" Wrap="False" Enabled="false" Text='<%# Eval("DETAIL") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                RECEIVE FROM<br />
                                <asp:Label ID="SENDER_DESC_Label" runat="server" Text="(ผู้ส่ง)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="SENDERTextBox" runat="server" Font-Size="Medium" TextMode="MultiLine" Wrap="False" Enabled="false" Text='<%# Eval("SENDER") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DEPART REFERENCE<br />
                                <asp:Label ID="DEPART_REFER_DESC_Label" runat="server" Text="(รับจากฝ่าย/ส่งถึงฝ่าย)"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="DEPART_REFERTextBox" runat="server" Enabled="false" Text='<%# Eval("DEPART_REFER") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_CREATE_DATE<br />(วันที่สร้างหนังสือ)
                            </td>
                            <td>
                                <asp:Label ID="ANNALS_CREATE_DATELabel" runat="server" Text='<%# Eval("ANNALS_CREATE_DATE","{0:d MMMM yyyy}") %>' ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ANNALS_UPDATE_DATE<br />(วันที่อัพเดตหนังสือ)
                            </td>
                            <td>
                                <asp:Label ID="ANNALS_UPDATE_DATELabel" runat="server" Text='<%# Eval("ANNALS_UPDATE_DATE","{0:d MMMM yyyy}") %>' ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tableRowBorder">
                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit"
                                    OnPreRender="EditButton_PreRender" />
                                <br />
                                <asp:Button ID="CreateCredit" runat="server" Text="เพิ่มรายละเอียดสินเชื่อ" Visible="false" OnClientClick="createCredit();return false;"/>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    Annals
                </HeaderTemplate>
            </asp:FormView>
            <asp:Button ID="CloseBtn" runat="server" OnClientClick="window.close();return false;"
                Text="Close" Width="100%" />
            
            <asp:SqlDataSource ID="AnnalsDS" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" DeleteCommand="DELETE FROM [ANNALS] WHERE [ANNALS_TYPE] = @original_ANNALS_TYPE AND [ANNALS_SEQ_NO] = @original_ANNALS_SEQ_NO AND [ANNALS_YEAR] = @original_ANNALS_YEAR AND [SENDER] = @original_SENDER AND [RECIVER] = @original_RECIVER AND [REFERENCE] = @original_REFERENCE AND [HEADER] = @original_HEADER AND [DETAIL] = @original_DETAIL AND [DATE_IN_ANNALS] = @original_DATE_IN_ANNALS AND [ANNALS_CREATE_DATE] = @original_ANNALS_CREATE_DATE AND [ANNALS_UPDATE_DATE] = @original_ANNALS_UPDATE_DATE"
                InsertCommand="Annals_Insert"
                OldValuesParameterFormatString="original_{0}" SelectCommand="Annals_Select"
                UpdateCommand="Annals_Update" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" DataSourceMode="DataReader" SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="original_ANNALS_TYPE" Type="String" />
                    <asp:Parameter Name="original_ANNALS_SEQ_NO" Type="String" />
                    <asp:Parameter Name="original_ANNALS_YEAR" Type="String" />
                    <asp:Parameter Name="original_SENDER" Type="String" />
                    <asp:Parameter Name="original_RECIVER" Type="String" />
                    <asp:Parameter Name="original_REFERENCE" Type="String" />
                    <asp:Parameter Name="original_HEADER" Type="String" />
                    <asp:Parameter Name="original_DETAIL" Type="String" />
                    <asp:Parameter Name="original_DATE_IN_ANNALS" Type="DateTime" />
                    <asp:Parameter Name="original_ANNALS_CREATE_DATE" Type="DateTime" />
                    <asp:Parameter Name="original_ANNALS_UPDATE_DATE" Type="DateTime" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SENDER" Type="String" />
                    <asp:Parameter Name="RECIVER" Type="String" />
                    <asp:Parameter Name="REFERENCE" Type="String" />
                    <asp:Parameter Name="HEADER" Type="String" />
                    <asp:Parameter Name="DETAIL" Type="String" />
                    <asp:Parameter Name="DEPART_REFER" Type="String" />
                    <asp:Parameter Name="DATE_IN_ANNALS" Type="DateTime" />
                    <asp:Parameter Name="original_ANNALS_TYPE" Type="String" />
                    <asp:Parameter Name="original_ANNALS_SEQ_NO" Type="String" />
                    <asp:Parameter Name="original_ANNALS_YEAR" Type="String" />
                    <asp:Parameter Name="original_SENDER" Type="String" />
                    <asp:Parameter Name="original_RECIVER" Type="String" />
                    <asp:Parameter Name="original_REFERENCE" Type="String" />
                    <asp:Parameter Name="original_HEADER" Type="String" />
                    <asp:Parameter Name="original_DETAIL" Type="String" />
                    <asp:Parameter Name="original_DEPART_REFER" Type="String" />
                    <asp:Parameter Name="original_DATE_IN_ANNALS" Type="DateTime" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="ANNALS_TYPE" QueryStringField="type" Type="String" />
                    <asp:QueryStringParameter Name="ANNALS_SEQ_NO" QueryStringField="seq" Type="String" />
                    <asp:QueryStringParameter Name="ANNALS_YEAR" QueryStringField="year" Type="String" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="ANNALS_TYPE" Type="String" />
                    <asp:Parameter Name="SENDER" Type="String" />
                    <asp:Parameter Name="RECIVER" Type="String" />
                    <asp:Parameter Name="REFERENCE" Type="String" />
                    <asp:Parameter Name="HEADER" Type="String" />
                    <asp:Parameter Name="DETAIL" Type="String" />
                    <asp:Parameter Name="DEPART_REFER" Type="String" />
                    <asp:Parameter Name="DATE_IN_ANNALS" Type="DateTime" />
                    <asp:Parameter Direction="InputOutput" Name="ANNALS_SEQ_NO_OUT" Type="String" Size="5"/>
                    <asp:Parameter Direction="InputOutput" Name="ANNALS_YEAR_OUT" Type="String" Size="4"/>
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="AnnalsTypeDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" EnableCaching="True" SelectCommand="AnnalsType_Select" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        
    </form>
</body>
</html>
