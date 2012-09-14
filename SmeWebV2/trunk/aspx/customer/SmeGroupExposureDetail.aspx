<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SmeGroupExposureDetail.aspx.vb" Inherits="aspx_customer_SmeGroupExposureDetail" %>

<%@ Register Assembly="Mytextbox" Namespace="Mytextbox" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Group Exposure Detail</title>
    <style type="text/css">
        .textBoxReadOnlyAlignRight
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        	text-align: right;
        }
        
        .textBoxNormalAlignRight
        {
        	border-width: 1px;
        	text-align: right;
        }
        
        .textBoxReadOnlyAlignCen
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        	text-align: center;
        }
        
        .textBoxNormalAlignCen
        {
        	border-width: 1px;
        	text-align: center;
        }
        
        
        .textBoxReadOnly
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        }
        
        .textBoxNormal
        {
        	border-width: 1px;
        }
    </style>
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript">
    
        function calLtv(sender,e) {
        
            var TOTAL_EXPOSURETextBox = getEleByProperty("input", "MyClientId", "TOTAL_EXPOSURETextBox");
            var TOTAL_APPRAISALTextBox = getEleByProperty("input", "MyClientId", "TOTAL_APPRAISALTextBox");
            var LTV_TextBox = getEleByProperty("input", "MyClientId", "LTV_TextBox");

            var totalExposureValue = Number(TOTAL_EXPOSURETextBox.value);
            var totalAppraisalValue = Number(TOTAL_APPRAISALTextBox.value);

            if (totalAppraisalValue == 0) {
                totalAppraisalValue = 1;
            }
            
            var ltvValue = totalExposureValue / totalAppraisalValue;

            LTV_TextBox.value = ltvValue;
        }
    </script>
