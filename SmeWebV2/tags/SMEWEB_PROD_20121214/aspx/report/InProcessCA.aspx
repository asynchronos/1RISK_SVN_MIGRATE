<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="InProcessCA.aspx.vb" Inherits="aspx.report.InProcessCA" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .urgent
        {
            font-size: medium;
            font-weight: bold;
            color: Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle" style="width:199px;height:64px;top: 25%;left:43%;background-image: url(../../images/progress/rectangle/3MA_loadingcontent.gif);">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="Label_Header" runat="server" Text="กลุ่มงาน : "></asp:Label>
                        <asp:DropDownList ID="DDL_Level" runat="server" AutoPostBack="True" DataSourceID="DS_LevelGrouping"
                            DataTextField="LAST_PROCESS_LEVEL_NAME" 
                            DataValueField="LAST_PROCESS_LEVEL_ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_LevelGrouping" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CA_REPORT.P_CA_IN_PROCESS_LEVEL_DROPDOWN" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
                                <asp:QueryStringParameter DefaultValue="no" Name="SINGLE" QueryStringField="single"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GV_InProcessCA" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="DS_InProcessCA" ForeColor="#333333"
                            Width="100%" Font-Size="Small">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImgBt_Select" runat="server" ImageUrl="~/images/word.gif" CausesValidation="false"
                                            AlternateText="Detail" OnClientClick='<%# "var creditPopup = window.open(""" + Page.ResolveUrl("~/aspx/annals/annalscredit.aspx?annals_id=") + Eval("OLD_ID").toString() + """,""creditPopup"",""toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();return false;" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="OLD_ID" DataFormatString="{0:######/####}" HeaderText="เลขที่หนังสือ"
                                    ReadOnly="True" SortExpression="OLD_ID">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUBJECT_GROUP" HeaderText="ประเภทหนังสือ" SortExpression="SUBJECT_GROUP">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="REGION_DESC" HeaderText="ภาค" 
                                    SortExpression="REGION_DESC">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ชื่อลูกค้า" SortExpression="FIRST_CIF_NAME">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label_CusName" runat="server" Text='<%# Eval("FIRST_CIF_NAME") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label_CusName" runat="server" Text='<%# Bind("FIRST_CIF_NAME") %>' 
                                            ToolTip='<%# Eval("FIRST_CIF", "FIRST CIF : {0:#}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CA_CREATE_DATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="วันที่เข้า"
                                    SortExpression="CA_CREATE_DATE">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ขั้นตอนดำเนินการล่าสุด" SortExpression="LAST_PROCESS">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox_LastProcess" runat="server" Text='<%# Bind("LAST_PROCESS") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label_LastProcess" runat="server" 
                                            Text='<%# Eval("LAST_PROCESS").toString().Substring(Eval("LAST_PROCESS").IndexOf(":"c) + 1) %>' 
                                            ToolTip='<%# Eval("LAST_PROCESS_ID", "PROCESS ID : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="LAST_PROCESS_DATE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="วันที่ดำเนินการ"
                                    SortExpression="LAST_PROCESS_DATE">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="ผู้ดำเนินการ" 
                                    SortExpression="LAST_PROCESS_EMP_NAME">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label_EmpName" runat="server" Text='<%# Eval("LAST_PROCESS_EMP_NAME") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label_EmpName" runat="server" Text='<%# Bind("LAST_PROCESS_EMP_NAME") %>'
                                            ToolTip='<%# Eval("LAST_PROCESS_EMP_ID", "LAST PROCESS EMP ID : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="เวลาที่ใช้ดำเนินการ" SortExpression="TIME_USE">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox_TimeUse" runat="server" Text='<%# Bind("TIME_USE") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label_TimeUse" runat="server" 
                                            Text='<%# Eval("TIME_USE", "{0:#,##0.00}") %>'
                                            ToolTip='<%# Math.Floor(Eval("TIME_USE")).toString() + "วัน " + Math.Floor((Eval("TIME_USE")-Math.Floor(Eval("TIME_USE")))*8).toString() + "ชม." %>' ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ประเภทลูกค้า" SortExpression="SIZE_DETAIL">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox_SizeDetail" runat="server" Text='<%# Bind("SIZE_DETAIL") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label_SizeDetail" runat="server" 
                                            Text='<%# Bind("SIZE_DETAIL") %>' ToolTip='<%# Eval("SIZE_ID", "SIZE ID : {0}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="DS_InProcessCA" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                            SelectCommand="CA_REPORT.P_CA_IN_PROCESS" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EMP_ID" SessionField="EMP_ID" Type="String" />
                                <asp:ControlParameter ControlID="DDL_Level" Name="LEVEL_ID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:QueryStringParameter DefaultValue="no" Name="SINGLE" QueryStringField="single"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
