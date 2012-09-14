<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="ODUtilization24.aspx.vb" Inherits="aspx_report_ODUtilization24" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel='stylesheet' type='text/css' href="../../theme/divTable.css" />
    <style id="printStyle" type="text/css" runat="server" media="print"> 
        #table1 {
            zoom:80%;
        }
        
        #table2 {
            zoom:90%;
        }
    </style>
    <style type="text/css">
        body
        {
            background-color: #EAFFE8;
        }
    </style>

    <script type="text/javascript">
        function getEleByClientSelector(ClientSelector) {
            var result = null;

            var eleArray = $("input[ClientSelector='" + ClientSelector + "']");

            if (eleArray.length > 0) {
                result = eleArray[0];
            } else {
                alert("Can not find ClientSelector=" + ClientSelector + ".\nPlease, contact administrator.");
            }

            return result;
        }

        function onKeypressEnter(sender, e, clientSelectorTarget) {
            var keyNum = eventKeyCode(e);

            if (keyNum == 13) {
                e.returnValue = false;

                var buttonTarget = getEleByClientSelector(clientSelectorTarget);
                buttonTarget.click();
            } if (keyNum < 32) {
                return keyNum;
            } else {
                return numberOnly(sender, e);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:HiddenField ID="cifHiddenField" runat="server" />
    <asp:HiddenField ID="accnoHiddenField" runat="server" />
    <asp:HiddenField ID="cusNameHiddenField" runat="server" />
    <table id="table1" style="vertical-align: top; width: 800px; page-break-inside: avoid;
        page-break-after: avoid">
        <tr>
            <td style="width: 100%; text-align: left;">
                <asp:Label ID="Part1Label" runat="server" Text="<%$ Resources:OdUtilization, Part1Label %>"
                    Font-Underline="True" Font-Bold="True"></asp:Label>
                <asp:Label ID="Part1LabelValue" runat="server" Text="<%$ Resources:OdUtilization, Part1LabelValue %>"
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:FormView ID="SummaryFormView" runat="server" DataSourceID="SummaryFormViewDS"
                    CellPadding="4" ForeColor="#333333" Width="800px" HorizontalAlign="Center" GridLines="Both">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <ItemTemplate>
                        <div id="section1" class="tableLayout">
                            <div id="section1Row2" class="tableRow">
                                <div id="section1Row2Cell1" class="leftTableCell" style="width: 65%;">
                                    <asp:Label ID="ctrl_unitLabel" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabel %>"
                                        Font-Bold="True"></asp:Label>
                                    <asp:Label ID="ctrl_unitLabelValue" runat="server" Text='<%# Bind("ctrl_unit") %>' />
                                </div>
                                <div id="section1Row2Cell2" class="rightTableCell" style="width: 34.3%;">
                                    <asp:Label ID="run_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabel %>"
                                        Font-Bold="True"></asp:Label>
                                    <asp:Label ID="run_dateLabelValue" runat="server" Text='<%# Bind("run_date","{0:d MMMM yyyy}") %>' />
                                </div>
                            </div>
                            <div id="section1Row3" class="tableRow">
                                <div id="section1Row3Cell1" class="leftTableCell" style="width: 60%;">
                                    <div id="section1_2" class="tableLayout">
                                        <div id="section1_2Row1" class="tableRow">
                                            <div id="section1_2Row1Cell1" class="leftTableCell" style="width: 100%;">
                                                <b>CIF :</b>&nbsp;
                                                <asp:TextBox ID="cifTextBox" runat="server" MaxLength="11" Style="text-align: right;"
                                                    Text='<%# Bind("cif") %>' Width="11ex" onkeypress="return onKeypressEnter(this,event,'searchCIFButton');">
                                                </asp:TextBox>
                                                <asp:Button ID="searchCifButton" runat="server" Text="Search" OnClick="searchCifButton_Click"
                                                    clientSelector="searchCIFButton" />
                                            </div>
                                        </div>
                                        <div id="section1_2Row1Half" class="tableRow">
                                            <div id="section1_2Row1HalfCell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="nameLabel" runat="server" Text="<%$ Resources:OdUtilization, nameLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="nameLabelValue" runat="server" Text='<%# Bind("name") %>' OnPreRender="nameLabel_PreRender" />
                                            </div>
                                        </div>
                                        <div id="section1_2Row2" class="tableRow">
                                            <div id="section1_2Row2Cell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="busi_typeLabel" runat="server" Text="<%$ Resources:OdUtilization, busi_typeLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="busi_typeLabelValue" runat="server" Text='<%# Bind("busi_type") %>' />
                                                &nbsp;<asp:Label ID="busi_descLabel" runat="server" Text='<%# Bind("busi_desc") %>' />
                                            </div>
                                        </div>
                                        <div id="section1_2Row3" class="tableRow">
                                            <div id="section1_2Row3Cell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="idratingLabel" runat="server" Text="<%$ Resources:OdUtilization, idratingLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="idratingLabelValue" runat="server" Text='<%# Bind("idrating") %>' />
                                            </div>
                                        </div>
                                        <div id="section1_2Row3Half" class="tableRow">
                                            <div id="section1_2Row3HalfCell1" class="leftTableCell" style="width: 100%;">
                                                <asp:FormView ID="CustomerDetailFormView" runat="server" DataKeyNames="CIF" DataSourceID="CustomerDetailFormViewDS">
                                                    <ItemTemplate>
                                                        <div class="tableLayout" style="vertical-align: top;">
                                                            <div class="tableRow">
                                                                <div class="leftTableCell" style="width: 100%;">
                                                                    <div id="CM_CODE_DIV">
                                                                        <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>"
                                                                            ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='<%# Bind("CM_CODE") %>' ToolTip="CM CODE"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='<%# Bind("CM_NAME") %>' ToolTip="CM NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="BRANCH_DIV">
                                                                        <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>"
                                                                            ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BRANCH_ID_Label" runat="server" Text='<%# Bind("BRANCH_ID") %>' ToolTip="BRANCH ID"></asp:Label>
                                                                        <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='<%# Eval("BRANCH_NAME") %>'
                                                                            ToolTip="BRANCH NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="GROUP_SIZE_DIV">
                                                                        <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>"
                                                                            ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='<%# Bind("GROUP_SIZE_DETAIL") %>'
                                                                            ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="JUDGEMENT_DIV">
                                                                        <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>"
                                                                            ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='<%# Bind("JUDGEMENT_DETAIL") %>'
                                                                            ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK1_DIV">
                                                                        <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>"
                                                                            ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK1_ID") %>'
                                                                            ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK1_DETAIL") %>'
                                                                            ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK2_DIV">
                                                                        <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>"
                                                                            ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK2_ID") %>'
                                                                            ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK2_DETAIL") %>'
                                                                            ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK3_DIV">
                                                                        <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>"
                                                                            ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK3_ID") %>'
                                                                            ToolTip="BUSINESS RISK3 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK3_DETAIL") %>'
                                                                            ToolTip="BUSINESS RISK3 DETAIL"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                    <EmptyDataTemplate>
                                                        <div class="tableLayout" style="vertical-align: top;">
                                                            <div class="tableRow">
                                                                <div class="leftTableCell" style="width: 100%;">
                                                                    <div id="CM_CODE_DIV">
                                                                        <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>"
                                                                            ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='N/A' ToolTip="CM CODE"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='' ToolTip="CM NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="BRANCH_DIV">
                                                                        <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>"
                                                                            ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BRANCH_ID_Label" runat="server" Text='N/A' ToolTip="BRANCH ID"></asp:Label>
                                                                        <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='' ToolTip="BRANCH NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="GROUP_SIZE_DIV">
                                                                        <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>"
                                                                            ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='N/A' ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="JUDGEMENT_DIV">
                                                                        <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>"
                                                                            ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='N/A' ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK1_DIV">
                                                                        <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>"
                                                                            ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK2_DIV">
                                                                        <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>"
                                                                            ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK3_DIV">
                                                                        <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>"
                                                                            ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK3 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK3 DETAIL"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:FormView>
                                                <asp:SqlDataSource ID="CustomerDetailFormViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                                    SelectCommand="SELECT CM_CODE, CM_NAME, BRANCH_ID, BRANCH_NAME, GROUP_SIZE_DETAIL, CASE WHEN JUDGEMENT_ID='000' THEN '' ELSE JUDGEMENT_DETAIL END AS JUDGEMENT_DETAIL, BUSI_RISK1_ID, BUSI_RISK1_DETAIL, BUSI_RISK2_ID, BUSI_RISK2_DETAIL, BUSI_RISK3_ID, BUSI_RISK3_DETAIL, CIF FROM CUSTOMER_SME_FULL_DESC WHERE (CIF = @CIF)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <br />
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- end div section1_2 -->
                                </div>
                                <!-- end div section1Row3Cell1 -->
                                <div id="section1Row3Cell2" class="rightTableCell" style="text-align: center;">
                                    <asp:GridView ID="CreditodSummaryGridView" runat="server" HorizontalAlign="Center"
                                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="CreditSummaryDS" ForeColor="#333333"
                                        Font-Names="Arial" Font-Size="Small" ShowFooter="True" OnPreRender="CreditOdSummaryGridView_PreRender"
                                        Width="100%" CaptionAlign="Right" Caption="<%$ Resources:OdUtilization, CreditodSummaryGridView_Unit %>">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="GL_TYPE" SortExpression="GL_TYPE">
                                                <EditItemTemplate>
                                                    <asp:Label ID="GL_TYPELabel" runat="server" Text='<%# Eval("GL_TYPE") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <u>Total</u>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="GL_TYPELabel" runat="server" Text='<%# Bind("GL_TYPE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LIMIT" SortExpression="LIMIT">
                                                <EditItemTemplate>
                                                    <asp:Label ID="LIMITLabel" runat="server" Text='<%# Eval("LIMIT", "{0:#,###}") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="LIMITLabel" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LIMITLabel" runat="server" Text='<%# Bind("LIMIT", "{0:#,###}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PRIN" SortExpression="PRIN">
                                                <EditItemTemplate>
                                                    <asp:Label ID="PRINLabel" runat="server" Text='<%# Eval("PRIN", "{0:#,###}") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="PRINLabel" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="PRINLabel" runat="server" Text='<%# Bind("PRIN", "{0:#,###}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AGING" SortExpression="AGING">
                                                <EditItemTemplate>
                                                    <asp:Label ID="AGINGLabel" runat="server" Text='<%# Eval("AGING", "{0:#,##0.00}") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="AGINGLabel" runat="server" Text='<%# Bind("AGING", "{0:#,##0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="CreditSummaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                        SelectCommand="REP_OD_CREDIT_SUMMARY" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <!-- end div section1Row3Cell2 -->
                            </div>
                            <!-- end div section1Row3 -->
                            <div id="section1_Row4" class="tableRow">
                                <div id="section1_Row4Cell1" class="leftTableCell" style="width: 100%;">
                                    <asp:Label ID="accnoLabel" runat="server" Text="<%$ Resources:OdUtilization, accnoLabel %>"
                                        Font-Bold="true"></asp:Label>
                                    <asp:DropDownList ID="accnoList" runat="server" AutoPostBack="True" DataSourceID="accnoListDS"
                                        DataTextField="accno" DataValueField="accno" OnPreRender="accnoList_PreRender">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="accnoListDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                        SelectCommand="REP_OD_ACCNO_BY_CIF" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:FormView ID="odSummaryFormView" runat="server" CellPadding="4" DataSourceID="odSummaryDS"
                                        ForeColor="#333333">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <ItemTemplate>
                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_limLabelValue" runat="server" Text='<%# Bind("od_lim","{0:#,##0.00} บาท") %>' />
                                            <br />
                                            <asp:Label ID="od_prinLabel" runat="server" Text="<%$ Resources:OdUtilization, od_prinLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_prinLabelValue" runat="server" Text='<%# Bind("od_prin","{0:#,##0.00} บาท") %>' />
                                            <br />
                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="brnameLabelValue" runat="server" Text='<%# Bind("brname") %>' />
                                            <br />
                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_intLabelValue" runat="server" Text='<%# Bind("od_int","{0:#,##0.00}%") %>' />
                                            <br />
                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='<%# Bind("od_date","{0:d MMMM yyyy}") %>' />
                                            <br />
                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="class_hLabelValue" runat="server" Text='<%# Bind("class_h") %>' />
                                            <br />
                                        </ItemTemplate>
                                        <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_limLabelValue" runat="server" Text='<%# Bind("od_lim","{0:#,##0.00} บาท") %>' />
                                            <br />
                                            <asp:Label ID="od_prinLabel" runat="server" Text="<%$ Resources:OdUtilization, od_prinLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_prinLabelValue" runat="server" Text='<%# Bind("od_prin","{0:#,##0.00} บาท") %>' />
                                            <br />
                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="brnameLabelValue" runat="server" Text='<%# Bind("brname") %>' />
                                            <br />
                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_intLabelValue" runat="server" Text='<%# Bind("od_int","{0:#,##0.00}%") %>' />
                                            <br />
                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='<%# Bind("od_date") %>' />
                                            <br />
                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="class_hLabelValue" runat="server" Text='<%# Bind("class_h") %>' />
                                            <br />
                                        </EmptyDataTemplate>
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="odSummaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                        SelectCommand="REP_OD_SUMMARY_BY_ACC" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="accnoList" Name="accno" PropertyName="SelectedValue"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <!-- end div section1_Row4Cell1 -->
                            </div>
                            <!-- end div section1_Row4 -->
                        </div>
                        <!-- end div section1 -->
                    </ItemTemplate>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <div id="section1" class="tableLayout">
                            <div id="section1Row2" class="tableRow">
                                <div id="section1Row2Cell1" class="leftTableCell" style="width: 65%;">
                                    <asp:Label ID="ctrl_unitLabel" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabel %>"
                                        Font-Bold="True"></asp:Label>
                                    <asp:Label ID="ctrl_unitLabelValue" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabelValue %>" />
                                </div>
                                <div id="section1Row2Cell2" class="rightTableCell" style="width: 34.3%;">
                                    <asp:Label ID="run_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabel %>"
                                        Font-Bold="True"></asp:Label>
                                    <asp:Label ID="run_dateLabelValue" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabelValue %>" />
                                </div>
                            </div>
                            <div id="section1Row3" class="tableRow">
                                <div id="section1Row3Cell1" class="leftTableCell" style="width: 60%;">
                                    <div id="section1_2" class="tableLayout">
                                        <div id="section1_2Row1" class="tableRow">
                                            <div id="section1_2Row1Cell1" class="leftTableCell" style="width: 100%;">
                                                <b>CIF :</b>&nbsp;
                                                <asp:TextBox ID="cifTextBox" runat="server" MaxLength="11" Style="text-align: right;"
                                                    Text='' Width="11ex" OnPreRender="cifTextBoxEmpty_PreRender" onkeypress="return onKeypressEnter(this,event,'searchCIFButton');">
                                                </asp:TextBox>
                                                <asp:Button ID="searchCifButton" runat="server" Text="Search" OnClick="searchCifButton_Click"
                                                    clientSelector="searchCIFButton" />
                                            </div>
                                        </div>
                                        <div id="section1_2Row1Half" class="tableRow">
                                            <div id="section1_2Row1HalfCell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:OdUtilization, nameLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>' OnPreRender="nameLabel_PreRender" />
                                            </div>
                                        </div>
                                        <div id="section1_2Row2" class="tableRow">
                                            <div id="section1_2Row2Cell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="busi_typeLabel" runat="server" Text="<%$ Resources:OdUtilization, busi_typeLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="busi_typeLabelValue" runat="server" Text='N/A' />
                                                &nbsp;<asp:Label ID="busi_descLabel" runat="server" Text='' />
                                            </div>
                                        </div>
                                        <div id="section1_2Row3" class="tableRow">
                                            <div id="section1_2Row3Cell1" class="leftTableCell" style="width: 100%;">
                                                <asp:Label ID="idratingLabel" runat="server" Text="<%$ Resources:OdUtilization, idratingLabel %>"
                                                    Font-Bold="True"></asp:Label>
                                                <asp:Label ID="idratingLabelValue" runat="server" Text='N/A' />
                                            </div>
                                        </div>
                                        <div id="section1_2Row3Half" class="tableRow">
                                            <div id="section1_2Row3HalfCell1" class="leftTableCell" style="width: 100%;">
                                                <asp:FormView ID="CustomerDetailFormView" runat="server">
                                                    <EmptyDataTemplate>
                                                        <div class="tableLayout" style="vertical-align: top;">
                                                            <div class="tableRow">
                                                                <div class="leftTableCell" style="width: 100%;">
                                                                    <div id="CM_CODE_DIV">
                                                                        <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>"
                                                                            ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='N/A' ToolTip="CM CODE"></asp:Label>
                                                                        <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='' ToolTip="CM NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="BRANCH_DIV">
                                                                        <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>"
                                                                            ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BRANCH_ID_Label" runat="server" Text='N/A' ToolTip="BRANCH ID"></asp:Label>
                                                                        <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='' ToolTip="BRANCH NAME"></asp:Label>
                                                                    </div>
                                                                    <div id="GROUP_SIZE_DIV">
                                                                        <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>"
                                                                            ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='N/A' ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="JUDGEMENT_DIV">
                                                                        <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>"
                                                                            ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='N/A' ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK1_DIV">
                                                                        <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>"
                                                                            ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK2_DIV">
                                                                        <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>"
                                                                            ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                    </div>
                                                                    <div id="BUSI_RISK3_DIV">
                                                                        <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>"
                                                                            ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK3 ID"></asp:Label>
                                                                        <asp:Label ID="BUSI_RISK3_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK3 DETAIL"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:FormView>
                                                <br />
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <!-- end div section1_2 -->
                                </div>
                                <!-- end div section1Row3Cell1 -->
                                <div id="section1Row3Cell2" class="rightTableCell" style="text-align: center;">
                                    &nbsp;
                                </div>
                                <!-- end div section1Row3Cell2 -->
                            </div>
                            <!-- end div section1Row3 -->
                            <div id="section1_Row4" class="tableRow">
                                <div id="section1_Row4Cell1" class="leftTableCell" style="width: 100%;">
                                    <asp:Label ID="accnoLabel" runat="server" Text="<%$ Resources:OdUtilization, accnoLabel %>"
                                        Font-Bold="true"></asp:Label>
                                    <asp:DropDownList ID="accnoList" runat="server" AutoPostBack="True" DataTextField="accno"
                                        DataValueField="accno" OnPreRender="accnoList_PreRender">
                                        <asp:ListItem>N/A</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:FormView ID="odSummaryFormView" runat="server" CellPadding="4" DataSourceID="odSummaryDS"
                                        ForeColor="#333333">
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_limLabelValue" runat="server" Text='N/A' />
                                            <br />
                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="brnameLabelValue" runat="server" Text='N/A' />
                                            <br />
                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_intLabelValue" runat="server" Text='N/A' />
                                            <br />
                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='N/A' />
                                            <br />
                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>"
                                                Font-Bold="true"></asp:Label>
                                            <asp:Label ID="class_hLabelValue" runat="server" Text='N/A' />
                                            <br />
                                        </EmptyDataTemplate>
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="odSummaryDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                                        SelectCommand="REP_OD_SUMMARY_BY_ACC" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="accnoList" Name="accno" PropertyName="SelectedValue"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <!-- end div section1_Row4Cell1 -->
                            </div>
                        </div>
                        <!-- end div section1 -->
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SummaryFormViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_SUMMARY_BY_CIF" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="CIF" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table id="table2" style="vertical-align: top; width: 800px; page-break-inside: avoid;
        page-break-after: always;">
        <tr>
            <td style="width: 100%; text-align: left;">
                <asp:Label ID="Part2Label" runat="server" Text="<%$ Resources:OdUtilization, Part2Label %>"
                    Font-Underline="True" Font-Bold="True"></asp:Label>
                <asp:Label ID="Part2LabelValue" runat="server" Text="<%$ Resources:OdUtilization, Part2LabelValue %>"
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                2.1
                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:OdUtilization, Part2LabelValue %>"
                    Font-Bold="True"></asp:Label>
                1-12
                <asp:GridView ID="riskTableGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="riskTableGridViewDS" ForeColor="#333333" Font-Names="Arial" Font-Size="Small"
                    Style="margin-bottom: 0px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="CriteriaMovement" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaMovement">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Movement(Avg)" HeaderText="Movement(Avg)" ReadOnly="True"
                            SortExpression="Movement(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Movement(Last)" HeaderText="Movement(Last)" ReadOnly="True"
                            SortExpression="Movement(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CriteriaUtilize" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaUtilize">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Utilization(Avg)" HeaderText="Utilization(Avg)" ReadOnly="True"
                            SortExpression="Utilization(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Utilization(Last)" HeaderText="Utilization(Last)" ReadOnly="True"
                            SortExpression="Utilization(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CriteriaCheque" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaCheque">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Withdraw" HeaderText="Withdraw" ReadOnly="True" SortExpression="Withdraw">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deposit" HeaderText="Deposit" ReadOnly="True" SortExpression="Deposit">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="riskTableGridViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_RISK_TABLE" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                2.2
                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:OdUtilization, Part2LabelValue %>"
                    Font-Bold="True"></asp:Label>
                13-24
                <asp:GridView ID="riskTableGridView13" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="riskTableGridView13DS" ForeColor="#333333" Font-Names="Arial"
                    Font-Size="Small" Style="margin-bottom: 0px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="CriteriaMovement" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaMovement">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Movement(Avg)" HeaderText="Movement(Avg)" ReadOnly="True"
                            SortExpression="Movement(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Movement(Last)" HeaderText="Movement(Last)" ReadOnly="True"
                            SortExpression="Movement(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CriteriaUtilize" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaUtilize">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Utilization(Avg)" HeaderText="Utilization(Avg)" ReadOnly="True"
                            SortExpression="Utilization(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Utilization(Last)" HeaderText="Utilization(Last)" ReadOnly="True"
                            SortExpression="Utilization(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CriteriaCheque" HeaderText="Criteria" ReadOnly="True"
                            SortExpression="CriteriaCheque">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Withdraw" HeaderText="Withdraw" ReadOnly="True" SortExpression="Withdraw">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Deposit" HeaderText="Deposit" ReadOnly="True" SortExpression="Deposit">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="riskTableGridView13DS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_RISK_TABLE_13" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    
        <tr>
            <td style="text-align: left;">
                <asp:Label ID="Part3Label" runat="server" Text="<%$ Resources:OdUtilization, Part3Label %>"
                    Font-Underline="True" Font-Bold="True"></asp:Label>
                <asp:Label ID="Part3LabelValue" runat="server" Text="<%$ Resources:OdUtilization, Part3LabelValue %>"
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:GridView ID="odSummaryGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="odSummaryGridViewDS" ForeColor="#333333" HorizontalAlign="Center"
                    Width="100%" Font-Bold="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small"
                    Font-Strikeout="False" CaptionAlign="Right">
                    <RowStyle BackColor="#EFF3FB" Wrap="True" />
                    <Columns>
                        <asp:BoundField DataField="SUMMARY" HeaderText="SUMMARY" ReadOnly="True" SortExpression="SUMMARY">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam12" HeaderText="mvmdam12" ReadOnly="True" SortExpression="mvmdam12"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam11" HeaderText="mvmdam11" ReadOnly="True" SortExpression="mvmdam11"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam10" HeaderText="mvmdam10" ReadOnly="True" SortExpression="mvmdam10"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam09" HeaderText="mvmdam09" ReadOnly="True" SortExpression="mvmdam09"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam08" HeaderText="mvmdam08" SortExpression="mvmdam08"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam07" HeaderText="mvmdam07" ReadOnly="True" SortExpression="mvmdam07"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam06" HeaderText="mvmdam06" ReadOnly="True" SortExpression="mvmdam06"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam05" HeaderText="mvmdam05" ReadOnly="True" SortExpression="mvmdam05"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam04" HeaderText="mvmdam04" ReadOnly="True" SortExpression="mvmdam04"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam03" HeaderText="mvmdam03" ReadOnly="True" SortExpression="mvmdam03"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam02" HeaderText="mvmdam02" ReadOnly="True" SortExpression="mvmdam02"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam01" HeaderText="mvmdam01" ReadOnly="True" SortExpression="mvmdam01"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdr_avg" HeaderText="<%$ Resources:OdUtilization, odSummaryGridView_Header3 %>"
                            ReadOnly="True" SortExpression="mvmdr_avg" DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="run_date" SortExpression="run_date" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="LabelRunDate" runat="server" Text='<%# Eval("run_date","{0:d/MM/yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelRunDate" runat="server" Text='<%# Bind("run_date","{0:d/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="odSummaryGridViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_SUMMARY_CHART" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="odSummaryGridView13" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="odSummaryGridView13DS" ForeColor="#333333" HorizontalAlign="Center"
                    Width="100%" Font-Bold="False" Font-Names="Arial" Font-Overline="False" Font-Size="Small"
                    Font-Strikeout="False" CaptionAlign="Right">
                    <RowStyle BackColor="#EFF3FB" Wrap="True" />
                    <Columns>
                        <asp:BoundField DataField="SUMMARY" HeaderText="SUMMARY" ReadOnly="True" SortExpression="SUMMARY">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam12" HeaderText="mvmdam12" ReadOnly="True" SortExpression="mvmdam12"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam11" HeaderText="mvmdam11" ReadOnly="True" SortExpression="mvmdam11"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam10" HeaderText="mvmdam10" ReadOnly="True" SortExpression="mvmdam10"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam09" HeaderText="mvmdam09" ReadOnly="True" SortExpression="mvmdam09"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam08" HeaderText="mvmdam08" SortExpression="mvmdam08"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam07" HeaderText="mvmdam07" ReadOnly="True" SortExpression="mvmdam07"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam06" HeaderText="mvmdam06" ReadOnly="True" SortExpression="mvmdam06"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam05" HeaderText="mvmdam05" ReadOnly="True" SortExpression="mvmdam05"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam04" HeaderText="mvmdam04" ReadOnly="True" SortExpression="mvmdam04"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam03" HeaderText="mvmdam03" ReadOnly="True" SortExpression="mvmdam03"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam02" HeaderText="mvmdam02" ReadOnly="True" SortExpression="mvmdam02"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdam01" HeaderText="mvmdam01" ReadOnly="True" SortExpression="mvmdam01"
                            DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mvmdr_avg" HeaderText="<%$ Resources:OdUtilization, odSummaryGridView_Header3 %>"
                            ReadOnly="True" SortExpression="mvmdr_avg" DataFormatString="{0:#,###}">
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="run_date" SortExpression="run_date" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="LabelRunDate" runat="server" Text='<%# Eval("run_date","{0:d/MM/yyyy}") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelRunDate" runat="server" Text='<%# Bind("run_date","{0:d/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="odSummaryGridView13DS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_SUMMARY_CHART_13" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <asp:GridView ID="chequeGridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="chequeGridViewDS" ForeColor="#333333" HorizontalAlign="Left" Font-Names="Arial"
                    Font-Size="Small" CaptionAlign="Right">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="SUMMARY" HeaderText="Cheque Summary(01-12)" ReadOnly="True" SortExpression="SUMMARY" />
                        <asp:BoundField DataField="chqre_dact" HeaderText="No." SortExpression="chqre_dact"
                            ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_daca" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqre_daca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrdt01" HeaderText="No." SortExpression="chqrdt01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqred01" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqred01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_cact" HeaderText="No." SortExpression="chqre_cact"
                            ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_caca" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqre_caca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrct01" HeaderText="No." SortExpression="chqrct01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrec01" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqrec01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="run_date" HeaderText="run_date" SortExpression="run_date"
                            Visible="False" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="chequeGridViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_CHEQUE_SUMMARY" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="ACCNO" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <asp:GridView ID="chequeGridView13" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataSourceID="chequeGridView13DS" ForeColor="#333333" HorizontalAlign="Left"
                    Font-Names="Arial" Font-Size="Small" CaptionAlign="Right">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="SUMMARY" HeaderText="Cheque Summary(13-24)" ReadOnly="True" SortExpression="SUMMARY" />
                        <asp:BoundField DataField="chqre_dact" HeaderText="No." SortExpression="chqre_dact"
                            ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_daca" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqre_daca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrdt01" HeaderText="No." SortExpression="chqrdt01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqred01" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqred01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_cact" HeaderText="No." SortExpression="chqre_cact"
                            ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqre_caca" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqre_caca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrct01" HeaderText="No." SortExpression="chqrct01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="chqrec01" DataFormatString="{0:#,###.##}" HeaderText="Amount"
                            SortExpression="chqrec01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="run_date" HeaderText="run_date" SortExpression="run_date"
                            Visible="False" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="chequeGridView13DS" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="REP_OD_CHEQUE_SUMMARY_13" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="accnoHiddenField" Name="ACCNO" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <div id="tableDiv3" class="tableLayout" style="width: 800px; vertical-align: top;">
        <div class="tableRow">
            <div class="leftTableCell" style="width: 100%; text-align: center;">
                <asp:Chart ID="ChartPrevious1Year" runat="server" Height="1100px" 
                    Width="800px" AlternateText="ChartPrevious1Year"
                    ImageStorageMode="UseImageLocation" 
                    ImageLocation="~/images/dundas/Previous1Year_#SEQ(300,3)" Palette="None">
                    <Annotations>
                        <asp:CalloutAnnotation Name="Callout1" Font="Microsoft Sans Serif, 12pt" Text="*** Debt&lt;0 (ติดลบ) = Deposit ***"
                            X="0" Y="97">
                            <SmartLabelStyle AllowOutsidePlotArea="Yes" />
                        </asp:CalloutAnnotation>
                    </Annotations>
                    <Legends>
                        <asp:Legend Name="LegendMovementPrevious1Year" Alignment="Center" Docking="Top" IsDockedInsideChartArea="False"
                            BorderColor="Black" LegendStyle="Row" BackColor="LightCyan" DockedToChartArea="MovementPrevious1Year">
                        </asp:Legend>
                        <asp:Legend Alignment="Center" BackColor="LightCyan" BorderColor="Black" Docking="Top"
                            IsDockedInsideChartArea="False" LegendStyle="Row" Name="LegendUtilizePrevious1Year"
                            DockedToChartArea="UtilizationPrevious1Year">
                        </asp:Legend>
                        <asp:Legend Name="LegendBalancePrevious1Year" Alignment="Center" Docking="Top" IsDockedInsideChartArea="False"
                            BorderColor="Black" LegendStyle="Row" BackColor="LightCyan" DockedToChartArea="BalancePrevious1Year">
                        </asp:Legend>                        
                    </Legends>
                    <Titles>
                        <asp:Title Name="MovementTitle" Text="Deposit&amp;Withdraw Amount(Exclude P/N)" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" 
                            DockedToChartArea="MovementPrevious1Year" IsDockedInsideChartArea="False">
                        </asp:Title>
                        <asp:Title DockedToChartArea="UtilizationPrevious1Year" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" IsDockedInsideChartArea="False" 
                            Name="UtiltzeTitle" Text="Out Standing Balance">
                        </asp:Title>
                        <asp:Title DockedToChartArea="BalancePrevious1Year" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" IsDockedInsideChartArea="False" 
                            Name="BalanceTitle" Text="Highest&amp;Lowest Debt">
                        </asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series ChartArea="MovementPrevious1Year" ChartType="Area" Name="LimitSeriesPrevious1Year"
                            BackGradientStyle="TopBottom" Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold"
                            IsValueShownAsLabel="True" LabelForeColor="51, 153, 255" LabelFormat="#,###"
                            Legend="LegendMovementPrevious1Year" 
                            CustomProperties="EmptyPointValue=Zero" LegendText="Limit" 
                            BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series ChartArea="MovementPrevious1Year" ChartType="Line" Name="WithdrawSeriesPrevious1Year"
                            Color="Red" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="Red" LabelFormat="#,###" Legend="LegendMovementPrevious1Year" MarkerSize="8"
                            MarkerStyle="Square" BorderWidth="3" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Withdraw" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="MovementPrevious1Year" ChartType="Line" Name="DepositSeriesPrevious1Year"
                            Color="Lime" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="0, 204, 0" LabelFormat="#,###" Legend="LegendMovementPrevious1Year" MarkerSize="10"
                            MarkerStyle="Cross" BorderWidth="3" CustomProperties="EmptyPointValue=Zero" LegendText="Deposit"
                            MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series Name="UtilizeLimitSeriesPrevious1Year" BackGradientStyle="TopBottom"
                            ChartArea="UtilizationPrevious1Year" ChartType="Area" 
                            Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold"
                            IsValueShownAsLabel="True" LabelForeColor="51, 153, 255" LabelFormat="#,###"
                            Legend="LegendUtilizePrevious1Year" 
                            CustomProperties="EmptyPointValue=Zero" LegendText="Limit" 
                            BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series BorderWidth="3" ChartArea="UtilizationPrevious1Year" ChartType="Line"
                            Color="Blue" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="Blue" LabelFormat="#,###" Legend="LegendUtilizePrevious1Year" MarkerSize="8"
                            MarkerStyle="Circle" Name="UtilizationSeriesPrevious1Year" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Utilization" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series BorderWidth="3" ChartArea="UtilizationPrevious1Year" ChartType="Line"
                            Color="255, 128, 0" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="236, 118, 0" LabelFormat="P2" Legend="LegendUtilizePrevious1Year" MarkerSize="10"
                            MarkerStyle="Diamond" Name="PercentUtilizationSeriesPrevious1Year" YAxisType="Secondary"
                            CustomProperties="EmptyPointValue=Zero" LegendText="%Utilization" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePrevious1Year" ChartType="Area" Name="BalLimitSeriesPrevious1Year"
                            BackGradientStyle="TopBottom" Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold"
                            IsValueShownAsLabel="True" LabelForeColor="51, 153, 255" LabelFormat="#,###"
                            Legend="LegendBalancePrevious1Year" 
                            CustomProperties="EmptyPointValue=Zero" LegendText="Limit" 
                            BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePrevious1Year" ChartType="Line" Name="MaxBalanceSeriesPrevious1Year"
                            Color="192, 0, 192" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="192, 0, 192" LabelFormat="#,###" Legend="LegendBalancePrevious1Year"
                            MarkerSize="10" MarkerStyle="Star5" BorderWidth="3" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Max Debt Balance" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePrevious1Year" ChartType="Line" Name="MinBalanceSeriesPrevious1Year"
                            Color="192, 192, 0" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="192, 192, 0" LabelFormat="#,###" Legend="LegendBalancePrevious1Year"
                            MarkerSize="10" MarkerStyle="Star10" BorderWidth="3" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Min Debt Balance" MarkerBorderColor="Black">
                        </asp:Series>                        
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MovementPrevious1Year" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                        <asp:ChartArea Name="UtilizationPrevious1Year" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                            <AxisY2 Maximum="1.2" Minimum="0" Interval="0.1" IsLabelAutoFit="False" 
                                IntervalAutoMode="VariableCount">
                                <MajorGrid LineDashStyle="Dot" />
                                <LabelStyle Format="P2" />
                            </AxisY2>
                        </asp:ChartArea>
                        <asp:ChartArea Name="BalancePrevious1Year" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" Crossing="0" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
        <div class="tableRow">
            <div class="leftTableCell" style="width: 100%; text-align: center;">
                <asp:Chart ID="ChartPast2Years" runat="server" Height="1100px" Width="800px" AlternateText="ChartPast2Years"
                    ImageStorageMode="UseImageLocation" 
                    ImageLocation="~/images/dundas/Past2Years_#SEQ(300,3)" Palette="None">
                    <Annotations>
                        <asp:CalloutAnnotation Name="Callout1" Font="Microsoft Sans Serif, 12pt" Text="*** Debt&lt;0 (ติดลบ) = Deposit ***"
                            X="0" Y="97">
                            <SmartLabelStyle AllowOutsidePlotArea="Yes" />
                        </asp:CalloutAnnotation>
                    </Annotations>
                    <Legends>
                        <asp:Legend Alignment="Center" DockedToChartArea="MovementPast2Years" Docking="Top"
                            IsDockedInsideChartArea="False" Name="LegendMovementPast2Years" BackColor="LightCyan"
                            BorderColor="Black" LegendStyle="Row">
                        </asp:Legend>
                        <asp:Legend Alignment="Center" BackColor="LightCyan" BorderColor="Black" DockedToChartArea="UtilizationPast2Years"
                            Docking="Top" IsDockedInsideChartArea="False" LegendStyle="Row" Name="LegendUtilizePast2Years">
                        </asp:Legend>
                        <asp:Legend Alignment="Center" DockedToChartArea="BalancePast2Years" Docking="Top"
                            IsDockedInsideChartArea="False" Name="LegendBalancePast2Years" BackColor="LightCyan"
                            BorderColor="Black" LegendStyle="Row">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Name="MovementTitle" Text="Deposit&amp;Withdraw Amount(Exclude P/N)" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" 
                            DockedToChartArea="MovementPast2Years" IsDockedInsideChartArea="False">
                        </asp:Title>
                        <asp:Title DockedToChartArea="UtilizationPast2Years" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" IsDockedInsideChartArea="False" 
                            Name="UtiltzeTitle" Text="Out Standing Balance">
                        </asp:Title>
                        <asp:Title DockedToChartArea="BalancePast2Years" 
                            Font="Microsoft Sans Serif, 16pt, style=Bold" IsDockedInsideChartArea="False" 
                            Name="BalanceTitle" Text="Highest&amp;Lowest Debt">
                        </asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series ChartArea="MovementPast2Years" ChartType="Area" Name="LimitSeriesPast2Years"
                            BackGradientStyle="TopBottom" Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold"
                            IsValueShownAsLabel="True" LabelForeColor="51, 153, 255" LabelFormat="#,###"
                            Legend="LegendMovementPast2Years" CustomProperties="EmptyPointValue=Zero" 
                            LegendText="Limit" BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series ChartArea="MovementPast2Years" ChartType="Line" Name="WithdrawSeriesPast2Years"
                            Color="Red" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="Red" LabelFormat="#,###" Legend="LegendMovementPast2Years" MarkerSize="8"
                            MarkerStyle="Square" BorderWidth="3" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Withdraw" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="MovementPast2Years" ChartType="Line" Name="DepositSeriesPast2Years"
                            Color="Lime" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="0, 204, 0" LabelFormat="#,###" Legend="LegendMovementPast2Years" MarkerSize="10"
                            MarkerStyle="Cross" BorderWidth="3" CustomProperties="EmptyPointValue=Zero" LegendText="Deposit"
                            MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series BackGradientStyle="TopBottom" ChartArea="UtilizationPast2Years" ChartType="Area"
                            Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="51, 153, 255" LabelFormat="#,###" 
                            Legend="LegendUtilizePast2Years" Name="UtilizeLimitSeriesPast2Years"
                            CustomProperties="EmptyPointValue=Zero" LegendText="Limit" 
                            BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series BorderWidth="3" ChartArea="UtilizationPast2Years" ChartType="Line" Color="Blue"
                            Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True" LabelForeColor="Blue"
                            LabelFormat="#,###" Legend="LegendUtilizePast2Years" MarkerSize="8" MarkerStyle="Circle"
                            Name="UtilizationSeriesPast2Years" CustomProperties="EmptyPointValue=Zero" LegendText="Utilization"
                            MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series BorderWidth="3" ChartArea="UtilizationPast2Years" ChartType="Line" Color="255, 128, 0"
                            Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True" LabelForeColor="236, 118, 0"
                            LabelFormat="P2" Legend="LegendUtilizePast2Years" MarkerSize="10" MarkerStyle="Diamond"
                            Name="PercentUtilizationSeriesPast2Years" YAxisType="Secondary" CustomProperties="EmptyPointValue=Zero"
                            LegendText="%Utilization" MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePast2Years" ChartType="Area" Name="BalLimitSeriesPast2Years"
                            BackGradientStyle="TopBottom" Color="153, 204, 255" Font="Microsoft Sans Serif, 12pt, style=Bold"
                            IsValueShownAsLabel="True" LabelForeColor="51, 153, 255" LabelFormat="#,###"
                            Legend="LegendBalancePast2Years" CustomProperties="EmptyPointValue=Zero" 
                            LegendText="Limit" BackSecondaryColor="White" BorderColor="64, 64, 64">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePast2Years" ChartType="Line" Name="MaxBalanceSeriesPast2Years"
                            Color="192, 0, 192" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="192, 0, 192" LabelFormat="#,###" 
                            Legend="LegendBalancePast2Years" MarkerSize="10"
                            MarkerStyle="Star5" BorderWidth="3" 
                            CustomProperties="EmptyPointValue=Zero" LegendText="Max Debt Balance"
                            MarkerBorderColor="Black">
                        </asp:Series>
                        <asp:Series ChartArea="BalancePast2Years" ChartType="Line" Name="MinBalanceSeriesPast2Years"
                            Color="192, 192, 0" Font="Microsoft Sans Serif, 12pt, style=Bold" IsValueShownAsLabel="True"
                            LabelForeColor="192, 192, 0" LabelFormat="#,###" Legend="LegendBalancePast2Years"
                            MarkerSize="10" MarkerStyle="Star10" BorderWidth="3" CustomProperties="EmptyPointValue=Zero"
                            LegendText="Min Debt Balance" MarkerBorderColor="Black">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MovementPast2Years" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                        
                        <asp:ChartArea Name="UtilizationPast2Years" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                            <AxisY2 Maximum="1.2" Minimum="0" Interval="0.1" IsLabelAutoFit="False" 
                                IntervalAutoMode="VariableCount">
                                <MajorGrid LineDashStyle="Dot" />
                                <LabelStyle Format="P2" />
                            </AxisY2>
                        </asp:ChartArea>
                        <asp:ChartArea Name="BalancePast2Years" BackColor="100, 235, 245, 255">
                            <AxisY Title="Thousand Baht" Crossing="0" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                <MajorGrid LineDashStyle="Dash" />
                                <LabelStyle Format="#,##0" />
                            </AxisY>
                            <AxisX Interval="1" IsInterlaced="True">
                                <MajorGrid LineDashStyle="NotSet" Enabled="False" />
                                <MajorTickMark Enabled="False" />
                            </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SamplePivotDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" SelectCommand="SELECT	CASE monthly 
			WHEN 'MVMDAM12' THEN DATEADD(MONTH,-11,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM11' THEN DATEADD(MONTH,-10,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM10' THEN DATEADD(MONTH,-9,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM09' THEN DATEADD(MONTH,-8,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM08' THEN DATEADD(MONTH,-7,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM07' THEN DATEADD(MONTH,-6,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM06' THEN DATEADD(MONTH,-5,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM05' THEN DATEADD(MONTH,-4,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM04' THEN DATEADD(MONTH,-3,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM03' THEN DATEADD(MONTH,-2,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM02' THEN DATEADD(MONTH,-1,DATEADD(day,-1*DATEPART(day,run_date),run_date))
			WHEN 'MVMDAM01' THEN DATEADD(day,-1*DATEPART(day,run_date),run_date)
			ELSE run_date 
		END AS ASOF
	,DEBIT
FROM (

		SELECT 'DEBIT' AS 'SUMMARY'
				, MVMDAM12/1000 AS MVMDAM12, MVMDAM11/1000 AS MVMDAM11
				, MVMDAM10/1000 AS MVMDAM10, MVMDAM09/1000 AS MVMDAM09
				, MVMDAM08/1000 AS MVMDAM08, MVMDAM07/1000 AS MVMDAM07
				, MVMDAM06/1000 AS MVMDAM06, MVMDAM05/1000 AS MVMDAM05
				, MVMDAM04/1000 AS MVMDAM04, MVMDAM03/1000 AS MVMDAM03
				, MVMDAM02/1000 AS MVMDAM02, MVMDAM01/1000 AS MVMDAM01
				, MVMDR_AVG/1000 AS MVMDR_AVG, run_date
			FROM REP_OD13 
			WHERE (ACCNO = N'1320012123') 

) AS T
UNPIVOT(
	DEBIT FOR monthly IN
		(MVMDAM12, MVMDAM11, MVMDAM10, MVMDAM09,
		MVMDAM08, MVMDAM07, MVMDAM06, MVMDAM05,
		MVMDAM04, MVMDAM03, MVMDAM02, MVMDAM01)
	
)AS unpvt"></asp:SqlDataSource>
</asp:Content>
