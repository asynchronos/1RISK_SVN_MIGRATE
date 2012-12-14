<%@ Page Title="STOP HISTORY DETAIL" Language="VB" MasterPageFile="~/Popup.master" AutoEventWireup="false" CodeFile="stopHistoryDetail.aspx.vb" Inherits="aspx.stop.stopHistoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .oddRow{
            background-color:#FFFFCC;
        }
        
        .evenRow{
            background-color:#CCFFCC;
        }
        
        .headerLabel{
            font-weight:bold;
            color:#000066;
        }
        
        td{
            white-space:nowrap;
        }
    </style>
    
    <script type="text/javascript">
        function getEleByClientSelector(ClientSelector) {
            var result = null;

            var eleArray = $("span[ClientSelector='" + ClientSelector + "']");

            if (eleArray.length > 0) {
                result = eleArray[0];
            } else {
                alert("Can not find ClientSelector=" + ClientSelector + ".\nPlease, contact administrator.");
            }

            return result;
        }

        function confirmBack2Stop(sender, e) {
            var confirmMove = confirm("ยืนยันการย้ายไปยัง Stop Program?");

            if (confirmMove) {
                //isValidInStop("Nohing", sender.id);
                var TargetClientSelector = "CIF_Lael";
                var eleTarget = getEleByClientSelector(TargetClientSelector);
                leader1.StopProgramWCFService.IsValidInStop(eleTarget.innerHTML, onSuccess, onFailed, sender.id)
            }

        }

        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            if (result.status == "success") {
                if (eval(result.detail)) {
                    //มี CIF นี้ใน STOP
                    //alert("valid"); //For debug
                    var confirmMove = confirm("มี CIF นี้อยู่ใน STOP PROGRAM ณ ขณะนี้\nคุณต้องการย้ายข้อมูลนี้ไปทับหรือไม่?");
                    if (!confirmMove) {
                        return false;
                    }
                } else {
                    //ไม่มี CIF นี้ใน STOP สามารถย้ายได้เลยไม่ต้อง Confirm อะไรอีก
                    //do nothing
                    //alert("invalid"); //For debug
                }

                //หากมาถึงตรงนี้แสดงว่าจะทำการย้ายไปยัง STOP PROGRAM แน่นอนแล้ว
                var sender = ele(userContext, this, null);
                sender.onclick = "";
                sender.click();
            } else {
                alert("failed:Please, contact administrator.");
                alert(result.detail);
            }

        }

        function onFailed(error, userContext, methodName) {
            //alert(error.constructor);
            if (error.get_statusCode() != 0)
                alert(methodName + " error:" + error.get_statusCode());
            //alert(error.get_message());
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            <Services>
                <asp:ServiceReference Path="~/webservice/StopProgramWCFService.svc" />
            </Services>
        </asp:ScriptManager>
        
        <asp:FormView ID="DetailFormView" runat="server" 
            DataKeyNames="CIF,DATE_IN" 
            DataSourceID="HistoryDetail_DS">
            <ItemTemplate>
                <asp:HiddenField ID="HIDHiddenField" runat="server" Value='<%# Bind("HID") %>' />
                <table>
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="CIFLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# CIFLabelFieldText %>'
                                ToolTip='<%# CIFLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CIFLabelValue" runat="server"
                                ClientSelector="CIF_Lael" 
                                Text='<%# Bind("CIF") %>' 
                                ToolTip='<%# Eval("CIF") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CUS_NAMELabelField" runat="server" 
                                CssClass="headerLabel" 
                                Text='<%# CUS_NAMELabelFieldText %>'
                                ToolTip='<%# CUS_NAMELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CUS_NAMELabelValue" runat="server" 
                                Text='<%# Bind("CUS_NAME") %>' 
                                ToolTip='<%# Eval("CUS_NAME") %>' />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="DATE_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# DATE_INLabelFieldText %>'
                                ToolTip='<%# DATE_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="DATE_INLabelValue" runat="server" 
                                Text='<%# Bind("DATE_IN", "{0:dd/MM/yyyy hh:mm:ss}") %>'
                                ToolTip='<%# Bind("DATE_IN", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DATE_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# DATE_OUTLabelFieldText %>'
                                ToolTip='<%# DATE_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="DATE_OUTLabelValue" runat="server" 
                                Text='<%# Bind("DATE_OUT", "{0:dd/MM/yyyy hh:mm:ss}") %>' 
                                ToolTip='<%# Bind("DATE_OUT", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SEQUENCELabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# SEQUENCELabelFieldText %>'
                                ToolTip='<%# SEQUENCELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="SEQUENCELabelValue" runat="server" 
                                Text='<%# Bind("SEQUENCE") %>'
                                ToolTip='<%# Bind("SEQUENCE") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="AGING_H_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# AGING_H_INLabelFieldText %>'
                                ToolTip='<%# AGING_H_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_H_INLabelValue" runat="server" 
                                Text='<%# Bind("AGING_H_IN") %>' 
                                ToolTip='<%# Bind("AGING_H_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AGING_H_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# AGING_H_OUTLabelFieldText %>'
                                ToolTip='<%# AGING_H_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_H_OUTLabelValue" runat="server" 
                                Text='<%# Bind("AGING_H_OUT") %>' 
                                ToolTip='<%# Bind("AGING_H_OUT") %>' />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="CLASS_H_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# CLASS_H_INLabelFieldText %>'
                                ToolTip='<%# CLASS_H_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CLASS_H_INLabelValue" runat="server" 
                                Text='<%# Bind("CLASS_H_IN") %>' 
                                ToolTip='<%# Bind("CLASS_H_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CLASS_H_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# CLASS_H_OUTLabelFieldText %>'
                                ToolTip='<%# CLASS_H_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CLASS_H_OUTLabelValue" runat="server" 
                                Text='<%# Bind("CLASS_H_OUT") %>' 
                                ToolTip='<%# Bind("CLASS_H_OUT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CLASS_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# CLASS_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# CLASS_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="CLASS_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("CLASS_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("CLASS_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="AGING_DPD_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# AGING_DPD_INLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_INLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_IN") %>' 
                                ToolTip='<%# Bind("AGING_DPD_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# AGING_DPD_OUTLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_OUTLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_OUT") %>' 
                                ToolTip='<%# Bind("AGING_DPD_OUT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AGING_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# AGING_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# AGING_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("AGING_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("AGING_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="IS_TDR_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# IS_TDR_INLabelFieldText %>'
                                ToolTip='<%# IS_TDR_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="IS_TDR_INLabelValue" runat="server" 
                                Text='<%# Bind("IS_TDR_IN") %>' 
                                ToolTip='<%# Bind("IS_TDR_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="IS_TDR_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# IS_TDR_OUTLabelFieldText %>'
                                ToolTip='<%# IS_TDR_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="IS_TDR_OUTLabelValue" runat="server" 
                                Text='<%# Bind("IS_TDR_OUT") %>' 
                                ToolTip='<%# Bind("IS_TDR_OUT") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TDR_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# TDR_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# TDR_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="TDR_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("TDR_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("TDR_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="OD_UTILIZE_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# OD_UTILIZE_INLabelFieldText %>'
                                ToolTip='<%# OD_UTILIZE_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="OD_UTILIZE_INLabelValue" runat="server" 
                                Text='<%# Bind("OD_UTILIZE_IN","{0:#,##.##}%") %>' 
                                ToolTip='<%# Bind("OD_UTILIZE_IN","{0:#,##.##}%") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OD_UTILIZE_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# OD_UTILIZE_OUTLabelFieldText %>'
                                ToolTip='<%# OD_UTILIZE_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="OD_UTILIZE_OUTLabelValue" runat="server" 
                                Text='<%# Bind("OD_UTILIZE_OUT","{0:#,##.##}%") %>' 
                                ToolTip='<%# Bind("OD_UTILIZE_OUT","{0:#,##.##}%") %>' />
                        </td>
                        <td rowspan="2">
                            <asp:Label ID="OD_UTILIZE_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# OD_UTILIZE_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# OD_UTILIZE_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td rowspan="2">
                            <asp:Label ID="OD_UTILIZE_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("OD_UTILIZE_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("OD_UTILIZE_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="MOVEMENT_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# MOVEMENT_INLabelFieldText %>'
                                ToolTip='<%# MOVEMENT_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="MOVEMENT_INLabelValue" runat="server" 
                                Text='<%# Bind("MOVEMENT_IN","{0:#,##.##}%") %>' 
                                ToolTip='<%# Bind("MOVEMENT_IN","{0:#,##.##}%") %>' />
                        </td>
                        <td>
                            <asp:Label ID="MOVEMENT_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# MOVEMENT_OUTLabelFieldText %>'
                                ToolTip='<%# MOVEMENT_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="MOVEMENT_OUTLabelValue" runat="server" 
                                Text='<%# Bind("MOVEMENT_OUT","{0:#,##.##}%") %>' 
                                ToolTip='<%# Bind("MOVEMENT_OUT","{0:#,##.##}%") %>' />
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="JUDGEMENT_ID_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# JUDGEMENT_ID_INLabelFieldText %>'
                                ToolTip='<%# JUDGEMENT_ID_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Judgement_IN_DDL" runat="server" 
                                DataSourceID="Judgement_DS" DataTextField="Judgement" DataValueField="ID" 
                                Enabled="False" SelectedValue='<%# Bind("JUDGEMENT_ID_IN") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="JUDGEMENT_ID_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# JUDGEMENT_ID_OUTLabelFieldText %>'
                                ToolTip='<%# JUDGEMENT_ID_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Judgement_OUT_DDL" runat="server" 
                                DataSourceID="Judgement_DS" DataTextField="Judgement" DataValueField="ID" 
                                Enabled="False" SelectedValue='<%# Bind("JUDGEMENT_ID_OUT") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="JUDGEMENT_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# JUDGEMENT_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# JUDGEMENT_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="JUDGEMENT_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("JUDGEMENT_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("JUDGEMENT_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="BUSINESS_DESC_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# BUSINESS_DESC_INLabelFieldText %>'
                                ToolTip='<%# BUSINESS_DESC_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_DESC_INLabelValue" runat="server" 
                                ToolTip='<%# Bind("BUSINESS_DESC_IN") %>'
                                Text='<%# LEFT(Eval("BUSINESS_DESC_IN"),26) + IIf(Len(Eval("BUSINESS_DESC_IN")) > 26, "...", "") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_DESC_OUTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# BUSINESS_DESC_OUTLabelFieldText %>'
                                ToolTip='<%# BUSINESS_DESC_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_DESC_OUTLabelValue" runat="server" 
                                ToolTip='<%# Bind("BUSINESS_DESC_OUT") %>'
                                Text='<%# LEFT(Eval("BUSINESS_DESC_OUT"),26) + IIf(Len(Eval("BUSINESS_DESC_OUT")) > 26, "...", "") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CRITERIA_INLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# BUSINESS_CRITERIA_INLabelFieldText %>'
                                ToolTip='<%# BUSINESS_CRITERIA_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CRITERIA_INLabelValue" runat="server" 
                                Text='<%# Bind("BUSINESS_CRITERIA_IN") %>' 
                                ToolTip='<%# Bind("BUSINESS_CRITERIA_IN") %>' />
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="PAY_ABILITYLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# PAY_ABILITYLabelFieldText %>'
                                ToolTip='<%# PAY_ABILITYLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="5">
                            <asp:DropDownList ID="PayAbility_DDL" runat="server" 
                                DataSourceID="PayAbility_DS" DataTextField="PAY_ABILITY_DETAIL" 
                                DataValueField="PAY_ABILITY_ID" Enabled="False"
                                SelectedValue='<%# Bind("UPDATE_PAY_ABILITY_ID") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="UPDATE_ACTION_IDLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# UPDATE_ACTION_IDLabelFieldText %>'
                                ToolTip='<%# UPDATE_ACTION_IDLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="5">
                            <asp:DropDownList ID="Action_DDL" runat="server" DataSourceID="Action_DS" 
                                DataTextField="ACTION_DETAIL" DataValueField="ACTION_ID" Enabled="False"
                                SelectedValue='<%# Bind("UPDATE_ACTION_ID") %>'>
                            </asp:DropDownList>
                        </td>
                        
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="DEPT_RESOLVELabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# DEPT_RESOLVELabelFieldText %>'
                                ToolTip='<%# DEPT_RESOLVELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DebtResolve_DDL" runat="server" 
                                DataSourceID="DebtResolve_DS" DataTextField="DEPT_RESOLVE_DETAIL" 
                                DataValueField="DEPT_RESOLVE_ID" Enabled="False"
                                SelectedValue='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>'>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="UPDATE_TDR_DATELabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# UPDATE_TDR_DATELabelFieldText %>'
                                ToolTip='<%# UPDATE_TDR_DATELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="UPDATE_TDR_DATELabelValue" runat="server" 
                                Text='<%# Bind("UPDATE_TDR_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' 
                                ToolTip='<%# Bind("UPDATE_TDR_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td>
                            <asp:Label ID="UPDATE_ACTION_DATELabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# UPDATE_ACTION_DATELabelFieldText %>'
                                ToolTip='<%# UPDATE_ACTION_DATELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="UPDATE_ACTION_DATELabelValue" runat="server" 
                                Text='<%# Bind("UPDATE_ACTION_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' 
                                ToolTip='<%# Bind("UPDATE_ACTION_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UPDATE_ACTION_USERLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# UPDATE_ACTION_USERLabelFieldText %>'
                                ToolTip='<%# UPDATE_ACTION_USERLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="UPDATE_ACTION_USERLabelValue" runat="server" 
                                Text='<%# Bind("UPDATE_ACTION_USER") %>' 
                                ToolTip='<%# Bind("UPDATE_ACTION_USER") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EMP_NAMELabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# EMP_NAMELabelFieldText %>'
                                ToolTip='<%# EMP_NAMELabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="EMP_NAMELabelValue" runat="server" 
                                Text='<%# Bind("EMP_NAME") %>' 
                                ToolTip='<%# Bind("EMP_NAME") %>' />
                        </td>
                    </tr>
                    
                    <tr class="evenRow">
                        <td>
                            <asp:Label ID="COMMENTLabelField" runat="server"
                                CssClass="headerLabel" 
                                Text='<%# COMMENTLabelFieldText %>'
                                ToolTip='<%# COMMENTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="5">
                            <asp:TextBox ID="COMMENTLabelValue" runat="server" 
                                Text='<%# Bind("COMMENT") %>' 
                                ToolTip='<%# Bind("COMMENT") %>'
                                TextMode="MultiLine" Enabled="False"
                                Width="100%" />
                        </td>
                    </tr>
                    
                    <tr class="oddRow">
                        <td colspan="6">
                            <asp:Button ID="move2StopButton" runat="server" Text="ส่งกลับ Stop Program" 
                                onclientclick="confirmBack2Stop(this,event);return false;" 
                                onclick="move2StopButton_Click" />
                        </td>
                    </tr>

                    <tr style="display:none">
                        <td>
                            <asp:Label ID="BUSINESS_CIM_FLAG_INLabelField" runat="server" Font-Bold="True"
                                Text='<%# BUSINESS_CIM_FLAG_INLabelFieldText %>'
                                ToolTip='<%# BUSINESS_CIM_FLAG_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CIM_FLAG_INLabelValue" runat="server" 
                                Text='<%# Bind("BUSINESS_CIM_FLAG_IN") %>' 
                                ToolTip='<%# Bind("BUSINESS_CIM_FLAG_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CIM_FLAG_OUTLabelField" runat="server" Font-Bold="True"
                                Text='<%# BUSINESS_CIM_FLAG_OUTLabelFieldText %>'
                                ToolTip='<%# BUSINESS_CIM_FLAG_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CIM_FLAG_OUTLabelValue" runat="server" 
                                Text='<%# Bind("BUSINESS_CIM_FLAG_OUT") %>' 
                                ToolTip='<%# Bind("BUSINESS_CIM_FLAG_OUT") %>' />
                        </td>
                    </tr>
                    
                    <tr style="display:none">
                        <td>
                            <asp:Label ID="BUSINESS_CODE_INLabelField" runat="server" Font-Bold="True"
                                Text='<%# BUSINESS_CODE_INLabelFieldText %>'
                                ToolTip='<%# BUSINESS_CODE_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CODE_INLabelValue" runat="server" 
                                Text='<%# Bind("BUSINESS_CODE_IN") %>' 
                                ToolTip='<%# Bind("BUSINESS_CODE_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CODE_OUTLabelField" runat="server" Font-Bold="True"
                                Text='<%# BUSINESS_CODE_OUTLabelFieldText %>'
                                ToolTip='<%# BUSINESS_CODE_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="BUSINESS_CODE_OUTLabelValue" runat="server" 
                                Text='<%# Bind("BUSINESS_CODE_OUT") %>' 
                                ToolTip='<%# Bind("BUSINESS_CODE_OUT") %>' />
                        </td>
                    </tr>
                    
                    <tr style="display:none">
                        <td>
                            <asp:Label ID="AGING_DPD_C_INLabelField" runat="server" Font-Bold="True"
                                Text='<%# AGING_DPD_C_INLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_C_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_C_INLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_C_IN") %>' 
                                ToolTip='<%# Bind("AGING_DPD_C_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_C_OUTLabelField" runat="server" Font-Bold="True"
                                Text='<%# AGING_DPD_C_OUTLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_C_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="AGING_DPD_C_OUTLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_C_OUT") %>' 
                                ToolTip='<%# Bind("AGING_DPD_C_OUT") %>' />
                        </td>
                    </tr>
                    
                    <tr style="display:none">
                        <td>
                            <asp:Label ID="AGING_DPD_O_INLabelField" runat="server" Font-Bold="True"
                                Text='<%# AGING_DPD_O_INLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_O_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_O_INLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_O_IN") %>' 
                                ToolTip='<%# Bind("AGING_DPD_O_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AGING_DPD_O_OUTLabelField" runat="server" Font-Bold="True"
                                Text='<%# AGING_DPD_O_OUTLabelFieldText %>'
                                ToolTip='<%# AGING_DPD_O_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="AGING_DPD_O_OUTLabelValue" runat="server" 
                                Text='<%# Bind("AGING_DPD_O_OUT") %>' 
                                ToolTip='<%# Bind("AGING_DPD_O_OUT") %>' />
                        </td>
                    </tr>
                    
                    <tr style="display: none">
                        <td>
                            <asp:Label ID="HAS_OTHER_CLASS_INLabelField" runat="server" Font-Bold="True"
                                Text='<%# HAS_OTHER_CLASS_INLabelFieldText %>'
                                ToolTip='<%# HAS_OTHER_CLASS_INLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="HAS_OTHER_CLASS_INLabelValue" runat="server" 
                                Text='<%# Bind("HAS_OTHER_CLASS_IN") %>' 
                                ToolTip='<%# Bind("HAS_OTHER_CLASS_IN") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HAS_OTHER_CLASS_OUTLabelField" runat="server" Font-Bold="True"
                                Text='<%# HAS_OTHER_CLASS_OUTLabelFieldText %>'
                                ToolTip='<%# HAS_OTHER_CLASS_OUTLabelFieldToolTip %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="HAS_OTHER_CLASS_OUTLabelValue" runat="server" 
                                Text='<%# Bind("HAS_OTHER_CLASS_OUT") %>' 
                                ToolTip='<%# Bind("HAS_OTHER_CLASS_OUT") %>' />
                        </td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:FormView>
    
        <asp:SqlDataSource ID="HistoryDetail_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
            SelectCommand="S14_SELECT_STOP_HISTORY_BY_HID" 
            SelectCommandType="StoredProcedure"
            InsertCommand="S08_MOVE_BACK_2_STOP" 
            InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="HID" QueryStringField="hid" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CIF" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Action_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
            SelectCommand="SELECT ACTION_ID, ACTION_DETAIL, ACTION_GROUP FROM STOP_ACTION ORDER BY ACTION_PRIORITY">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="PayAbility_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
            SelectCommand="SELECT PAY_ABILITY_ID, PAY_ABILITY_DETAIL FROM STOP_PAY_ABILITY">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="DebtResolve_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>" 
            SelectCommand="SELECT DEPT_RESOLVE_ID, DEPT_RESOLVE_DETAIL FROM STOP_DEPT_RESOLVE_PROCESS">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="Judgement_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT ID, Judgement, PRIORITY FROM ANNALS_JUDGEMENT">
        </asp:SqlDataSource>
        
        <asp:Label ID="Label1" runat="server" Text="ทำการย้ายกลับเรียบร้อยแล้ว" Visible="False"></asp:Label>
        <asp:Button ID="CloseButton" runat="server" 
            onclientclick="window.close();return false;" Text="ปิดหน้าต่างนี้" 
            Visible="False" />
        
    </div>
</asp:Content>