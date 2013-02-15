<%@ Page Title="สรุปการใช้วงเงินO/D" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="OdUtilization.aspx.vb" Inherits="aspx.report.OdUtilization" %>

<%@ Register Assembly="DundasWebChart" Namespace="Dundas.Charting.WebControl" TagPrefix="DCWC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel='stylesheet' type='text/css' href="../../theme/divTable.css" />
    <style id="printStyle" type="text/css" runat="server" media="print">
     <%--   
        #tableDiv1 {
            zoom:67%;
        }
        
        #tableDiv2 {
            zoom:70%;
        }
        --%>
    </style>
    <style type="text/css">
        body{
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

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:HiddenField ID="cifHiddenField" runat="server" />
        <asp:HiddenField ID="accnoHiddenField" runat="server" />
        <asp:HiddenField ID="cusNameHiddenField" runat="server" />
        
        <div id="tableDiv1" class="tableLayout" style="vertical-align: top;width: 1000px;page-break-inside:avoid;">
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:left;">
                    <asp:Label ID="Part1Label" runat="server" 
                        Text="<%$ Resources:OdUtilization, Part1Label %>" Font-Underline="True" 
                        Font-Bold="True"></asp:Label>
                    <asp:Label ID="Part1LabelValue" runat="server" Text="<%$ Resources:OdUtilization, Part1LabelValue %>" Font-Bold="True"></asp:Label>
                </div>
            </div>
                
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    <asp:FormView ID="SummaryFormView" runat="server" 
                        DataSourceID="SummaryFormViewDS" CellPadding="4" ForeColor="#333333" 
                        Width="1000px" HorizontalAlign="Center" GridLines="Both">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <div id="section1" class="tableLayout" >

                                <div id="section1Row2" class="tableRow">
                                    <div id="section1Row2Cell1" class="leftTableCell" style="width:65%;">
                                        <asp:Label ID="ctrl_unitLabel" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabel %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="ctrl_unitLabelValue" runat="server" Text='<%# Bind("ctrl_unit") %>' />
                                    </div>
                                    
                                    <div id="section1Row2Cell2" class="rightTableCell"  style="width:34.3%;">
                                        <asp:Label ID="run_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabel %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="run_dateLabelValue" runat="server" Text='<%# Bind("run_date","{0:d MMMM yyyy}") %>' />
                                    </div>
                                </div>
                                
                                <div id="section1Row3" class="tableRow">
                                    <div id="section1Row3Cell1" class="leftTableCell" style="width:65%;">
                                        <div id="section1_2" class="tableLayout">
                                            <div id="section1_2Row1" class="tableRow">
                                                <div id="section1_2Row1Cell1" class="leftTableCell" style="width:34.3%;">
                                                    <b>CIF :</b>&nbsp;
                                                    <asp:TextBox ID="cifTextBox" runat="server" MaxLength="11" style="text-align:right;"
                                                        Text='<%# Bind("cif") %>' Width="11ex" onkeypress="return onKeypressEnter(this,event,'searchCIFButton');">
                                                    </asp:TextBox>
                                                    <asp:Button ID="searchCifButton" runat="server" Text="Search" OnClick="searchCifButton_Click" clientSelector="searchCIFButton" />
                                                </div>
                                                
                                                <div id="section1_2Row1Cell2" class="rightTableCell"  style="width:65%;">
                                                    <asp:Label ID="nameLabel" runat="server" Text="<%$ Resources:OdUtilization, nameLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="nameLabelValue" runat="server" Text='<%# Bind("name") %>' OnPreRender="nameLabel_PreRender"/>
                                                </div>
                                            </div>
                                            
                                            <div id="section1_2Row2" class="tableRow">
                                                <div id="section1_2Row2Cell1" class="leftTableCell" style="width:100%;">
                                                    <asp:Label ID="busi_typeLabel" runat="server" Text="<%$ Resources:OdUtilization, busi_typeLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="busi_typeLabelValue" runat="server" Text='<%# Bind("busi_type") %>' />
                                                    &nbsp;<asp:Label ID="busi_descLabel" runat="server" Text='<%# Bind("busi_desc") %>' />
                                                </div>
                                            </div>

                                            <div id="section1_2Row3" class="tableRow">
                                                <div id="section1_2Row3Cell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:Label ID="idratingLabel" runat="server" Text="<%$ Resources:OdUtilization, idratingLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="idratingLabelValue" runat="server" Text='<%# Bind("idrating") %>' />
                                                </div>
                                            </div>
                                            
                                            <div id="section1_2Row3Half" class="tableRow">
                                                <div id="section1_2Row3HalfCell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:FormView ID="CustomerDetailFormView" runat="server" DataKeyNames="CIF" 
                                                        DataSourceID="CustomerDetailFormViewDS">
                                                        <ItemTemplate>
                                                            <div class="tableLayout" style="vertical-align: top;">
                                                                <div class="tableRow">
                                                                    <div class="leftTableCell" style="width:100%;">
                                                                        <div id="CM_CODE_DIV">
                                                                            <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>" ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='<%# Bind("CM_CODE") %>' ToolTip="CM CODE"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='<%# Bind("CM_NAME") %>' ToolTip="CM NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BRANCH_DIV">
                                                                            <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>" ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BRANCH_ID_Label" runat="server" Text='<%# Bind("BRANCH_ID") %>' ToolTip="BRANCH ID"></asp:Label>
                                                                            <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='<%# Eval("BRANCH_NAME") %>' ToolTip="BRANCH NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="GROUP_SIZE_DIV">
                                                                            <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>" ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='<%# Bind("GROUP_SIZE_DETAIL") %>' ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="JUDGEMENT_DIV">
                                                                            <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>" ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='<%# Bind("JUDGEMENT_DETAIL") %>' ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK1_DIV">
                                                                            <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>" ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK1_ID") %>' ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK1_DETAIL") %>' ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK2_DIV">
                                                                            <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>" ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK2_ID") %>' ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK2_DETAIL") %>' ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK3_DIV">
                                                                            <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>" ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK3_ID_Label" runat="server" Text='<%# Bind("BUSI_RISK3_ID") %>' ToolTip="BUSINESS RISK3 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK3_DETAIL_Label" runat="server" Text='<%# Eval("BUSI_RISK3_DETAIL") %>' ToolTip="BUSINESS RISK3 DETAIL"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <EmptyDataTemplate>
                                                            <div class="tableLayout" style="vertical-align: top;">
                                                                <div class="tableRow">
                                                                    <div class="leftTableCell" style="width:100%;">
                                                                        <div id="CM_CODE_DIV">
                                                                            <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>" ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='N/A' ToolTip="CM CODE"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='' ToolTip="CM NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BRANCH_DIV">
                                                                            <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>" ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BRANCH_ID_Label" runat="server" Text='N/A' ToolTip="BRANCH ID"></asp:Label>
                                                                            <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='' ToolTip="BRANCH NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="GROUP_SIZE_DIV">
                                                                            <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>" ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='N/A' ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="JUDGEMENT_DIV">
                                                                            <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>" ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='N/A' ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK1_DIV">
                                                                            <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>" ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK2_DIV">
                                                                            <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>" ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK3_DIV">
                                                                            <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>" ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK3_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK3 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK3_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK3 DETAIL"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </EmptyDataTemplate>
                                                    </asp:FormView>
                                                    <asp:SqlDataSource ID="CustomerDetailFormViewDS" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                        
                                                        SelectCommand="SELECT CM_CODE, CM_NAME, BRANCH_ID, BRANCH_NAME, GROUP_SIZE_DETAIL, CASE WHEN JUDGEMENT_ID='000' THEN '' ELSE JUDGEMENT_DETAIL END AS JUDGEMENT_DETAIL, BUSI_RISK1_ID, BUSI_RISK1_DETAIL, BUSI_RISK2_ID, BUSI_RISK2_DETAIL, BUSI_RISK3_ID, BUSI_RISK3_DETAIL, CIF FROM CUSTOMER_SME_FULL_DESC WHERE (CIF = @CIF)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" 
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </div>
                                            </div>
                                             
                                            <div id="section1_2Row4" class="tableRow">
                                                <div id="section1_2Row4Cell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:Label ID="accnoLabel" runat="server" Text="<%$ Resources:OdUtilization, accnoLabel %>" Font-Bold="true"></asp:Label>
                                                    <asp:DropDownList ID="accnoList" runat="server" AutoPostBack="True" 
                                                        DataSourceID="accnoListDS" DataTextField="accno" DataValueField="accno"
                                                        OnPreRender="accnoList_PreRender"
                                                        OnDataBound="accnoList_DataBound">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="accnoListDS" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                        SelectCommand="REP_OD_ACCNO_BY_CIF" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" 
                                                                Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    
                                                    <asp:FormView ID="odSummaryFormView" runat="server" CellPadding="4" 
                                                        DataSourceID="odSummaryDS" ForeColor="#333333">
                                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_limLabelValue" runat="server" Text='<%# Bind("od_lim","{0:#,##0.00} บาท") %>' />
                                                                <br />
                                                            <asp:Label ID="od_prinLabel" runat="server" Text="<%$ Resources:OdUtilization, od_prinLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_prinLabelValue" runat="server" Text='<%# Bind("od_prin","{0:#,##0.00} บาท") %>' />
                                                                <br />
                                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="brnameLabelValue" runat="server" Text='<%# Bind("brname") %>' />
                                                                <br />
                                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_intLabelValue" runat="server" Text='<%# Bind("od_int","{0:#,##0.00}%") %>' />
                                                                <br />
                                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='<%# Bind("od_date","{0:d MMMM yyyy}") %>' />
                                                                <br />
                                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="class_hLabelValue" runat="server" Text='<%# Bind("class_h") %>' />
                                                                <br />
                                                        </ItemTemplate>
                                                        <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                        <EmptyDataTemplate>
                                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_limLabelValue" runat="server" Text='<%# Bind("od_lim","{0:#,##0.00} บาท") %>' />
                                                                <br />
                                                            <asp:Label ID="od_prinLabel" runat="server" Text="<%$ Resources:OdUtilization, od_prinLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_prinLabelValue" runat="server" Text='<%# Bind("od_prin","{0:#,##0.00} บาท") %>' />
                                                                <br />
                                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="brnameLabelValue" runat="server" Text='<%# Bind("brname") %>' />
                                                                <br />
                                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_intLabelValue" runat="server" Text='<%# Bind("od_int","{0:#,##0.00}%") %>' />
                                                                <br />
                                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='<%# Bind("od_date") %>' />
                                                                <br />
                                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="class_hLabelValue" runat="server" Text='<%# Bind("class_h") %>' />
                                                                <br />
                                                        </EmptyDataTemplate>
                                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    </asp:FormView>
                                                    <asp:SqlDataSource ID="odSummaryDS" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                        SelectCommand="REP_OD_SUMMARY_BY_ACC" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="accnoList" Name="accno" 
                                                                PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div><!-- end div section1_2Row4Cell1 -->
                                                
                                            </div>
                                            
                                        </div><!-- end div section1_2 -->
                                    </div><!-- end div section1Row3Cell1 -->
                                    
                                    <div id="section1Row3Cell2" class="rightTableCell" style="width:34.3%;text-align:center;">
                                        <asp:GridView ID="CreditodSummaryGridView" runat="server" HorizontalAlign="Center"
                                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="CreditSummaryDS" 
                                            ForeColor="#333333" Font-Names="Arial" Font-Size="Small" 
                                            ShowFooter="True" OnPreRender="CreditOdSummaryGridView_PreRender"
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
                                                        <asp:Label ID="LIMITLabel" runat="server" 
                                                            Text='<%# Eval("LIMIT", "{0:#,###}") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="LIMITLabel" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LIMITLabel" runat="server" 
                                                            Text='<%# Bind("LIMIT", "{0:#,###}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="PRIN" SortExpression="PRIN">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="PRINLabel" runat="server" 
                                                            Text='<%# Eval("PRIN", "{0:#,###}") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="PRINLabel" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="PRINLabel" runat="server" 
                                                            Text='<%# Bind("PRIN", "{0:#,###}") %>'></asp:Label>
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
                                        <asp:SqlDataSource ID="CreditSummaryDS" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                            SelectCommand="REP_OD_CREDIT_SUMMARY" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="cifTextBox" Name="CIF" PropertyName="Text" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div><!-- end div section1Row3Cell2 -->
                                </div><!-- end div section1Row3 -->

                            </div><!-- end div section1 -->
                        </ItemTemplate>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <EmptyDataTemplate>
                            <div id="section1" class="tableLayout" >

                                <div id="section1Row2" class="tableRow">
                                    <div id="section1Row2Cell1" class="leftTableCell" style="width:65%;">
                                        <asp:Label ID="ctrl_unitLabel" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabel %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="ctrl_unitLabelValue" runat="server" Text="<%$ Resources:OdUtilization, ctrl_unitLabelValue %>" />
                                    </div>
                                    
                                    <div id="section1Row2Cell2" class="rightTableCell"  style="width:34.3%;">
                                        <asp:Label ID="run_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabel %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="run_dateLabelValue" runat="server" Text="<%$ Resources:OdUtilization, run_dateLabelValue %>" />
                                    </div>
                                </div>
                                
                                <div id="section1Row3" class="tableRow">
                                    <div id="section1Row3Cell1" class="leftTableCell" style="width:65%;">
                                        <div id="section1_2" class="tableLayout">
                                            <div id="section1_2Row1" class="tableRow">
                                                <div id="section1_2Row1Cell1" class="leftTableCell" style="width:34.3%;">
                                                    <b>CIF :</b>&nbsp;
                                                    <asp:TextBox ID="cifTextBox" runat="server" MaxLength="11" style="text-align:right;"
                                                        Text='' Width="11ex" OnPreRender="cifTextBoxEmpty_PreRender"
                                                         onkeypress="return onKeypressEnter(this,event,'searchCIFButton');">
                                                    </asp:TextBox>
                                                    <asp:Button ID="searchCifButton" runat="server" Text="Search" OnClick="searchCifButton_Click" clientSelector="searchCIFButton" />
                                                </div>
                                                
                                                <div id="section1_2Row1Cell2" class="rightTableCell"  style="width:65%;">
                                                    <asp:Label ID="nameLabel" runat="server" Text="<%$ Resources:OdUtilization, nameLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="nameLabelValue" runat="server" Text="<%$ Resources:OdUtilization, nameLabelValue %>" />
                                                </div>
                                            </div>
                                            
                                            <div id="section1_2Row2" class="tableRow">
                                                <div id="section1_2Row2Cell1" class="leftTableCell" style="width:100%;">
                                                    <asp:Label ID="busi_typeLabel" runat="server" Text="<%$ Resources:OdUtilization, busi_typeLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="busi_typeLabelValue" runat="server" Text='N/A' />
                                                    &nbsp;<asp:Label ID="busi_descLabel" runat="server" Text='' />
                                                </div>
                                            </div>

                                            <div id="section1_2Row3" class="tableRow">
                                                <div id="section1_2Row3Cell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:Label ID="idratingLabel" runat="server" Text="<%$ Resources:OdUtilization, idratingLabel %>" Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="idratingLabelValue" runat="server" Text='N/A' />
                                                </div>
                                            </div>
                                            
                                            <div id="section1_2Row3Half" class="tableRow">
                                                <div id="section1_2Row3HalfCell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:FormView ID="CustomerDetailFormView" runat="server">
                                                        <EmptyDataTemplate>
                                                            <div class="tableLayout" style="vertical-align: top;">
                                                                <div class="tableRow">
                                                                    <div class="leftTableCell" style="width:100%;">
                                                                        <div id="CM_CODE_DIV">
                                                                            <asp:Label ID="CM_CODE_Label" runat="server" Text="<%$ Resources:OdUtilization, CM_CODE_Label %>" ToolTip="CM ผู้ดูแล" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_ID_Label" runat="server" Text='N/A' ToolTip="CM CODE"></asp:Label>
                                                                            <asp:Label ID="CM_CODE_NAME_Label" runat="server" Text='' ToolTip="CM NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BRANCH_DIV">
                                                                            <asp:Label ID="BRANCH_Label" runat="server" Text="<%$ Resources:OdUtilization, BRANCH_Label %>" ToolTip="สาขา" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BRANCH_ID_Label" runat="server" Text='N/A' ToolTip="BRANCH ID"></asp:Label>
                                                                            <asp:Label ID="BRANCH_NAME_Label" runat="server" Text='' ToolTip="BRANCH NAME"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="GROUP_SIZE_DIV">
                                                                            <asp:Label ID="GROUP_SIZE_Label" runat="server" Text="<%$ Resources:OdUtilization, GROUP_SIZE_Label %>" ToolTip="GROUP SIZE" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="GROUP_SIZE_DETAIL_Label" runat="server" Text='N/A' ToolTip="GROUP SIZE DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="JUDGEMENT_DIV">
                                                                            <asp:Label ID="JUDGEMENT_Label" runat="server" Text="<%$ Resources:OdUtilization, JUDGEMENT_Label %>" ToolTip="JUDGEMENT" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="JUDGEMENT_DETAIL_Label" runat="server" Text='N/A' ToolTip="JUDGEMENT DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK1_DIV">
                                                                            <asp:Label ID="BUSI_RISK1_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK1_Label %>" ToolTip="BUSINESS RISK1" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK1 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK1_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK1 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK2_DIV">
                                                                            <asp:Label ID="BUSI_RISK2_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK2_Label %>" ToolTip="BUSINESS RISK2" Font-Bold="True"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_ID_Label" runat="server" Text='N/A' ToolTip="BUSINESS RISK2 ID"></asp:Label>
                                                                            <asp:Label ID="BUSI_RISK2_DETAIL_Label" runat="server" Text='' ToolTip="BUSINESS RISK2 DETAIL"></asp:Label>
                                                                        </div>
                                                                        
                                                                        <div id="BUSI_RISK3_DIV">
                                                                            <asp:Label ID="BUSI_RISK3_Label" runat="server" Text="<%$ Resources:OdUtilization, BUSI_RISK3_Label %>" ToolTip="BUSINESS RISK3" Font-Bold="True"></asp:Label>
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
                                             
                                            <div id="section1_2Row4" class="tableRow">
                                                <div id="section1_2Row4Cell1" class="leftTableCell"  style="width:100%;">
                                                    <asp:Label ID="accnoLabel" runat="server" Text="<%$ Resources:OdUtilization, accnoLabel %>" Font-Bold="true"></asp:Label>
                                                    <asp:DropDownList ID="accnoList" runat="server" AutoPostBack="True" 
                                                        DataTextField="accno" DataValueField="accno"
                                                        OnPreRender="accnoList_PreRender">
                                                        <asp:ListItem>N/A</asp:ListItem>
                                                    </asp:DropDownList>
                                                    
                                                    <asp:FormView ID="odSummaryFormView" runat="server" CellPadding="4" 
                                                        DataSourceID="odSummaryDS" ForeColor="#333333">
                                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                        <EmptyDataRowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                        <EmptyDataTemplate>
                                                            <asp:Label ID="od_limLabel" runat="server" Text="<%$ Resources:OdUtilization, od_limLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_limLabelValue" runat="server" Text='N/A' />
                                                                <br />
                                                            <asp:Label ID="brnameLabel" runat="server" Text="<%$ Resources:OdUtilization, brnameLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="brnameLabelValue" runat="server" Text='N/A' />
                                                                <br />
                                                            <asp:Label ID="od_intLabel" runat="server" Text="<%$ Resources:OdUtilization, od_intLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_intLabelValue" runat="server" Text='N/A' />
                                                                <br />
                                                            <asp:Label ID="od_dateLabel" runat="server" Text="<%$ Resources:OdUtilization, od_dateLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="od_dateLabelValue" runat="server" Text='N/A' />
                                                                <br />
                                                            <asp:Label ID="class_hLabel" runat="server" Text="<%$ Resources:OdUtilization, class_hLabel %>" Font-Bold="true"></asp:Label>
                                                            <asp:Label ID="class_hLabelValue" runat="server" Text='N/A' />
                                                                <br />
                                                        </EmptyDataTemplate>
                                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                    </asp:FormView>
                                                    <asp:SqlDataSource ID="odSummaryDS" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                                        SelectCommand="REP_OD_SUMMARY_BY_ACC" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="accnoList" Name="accno" 
                                                                PropertyName="SelectedValue" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div><!-- end div section1_2Row4Cell1 -->
                                                
                                            </div>
                                        </div><!-- end div section1_2 -->
                                    </div><!-- end div section1Row3Cell1 -->
                                    
                                    <div id="section1Row3Cell2" class="rightTableCell" style="width:34.3%;text-align:center;">
                                        &nbsp;
                                    </div><!-- end div section1Row3Cell2 -->
                                </div><!-- end div section1Row3 -->
                            </div><!-- end div section1 -->
                        </EmptyDataTemplate>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="SummaryFormViewDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="REP_OD_SUMMARY_BY_CIF" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="CIF" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div><!-- end <div class="tableRow"> -->
            
            <div class="tableRow"><!-- space row -->
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    &nbsp;
                </div>
            </div><!-- end space row -->
            
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:left;">
                    <asp:Label ID="Part2Label" runat="server" 
                        Text="<%$ Resources:OdUtilization, Part2Label %>" Font-Underline="True" 
                        Font-Bold="True"></asp:Label>
                    <asp:Label ID="Part2LabelValue" runat="server" 
                        Text="<%$ Resources:OdUtilization, Part2LabelValue %>" Font-Bold="True"></asp:Label>
                </div>
            </div>
            
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:left;">
                    <asp:GridView ID="riskTableGridView" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="riskTableGridViewDS" ForeColor="#333333" 
                        Font-Names="Arial" Font-Size="Small" style="margin-bottom: 0px">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="CriteriaMovement" HeaderText="Criteria" 
                                ReadOnly="True" SortExpression="CriteriaMovement">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Movement(Avg)" 
                                HeaderText="Movement(Avg)" ReadOnly="True" SortExpression="Movement(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Movement(Last)" 
                                HeaderText="Movement(Last)" ReadOnly="True" SortExpression="Movement(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CriteriaUtilize" HeaderText="Criteria" 
                                ReadOnly="True" SortExpression="CriteriaUtilize">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Utilization(Avg)" 
                                HeaderText="Utilization(Avg)" ReadOnly="True" SortExpression="Utilization(Avg)">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Utilization(Last)" 
                                HeaderText="Utilization(Last)" ReadOnly="True" 
                                SortExpression="Utilization(Last)">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CriteriaCheque" HeaderText="Criteria" 
                                ReadOnly="True" SortExpression="CriteriaCheque">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Withdraw" 
                                HeaderText="Withdraw" ReadOnly="True" SortExpression="Withdraw">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Deposit" 
                                HeaderText="Deposit" ReadOnly="True" SortExpression="Deposit">
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
                    <asp:SqlDataSource ID="riskTableGridViewDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="REP_OD_RISK_TABLE" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" 
                                PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
            <div class="tableRow"><!-- space row -->
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    &nbsp;
                </div>
            </div><!-- end space row -->
            
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:left;">
                    <asp:Label ID="Part3Label" runat="server" 
                        Text="<%$ Resources:OdUtilization, Part3Label %>" Font-Underline="True" 
                        Font-Bold="True"></asp:Label>
                    <asp:Label ID="Part3LabelValue" runat="server" Text="<%$ Resources:OdUtilization, Part3LabelValue %>" Font-Bold="True"></asp:Label>
                </div>
            </div>
            
            <div class="tableRow">    
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    <asp:SqlDataSource ID="odSummaryGridViewDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="REP_OD_SUMMARY_CHART" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="accnoHiddenField" Name="accno" 
                                PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="odSummaryGridView" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="odSummaryGridViewDS" ForeColor="#333333" HorizontalAlign="Center" 
                        Width="1000px" Font-Bold="False" Font-Names="Arial" 
                        Font-Overline="False" Font-Size="Small" Font-Strikeout="False" 
                        Caption="<%$ Resources:OdUtilization, odSummaryGridView_Unit %>" CaptionAlign="Right">
                        <RowStyle BackColor="#EFF3FB" Wrap="True" />
                        <Columns>
                            <asp:BoundField DataField="SUMMARY" HeaderText="SUMMARY" ReadOnly="True" 
                                SortExpression="SUMMARY" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam12" HeaderText="mvmdam12" ReadOnly="True" 
                                SortExpression="mvmdam12" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam11" HeaderText="mvmdam11" ReadOnly="True" 
                                SortExpression="mvmdam11" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam10" HeaderText="mvmdam10" ReadOnly="True" 
                                SortExpression="mvmdam10" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam09" HeaderText="mvmdam09" ReadOnly="True" 
                                SortExpression="mvmdam09" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam08" HeaderText="mvmdam08" 
                                SortExpression="mvmdam08" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam07" HeaderText="mvmdam07" ReadOnly="True" 
                                SortExpression="mvmdam07" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam06" HeaderText="mvmdam06" ReadOnly="True" 
                                SortExpression="mvmdam06" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam05" HeaderText="mvmdam05" ReadOnly="True" 
                                SortExpression="mvmdam05" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam04" HeaderText="mvmdam04" ReadOnly="True" 
                                SortExpression="mvmdam04" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam03" HeaderText="mvmdam03" ReadOnly="True" 
                                SortExpression="mvmdam03" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam02" HeaderText="mvmdam02" ReadOnly="True" 
                                SortExpression="mvmdam02" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdam01" HeaderText="mvmdam01" ReadOnly="True" 
                                SortExpression="mvmdam01" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mvmdr_avg" HeaderText="<%$ Resources:OdUtilization, odSummaryGridView_Header3 %>" ReadOnly="True" 
                                SortExpression="mvmdr_avg" DataFormatString="{0:#,###}" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="run_date" HeaderText="run_date" ReadOnly="True" 
                                SortExpression="run_date" Visible="False" >
                            <ItemStyle Wrap="False" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </div>
            </div>
            
            <div class="tableRow"><!-- space row -->
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    &nbsp;
                </div>
            </div><!-- end space row -->
                
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    <asp:GridView ID="chequeGridView" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="chequeGridViewDS" ForeColor="#333333" 
                        HorizontalAlign="Left" Font-Names="Arial" Font-Size="Small" 
                        Caption="<%$ Resources:OdUtilization, chequeGridView_Unit %>" CaptionAlign="Right">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="SUMMARY" HeaderText="SUMMARY" ReadOnly="True" 
                                SortExpression="SUMMARY" />
                            <asp:BoundField DataField="chqre_dact" HeaderText="No." 
                                SortExpression="chqre_dact" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqre_daca" DataFormatString="{0:#,###.##}" 
                                HeaderText="Amount" SortExpression="chqre_daca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqrdt01" HeaderText="No." 
                                SortExpression="chqrdt01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqred01" DataFormatString="{0:#,###.##}" 
                                HeaderText="Amount" SortExpression="chqred01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqre_cact" HeaderText="No." 
                                SortExpression="chqre_cact" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqre_caca" DataFormatString="{0:#,###.##}" 
                                HeaderText="Amount" SortExpression="chqre_caca" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqrct01" HeaderText="No." 
                                SortExpression="chqrct01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="chqrec01" DataFormatString="{0:#,###.##}" 
                                HeaderText="Amount" SortExpression="chqrec01" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="run_date" HeaderText="run_date" 
                                SortExpression="run_date" Visible="False" ReadOnly="True" />
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="chequeGridViewDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                        SelectCommand="REP_OD_CHEQUE_SUMMARY" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="accnoHiddenField" Name="ACCNO" 
                                PropertyName="Value" Type="String" />
                        </SelectParameters>

                    </asp:SqlDataSource>
                </div>
            </div>
        </div> <%-- end id="tableDiv1" --%>
        
        <div id="tableDiv2" class="tableLayout" style="vertical-align: top;width: 1000px;page-break-inside:avoid;page-break-before:always;">
            <div class="tableRow">
                <div class="leftTableCell" style="width:100%;text-align:center;">
                    <DCWC:Chart ID="odSummaryChart" runat="server" 
                        BackGradientEndColor="White" 
                        BorderLineColor="LightSlateGray" BorderLineStyle="Solid" Height="1500px" 
                        Palette="WaterLilies" Width="1000px" ImageStorageMode="UseImageUrl"
                        ImageUrl="~/images/dundas/MoveMentChartPic_#SEQ(300,3)" >
                        <Legends>
                            <DCWC:Legend BackColor="200, 235, 245, 255" BorderColor="LightSlateGray" 
                                Enabled="False" Name="Default">
                            </DCWC:Legend>
                            <DCWC:Legend Alignment="Center" BackColor="200, 235, 245, 255" 
                                BorderColor="LightSlateGray" Docking="Top" DockInsideChartArea="False" 
                                DockToChartArea="movementArea" Name="movementLegend">
                            </DCWC:Legend>
                            <DCWC:Legend Alignment="Center" BackColor="200, 235, 245, 255" 
                                BorderColor="LightSlateGray" Docking="Top" DockInsideChartArea="False" 
                                DockToChartArea="utilizationArea" Name="utilizationLegend">
                            </DCWC:Legend>
                            <DCWC:Legend Alignment="Center" BackColor="200, 235, 245, 255" 
                                BorderColor="LightSlateGray" Docking="Top" DockInsideChartArea="False" 
                                DockToChartArea="balanceArea" Name="balanceLegend">
                            </DCWC:Legend>
                        </Legends>
                        <Annotations>
                            <DCWC:CalloutAnnotation Name="Callout1" 
                                Text="Set this in code behind" 
                                TextFont="Microsoft Sans Serif, 12pt" Multiline="True" X="5" Y="94">
                                <SmartLabels AllowOutsidePlotArea="Yes" Enabled="True" 
                                    MarkerOverlapping="True" />
                            </DCWC:CalloutAnnotation>
                        </Annotations>
                        <UI>
                            <Toolbar BackColor="Transparent" BorderStyle="NotSet">
                                <BorderSkin FrameBackColor="SteelBlue" FrameBackGradientEndColor="LightBlue" 
                                    PageColor="Transparent" />
                            </Toolbar>
                        </UI>
                        <Titles>
                            <DCWC:Title DockInsideChartArea="False" DockToChartArea="movementArea" 
                                Font="Microsoft Sans Serif, 12pt, style=Bold" Name="movementTitle" 
                                Text="Deposit & Withdraw Amount(Exclude P/N)">
                            </DCWC:Title>
                            <DCWC:Title DockInsideChartArea="False" DockToChartArea="utilizationArea" 
                                Font="Microsoft Sans Serif, 12pt, style=Bold" Name="utilizationTitle" 
                                Text="Out Standing Balance">
                            </DCWC:Title>
                            <DCWC:Title DockInsideChartArea="False" DockToChartArea="balanceArea" 
                                Font="Microsoft Sans Serif, 12pt, style=Bold" Name="balanceTitle" 
                                Text="Highest Debt & Lowest Debt On a Day Of Each Month">
                            </DCWC:Title>
                        </Titles>
                        <Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="TopBottom" BorderColor="64, 64, 64" ChartArea="movementArea" 
                                ChartType="Area" Color="153, 204, 255" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="51, 153, 255" 
                                Legend="movementLegend" Name="Limit" ShowLabelAsValue="True" 
                                LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="movementArea" ChartType="Line" Color="Red" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="Red" 
                                Legend="movementLegend" MarkerStyle="Square" Name="Debit" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="movementArea" ChartType="Line" Color="Lime" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="0, 204, 0" 
                                Legend="movementLegend" MarkerStyle="Cross" Name="Credit" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="TopBottom" BorderColor="64, 64, 64" 
                                ChartArea="utilizationArea" ChartType="Area" Color="153, 204, 255" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="51, 153, 255" 
                                Legend="utilizationLegend" LegendText="Limit" Name="Limit2" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="utilizationArea" ChartType="Line" Color="Blue" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="Blue" 
                                Legend="utilizationLegend" MarkerStyle="Circle" Name="Utilization" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="utilizationArea" ChartType="Line" Color="255, 128, 0" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="236, 118, 0" 
                                Legend="utilizationLegend" MarkerStyle="Diamond" Name="%Utilization" 
                                ShowLabelAsValue="True" YAxisType="Secondary" LabelFormat="P2">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="TopBottom" BorderColor="64, 64, 64" ChartArea="balanceArea" 
                                ChartType="Area" Color="153, 204, 255" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="51, 153, 255" 
                                Legend="balanceLegend" LegendText="Limit" Name="Limit3" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="balanceArea" ChartType="Line" Color="192, 0, 192" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="192, 0, 192" 
                                Legend="balanceLegend" MarkerStyle="Star5" Name="Maximum" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                            <DCWC:Series BackGradientEndColor="200, 195, 205, 220" 
                                BackGradientType="VerticalCenter" BorderColor="64, 64, 64" BorderWidth="3" 
                                ChartArea="balanceArea" ChartType="Line" Color="192, 192, 0" 
                                CustomAttributes="DrawingStyle=LightToDark" 
                                Font="Microsoft Sans Serif, 8.25pt, style=Bold" FontColor="192, 192, 0" 
                                Legend="balanceLegend" MarkerStyle="Star10" Name="Minimum" 
                                ShowLabelAsValue="True" LabelFormat="#,###">
                                <SmartLabels Enabled="True" />
                            </DCWC:Series>
                        </Series>
                        <ChartAreas>
                            <DCWC:ChartArea BackColor="100, 235, 245, 255" 
                                BackGradientEndColor="235, 245, 255" BorderColor="200, 0, 0, 0" 
                                Name="movementArea">
                                <AxisY IntervalAutoMode="VariableCount" LabelsAutoFit="False" Title="Thousand Baht" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <MajorTickMark Style="Cross" />
                                    <LabelStyle Format="#,##0" />
                                </AxisY>
                                <AxisX Interlaced="True" LabelsAutoFit="False" Interval="1" Title="Month" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" Interval="Auto" 
                                        Enabled="False" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <MajorTickMark Enabled="False" Interval="Auto" />
                                    <LabelStyle Interval="1" ShowEndLabels="False" />
                                </AxisX>
                                <Area3DStyle WallWidth="0" />
                            </DCWC:ChartArea>
                            <DCWC:ChartArea BackColor="100, 235, 245, 255" 
                                BackGradientEndColor="235, 245, 255" BorderColor="200, 0, 0, 0" 
                                Name="utilizationArea" AlignWithChartArea="movementArea">
                                <AxisY IntervalAutoMode="VariableCount" LabelsAutoFit="False" Title="Thousand Baht" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <MajorTickMark Style="Cross" />
                                    <LabelStyle Format="#,##0" />
                                </AxisY>
                                <AxisX Interlaced="True" LabelsAutoFit="False" Interval="1" Title="Month" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" Interval="Auto" 
                                        Enabled="False" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <MajorTickMark Enabled="False" />
                                    <LabelStyle ShowEndLabels="False" />
                                </AxisX>
                                <AxisY2 Enabled="True" Maximum="110">
                                    <MajorGrid LineStyle="DashDotDot" />
                                    <MajorTickMark Style="Cross" />
                                    <LabelStyle Format="P" />
                                </AxisY2>
                                <Area3DStyle WallWidth="0" />
                            </DCWC:ChartArea>
                            <DCWC:ChartArea BackColor="100, 235, 245, 255" 
                                BackGradientEndColor="235, 245, 255" BorderColor="200, 0, 0, 0" 
                                Name="balanceArea" AlignWithChartArea="movementArea">
                                <AxisY Crossing="0" IntervalAutoMode="VariableCount" LabelsAutoFit="False" 
                                    StartFromZero="False" Title="Thousand Baht" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <LabelStyle Format="#,##0" />
                                </AxisY>
                                <AxisX Interlaced="True" LabelsAutoFit="False" 
                                    MarksNextToAxis="False" Interval="1" Title="Month" 
                                    TitleFont="Microsoft Sans Serif, 12pt">
                                    <MajorGrid LineColor="65, 0, 0, 0" LineStyle="Dash" Enabled="False" 
                                        Interval="Auto" />
                                    <MinorGrid LineColor="30, 0, 0, 0" LineStyle="Dash" />
                                    <MajorTickMark Enabled="False" Interval="Auto" />
                                    <LabelStyle ShowEndLabels="False" />
                                </AxisX>
                                <Area3DStyle WallWidth="0" />
                            </DCWC:ChartArea>
                        </ChartAreas>
                        <BorderSkin FrameBackColor="SteelBlue" FrameBackGradientEndColor="LightBlue" 
                            PageColor="AliceBlue" />
                    </DCWC:Chart>
                </div>
            </div>
        </div>
</asp:Content>
