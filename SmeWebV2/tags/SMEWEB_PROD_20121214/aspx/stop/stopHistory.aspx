<%@ Page Title="Stop History" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="stopHistory.aspx.vb" Inherits="aspx.stop.StopHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="~/Controls/ControllingTree/ControllingTree.ascx" tagname="ControllingTree" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            
            <table>
            
                <tr valign="top">
                    <td>
                        <uc4:ControllingTree ID="ControllingTree1" runat="server" />
                        <asp:HiddenField ID="Hidd_TreeSelectedValue" runat="server" />
                        <asp:HiddenField ID="Hidd_TreeSelectedValueType" runat="server" />
                        <asp:HiddenField ID="Hidd_TreeSelectedEmpIds" runat="server" />
                    </td>

                    <td>
                        <asp:Label ID="TreeSelectedLabel" runat="server" Text="Label" Font-Bold="True" Font-Italic="False" Font-Size="Larger" ForeColor="Red" Font-Underline="True"></asp:Label>
                        
                        <asp:GridView ID="HistoryGridView" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="CIF,DATE_IN" DataSourceID="History_DS" 
                            ForeColor="#333333" AllowPaging="True" AllowSorting="True" 
                            Font-Size="Small">
                            <PagerSettings Mode="NumericFirstLast" />
                            <RowStyle BackColor="#E3EAEB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="SelectLinkButton" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select" OnPreRender="SelectLinkButton_PreRender"
                                        >
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CIF" HeaderText="CIF" ReadOnly="True" 
                                    SortExpression="CIF">
                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CUS_NAME" HeaderText="CUS_NAME" 
                                    SortExpression="CUS_NAME" >
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SEQUENCE" HeaderText="SEQ" 
                                    SortExpression="SEQUENCE">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DATE_IN" HeaderText="DATE IN" 
                                    SortExpression="DATE_IN" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DATE_OUT" HeaderText="DATE OUT" 
                                    SortExpression="DATE_OUT" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ACTION" SortExpression="UPDATE_ACTION_ID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="Action_DDL" runat="server" 
                                            DataSourceID="Action_DS" DataTextField="ACTION_DETAIL" 
                                            DataValueField="ACTION_ID" Enabled="False"
                                            SelectedValue='<%# Bind("UPDATE_ACTION_ID") %>'>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" 
                                            Text='<%# Bind("UPDATE_ACTION_ID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="EMP_NAME" HeaderText="EMP_NAME" 
                                    SortExpression="EMP_NAME">
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="PAY ABILITY" 
                                    SortExpression="UPDATE_PAY_ABILITY_ID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="PayAbility_DDL" runat="server" 
                                            DataSourceID="PayAbility_DS" DataTextField="PAY_ABILITY_DETAIL" 
                                            DataValueField="PAY_ABILITY_ID" Enabled="False"
                                            SelectedValue='<%# Bind("UPDATE_PAY_ABILITY_ID") %>'>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" 
                                            Text='<%# Bind("UPDATE_PAY_ABILITY_ID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DEPT RESOLVE" 
                                    SortExpression="UPDATE_DEPT_RESOLVE_ID">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DebtResolve_DDL" runat="server" 
                                            DataSourceID="DebtResolve_DS" DataTextField="DEPT_RESOLVE_DETAIL" 
                                            DataValueField="DEPT_RESOLVE_ID" Enabled="False"
                                            SelectedValue='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>'>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" 
                                            Text='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="UPDATE_TDR_DATE" HeaderText="TDR DATE" 
                                    SortExpression="UPDATE_TDR_DATE" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="HID" SortExpression="HID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="HIDLabelValue" runat="server" Text='<%# Bind("HID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="HIDTextBox" runat="server" Text='<%# Bind("HID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                 
                        
                 
                        <table>            
                            <tr>
                                <td>
                                    <asp:FormView ID="DetailFormView" runat="server" 
                                        DataKeyNames="CIF,DATE_IN" CellPadding="4" ForeColor="#333333" 
                                        Visible="False">
                                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <EditItemTemplate>
                                            CIF:
                                            <asp:Label ID="CIFLabel1" runat="server" Text='<%# Eval("CIF") %>' />
                                            <br />
                                            CUS_NAME:
                                            <asp:TextBox ID="CUS_NAMETextBox" runat="server" 
                                                Text='<%# Bind("CUS_NAME") %>' />
                                            <br />
                                            EMP_NAME:
                                            <asp:TextBox ID="EMP_NAMETextBox" runat="server" 
                                                Text='<%# Bind("EMP_NAME") %>' />
                                            <br />
                                            SEQUENCE:
                                            <asp:TextBox ID="SEQUENCETextBox" runat="server" 
                                                Text='<%# Bind("SEQUENCE") %>' />
                                            <br />
                                            DATE_IN:
                                            <asp:Label ID="DATE_INLabel1" runat="server" Text='<%# Eval("DATE_IN") %>' />
                                            <br />
                                            AGING_DPD_IN:
                                            <asp:TextBox ID="AGING_DPD_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_IN") %>' />
                                            <br />
                                            AGING_DPD_C_IN:
                                            <asp:TextBox ID="AGING_DPD_C_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_C_IN") %>' />
                                            <br />
                                            AGING_DPD_O_IN:
                                            <asp:TextBox ID="AGING_DPD_O_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_O_IN") %>' />
                                            <br />
                                            AGING_H_IN:
                                            <asp:TextBox ID="AGING_H_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_H_IN") %>' />
                                            <br />
                                            HAS_OTHER_CLASS_IN:
                                            <asp:TextBox ID="HAS_OTHER_CLASS_INTextBox" runat="server" 
                                                Text='<%# Bind("HAS_OTHER_CLASS_IN") %>' />
                                            <br />
                                            CLASS_H_IN:
                                            <asp:TextBox ID="CLASS_H_INTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_H_IN") %>' />
                                            <br />
                                            IS_TDR_IN:
                                            <asp:TextBox ID="IS_TDR_INTextBox" runat="server" 
                                                Text='<%# Bind("IS_TDR_IN") %>' />
                                            <br />
                                            OD_UTILIZE_IN:
                                            <asp:TextBox ID="OD_UTILIZE_INTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_IN") %>' />
                                            <br />
                                            JUDGEMENT_ID_IN:
                                            <asp:TextBox ID="JUDGEMENT_ID_INTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_ID_IN") %>' />
                                            <br />
                                            BUSINESS_CIM_FLAG_IN:
                                            <asp:TextBox ID="BUSINESS_CIM_FLAG_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CIM_FLAG_IN") %>' />
                                            <br />
                                            BUSINESS_CODE_IN:
                                            <asp:TextBox ID="BUSINESS_CODE_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CODE_IN") %>' />
                                            <br />
                                            BUSINESS_DESC_IN:
                                            <asp:TextBox ID="BUSINESS_DESC_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_DESC_IN") %>' />
                                            <br />
                                            DATE_OUT:
                                            <asp:TextBox ID="DATE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("DATE_OUT") %>' />
                                            <br />
                                            AGING_DPD_OUT:
                                            <asp:TextBox ID="AGING_DPD_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_OUT") %>' />
                                            <br />
                                            AGING_DPD_C_OUT:
                                            <asp:TextBox ID="AGING_DPD_C_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_C_OUT") %>' />
                                            <br />
                                            AGING_DPD_O_OUT:
                                            <asp:TextBox ID="AGING_DPD_O_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_O_OUT") %>' />
                                            <br />
                                            AGING_H_OUT:
                                            <asp:TextBox ID="AGING_H_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_H_OUT") %>' />
                                            <br />
                                            HAS_OTHER_CLASS_OUT:
                                            <asp:TextBox ID="HAS_OTHER_CLASS_OUTTextBox" runat="server" 
                                                Text='<%# Bind("HAS_OTHER_CLASS_OUT") %>' />
                                            <br />
                                            CLASS_H_OUT:
                                            <asp:TextBox ID="CLASS_H_OUTTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_H_OUT") %>' />
                                            <br />
                                            IS_TDR_OUT:
                                            <asp:TextBox ID="IS_TDR_OUTTextBox" runat="server" 
                                                Text='<%# Bind("IS_TDR_OUT") %>' />
                                            <br />
                                            OD_UTILIZE_OUT:
                                            <asp:TextBox ID="OD_UTILIZE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_OUT") %>' />
                                            <br />
                                            JUDGEMENT_ID_OUT:
                                            <asp:TextBox ID="JUDGEMENT_ID_OUTTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_ID_OUT") %>' />
                                            <br />
                                            BUSINESS_CIM_FLAG_OUT:
                                            <asp:TextBox ID="BUSINESS_CIM_FLAG_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CIM_FLAG_OUT") %>' />
                                            <br />
                                            BUSINESS_CODE_OUT:
                                            <asp:TextBox ID="BUSINESS_CODE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CODE_OUT") %>' />
                                            <br />
                                            BUSINESS_DESC_OUT:
                                            <asp:TextBox ID="BUSINESS_DESC_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_DESC_OUT") %>' />
                                            <br />
                                            AGING_CRITERIA_IN:
                                            <asp:TextBox ID="AGING_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_CRITERIA_IN") %>' />
                                            <br />
                                            CLASS_CRITERIA_IN:
                                            <asp:TextBox ID="CLASS_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_CRITERIA_IN") %>' />
                                            <br />
                                            TDR_CRITERIA_IN:
                                            <asp:TextBox ID="TDR_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("TDR_CRITERIA_IN") %>' />
                                            <br />
                                            OD_UTILIZE_CRITERIA_IN:
                                            <asp:TextBox ID="OD_UTILIZE_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_CRITERIA_IN") %>' />
                                            <br />
                                            JUDGEMENT_CRITERIA_IN:
                                            <asp:TextBox ID="JUDGEMENT_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_CRITERIA_IN") %>' />
                                            <br />
                                            BUSINESS_CRITERIA_IN:
                                            <asp:TextBox ID="BUSINESS_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CRITERIA_IN") %>' />
                                            <br />
                                            UPDATE_ACTION_ID:
                                            <asp:TextBox ID="UPDATE_ACTION_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_ID") %>' />
                                            <br />
                                            UPDATE_ACTION_DATE:
                                            <asp:TextBox ID="UPDATE_ACTION_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_DATE") %>' />
                                            <br />
                                            UPDATE_ACTION_USER:
                                            <asp:TextBox ID="UPDATE_ACTION_USERTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_USER") %>' />
                                            <br />
                                            UPDATE_PAY_ABILITY_ID:
                                            <asp:TextBox ID="UPDATE_PAY_ABILITY_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_PAY_ABILITY_ID") %>' />
                                            <br />
                                            UPDATE_DEPT_RESOLVE_ID:
                                            <asp:TextBox ID="UPDATE_DEPT_RESOLVE_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>' />
                                            <br />
                                            UPDATE_TDR_DATE:
                                            <asp:TextBox ID="UPDATE_TDR_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_TDR_DATE") %>' />
                                            <br />
                                            COMMENT:
                                            <asp:TextBox ID="COMMENTTextBox" runat="server" 
                                                Text='<%# Bind("COMMENT") %>' />
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            CIF:
                                            <asp:TextBox ID="CIFTextBox" runat="server" Text='<%# Bind("CIF") %>' />
                                            <br />
                                            CUS_NAME:
                                            <asp:TextBox ID="CUS_NAMETextBox" runat="server" 
                                                Text='<%# Bind("CUS_NAME") %>' />
                                            <br />
                                            EMP_NAME:
                                            <asp:TextBox ID="EMP_NAMETextBox" runat="server" 
                                                Text='<%# Bind("EMP_NAME") %>' />
                                            <br />
                                            SEQUENCE:
                                            <asp:TextBox ID="SEQUENCETextBox" runat="server" 
                                                Text='<%# Bind("SEQUENCE") %>' />
                                            <br />
                                            DATE_IN:
                                            <asp:TextBox ID="DATE_INTextBox" runat="server" 
                                                Text='<%# Bind("DATE_IN") %>' />
                                            <br />
                                            AGING_DPD_IN:
                                            <asp:TextBox ID="AGING_DPD_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_IN") %>' />
                                            <br />
                                            AGING_DPD_C_IN:
                                            <asp:TextBox ID="AGING_DPD_C_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_C_IN") %>' />
                                            <br />
                                            AGING_DPD_O_IN:
                                            <asp:TextBox ID="AGING_DPD_O_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_O_IN") %>' />
                                            <br />
                                            AGING_H_IN:
                                            <asp:TextBox ID="AGING_H_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_H_IN") %>' />
                                            <br />
                                            HAS_OTHER_CLASS_IN:
                                            <asp:TextBox ID="HAS_OTHER_CLASS_INTextBox" runat="server" 
                                                Text='<%# Bind("HAS_OTHER_CLASS_IN") %>' />
                                            <br />
                                            CLASS_H_IN:
                                            <asp:TextBox ID="CLASS_H_INTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_H_IN") %>' />
                                            <br />
                                            IS_TDR_IN:
                                            <asp:TextBox ID="IS_TDR_INTextBox" runat="server" 
                                                Text='<%# Bind("IS_TDR_IN") %>' />
                                            <br />
                                            OD_UTILIZE_IN:
                                            <asp:TextBox ID="OD_UTILIZE_INTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_IN") %>' />
                                            <br />
                                            JUDGEMENT_ID_IN:
                                            <asp:TextBox ID="JUDGEMENT_ID_INTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_ID_IN") %>' />
                                            <br />
                                            BUSINESS_CIM_FLAG_IN:
                                            <asp:TextBox ID="BUSINESS_CIM_FLAG_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CIM_FLAG_IN") %>' />
                                            <br />
                                            BUSINESS_CODE_IN:
                                            <asp:TextBox ID="BUSINESS_CODE_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CODE_IN") %>' />
                                            <br />
                                            BUSINESS_DESC_IN:
                                            <asp:TextBox ID="BUSINESS_DESC_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_DESC_IN") %>' />
                                            <br />
                                            DATE_OUT:
                                            <asp:TextBox ID="DATE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("DATE_OUT") %>' />
                                            <br />
                                            AGING_DPD_OUT:
                                            <asp:TextBox ID="AGING_DPD_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_OUT") %>' />
                                            <br />
                                            AGING_DPD_C_OUT:
                                            <asp:TextBox ID="AGING_DPD_C_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_C_OUT") %>' />
                                            <br />
                                            AGING_DPD_O_OUT:
                                            <asp:TextBox ID="AGING_DPD_O_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_DPD_O_OUT") %>' />
                                            <br />
                                            AGING_H_OUT:
                                            <asp:TextBox ID="AGING_H_OUTTextBox" runat="server" 
                                                Text='<%# Bind("AGING_H_OUT") %>' />
                                            <br />
                                            HAS_OTHER_CLASS_OUT:
                                            <asp:TextBox ID="HAS_OTHER_CLASS_OUTTextBox" runat="server" 
                                                Text='<%# Bind("HAS_OTHER_CLASS_OUT") %>' />
                                            <br />
                                            CLASS_H_OUT:
                                            <asp:TextBox ID="CLASS_H_OUTTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_H_OUT") %>' />
                                            <br />
                                            IS_TDR_OUT:
                                            <asp:TextBox ID="IS_TDR_OUTTextBox" runat="server" 
                                                Text='<%# Bind("IS_TDR_OUT") %>' />
                                            <br />
                                            OD_UTILIZE_OUT:
                                            <asp:TextBox ID="OD_UTILIZE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_OUT") %>' />
                                            <br />
                                            JUDGEMENT_ID_OUT:
                                            <asp:TextBox ID="JUDGEMENT_ID_OUTTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_ID_OUT") %>' />
                                            <br />
                                            BUSINESS_CIM_FLAG_OUT:
                                            <asp:TextBox ID="BUSINESS_CIM_FLAG_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CIM_FLAG_OUT") %>' />
                                            <br />
                                            BUSINESS_CODE_OUT:
                                            <asp:TextBox ID="BUSINESS_CODE_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CODE_OUT") %>' />
                                            <br />
                                            BUSINESS_DESC_OUT:
                                            <asp:TextBox ID="BUSINESS_DESC_OUTTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_DESC_OUT") %>' />
                                            <br />
                                            AGING_CRITERIA_IN:
                                            <asp:TextBox ID="AGING_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("AGING_CRITERIA_IN") %>' />
                                            <br />
                                            CLASS_CRITERIA_IN:
                                            <asp:TextBox ID="CLASS_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("CLASS_CRITERIA_IN") %>' />
                                            <br />
                                            TDR_CRITERIA_IN:
                                            <asp:TextBox ID="TDR_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("TDR_CRITERIA_IN") %>' />
                                            <br />
                                            OD_UTILIZE_CRITERIA_IN:
                                            <asp:TextBox ID="OD_UTILIZE_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("OD_UTILIZE_CRITERIA_IN") %>' />
                                            <br />
                                            JUDGEMENT_CRITERIA_IN:
                                            <asp:TextBox ID="JUDGEMENT_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("JUDGEMENT_CRITERIA_IN") %>' />
                                            <br />
                                            BUSINESS_CRITERIA_IN:
                                            <asp:TextBox ID="BUSINESS_CRITERIA_INTextBox" runat="server" 
                                                Text='<%# Bind("BUSINESS_CRITERIA_IN") %>' />
                                            <br />
                                            UPDATE_ACTION_ID:
                                            <asp:TextBox ID="UPDATE_ACTION_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_ID") %>' />
                                            <br />
                                            UPDATE_ACTION_DATE:
                                            <asp:TextBox ID="UPDATE_ACTION_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_DATE") %>' />
                                            <br />
                                            UPDATE_ACTION_USER:
                                            <asp:TextBox ID="UPDATE_ACTION_USERTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_ACTION_USER") %>' />
                                            <br />
                                            UPDATE_PAY_ABILITY_ID:
                                            <asp:TextBox ID="UPDATE_PAY_ABILITY_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_PAY_ABILITY_ID") %>' />
                                            <br />
                                            UPDATE_DEPT_RESOLVE_ID:
                                            <asp:TextBox ID="UPDATE_DEPT_RESOLVE_IDTextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>' />
                                            <br />
                                            UPDATE_TDR_DATE:
                                            <asp:TextBox ID="UPDATE_TDR_DATETextBox" runat="server" 
                                                Text='<%# Bind("UPDATE_TDR_DATE") %>' />
                                            <br />
                                            COMMENT:
                                            <asp:TextBox ID="COMMENTTextBox" runat="server" Text='<%# Bind("COMMENT") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="CIFLabelField" runat="server" Text="CIF:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="CIFLabelValue" runat="server" Text='<%# Bind("CIF") %>' 
                                                            ClientSelector="CIF_Lael" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="CUS_NAMELabelField" runat="server" Text="CUS_NAME:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="CUS_NAMELabelValue" runat="server" Text='<%# Bind("CUS_NAME") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="SEQUENCELabelField" runat="server" Text="SEQUENCE:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="SEQUENCELabelValue" runat="server" Text='<%# Bind("SEQUENCE") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="DATE_INLabelField" runat="server" Text="DATE_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="DATE_INLabelValue" runat="server" 
                                                            Text='<%# Bind("DATE_IN", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_C_INLabelField" runat="server" Text="AGING_DPD_C_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_C_INLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_C_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_C_OUTLabelField" runat="server" Text="AGING_DPD_C_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_C_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_C_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_O_INLabelField" runat="server" Text="AGING_DPD_O_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_O_INLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_O_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_O_OUTLabelField" runat="server" Text="AGING_DPD_O_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_O_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_O_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="AGING_H_INLabelField" runat="server" Text="AGING_H_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_H_INLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_H_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AGING_H_OUTLabelField" runat="server" Text="AGING_H_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_H_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_H_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_INLabelField" runat="server" Text="AGING_DPD_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_INLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AGING_DPD_OUTLabelField" runat="server" Text="AGING_DPD_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_DPD_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_DPD_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="AGING_CRITERIA_INLabelField" runat="server" Text="AGING_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="AGING_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("AGING_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="CLASS_H_INLabelField" runat="server" Text="CLASS_H_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="CLASS_H_INLabelValue" runat="server" 
                                                            Text='<%# Bind("CLASS_H_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="CLASS_H_OUTLabelField" runat="server" Text="CLASS_H_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="CLASS_H_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("CLASS_H_OUT") %>' />
                                                    </td>
                                                    <td rowspan="2">
                                                        <asp:Label ID="CLASS_CRITERIA_INLabelField" runat="server" Text="CLASS_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="CLASS_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("CLASS_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="HAS_OTHER_CLASS_INLabelField" runat="server" Text="HAS_OTHER_CLASS_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="HAS_OTHER_CLASS_INLabelValue" runat="server" 
                                                            Text='<%# Bind("HAS_OTHER_CLASS_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="HAS_OTHER_CLASS_OUTLabelField" runat="server" Text="HAS_OTHER_CLASS_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="HAS_OTHER_CLASS_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("HAS_OTHER_CLASS_OUT") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="IS_TDR_INLabelField" runat="server" Text="IS_TDR_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="IS_TDR_INLabelValue" runat="server" 
                                                            Text='<%# Bind("IS_TDR_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="IS_TDR_OUTLabelField" runat="server" Text="IS_TDR_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="IS_TDR_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("IS_TDR_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="TDR_CRITERIA_INLabelField" runat="server" Text="TDR_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="TDR_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("TDR_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="OD_UTILIZE_INLabelField" runat="server" Text="OD_UTILIZE_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="OD_UTILIZE_INLabelValue" runat="server" 
                                                            Text='<%# Bind("OD_UTILIZE_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="OD_UTILIZE_OUTLabelField" runat="server" Text="OD_UTILIZE_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="OD_UTILIZE_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("OD_UTILIZE_OUT") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="OD_UTILIZE_CRITERIA_INLabelField" runat="server" Text="OD_UTILIZE_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="OD_UTILIZE_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("OD_UTILIZE_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="JUDGEMENT_ID_INLabelField" runat="server" Text="JUDGEMENT_ID_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:DropDownList ID="Judgement_IN_DDL" runat="server" 
                                                            DataSourceID="Judgement_DS" DataTextField="Judgement" DataValueField="ID" 
                                                            Enabled="False" SelectedValue='<%# Bind("JUDGEMENT_ID_IN") %>'>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="JUDGEMENT_ID_OUTLabelField" runat="server" Text="JUDGEMENT_ID_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:DropDownList ID="Judgement_OUT_DDL" runat="server" 
                                                            DataSourceID="Judgement_DS" DataTextField="Judgement" DataValueField="ID" 
                                                            Enabled="False" SelectedValue='<%# Bind("JUDGEMENT_ID_OUT") %>'>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="JUDGEMENT_CRITERIA_INLabelField" runat="server" Text="JUDGEMENT_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="JUDGEMENT_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("JUDGEMENT_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_CIM_FLAG_INLabelField" runat="server" Text="BUSINESS_CIM_FLAG_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_CIM_FLAG_INLabelValue" runat="server" 
                                                            Text='<%# Bind("BUSINESS_CIM_FLAG_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_CIM_FLAG_OUTLabelField" runat="server" Text="BUSINESS_CIM_FLAG_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_CIM_FLAG_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("BUSINESS_CIM_FLAG_OUT") %>' />
                                                    </td>
                                                    <td rowspan="3">
                                                        <asp:Label ID="BUSINESS_CRITERIA_INLabelField" runat="server" Text="BUSINESS_CRITERIA_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_CRITERIA_INLabelValue" runat="server" 
                                                            Text='<%# Bind("BUSINESS_CRITERIA_IN") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_CODE_INLabelField" runat="server" Text="BUSINESS_CODE_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_CODE_INLabelValue" runat="server" 
                                                            Text='<%# Bind("BUSINESS_CODE_IN") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_CODE_OUTLabelField" runat="server" Text="BUSINESS_CODE_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_CODE_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("BUSINESS_CODE_OUT") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_DESC_INLabelField" runat="server" Text="BUSINESS_DESC_IN:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_DESC_INLabelValue" runat="server"
                                                            ForeColor="Red" BackColor="Lime"
                                                            Text='<%# Bind("BUSINESS_DESC_IN") %>' />
                                                        <asp:Label ID="BUSINESS_DESC_INLabelValueShort" runat="server" 
                                                            Text='<%# LEFT(Eval("BUSINESS_DESC_IN"),26) + IIf(Len(Eval("BUSINESS_DESC_IN")) > 26, "...", "") %>' />
                                                        <cc1:HoverMenuExtender ID="HoverMenuExtender1"
                                                            runat="server" TargetControlID="BUSINESS_DESC_INLabelValueShort" PopupControlID="BUSINESS_DESC_INLabelValue">
                                                        </cc1:HoverMenuExtender>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="BUSINESS_DESC_OUTLabelField" runat="server" Text="BUSINESS_DESC_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="BUSINESS_DESC_OUTLabelValue" runat="server" 
                                                            ForeColor="Red" BackColor="Lime"
                                                            Text='<%# Bind("BUSINESS_DESC_OUT") %>' />
                                                        <asp:Label ID="BUSINESS_DESC_OUTLabelValueShort" runat="server" 
                                                            Text='<%# LEFT(Eval("BUSINESS_DESC_OUT"),26) + IIf(Len(Eval("BUSINESS_DESC_OUT")) > 26, "...", "") %>' />
                                                        <cc1:HoverMenuExtender ID="HoverMenuExtender2"
                                                            runat="server" TargetControlID="BUSINESS_DESC_OUTLabelValueShort" PopupControlID="BUSINESS_DESC_OUTLabelValue">
                                                        </cc1:HoverMenuExtender>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LAST_ACTIONLabelField" runat="server" Text="LAST_ACTION:" Font-Bold="True"></asp:Label>
                                                        <asp:DropDownList ID="Action_DDL" runat="server" DataSourceID="Action_DS" 
                                                            DataTextField="ACTION_DETAIL" DataValueField="ACTION_ID" Enabled="False"
                                                            SelectedValue='<%# Bind("UPDATE_ACTION_ID") %>'>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LAST_ACTION_DATELabelField" runat="server" Text="LAST_ACTION_DATE:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="UPDATE_ACTION_DATELabelValue" runat="server" 
                                                            Text='<%# Bind("UPDATE_ACTION_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="ACTION_USERLabelField" runat="server" Text="ACTION_USER:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="UPDATE_ACTION_USERLabelValue" runat="server" 
                                                            Text='<%# Bind("UPDATE_ACTION_USER") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="EMP_NAMELabelField" runat="server" Text="EMP_NAME:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="EMP_NAMELabelValue" runat="server" Text='<%# Bind("EMP_NAME") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PAY_ABILITYLabelField" runat="server" Text="PAY_ABILITY:" Font-Bold="True"></asp:Label>
                                                        <asp:DropDownList ID="PayAbility_DDL" runat="server" 
                                                            DataSourceID="PayAbility_DS" DataTextField="PAY_ABILITY_DETAIL" 
                                                            DataValueField="PAY_ABILITY_ID" Enabled="False"
                                                            SelectedValue='<%# Bind("UPDATE_PAY_ABILITY_ID") %>'>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="DEPT_RESOLVELabelField" runat="server" Text="DEPT_RESOLVE:" Font-Bold="True"></asp:Label>
                                                        <asp:DropDownList ID="DebtResolve_DDL" runat="server" 
                                                            DataSourceID="DebtResolve_DS" DataTextField="DEPT_RESOLVE_DETAIL" 
                                                            DataValueField="DEPT_RESOLVE_ID" Enabled="False"
                                                            SelectedValue='<%# Bind("UPDATE_DEPT_RESOLVE_ID") %>'>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="UPDATE_TDR_DATELabelField" runat="server" Text="UPDATE_TDR_DATE:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="UPDATE_TDR_DATELabelValue" runat="server" 
                                                            Text='<%# Bind("UPDATE_TDR_DATE", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="DATE_OUTLabelField" runat="server" Text="DATE_OUT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="DATE_OUTLabelValue" runat="server" 
                                                            Text='<%# Bind("DATE_OUT", "{0:dd/MM/yyyy hh:mm:ss}") %>' />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Label ID="COMMENTLabelField" runat="server" Text="COMMENT:" Font-Bold="True"></asp:Label>
                                                        <asp:Label ID="COMMENTLabelValue" runat="server" Text='<%# Bind("COMMENT") %>' />
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:Button ID="move2StopButton" runat="server" Text="ส่งกลับ Stop Program" 
                                                            onclientclick="confirmBack2Stop(this,event);return false;" 
                                                            onclick="move2StopButton_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                          
                                        </ItemTemplate>
                                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#7C6F57" />
                                    </asp:FormView>
                                </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
                
            </table>
            
            <asp:SqlDataSource ID="History_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>"
                SelectCommand="S07_SELECT_STOP_HISTORY_BY_CMs" 
                SelectCommandType="StoredProcedure" InsertCommand="S08_MOVE_BACK_2_STOP" 
                InsertCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Hidd_TreeSelectedEmpIds" Name="CM_CODE" 
                        PropertyName="Value" Type="String" />
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
            
        </div>
</asp:Content>