</head>
<body style="background-color: #FFFBD6;margin-bottom: 0;margin-left: 0; margin-right: 0; margin-top: 0;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            <Services>
                <asp:ServiceReference Path="~/webservice/EmployeeWCFService.svc" />
            </Services>
        </asp:ScriptManager>
        <div>

            <asp:FormView ID="FV_GROUP_EXPOSURE" runat="server" CellPadding="4" 
                ForeColor="#333333" DataSourceID="DS_GROUP_EXPOSURE_BY_ID" 
                DataKeyNames="EXPOSURE_ID">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <EditItemTemplate>
                    <asp:HiddenField ID="Hid_G_EXPO_ID" runat="server" Value='<%# Eval("G_EXPO_ID") %>' />
                    <asp:HiddenField ID="Hid_GROUP_ID" runat="server" Value='<%# Bind("GROUP_ID") %>' />
                    <asp:HiddenField ID="Hid_EXPOSURE_ID" runat="server" Value='<%# Bind("EXPOSURE_ID") %>' />
                    
                    <table>
                        <tr valign="top">
                            <td>
                                <table>
                                    <tr align="center" valign="top">
                                        <td>
                                            Available Cif
                                            <br />
                                            <asp:ListBox ID="ListBox_AvailableCif" runat="server" DataSourceID="DS_AvailableCif" 
                                                DataTextField="CIF" DataValueField="CIF" 
                                                SelectionMode="Multiple" Height="150px" Width="100%" ToolTip="Available Cif" >
                                            </asp:ListBox>
                                            <asp:SqlDataSource ID="DS_AvailableCif" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                SelectCommand="SME_EXPOSURE_GET_AVAILABLE_CIF" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Hid_GROUP_ID" Name="GROUP_ID" 
                                                        PropertyName="Value" />
                                                    <asp:ControlParameter ControlID="Hid_EXPOSURE_ID" Name="EXPOSURE_ID" 
                                                        PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td align="center" valign="middle">
                                            <asp:Button ID="Butt_ToRight" runat="server" Text="&gt;" 
                                                onclick="Butt_ToRight_Click" />
                                            <br />
                                            <asp:Button ID="Butt_ToLeft" runat="server" Text="&lt;" 
                                                onclick="Butt_ToLeft_Click" />
                                        </td>
                                        <td>
                                            Selected Cif
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="ListBox_SelectedCif" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeEdit">
                                            </asp:RequiredFieldValidator>
                                            <br />
                                            <asp:ListBox ID="ListBox_SelectedCif" runat="server" DataSourceID="DS_SelectedCif" 
                                                DataTextField="CIF" DataValueField="CIF" 
                                                SelectionMode="Multiple" Height="150px" Width="100%" ToolTip="Selected Cif" >
                                            </asp:ListBox>
                                            <asp:SqlDataSource ID="DS_SelectedCif" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                                SelectCommand="SME_EXPOSURE_GET_SELECTED_CIF" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Hid_EXPOSURE_ID" Name="EXPOSURE_ID" 
                                                        PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            EXPOSURE_TYPE:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_EXPOSURE_TYPE" runat="server" 
                                                DataSourceID="DS_EXPOSURE_TYPE" DataTextField="DESCRIPTION" 
                                                DataValueField="EXPOSURE_TYPE_ID" 
                                                SelectedValue='<%# Bind("EXPOSURE_TYPE_ID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_EXPOSURE:
                                        </td>
                                        <td>
                                            <cc1:mytext ID="TOTAL_EXPOSURETextBox" runat="server" 
                                                Text='<%# Bind("TOTAL_EXPOSURE","{0:###0.00}") %>'
                                                CssClass="textBoxNormalAlignRight"
                                                MyClientId="TOTAL_EXPOSURETextBox" 
                                                onkeyup="calLtv(this,event)" 
                                                AllowUserKey="num_Numeric" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="TOTAL_EXPOSURETextBox" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeEdit">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_APPRAISAL:
                                        </td>
                                        <td>
                                            <cc1:mytext ID="TOTAL_APPRAISALTextBox" runat="server" 
                                                Text='<%# Bind("TOTAL_APPRAISAL","{0:###0.00}") %>'
                                                CssClass="textBoxNormalAlignRight"
                                                MyClientId="TOTAL_APPRAISALTextBox" 
                                                onkeyup="calLtv(this,event)" 
                                                AllowUserKey="num_Numeric" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="TOTAL_APPRAISALTextBox" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeEdit">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            LTV:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="LTV_TextBox" runat="server" 
                                                Text='<%# Eval("LTV","{0:#,##0.00}") %>'
                                                CssClass="textBoxReadOnlyAlignRight"
                                                onfocus="this.blur();"
                                                MyClientId="LTV_TextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_BY:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_BYTextBox" runat="server" Text='<%# Bind("UPDATE_BY") %>'
                                                CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" />
                                            <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Eval("EMP_NAME") %>' 
                                                CssClass="textBoxReadOnly" ReadOnly="True" />
                                            <asp:ImageButton ID="UPDATE_BY_PopupBt" runat="server" 
                                                ImageUrl="~/images/Magnifying Glass.gif" onload="UPDATE_BY_PopupBt_Load" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_DATE:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>' 
                                                CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                                            <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                                OnClientClick="return false;" OnLoad="CalImageBt_Load" />
                                            <cc2:calendarextender id="CalendarExtender1" runat="server" format="d MMMM yyyy"
                                                popupbuttonid="CalImageBt" targetcontrolid="UPDATE_DATETextBox"></cc2:calendarextender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="Butt_Update" runat="server" Text="Update" CommandName="Update" CausesValidation="true" ValidationGroup="beforeEdit" />
                                            <asp:Button ID="Butt_Cancel_Edit" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:HiddenField ID="Hid_EXPOSURE_ID" runat="server" Value='<%# Eval("EXPOSURE_ID") %>' />
                    
                    <table>
                        <tr valign="top">
                            <td>
                                <table>
                                    <tr align="center" valign="top">
                                        <td>
                                            Available Cif
                                            <br />
                                            <asp:ListBox ID="ListBox_AvailableCif" runat="server" DataSourceID="DS_AvailableCif" 
                                                DataTextField="CIF" DataValueField="CIF" 
                                                SelectionMode="Multiple" Height="150px" Width="100%" ToolTip="Available Cif" >
                                            </asp:ListBox>
                                            <asp:SqlDataSource ID="DS_AvailableCif" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                SelectCommand="SME_EXPOSURE_GET_AVAILABLE_CIF" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="GROUP_ID" QueryStringField="groupId" />
                                                    <asp:ControlParameter ControlID="Hid_EXPOSURE_ID" Name="EXPOSURE_ID" 
                                                        PropertyName="Value" DefaultValue="0"/>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td align="center" valign="middle">
                                            <asp:Button ID="Butt_ToRight" runat="server" Text="&gt;" 
                                                onclick="Butt_ToRight_Click" />
                                            <br />
                                            <asp:Button ID="Butt_ToLeft" runat="server" Text="&lt;" 
                                                onclick="Butt_ToLeft_Click" />
                                        </td>
                                        <td>
                                            Selected Cif
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="ListBox_SelectedCif" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeInsert">
                                            </asp:RequiredFieldValidator>
                                            <br />
                                            <asp:ListBox ID="ListBox_SelectedCif" runat="server" DataSourceID="DS_SelectedCif" 
                                                DataTextField="CIF" DataValueField="CIF" 
                                                SelectionMode="Multiple" Height="150px" Width="100%" ToolTip="Selected Cif" >
                                            </asp:ListBox>
                                            
                                            <asp:SqlDataSource ID="DS_SelectedCif" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                                SelectCommand="SME_EXPOSURE_GET_SELECTED_CIF" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Hid_EXPOSURE_ID" Name="EXPOSURE_ID" 
                                                        PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            EXPOSURE_TYPE:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_EXPOSURE_TYPE" runat="server" 
                                                DataSourceID="DS_EXPOSURE_TYPE" DataTextField="DESCRIPTION" 
                                                DataValueField="EXPOSURE_TYPE_ID" 
                                                SelectedValue='<%# Bind("EXPOSURE_TYPE_ID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_EXPOSURE:
                                        </td>
                                        <td>
                                            <cc1:mytext ID="TOTAL_EXPOSURETextBox" runat="server" 
                                                Text='<%# Bind("TOTAL_EXPOSURE","{0:###0.00}") %>'
                                                CssClass="textBoxNormalAlignRight"
                                                MyClientId="TOTAL_EXPOSURETextBox" 
                                                onkeyup="calLtv(this,event)" 
                                                AllowUserKey="num_Numeric" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="TOTAL_EXPOSURETextBox" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeInsert">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_APPRAISAL:
                                        </td>
                                        <td>
                                            <cc1:mytext ID="TOTAL_APPRAISALTextBox" runat="server" 
                                                Text='<%# Bind("TOTAL_APPRAISAL","{0:###0.00}") %>'
                                                CssClass="textBoxNormalAlignRight"
                                                MyClientId="TOTAL_APPRAISALTextBox" 
                                                onkeyup="calLtv(this,event)" 
                                                AllowUserKey="num_Numeric" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="TOTAL_APPRAISALTextBox" ErrorMessage="*" SetFocusOnError="True" 
                                                ValidationGroup="beforeInsert">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            LTV:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="LTV_TextBox" runat="server" 
                                                Text='<%# Eval("LTV","{0:#,##0.00}") %>'
                                                CssClass="textBoxReadOnlyAlignRight"
                                                onfocus="this.blur();"
                                                MyClientId="LTV_TextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_BY:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_BYTextBox" runat="server" Text='<%# Bind("UPDATE_BY") %>'
                                                CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" />
                                            <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Eval("EMP_NAME") %>' 
                                                CssClass="textBoxReadOnly" ReadOnly="True" />
                                            <asp:ImageButton ID="UPDATE_BY_PopupBt" runat="server" 
                                                ImageUrl="~/images/Magnifying Glass.gif" onload="UPDATE_BY_PopupBt_Load" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_DATE:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>' 
                                                CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                                            <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                                OnClientClick="return false;" OnLoad="CalImageBt_Load" />
                                            <cc2:calendarextender id="CalendarExtender1" runat="server" format="d MMMM yyyy"
                                                popupbuttonid="CalImageBt" targetcontrolid="UPDATE_DATETextBox"></cc2:calendarextender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="Butt_Insert" runat="server" Text="Insert" CommandName="Insert" CausesValidation="true" ValidationGroup="beforeInsert" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="Hid_ID" runat="server" Value='<%# Bind("G_EXPO_ID") %>' />
                    <asp:HiddenField ID="Hid_GROUP_ID" runat="server" Value='<%# Bind("GROUP_ID") %>' />
                    <asp:HiddenField ID="Hid_EXPOSURE_ID" runat="server" Value='<%# Bind("EXPOSURE_ID") %>' />
                    
                    <table>
                        <tr valign="top">
                            <td>
                                <table>
                                    <tr align="center" valign="top">
                                        <td>
                                            Cif
                                            <br />
                                            <asp:ListBox ID="ListBox_SelectedCif" runat="server" DataSourceID="DS_SelectedCif" 
                                                DataTextField="CIF" DataValueField="CIF" 
                                                SelectionMode="Multiple" Height="150px" ToolTip="Selected Cif" >
                                            </asp:ListBox>
                                            <asp:SqlDataSource ID="DS_SelectedCif" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                                SelectCommand="SME_EXPOSURE_GET_SELECTED_CIF" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Hid_EXPOSURE_ID" Name="EXPOSURE_ID" 
                                                        PropertyName="Value" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            EXPOSURE_TYPE:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDL_EXPOSURE_TYPE" runat="server" 
                                                DataSourceID="DS_EXPOSURE_TYPE" DataTextField="DESCRIPTION" 
                                                DataValueField="EXPOSURE_TYPE_ID" 
                                                SelectedValue='<%# Bind("EXPOSURE_TYPE_ID") %>'
                                                Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_EXPOSURE:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TOTAL_EXPOSURETextBox" runat="server" Text='<%# Bind("TOTAL_EXPOSURE","{0:#,##0.00}") %>'
                                                CssClass="textBoxReadOnlyAlignRight" ReadOnly="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TOTAL_APPRAISAL:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TOTAL_APPRAISALTextBox" runat="server" Text='<%# Bind("TOTAL_APPRAISAL","{0:#,##0.00}") %>'
                                                CssClass="textBoxReadOnlyAlignRight" ReadOnly="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            LTV:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="LTVTextBox" runat="server" Text='<%# Bind("LTV","{0:#,##0.00}") %>'
                                                CssClass="textBoxReadOnlyAlignRight" ReadOnly="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_BY:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_BYTextBox" runat="server" Text='<%# Bind("UPDATE_BY") %>'
                                                CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" />
                                            <asp:TextBox ID="EMP_NAMETextBox" runat="server" Text='<%# Eval("EMP_NAME") %>' 
                                                CssClass="textBoxReadOnly" ReadOnly="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            UPDATE_DATE:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UPDATE_DATETextBox" runat="server" Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>' 
                                                CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="Butt_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                            <asp:Button ID="Butt_Delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick='return confirm("ยืนยันการลบ");' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            </asp:FormView>
            <asp:SqlDataSource ID="DS_GROUP_EXPOSURE_BY_ID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                SelectCommand="SME_EXPOSURE_GET_EXPO_BY_G_EXPO_ID" SelectCommandType="StoredProcedure"
                InsertCommand="SME_EXPOSURE_INSERT_EXPO" InsertCommandType="StoredProcedure" 
                UpdateCommand="SME_EXPOSURE_UPDATE_EXPO" UpdateCommandType="StoredProcedure" 
                DeleteCommand="SME_EXPOSURE_DELETE_EXPO" DeleteCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="G_EXPO_ID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="EXPOSURE_ID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EXPOSURE_ID" Type="Int32" />
                    <asp:Parameter Name="EXPOSURE_TYPE_ID" Type="Int32" />
                    <asp:Parameter Name="TOTAL_EXPOSURE" Type="Decimal" />
                    <asp:Parameter Name="TOTAL_APPRAISAL" Type="Decimal" />
                    <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    <asp:Parameter Name="UPDATE_BY" Type="String" />
                    <asp:Parameter Name="CIFs" Type="String" />
                    <asp:Parameter Name="GROUP_ID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="EXPOSURE_TYPE_ID" Type="Int32" />
                    <asp:Parameter Name="TOTAL_EXPOSURE" Type="Decimal" />
                    <asp:Parameter Name="TOTAL_APPRAISAL" Type="Decimal" />
                    <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                    <asp:Parameter Name="UPDATE_BY" Type="String" />
                    <asp:Parameter Name="CIFs" Type="String" />
                    <asp:Parameter Name="GROUP_ID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DS_EXPOSURE_TYPE" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                SelectCommand="SME_EXPOSURE_GET_EXPO_TYPE" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
