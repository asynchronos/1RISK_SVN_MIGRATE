<%@ Page Title="SME Customer Management" Language="VB" MasterPageFile="~/Iframe.master"
    AutoEventWireup="false" CodeFile="SmeCustomerManagement.aspx.vb" Inherits="aspx.customer.SmeCustomerManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function getEleByClientSelector(ClientSelector, tagName) {
            var result = null;

            if (!tagName) { tagName = "input"; }

            var eleArray = $(tagName + "[ClientSelector='" + ClientSelector + "']");

            if (eleArray.length > 0) {
                result = eleArray[0];
            } else {
                alert("Can not find ClientSelector=" + ClientSelector + ".\nPlease, contact administrator.");
            }

            return result;
        }

        function cusIdChange(eleSrc, TargetClientSelector) {
            var cif = eleSrc.value;
            var eleTarget = getEleByClientSelector(TargetClientSelector);

            if (isNaN(cif)) {
                alert("CIF ต้องเป็นตัวเลขเท่านั้น");

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetCustomersFullNameByCif(cif,onSuccess,onFailed,userContext)
                //localhost.CustomerWCFService.GetCustomerFullNameByCif(cif, onSuccess, onFailed, TargetClientSelector);
                //localhost.CustomerWCFService.GetCustomerByCif(cif,onSuccess,onFailed,TargetClientSelector);
                var service = new SmeWeb.CustomerWCFService();
                service.GetCustomerFullNameByCif(cif, onSuccess, onFailed, TargetClientSelector);
            }
        }

        function empIdChange(eleSrc, TargetClientSelector) {
            var empId = eleSrc.value;
            var eleTarget = getEleByClientSelector(TargetClientSelector);

            if (isNaN(empId) || empId.length != 6) {
                if (empId.length > 0 && empId != 0) {
                    alert("รหัสพนักงาน ต้องเป็นตัวเลข6หลักเท่านั้น");
                }

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetCmFullNameByEmpId(empId,onSuccess,onFailed,userContext)
                //localhost.EmployeeWCFService.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, TargetClientSelector);
                var service = new SmeWeb.EmployeeWCFService();
                service.GetEmpFullNameByEmpId(empId, onSuccess, onFailed, TargetClientSelector);
            }
        }

        function branchIdChange(eleSrc, TargetClientSelector) {
            var branchId = eleSrc.value;
            var eleTarget = getEleByClientSelector(TargetClientSelector);

            if (isNaN(branchId)) {
                if (branchId.length > 0) {
                    alert("รหัสสาขา ต้องเป็นตัวเลขเท่านั้น");
                }

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetBranchNameById(branchId,onSuccess,onFailed,userContext)
                //localhost.BranchWCFService.GetBranchNameById(branchId, onSuccess, onFailed, TargetClientSelector);
                var service = new SmeWeb.BranchWCFService();
                service.GetBranchNameById(branchId, onSuccess, onFailed, TargetClientSelector);
            }
        }

        function businessTypeIdChange(eleSrc, TargetClientSelector) {
            var type4Id = eleSrc.value;
            var eleTarget = getEleByClientSelector(TargetClientSelector);

            if (isNaN(type4Id) || type4Id.length < 7 || type4Id.length > 8) {
                if (type4Id.length > 0) {
                    alert("Business Type ต้องเป็นตัวเลข7-8หลักเท่านั้น");
                }

                //เช็คว่ามี Element target หรือไม่
                if (eleTarget) {
                    //เคลียร์ค่า
                    eleTarget.value = "";
                }

                eleSrc.focus();
            } else {
                eleTarget.value = "loading...";
                //GetBusinessTypeDetailBytype4Id(type4Id,onSuccess,onFailed,userContext)
                //localhost.BusinessTypeWCFService.GetBusinessTypeDetailByType4Id(type4Id, onSuccess, onFailed, TargetClientSelector);
                var service = new SmeWeb.BusinessTypeWCFService();
                service.GetBusinessTypeDetailByType4Id(type4Id, onSuccess, onFailed, TargetClientSelector);
            }
        }

        //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
        //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
        //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
        function onSuccess(result, userContext, methodName) {
            var eleTarget = getEleByClientSelector(userContext);
            //เช็คว่ามี Element นี้หรือไม่
            if (eleTarget) {//ถ้ามี Element นี้
                if (methodName == "GetCustomerByCif") {
                    //this for test
                    alert(result.status);
                    alert(result.detail.CIF);
                } else {
                    if (result.status == "success") {
                        //set result ใส่ element
                        eleTarget.value = result.detail;
                    } else {
                        eleTarget.value = "failed:Please, contact administrator.";
                        alert(result.detail);
                    }
                }
            }
        }

        function onFailed(error, userContext, methodName) {
            //alert(error.constructor);
            if (error.get_statusCode() != 0)
                alert(methodName + " error:" + error.get_statusCode());
            //alert(error.get_message());
        }
    </script>
    <script type="text/javascript">
        function WeightValidate(sender, e) {

            var BUSINESS_DESTINATION_DDL = getEleByClientSelector("BUSINESS_DESTINATION_DDL", "select");
            var exportTextBox = getEleByClientSelector("Export_TextBox");
            var localTextBox = getEleByClientSelector("Local_TextBox");
            //            var totalTextBox = getEleByClientSelector("Total_TextBox");

            if (BUSINESS_DESTINATION_DDL.options[BUSINESS_DESTINATION_DDL.selectedIndex].value != 1) {
                var exportValue = Number(exportTextBox.value);
                var localValue = Number(localTextBox.value);

                if (exportValue + localValue != 100) {
                    e.IsValid = false;
                } else {
                    e.IsValid = true;
                }

                //                totalTextBox.value = String(exportValue + localValue);
            } else {
                exportTextBox.value = "";
                localTextBox.value = "";
                //                totalTextBox.value = "";
            }

            //alert(e.Value);
        }
    </script>
    <script type="text/javascript" src="../../js/ext3.0/iframeComponent.js"></script>
    <script type="text/javascript">
        Ext.onReady(function () {
            var exporterWindow;
            var exporterDetailButt = Ext.select('[ExtId=ExporterButton]').first();

            //            var exportValue = Number(Ext.select('[ClientSelector=Export_TextBox]').first().getValue(false));

            //            if (exportValue > 0) {
            //                exporterDetailButt.dom.disabled = false;
            //            } else {
            //                exporterDetailButt.dom.disabled = true;
            //            }
            if (exporterDetailButt)
                exporterDetailButt.on('click', function (e, t, o) {
                    // create the window on the first click and reuse on subsequent clicks
                    //                if (!exporterWindow) {
                    //                    exporterWindow = new Ext.Window({
                    //                        id: 'exporterWindow',
                    //                        title: 'Exporter Detail',
                    //                        layout: 'fit',
                    //                        width: 800,
                    //                        height: 700,
                    //                        closable: false,
                    //                        closeAction: 'hide',
                    //                        buttonAlign: 'left',
                    //                        plain: true,
                    //                        y: 30,

                    //                        items: new Ext.ux.IFrameComponent({
                    //                            id: 'exporterDetailIframe',
                    //                            url: 'ExporterDetail.aspx?cif=' + getValueFromQueryString('cif'),
                    //                            myId: 'exporterDetailIframe'
                    //                        }),

                    //                        buttons: [{
                    //                            text: 'Close',
                    //                            handler: function() {
                    //                                //window.location.reload();
                    //                                //window.parent.location.reload();
                    //                                exporterWindow.hide();
                    //                            }
                    //                        }]
                    //                    });
                    //                }

                    //                exporterWindow.show(this);
                    //
                    var exporterPopup = window.open('ExporterDetail.aspx?cif=' + getValueFromQueryString('cif'), 'exporterPopup', 'toolbar=No,width=800,height=610,resizable=no,scrollbars=yes');
                    exporterPopup.focus();

                    //e.stopEvent();
                });

            var cif = (new MyNumber(getValueFromQueryString('cif'))).getValue();
            if (cif != 0) {
                // localhost.CustomerWCFService.IsExporter(cif, onSuccessIsExporter, onFailedIsExporter, null);
                var service = new SmeWeb.CustomerWCFService();
                service.IsExporter(cif, onSuccessIsExporter, onFailedIsExporter, null);
            }

            //result - this contains any values returned from my method. In this case it will be the id of the item that was inserted.
            //userContext - this is an optional item that can be passed into the original call to the method and will just be passed on to the callback method. I am not using this parameter in this situation
            //methodName - this is the name of the method that was called which resulted in the OnSucceeded method being called. In my case, this will be the string "GetCustomersFullNameByCif"
            function onSuccessIsExporter(result, userContext, methodName) {
                if (result.status == "success") {
                    var img = Ext.select("img[ExtId=ExporterImage]").first();
                    if (result.detail == "true") {
                        img.dom.src = "../../images/correct.jpg";
                    } else {
                        img.dom.src = "../../images/incorrect.jpg";
                    }
                } else {
                    Ext.select("img[ExtId=ExporterImage]").first().dom.src = "../../images/unknown.jpg";
                    alert(result.detail);
                }
            }

            function onFailedIsExporter(error, userContext, methodName) {
                //alert(error.constructor);
                Ext.select("img[ExtId=ExporterImage]").first().dom.src = "../../images/unknown.jpg";
                if (error.get_statusCode() != 0)
                    alert(methodName + " error:" + error.get_statusCode());
                //alert(error.get_message());
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
        <Services>
            <asp:ServiceReference Path="~/webservice/CustomerWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/EmployeeWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/BranchWCFService.svc" />
            <asp:ServiceReference Path="~/webservice/BusinessTypeWCFService.svc" />
        </Services>
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="FormView1DataSource" Width="100%"
            CellPadding="4" ForeColor="#333333" DataKeyNames="CIF">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EditItemTemplate>
                <table width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <div id="CUSTOMER_DIV">
                                <asp:Label ID="CUSTOMER_Label" runat="server" Text="CIF : " ToolTip="รหัสลูกค้า"></asp:Label>
                                <asp:TextBox ID="CUSTOMER_ID" runat="server" Text='<%# Bind("CIF") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" ClientSelector="CUSTOMER_ID"
                                    onChange="cusIdChange(this,'CUSTOMER_NAME');" />
                                <asp:TextBox ID="CUSTOMER_NAME" runat="server" Text='<%# Eval("CUSTOMER_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="CUSTOMER_NAME" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CUSTOMER_ID"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeUpdate"></asp:RequiredFieldValidator>
                            </div>
                            <div id="CUSTOMER_SIZE_DIV">
                                <asp:Label ID="CUSTOMER_SIZE_Label" runat="server" Text="CUSTOMER SIZE : " ToolTip="CUSTOMER SIZE"></asp:Label>
                                <asp:DropDownList ID="DDL_CUSTOMER_SIZE" runat="server" DataSourceID="DS_CUSTOMER_SIZE"
                                    DataTextField="SIZE_DETAIL" DataValueField="SIZE_ID" SelectedValue='<%# Bind("SIZE_ID") %>'
                                    Enabled="true" TabIndex="31" OnDataBinding="DDL_CUSTOMER_SIZE_DataBinding">
                                </asp:DropDownList>
                            </div>
                            <div id="STATUS_DIV">
                                <asp:Label ID="STATUS_Label" runat="server" Text="STATUS : " ToolTip="สถานะลูกค้า"></asp:Label>
                                <asp:DropDownList ID="STATUS_ID" runat="server" DataSourceID="StatusDataSource" DataTextField="STATUS_DETAIL"
                                    DataValueField="STATUS_ID" SelectedValue='<%# Bind("STATUS_ID") %>' Enabled="true"
                                    TabIndex="41">
                                </asp:DropDownList>
                            </div>
                            <div id="CM_CODE_DIV">
                                <asp:Label ID="CM_CODE_Label" runat="server" Text="CM : " ToolTip="CM ผู้ดูแล"></asp:Label>
                                <asp:TextBox ID="CM_CODE_ID" runat="server" Text='<%# Bind("CM_CODE") %>' Wrap="False"
                                    CssClass="textBoxNormalAlignCen" Width="8ex" ClientSelector="CM_CODE_ID" onChange="empIdChange(this,'CM_CODE_NAME');"
                                    TabIndex="51" />
                                <asp:TextBox ID="CM_CODE_NAME" runat="server" Text='<%# Eval("CM_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="CM_CODE_NAME" />
                                <asp:ImageButton ID="CM_CODE_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="CM_CODE_PopupBt_Load" />
                            </div>
                            <div id="OLD_CM_CODE_DIV">
                                <asp:Label ID="OLD_CM_CODE_Label" runat="server" Text="OLD CM : " ToolTip="CM ผู้ดูแลก่อนหน้า"></asp:Label>
                                <asp:TextBox ID="OLD_CM_CODE_ID" runat="server" Text='<%# Bind("OLD_CM_CODE") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex"
                                    TabIndex="52" />
                                <asp:TextBox ID="OLD_CM_CODE_NAME" runat="server" Text='<%# Eval("OLD_CM_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" />
                                <asp:ImageButton ID="OLD_CM_CODE_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="OLD_CM_CODE_PopupBt_Load" />
                            </div>
                            <div id="RatingDiv">
                                <asp:Label ID="RatingLabel" runat="server" Text="RATING : " ToolTip="RATING"></asp:Label>
                                <asp:DropDownList ID="RatingTypeDDL" runat="server" DataSourceID="RatingTypeSqlDataSource"
                                    DataTextField="RATING_TYPE_DESC" DataValueField="RATING_TYPE_KEY" SelectedValue='<%# Bind("RATING_TYPE_KEY") %>'
                                    Enabled="true" AutoPostBack="true" TabIndex="61">
                                </asp:DropDownList>
                                <asp:DropDownList ID="RatingDDL" runat="server" DataSourceID="RatingSqlDataSource"
                                    DataTextField="RATING_DESC" DataValueField="RATING_KEY" TabIndex="62">
                                </asp:DropDownList>
                                <asp:HiddenField ID="RatingHidd" runat="server" Value='<%# Bind("RATING_KEY") %>' />
                                <%--<asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="RatingDDL"
                                    ErrorMessage="*กรุณาระบุ Rating" Operator="GreaterThan" SetFocusOnError="True"
                                    ValidationGroup="beforeInsert" ValueToCompare="1">
                                </asp:CompareValidator>--%>
                                <asp:SqlDataSource ID="RatingSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    SelectCommand="P_SME_RATING_GetByType" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RatingTypeDDL" DefaultValue="1" Name="RatingTypeKey"
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="RatingUpdateDateDiv">
                                <asp:Label ID="RatingUpdateDateLabel" runat="server" Text="Rating Date : " ToolTip="Rating Date"></asp:Label>
                                <asp:TextBox ID="RatingUpdateDateTextBox" runat="server" Text='<%# Bind("RATING_UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="63" />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RatingUpdateDateTextBox"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeUpdate"></asp:RequiredFieldValidator>--%>
                                <asp:ImageButton ID="CalImageBt2" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt2" TargetControlID="RatingUpdateDateTextBox">
                                </cc1:CalendarExtender>
                            </div>
                            <div id="NextReviewDateDiv">
                                <asp:Label ID="NextReviewDateLabel" runat="server" Text="Next Review Date : " ToolTip="Next Review Date"></asp:Label>
                                <asp:TextBox ID="NextReviewDateTextBox" runat="server" Text='<%# Bind("NEXT_REVIEW_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="64" />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RatingUpdateDateTextBox"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeUpdate"></asp:RequiredFieldValidator>--%>
                                <asp:ImageButton ID="CalImageBt3" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt3" TargetControlID="NextReviewDateTextBox">
                                </cc1:CalendarExtender>
                            </div>
                            <div id="BRANCH_DIV">
                                <asp:Label ID="BRANCH_Label" runat="server" Text="BRANCH : " ToolTip="สาขา"></asp:Label>
                                <asp:TextBox ID="BRANCH_ID" runat="server" Text='<%# Bind("BRANCH_ID") %>' Wrap="False"
                                    CssClass="textBoxNormalAlignCen" Width="5ex" ClientSelector="BRANCH_ID" onChange="branchIdChange(this,'BRANCH_NAME');"
                                    TabIndex="71" />
                                <asp:TextBox ID="BRANCH_NAME" runat="server" Text='<%# Eval("BRANCH_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BRANCH_NAME" />
                                <asp:ImageButton ID="BRANCH_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BRANCH_PopupBt_Load" />
                            </div>
                            <div id="GROUP_SIZE_DIV">
                                <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="MIS GROUP SIZE : " ToolTip="MIS GROUP SIZE"></asp:Label>
                                <asp:DropDownList ID="GROUP_SIZE_ID" runat="server" DataSourceID="GroupSizeDataSource"
                                    DataTextField="DESCRIPTION" DataValueField="GROUP_SIZE_ID" SelectedValue='<%# Bind("GROUP_SIZE_ID") %>'
                                    Enabled="true" TabIndex="81">
                                </asp:DropDownList>
                            </div>
                            <div id="JUDGEMENT_DIV">
                                <asp:Label ID="JUDGEMENT_Label" runat="server" Text="MIS JUDGEMENT : " ToolTip="MIS JUDGEMENT"></asp:Label>
                                <asp:DropDownList ID="JUDGEMENT_ID" runat="server" DataSourceID="JudgementDataSource"
                                    DataTextField="JUDGEMENT" DataValueField="ID" SelectedValue='<%# Bind("JUDGEMENT_ID") %>'
                                    Enabled="true" TabIndex="91">
                                </asp:DropDownList>
                            </div>
                            <div id="BUSI_RISK1_DIV">
                                <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="MIS BUSINESS(1st) : " ToolTip="ประเภทธุรกิจหลัก"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK1_ID" runat="server" Text='<%# Bind("BUSI_RISK1_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK1_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK1_DETAIL');" TabIndex="101" />
                                <asp:TextBox ID="BUSI_RISK1_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK1_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK1_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK1_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                            </div>
                            <div id="BUSI_RISK2_DIV">
                                <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="MIS BUSINESS(2nd) : " ToolTip="ประเภทธุรกิจรองที่1"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK2_ID" runat="server" Text='<%# Bind("BUSI_RISK2_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK2_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK2_DETAIL');" TabIndex="111" />
                                <asp:TextBox ID="BUSI_RISK2_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK2_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK2_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK2_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                            </div>
                            <div id="BUSI_RISK3_DIV">
                                <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="MIS BUSINESS(THRID) : " ToolTip="ประเภทธุรกิจรองที่2"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK3_ID" runat="server" Text='<%# Bind("BUSI_RISK3_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK3_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK3_DETAIL');" TabIndex="121" />
                                <asp:TextBox ID="BUSI_RISK3_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK3_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK3_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK3_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                            </div>
                            <div id="BUSINESS_DESTINATION">
                                <asp:Label ID="BUSINESS_DESTINATION_Label" runat="server" Text="ส่งต่อให้ธุรกิจ(ถ้ามี) : "
                                    ToolTip="ส่งต่อให้ธุรกิจ"></asp:Label>
                                <asp:DropDownList ID="BUSINESS_DESTINATION_DDL" runat="server" DataSourceID="BusinessDestination_DS"
                                    DataTextField="BUSINESS_DESTINATION_DESC" DataValueField="BUSINESS_DESTINATION_ID"
                                    SelectedValue='<%# Bind("BUSINESS_DESTINATION_ID") %>' TabIndex="131" ClientSelector="BUSINESS_DESTINATION_DDL">
                                </asp:DropDownList>
                            </div>
                            <div id="DESTINATION_WEIGHT">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Export_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อออกนอกประเทศ(Export) : "
                                                ToolTip="แบ่งเป็นส่งต่อออกนอกประเทศ(Export)"></asp:Label>
                                            <asp:TextBox ID="Export_TextBox" runat="server" Text='<%# Bind("EXPORT_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxNormalAlignCen" Width="4ex" MaxLength="3" ToolTip="Export Weight"
                                                ClientSelector="Export_TextBox" TabIndex="141" />%
                                            <cc1:FilteredTextBoxExtender ID="Export_TextBox_FilteredTextBoxExtender" runat="server"
                                                Enabled="True" FilterType="Numbers" TargetControlID="Export_TextBox">
                                            </cc1:FilteredTextBoxExtender>
                                        </td>
                                        <td rowspan="2" valign="middle">
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Export + Local รวมแล้วต้องเท่ากับ 100%"
                                                ValidationGroup="beforeUpdate" ClientValidationFunction="WeightValidate" Display="Dynamic"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Local_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อภายในประเทศ(Local) : "
                                                ToolTip="แบ่งเป็นส่งต่อภายในประเทศ(Local)"></asp:Label>
                                            <asp:TextBox ID="Local_TextBox" runat="server" Text='<%# Bind("LOCAL_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxNormalAlignCen" Width="4ex" MaxLength="3" ToolTip="Local Weight"
                                                ClientSelector="Local_TextBox" TabIndex="151" />%
                                            <cc1:FilteredTextBoxExtender ID="Local_TextBox_FilteredTextBoxExtender" runat="server"
                                                Enabled="True" FilterType="Numbers" TargetControlID="Local_TextBox">
                                            </cc1:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="UPDATE_BY_DIV">
                                <asp:Label ID="UPDATE_BY_Label" runat="server" Text="UPDATE BY : "></asp:Label>
                                <asp:TextBox ID="UPDATE_BY_ID" runat="server" Text='<%# Bind("UPDATE_BY") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" TabIndex="161" />
                                <asp:TextBox ID="UPDATE_BY_NAME" runat="server" Text='<%# Eval("UPDATE_BY_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" />
                                <asp:ImageButton ID="UPDATE_BY_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="UPDATE_BY_PopupBt_Load" />
                            </div>
                            <div id="UPDATE_DATE_DIV">
                                <asp:Label ID="UPDATE_DATE_Label" runat="server" Text="UPDATE DATE : "></asp:Label>
                                <asp:TextBox ID="UPDATE_DATE_Value" runat="server" Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="36" />
                                <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" OnLoad="CalImageBt_Load" Style="display: none;" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt" TargetControlID="UPDATE_DATE_Value">
                                </cc1:CalendarExtender>
                            </div>
                        </td>
                        <td align="right" valign="top">
                            <div id="GROUP_CIF_DIV">
                                <iframe id="GROUP_CIF_IFRAME" width="400px" height="300px" scrolling="auto" frameborder="0"
                                    src='<%# Page.ResolveUrl("~/aspx/customer/SmeGroupDetail.aspx?groupId=" + Eval("GROUP_ID").toString()) %>'
                                    runat="server"></iframe>
                                <asp:HiddenField ID="GROUP_ID_HiddenField" runat="server" Value='<%# Bind("GROUP_ID") %>' />
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" TabIndex="91" ValidationGroup="beforeUpdate" />
                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" TabIndex="92" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <div id="CUSTOMER_DIV">
                                <asp:Label ID="CUSTOMER_Label" runat="server" Text="CIF : " ToolTip="รหัสลูกค้า"></asp:Label>
                                <asp:TextBox ID="CUSTOMER_ID" runat="server" Text='<%# Bind("CIF") %>' Wrap="False"
                                    CssClass="textBoxNormalAlignCen" Width="8ex" OnLoad="CUSTOMER_ID_Load" ClientSelector="CUSTOMER_ID"
                                    onChange="cusIdChange(this,'CUSTOMER_NAME');" TabIndex="21" />
                                <asp:TextBox ID="CUSTOMER_NAME" runat="server" Text='<%# Eval("CUSTOMER_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="CUSTOMER_NAME" />
                                <asp:ImageButton ID="CUSTOMER_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="CUSTOMER_PopupBt_Load" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CUSTOMER_ID"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeInsert"></asp:RequiredFieldValidator>
                            </div>
                            <div id="CUSTOMER_SIZE_DIV">
                                <asp:Label ID="CUSTOMER_SIZE_Label" runat="server" Text="MIS CUST SIZE : " ToolTip="MIS CUST SIZE"></asp:Label>
                                <asp:DropDownList ID="DDL_CUSTOMER_SIZE" runat="server" DataSourceID="DS_CUSTOMER_SIZE"
                                    DataTextField="SIZE_DETAIL" DataValueField="SIZE_ID" SelectedValue='<%# Bind("SIZE_ID") %>'
                                    Enabled="true" TabIndex="31">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DDL_CUSTOMER_SIZE"
                                    ErrorMessage="*กรุณาระบุ MIS CUST SIZE" Operator="GreaterThan" SetFocusOnError="True"
                                    ValidationGroup="beforeInsert" ValueToCompare="1">
                                </asp:CompareValidator>
                            </div>
                            <div id="STATUS_DIV">
                                <asp:Label ID="STATUS_Label" runat="server" Text="STATUS : " ToolTip="สถานะลูกค้า"></asp:Label>
                                <asp:DropDownList ID="STATUS_ID" runat="server" DataSourceID="StatusDataSource" DataTextField="STATUS_DETAIL"
                                    DataValueField="STATUS_ID" SelectedValue='<%# Bind("STATUS_ID") %>' Enabled="true"
                                    TabIndex="41">
                                </asp:DropDownList>
                            </div>
                            <div id="CM_CODE_DIV">
                                <asp:Label ID="CM_CODE_Label" runat="server" Text="CM : " ToolTip="CM ผู้ดูแล"></asp:Label>
                                <asp:TextBox ID="CM_CODE_ID" runat="server" Text='<%# Bind("CM_CODE") %>' Wrap="False"
                                    CssClass="textBoxNormalAlignCen" Width="8ex" ClientSelector="CM_CODE_ID" onChange="empIdChange(this,'CM_CODE_NAME');"
                                    TabIndex="51" />
                                <asp:TextBox ID="CM_CODE_NAME" runat="server" Text='<%# Eval("CM_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="CM_CODE_NAME" />
                                <asp:ImageButton ID="CM_CODE_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="CM_CODE_PopupBt_Load" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CM_CODE_ID"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeInsert"></asp:RequiredFieldValidator>
                            </div>
                            <div id="OLD_CM_CODE_DIV" style="display: none;">
                                <asp:Label ID="OLD_CM_CODE_Label" runat="server" Text="OLD CM : " ToolTip="CM ผู้ดูแลก่อนหน้า"></asp:Label>
                                <asp:TextBox ID="OLD_CM_CODE_ID" runat="server" Text='<%# Bind("OLD_CM_CODE") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex"
                                    TabIndex="52" />
                                <asp:TextBox ID="OLD_CM_CODE_NAME" runat="server" Text='<%# Eval("OLD_CM_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" />
                                <asp:ImageButton ID="OLD_CM_CODE_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="OLD_CM_CODE_PopupBt_Load" />
                            </div>
                            <div id="RatingDiv">
                                <asp:Label ID="RatingLabel" runat="server" Text="RATING : " ToolTip="RATING"></asp:Label>
                                <asp:DropDownList ID="RatingTypeDDL" runat="server" DataSourceID="RatingTypeSqlDataSource"
                                    DataTextField="RATING_TYPE_DESC" DataValueField="RATING_TYPE_KEY" SelectedValue='<%# Bind("RATING_TYPE_KEY") %>'
                                    Enabled="true" AutoPostBack="true" TabIndex="61">
                                </asp:DropDownList>
                                <asp:DropDownList ID="RatingDDL" runat="server" DataSourceID="RatingSqlDataSource"
                                    DataTextField="RATING_DESC" DataValueField="RATING_KEY" TabIndex="62">
                                </asp:DropDownList>
                                <asp:HiddenField ID="RatingHidd" runat="server" Value='<%# Bind("RATING_KEY") %>' />
                                <%--<asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="RatingDDL"
                                    ErrorMessage="*กรุณาระบุ Rating" Operator="GreaterThan" SetFocusOnError="True"
                                    ValidationGroup="beforeInsert" ValueToCompare="1">
                                </asp:CompareValidator>--%>
                                <asp:SqlDataSource ID="RatingSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    SelectCommand="P_SME_RATING_GetByType" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RatingTypeDDL" DefaultValue="1" Name="RatingTypeKey"
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="RatingUpdateDateDiv">
                                <asp:Label ID="RatingUpdateDateLabel" runat="server" Text="Rating Date : " ToolTip="Rating Date"></asp:Label>
                                <asp:TextBox ID="RatingUpdateDateTextBox" runat="server" Text='<%# Bind("RATING_UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="63" />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RatingUpdateDateTextBox"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeInsert"></asp:RequiredFieldValidator>--%>
                                <asp:ImageButton ID="CalImageBt2" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt2" TargetControlID="RatingUpdateDateTextBox">
                                </cc1:CalendarExtender>
                            </div>
                            <div id="NextReviewDateDiv">
                                <asp:Label ID="NextReviewDateLabel" runat="server" Text="Next Review Date : " ToolTip="Next Review Date"></asp:Label>
                                <asp:TextBox ID="NextReviewDateTextBox" runat="server" Text='<%# Bind("NEXT_REVIEW_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="64" />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RatingUpdateDateTextBox"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeUpdate"></asp:RequiredFieldValidator>--%>
                                <asp:ImageButton ID="CalImageBt3" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" />
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt3" TargetControlID="NextReviewDateTextBox">
                                </cc1:CalendarExtender>
                            </div>
                            <div id="BRANCH_DIV">
                                <asp:Label ID="BRANCH_Label" runat="server" Text="BRANCH : " ToolTip="สาขา"></asp:Label>
                                <asp:TextBox ID="BRANCH_ID" runat="server" Text='<%# Bind("BRANCH_ID") %>' Wrap="False"
                                    CssClass="textBoxNormalAlignCen" Width="5ex" ClientSelector="BRANCH_ID" onChange="branchIdChange(this,'BRANCH_NAME');"
                                    TabIndex="71" />
                                <asp:TextBox ID="BRANCH_NAME" runat="server" Text='<%# Eval("BRANCH_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BRANCH_NAME" />
                                <asp:ImageButton ID="BRANCH_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BRANCH_PopupBt_Load" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BRANCH_ID"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeInsert"></asp:RequiredFieldValidator>
                            </div>
                            <div id="GROUP_SIZE_DIV">
                                <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="MIS GROUP SIZE : " ToolTip="MIS GROUP SIZE"></asp:Label>
                                <asp:DropDownList ID="GROUP_SIZE_ID" runat="server" DataSourceID="GroupSizeDataSource"
                                    DataTextField="DESCRIPTION" DataValueField="GROUP_SIZE_ID" SelectedValue='<%# Bind("GROUP_SIZE_ID") %>'
                                    Enabled="true" TabIndex="81">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="GROUP_SIZE_ID"
                                    ErrorMessage="*กรุณาระบุ Group Size" Operator="GreaterThan" SetFocusOnError="True"
                                    ValidationGroup="beforeInsert" ValueToCompare="1">
                                </asp:CompareValidator>
                            </div>
                            <div id="JUDGEMENT_DIV">
                                <asp:Label ID="JUDGEMENT_Label" runat="server" Text="MIS JUDGEMENT : " ToolTip="MIS JUDGEMENT"></asp:Label>
                                <asp:DropDownList ID="JUDGEMENT_ID" runat="server" DataSourceID="JudgementDataSource"
                                    DataTextField="JUDGEMENT" DataValueField="ID" SelectedValue='<%# Bind("JUDGEMENT_ID") %>'
                                    Enabled="true" TabIndex="91">
                                </asp:DropDownList>
                            </div>
                            <div id="BUSI_RISK1_DIV">
                                <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="MIS BUSINESS(1st) : " ToolTip="ประเภทธุรกิจหลัก"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK1_ID" runat="server" Text='<%# Bind("BUSI_RISK1_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK1_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK1_DETAIL');" TabIndex="101" />
                                <asp:TextBox ID="BUSI_RISK1_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK1_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK1_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK1_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="BUSI_RISK1_ID"
                                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="beforeInsert"></asp:RequiredFieldValidator>
                            </div>
                            <div id="BUSI_RISK2_DIV">
                                <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="MIS BUSINESS(2nd) : " ToolTip="ประเภทธุรกิจรองที่1"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK2_ID" runat="server" Text='<%# Bind("BUSI_RISK2_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK2_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK2_DETAIL');" TabIndex="111" />
                                <asp:TextBox ID="BUSI_RISK2_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK2_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK2_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK2_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                            </div>
                            <div id="BUSI_RISK3_DIV">
                                <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="MIS BUSINESS(3nd) : " ToolTip="ประเภทธุรกิจรองที่2"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK3_ID" runat="server" Text='<%# Bind("BUSI_RISK3_ID") %>'
                                    Wrap="False" CssClass="textBoxNormalAlignCen" Width="9ex" ClientSelector="BUSI_RISK3_ID"
                                    onChange="businessTypeIdChange(this,'BUSI_RISK3_DETAIL');" TabIndex="121" />
                                <asp:TextBox ID="BUSI_RISK3_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK3_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" ClientSelector="BUSI_RISK3_DETAIL" />
                                <asp:ImageButton ID="BUSI_RISK3_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="BUSI_RISK_PopupBt_Load" />
                            </div>
                            <div id="BUSINESS_DESTINATION">
                                <asp:Label ID="BUSINESS_DESTINATION_Label" runat="server" Text="ส่งต่อให้ธุรกิจ(ถ้ามี) : "
                                    ToolTip="ส่งต่อให้ธุรกิจ"></asp:Label>
                                <asp:DropDownList ID="BUSINESS_DESTINATION_DDL" runat="server" DataSourceID="BusinessDestination_DS"
                                    DataTextField="BUSINESS_DESTINATION_DESC" DataValueField="BUSINESS_DESTINATION_ID"
                                    SelectedValue='<%# Bind("BUSINESS_DESTINATION_ID") %>' TabIndex="131" ClientSelector="BUSINESS_DESTINATION_DDL">
                                </asp:DropDownList>
                            </div>
                            <div id="DESTINATION_WEIGHT">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Export_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อออกนอกประเทศ(Export) : "
                                                ToolTip="แบ่งเป็นส่งต่อออกนอกประเทศ(Export)"></asp:Label>
                                            <asp:TextBox ID="Export_TextBox" runat="server" Text='<%# Bind("EXPORT_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxNormalAlignCen" Width="4ex" MaxLength="3" ToolTip="Export Weight"
                                                ClientSelector="Export_TextBox" TabIndex="141" />%
                                            <cc1:FilteredTextBoxExtender ID="Export_TextBox_FilteredTextBoxExtender" runat="server"
                                                Enabled="True" FilterType="Numbers" TargetControlID="Export_TextBox">
                                            </cc1:FilteredTextBoxExtender>
                                        </td>
                                        <td rowspan="2" valign="middle">
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Export + Local รวมแล้วต้องเท่ากับ 100%"
                                                ValidationGroup="beforeInsert" ClientValidationFunction="WeightValidate" Display="Dynamic"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Local_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อภายในประเทศ(Local) : "
                                                ToolTip="แบ่งเป็นส่งต่อภายในประเทศ(Local)"></asp:Label>
                                            <asp:TextBox ID="Local_TextBox" runat="server" Text='<%# Bind("LOCAL_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxNormalAlignCen" Width="4ex" MaxLength="3" ToolTip="Local Weight"
                                                ClientSelector="Local_TextBox" TabIndex="151" />%
                                            <cc1:FilteredTextBoxExtender ID="Local_TextBox_FilteredTextBoxExtender" runat="server"
                                                Enabled="True" FilterType="Numbers" TargetControlID="Local_TextBox">
                                            </cc1:FilteredTextBoxExtender>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="UPDATE_BY_DIV">
                                <asp:Label ID="UPDATE_BY_Label" runat="server" Text="UPDATE BY : "></asp:Label>
                                <asp:TextBox ID="UPDATE_BY_ID" runat="server" Text='<%# Bind("UPDATE_BY") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" Width="8ex" TabIndex="161" />
                                <asp:TextBox ID="UPDATE_BY_NAME" runat="server" Text='<%# Eval("UPDATE_BY_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" onfocus="this.blur();" Width="50ex" />
                                <asp:ImageButton ID="UPDATE_BY_PopupBt" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                                    OnLoad="UPDATE_BY_PopupBt_Load" />
                            </div>
                            <div id="UPDATE_DATE_DIV">
                                <asp:Label ID="UPDATE_DATE_Label" runat="server" Text="UPDATE DATE : "></asp:Label>
                                <asp:TextBox ID="UPDATE_DATE_Value" runat="server" Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" onfocus="this.blur();" TabIndex="171" />
                                <asp:ImageButton ID="CalImageBt" runat="server" ImageUrl="~/images/Calendar-Logo-16x16-32.ico"
                                    OnClientClick="return false;" OnLoad="CalImageBt_Load" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="d MMMM yyyy"
                                    PopupButtonID="CalImageBt" TargetControlID="UPDATE_DATE_Value">
                                </cc1:CalendarExtender>
                            </div>
                        </td>
                        <td align="right" valign="top">
                            <div id="GROUP_CIF_DIV">
                                <iframe id="GROUP_CIF_IFRAME" width="400px" height="300px" scrolling="auto" frameborder="0"
                                    src='<%# Page.ResolveUrl("~/aspx/customer/SmeGroupDetail.aspx") %>' runat="server">
                                </iframe>
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="เพิ่มลูกค้ารายนี้เป็นลูกค้าSME" TabIndex="91" ValidationGroup="beforeInsert"
                    OnPreRender="InsertButton_PreRender" />
                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" Visible="false" TabIndex="92" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table width="100%">
                    <tr>
                        <td align="left" valign="top">
                            <div id="CUSTOMER_DIV">
                                <asp:Label ID="CUSTOMER_Label" runat="server" Text="CIF : " ToolTip="รหัสลูกค้า"></asp:Label>
                                <asp:TextBox ID="CUSTOMER_ID" runat="server" Text='<%# Bind("CIF") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="8ex" />
                                <asp:TextBox ID="CUSTOMER_NAME" runat="server" Text='<%# Eval("CUSTOMER_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                                &nbsp;</div>
                            <div id="CUSTOMER_SIZE_DIV">
                                <asp:Label ID="CUSTOMER_SIZE_Label" runat="server" Text="MIS CUS SIZE : " ToolTip="MIS CUS SIZE"></asp:Label>
                                <asp:DropDownList ID="DDL_CUSTOMER_SIZE" runat="server" DataSourceID="DS_CUSTOMER_SIZE"
                                    DataTextField="SIZE_DETAIL" DataValueField="SIZE_ID" SelectedValue='<%# Bind("SIZE_ID") %>'
                                    Enabled="false">
                                </asp:DropDownList>
                            </div>
                            <div id="STATUS_DIV">
                                <asp:Label ID="STATUS_Label" runat="server" Text="STATUS : " ToolTip="สถานะลูกค้า"></asp:Label>
                                <asp:DropDownList ID="STATUS_ID" runat="server" DataSourceID="StatusDataSource" DataTextField="STATUS_DETAIL"
                                    DataValueField="STATUS_ID" SelectedValue='<%# Bind("STATUS_ID") %>' Enabled="false">
                                </asp:DropDownList>
                            </div>
                            <div id="CM_CODE_DIV">
                                <asp:Label ID="CM_CODE_Label" runat="server" Text="CM : " ToolTip="CM ผู้ดูแล"></asp:Label>
                                <asp:TextBox ID="CM_CODE_ID" runat="server" Text='<%# Bind("CM_CODE") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="8ex" />
                                <asp:TextBox ID="CM_CODE_NAME" runat="server" Text='<%# Eval("CM_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="OLD_CM_CODE_DIV" style="display: none;">
                                <asp:Label ID="OLD_CM_CODE_Label" runat="server" Text="OLD CM : " ToolTip="CM ผู้ดูแลก่อนหน้า"></asp:Label>
                                <asp:TextBox ID="OLD_CM_CODE_ID" runat="server" Text='<%# Bind("OLD_CM_CODE") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="8ex" />
                                <asp:TextBox ID="OLD_CM_CODE_NAME" runat="server" Text='<%# Eval("OLD_CM_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="RatingDiv">
                                <asp:Label ID="RatingLabel" runat="server" Text="RATING : " ToolTip="RATING"></asp:Label>
                                <asp:DropDownList ID="RatingTypeDDL" runat="server" DataSourceID="RatingTypeSqlDataSource"
                                    DataTextField="RATING_TYPE_DESC" DataValueField="RATING_TYPE_KEY" SelectedValue='<%# Bind("RATING_TYPE_KEY") %>'
                                    Enabled="false">
                                </asp:DropDownList>
                                <asp:DropDownList ID="RatingDDL" runat="server" DataSourceID="RatingSqlDataSource"
                                    DataTextField="RATING_DESC" DataValueField="RATING_KEY" Enabled="false" TabIndex="62">
                                </asp:DropDownList>
                                <asp:HiddenField ID="RatingHidd" runat="server" Value='<%# Bind("RATING_KEY") %>' />
                                <asp:SqlDataSource ID="RatingSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                    SelectCommand="P_SME_RATING_GetByType" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="RatingTypeDDL" DefaultValue="1" Name="RatingTypeKey"
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="RatingUpdateDateDiv">
                                <asp:Label ID="RatingUpdateDateLabel" runat="server" Text="Rating Date : " ToolTip="Rating DAte"></asp:Label>
                                <asp:TextBox ID="RatingUpdateDateTextBox" runat="server" Text='<%# Bind("RATING_UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                            </div>
                            <div id="NextReviewDateDiv">
                                <asp:Label ID="NextReviewDateLabel" runat="server" Text="Next Review Date : " ToolTip="Next Review DAte"></asp:Label>
                                <asp:TextBox ID="NextReviewDateTextBox" runat="server" Text='<%# Bind("NEXT_REVIEW_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                            </div>
                            <div id="BRANCH_DIV">
                                <asp:Label ID="BRANCH_Label" runat="server" Text="BRANCH : " ToolTip="สาขา"></asp:Label>
                                <asp:TextBox ID="BRANCH_ID" runat="server" Text='<%# Bind("BRANCH_ID") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="5ex" />
                                <asp:TextBox ID="BRANCH_NAME" runat="server" Text='<%# Eval("BRANCH_NAME") %>' Wrap="False"
                                    CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="GROUP_SIZE_DIV">
                                <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="MIS GROUP SIZE : " ToolTip="MIS GROUP SIZE"></asp:Label>
                                <asp:DropDownList ID="GROUP_SIZE_ID" runat="server" DataSourceID="GroupSizeDataSource"
                                    DataTextField="DESCRIPTION" DataValueField="GROUP_SIZE_ID" SelectedValue='<%# Bind("GROUP_SIZE_ID") %>'
                                    Enabled="false">
                                </asp:DropDownList>
                            </div>
                            <div id="JUDGEMENT_DIV">
                                <asp:Label ID="JUDGEMENT_Label" runat="server" Text="MIS JUDGEMENT : " ToolTip="MIS JUDGEMENT"></asp:Label>
                                <asp:DropDownList ID="JUDGEMENT_ID" runat="server" DataSourceID="JudgementDataSource"
                                    DataTextField="JUDGEMENT" DataValueField="ID" SelectedValue='<%# Bind("JUDGEMENT_ID") %>'
                                    Enabled="false">
                                </asp:DropDownList>
                            </div>
                            <div id="BUSI_RISK1_DIV">
                                <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="MIS BUSINESS(1st) : " ToolTip="ประเภทธุรกิจหลัก"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK1_ID" runat="server" Text='<%# Bind("BUSI_RISK1_ID") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="9ex" />
                                <asp:TextBox ID="BUSI_RISK1_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK1_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="BUSI_RISK2_DIV">
                                <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="MIS BUSINESS(2nd) : " ToolTip="ประเภทธุรกิจรองที่1"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK2_ID" runat="server" Text='<%# Bind("BUSI_RISK2_ID") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="9ex" />
                                <asp:TextBox ID="BUSI_RISK2_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK2_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="BUSI_RISK3_DIV">
                                <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="MIS BUSINESS(3nd) : " ToolTip="ประเภทธุรกิจรองที่2"></asp:Label>
                                <asp:TextBox ID="BUSI_RISK3_ID" runat="server" Text='<%# Bind("BUSI_RISK3_ID") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="9ex" />
                                <asp:TextBox ID="BUSI_RISK3_DETAIL" runat="server" Text='<%# Eval("BUSI_RISK3_DETAIL") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="BUSINESS_DESTINATION">
                                <asp:Label ID="BUSINESS_DESTINATION_Label" runat="server" Text="ส่งต่อให้ธุรกิจ(ถ้ามี) : "
                                    ToolTip="ส่งต่อให้ธุรกิจ"></asp:Label>
                                <asp:TextBox ID="BUSINESS_DESTINATION_TextBox" runat="server" Text='<%# Bind("BUSINESS_DESTINATION_DESC") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="DESTINATION_WEIGHT">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Export_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อออกนอกประเทศ(Export) : "
                                                ToolTip="แบ่งเป็นส่งต่อออกนอกประเทศ(Export)"></asp:Label>
                                            <asp:TextBox ID="Export_TextBox" runat="server" Text='<%# Bind("EXPORT_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxReadOnlyAlignCen" Width="4ex" MaxLength="3" ToolTip="Export Weight"
                                                ClientSelector="Export_TextBox" />%
                                        </td>
                                        <%--<td rowspan="2">
                                            <input id="ExporterDetailButt" type="button" runat="server" style="text-align:center;"
                                                value='<%# (New StringBuilder).AppendLine("Exporter").AppendLine("Detail").ToString() %>'
                                                ExtClientId="ExporterDetailButt" />
                                        </td>--%>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Local_WEIGHT_Label" runat="server" Text="แบ่งเป็นส่งต่อภายในประเทศ(Local) : "
                                                ToolTip="แบ่งเป็นส่งต่อภายในประเทศ(Local)"></asp:Label>
                                            <asp:TextBox ID="Local_TextBox" runat="server" Text='<%# Bind("LOCAL_WEIGHT") %>'
                                                Wrap="False" CssClass="textBoxReadOnlyAlignCen" Width="4ex" MaxLength="3" ToolTip="Local Weight"
                                                ClientSelector="Local_TextBox" />%
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="UPDATE_BY_DIV">
                                <asp:Label ID="UPDATE_BY_Label" runat="server" Text="UPDATE BY : "></asp:Label>
                                <asp:TextBox ID="UPDATE_BY_ID" runat="server" Text='<%# Bind("UPDATE_BY") %>' Wrap="False"
                                    CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" Width="8ex" />
                                <asp:TextBox ID="UPDATE_BY_DETAIL" runat="server" Text='<%# Eval("UPDATE_BY_NAME") %>'
                                    Wrap="False" CssClass="textBoxReadOnly" ReadOnly="True" Width="50ex" />
                            </div>
                            <div id="UPDATE_DATE_DIV">
                                <asp:Label ID="UPDATE_DATE_Label" runat="server" Text="UPDATE DATE : "></asp:Label>
                                <asp:TextBox ID="UPDATE_DATE_Value" runat="server" Text='<%# Bind("UPDATE_DATE","{0:d MMMM yyyy}") %>'
                                    Wrap="False" CssClass="textBoxReadOnlyAlignCen" ReadOnly="True" />
                            </div>
                        </td>
                        <td align="right" valign="top">
                            <div id="GROUP_CIF_DIV" runat="server">
                                <iframe id="GROUP_CIF_IFRAME" myid="GROUP_CIF_IFRAME" width="400px" height="300px"
                                    scrolling="auto" frameborder="0" src='<%# Page.ResolveUrl("~/aspx/customer/SmeGroupDetail.aspx?groupId=" + Eval("GROUP_ID").toString()) %>'
                                    runat="server"></iframe>
                                <br />
                                <asp:Button ID="Butt_ManageRole" runat="server" Text="จัดการสิทธิ์การเข้าดูข้อมูล"
                                    OnPreRender="Butt_ManageRole_PreRender" OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/role/cifManageRole.aspx") + "&#39;,&#39;cif=" + (Eval("CIF")).ToString() + "&#39;,&#39;toolbar=No,width=570,height=525,resizable=no,scrollbars=yes&#39;);return false;" %>' />
                                <asp:Button ID="Ltv_PopupBt" runat="server" Text="Test LTV" OnClick="Ltv_PopupBt_Click"
                                    OnLoad="Ltv_PopupBt_Load" />
                                <br />
                                <br />
                                <asp:HiddenField ID="GROUP_ID_HiddenField" runat="server" Value='<%# Eval("GROUP_ID") %>' />
                                <asp:Button ID="Butt_Covenant" runat="server" Text="ดูข้อมูล Covenant ของลูกค้าและกลุ่มลูกค้า"
                                    BackColor="Red" OnLoad="Butt_Covenant_Load" OnClientClick='<%# "openPopup(&#39;managePopup&#39;,&#39;" + Page.ResolveUrl("~/aspx/annals/AnnalsCovenant.aspx") + "&#39;,&#39;groupid=" + (Eval("GROUP_ID")).ToString() + "&#39;,&#39;toolbar=No,width=1080,height=768,resizable=yes,scrollbars=yes&#39;);return false;" %>'
                                    Width="284px" />
                            </div>
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <input id="ExporterButton" extid="ExporterButton" type="button" value="Exporter"
                                                runat="server" />
                                        </td>
                                        <td align="center" valign="middle">
                                            <asp:Image ID="ExporterImage" ExtId="ExporterImage" runat="server" ImageUrl="~/images/progress/cicle/indicator_arrows_black.gif"
                                                Width="20" Height="20" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:DetailsView ID="DV_RepProd" runat="server" AutoGenerateRows="False" DataSourceID="DS_RepProd"
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                <RowStyle BackColor="#EFF3FB" />
                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <Fields>
                                    <%--<asp:BoundField DataField="custsize" HeaderText="CUST SIZE : " SortExpression="custsize" />--%>
                                    <asp:TemplateField HeaderText="ชั้นหนี้ : " SortExpression="class_h">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="HF_class_h" runat="server" Value='<%# Eval("class_h") %>' />
                                            <asp:HiddenField ID="HF_as_of" runat="server" Value='<%# Eval("as_of") %>' />
                                            <asp:GridView ID="GV_CLASSHISTORY" runat="server" DataSourceID="DS_CLASSHISTORY"
                                                CellPadding="4" ForeColor="#333333" GridLines="Both">
                                                <RowStyle BackColor="#EFF3FB" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="DS_CLASSHISTORY" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                                SelectCommand="SP_PIVOT_CLASS_HISTORY" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="HF_as_of" Name="startDate" PropertyName="Value"
                                                        Type="DateTime" />
                                                    <asp:Parameter Name="monthStep" Type="Int32" DefaultValue="24" />
                                                    <asp:ControlParameter ControlID="HF_class_h" DefaultValue="" Name="historyValue"
                                                        PropertyName="Value" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="DS_RepProd" runat="server" ConnectionString="<%$ ConnectionStrings:EDWConnectionString %>"
                                SelectCommand="SELECT T.CLASS_HIST_24M AS CLASS_H, T.ETL_ASOFDATE AS AS_OF FROM DWHADMIN.RISK_MAXAGING_MONTHLY_FACT T, (SELECT MAX(M.MONTH_KEY) AS MONTH_KEY FROM DWHADMIN.RISK_MAXAGING_MONTHLY_FACT M) &quot;A&quot; WHERE (T.MONTH_KEY = &quot;A&quot;.MONTH_KEY) AND (CIF = :CIF)"
                                ProviderName="<%$ ConnectionStrings:EDWConnectionString.ProviderName %>">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="CIF" QueryStringField="cif" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="NewButton" runat="server" CausesValidation="True" CommandName="New"
                    Text="New" Visible="False" />
                <asp:Button ID="EditButton" runat="server" CausesValidation="True" CommandName="Edit"
                    Text="Edit" OnPreRender="EditButton_PreRender" />
                <asp:Button ID="DeleteButton" runat="server" CausesValidation="True" CommandName="Delete"
                    Text="Delete" OnLoad="DeleteButton_Load" OnClientClick="false;" OnPreRender="DeleteButton_PreRender" />
            </ItemTemplate>
            <PagerStyle ForeColor="#333333" HorizontalAlign="Center" BackColor="#FFCC66" />
            <EmptyDataTemplate>
                <asp:Button ID="NewButton" runat="server" CausesValidation="True" CommandName="New"
                    Text="New" />
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <div id="ShowErrorDiv">
            <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <asp:SqlDataSource ID="DS_CUSTOMER_SIZE" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_CUSTOMER_SME_SIZE_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="FormView1DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_CUSTOMER_SME_SELECT_BY_CIF" SelectCommandType="StoredProcedure"
            UpdateCommand="SP_CUSTOMER_SME_UPDATE" UpdateCommandType="StoredProcedure" InsertCommand="SP_CUSTOMER_SME_INSERT"
            InsertCommandType="StoredProcedure" DeleteCommand="SP_CUSTOMER_SME_DELETE_BY_CIF"
            DeleteCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="CIF" QueryStringField="cif" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="CIF" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CM_CODE" Type="String" />
                <asp:Parameter Name="OLD_CM_CODE" Type="String" />
                <asp:Parameter Name="BRANCH_ID" Type="Int16" />
                <asp:Parameter Name="JUDGEMENT_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK1_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK2_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK3_ID" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="CIF" Type="Int32" />
                <asp:Parameter Name="GROUP_ID" Type="Int32" />
                <asp:Parameter Name="GROUP_SIZE_ID" Type="Int16" />
                <asp:Parameter Name="BUSINESS_DESTINATION_ID" Type="Decimal" />
                <asp:Parameter Name="EXPORT_WEIGHT" Type="Decimal" />
                <asp:Parameter Name="LOCAL_WEIGHT" Type="Decimal" />
                <asp:Parameter Name="STATUS_ID" Type="Int32" />
                <asp:Parameter Name="SIZE_ID" Type="Int32" />
                <asp:Parameter Name="RATING_TYPE_KEY" Type="Int32" />
                <asp:Parameter Name="RATING_KEY" Type="Int32" />
                <asp:Parameter Name="RATING_UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="NEXT_REVIEW_DATE" Type="DateTime" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CIF" Type="Int32" />
                <asp:Parameter Name="CM_CODE" Type="String" />
                <asp:Parameter Name="OLD_CM_CODE" Type="String" />
                <asp:Parameter Name="BRANCH_ID" Type="Int16" />
                <asp:Parameter Name="JUDGEMENT_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK1_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK2_ID" Type="String" />
                <asp:Parameter Name="BUSI_RISK3_ID" Type="String" />
                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="UPDATE_BY" Type="String" />
                <asp:Parameter Name="GROUP_SIZE_ID" Type="Int16" />
                <asp:Parameter Name="BUSINESS_DESTINATION_ID" Type="Decimal" />
                <asp:Parameter Name="EXPORT_WEIGHT" Type="Decimal" />
                <asp:Parameter Name="LOCAL_WEIGHT" Type="Decimal" />
                <asp:Parameter Name="STATUS_ID" Type="Int32" />
                <asp:Parameter Name="SIZE_ID" Type="Int32" />
                <asp:Parameter Name="RATING_TYPE_KEY" Type="Int32" />
                <asp:Parameter Name="RATING_KEY" Type="Int32" />
                <asp:Parameter Name="RATING_UPDATE_DATE" Type="DateTime" />
                <asp:Parameter Name="NEXT_REVIEW_DATE" Type="DateTime" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GroupSizeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_CUSTOMER_SME_GROUP_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BranchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_ID_BRANCH_GetAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="JudgementDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_ANNALS_JUDGEMENT_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="BusinessDestination_DS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_BUSINESS_DESTINATION_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="StatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_CUSTOMER_STATUS_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="RatingTypeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="P_SME_RATING_TYPE_GetAll" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="RatingAllSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT [RATING_KEY], [RATING_CODE], [RATING_TYPE_KEY], [RATING_DESC], [PRIORITY] FROM [CUSTOMER_SME_RATING] ORDER BY [PRIORITY]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="RatingBaySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="P_SME_RATING_GetByType" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Type="Int32" Name="RatingTypeKey" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>