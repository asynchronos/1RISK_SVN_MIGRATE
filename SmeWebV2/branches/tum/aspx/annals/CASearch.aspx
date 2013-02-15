<%@ Page Title="Search CA" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="CASearch.aspx.vb" Inherits="aspx.annals.CASearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        Caption
        {
            font-weight: bold;
            font-size: medium;
            color: Red;
            text-align: center;
        }
        #CA_NO_CIF_GRID Caption
        {
            color: Red;
        }
        #CA_GRID Caption
        {
            color: Green;
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
    <asp:Panel ID="FilterPanel" runat="server" HorizontalAlign="Center" Wrap="False">
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle" style="width:199px;height:64px;top: 25%;left:40%;background-image: url(../../images/progress/rectangle/3MA_loadingcontent.gif);">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:DropDownList ID="FilterColumnDDL1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="ID">เลขที่หนังสือ</asp:ListItem>
                    <asp:ListItem Value="CIF">CIF</asp:ListItem>
                    <asp:ListItem Value="Undertaker">ผู้รับผิดชอบ</asp:ListItem>
                    <asp:ListItem Value="BRANCH_ID">Branch_ID</asp:ListItem>
                    <asp:ListItem Value="BRANCH">Branch</asp:ListItem>
                    <asp:ListItem Value="REGION_ID">Region_ID</asp:ListItem>
                    <asp:ListItem Value="REGION">Region</asp:ListItem>
                    <asp:ListItem Value="PROCESS_ID">Process</asp:ListItem>
                    <asp:ListItem Value="PROCESS_GROUP">Process Group</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="FilterValueText1" runat="server"></asp:TextBox>
                <asp:DropDownList ID="FilterValueDDL1" runat="server" 
                    DataSourceID="CAYearDataSource" DataTextField="ANNALS_YEAR_TH" 
                    DataValueField="ANNALS_YEAR">
                </asp:DropDownList>
            <br />
                <asp:DropDownList ID="FilterColumnDDL2" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="ID">เลขที่หนังสือ</asp:ListItem>
                    <asp:ListItem Value="CIF">CIF</asp:ListItem>
                    <asp:ListItem Value="Undertaker">ผู้รับผิดชอบ</asp:ListItem>
                    <asp:ListItem Value="BRANCH_ID">Branch_ID</asp:ListItem>
                    <asp:ListItem Value="BRANCH">Branch</asp:ListItem>
                    <asp:ListItem Value="REGION_ID">Region_ID</asp:ListItem>
                    <asp:ListItem Value="REGION">Region</asp:ListItem>
                    <asp:ListItem Value="PROCESS_ID">Process</asp:ListItem>
                    <asp:ListItem Value="PROCESS_GROUP">Process Group</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="FilterValueText2" runat="server"></asp:TextBox>
                <asp:DropDownList ID="FilterValueDDL2" runat="server" 
                    DataSourceID="CAYearDataSource" DataTextField="ANNALS_YEAR_TH" 
                    DataValueField="ANNALS_YEAR">
                </asp:DropDownList>
            <br />
                <asp:DropDownList ID="FilterColumnDDL3" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="ID">เลขที่หนังสือ</asp:ListItem>
                    <asp:ListItem Value="CIF">CIF</asp:ListItem>
                    <asp:ListItem Value="Undertaker">ผู้รับผิดชอบ</asp:ListItem>
                    <asp:ListItem Value="BRANCH_ID">Branch_ID</asp:ListItem>
                    <asp:ListItem Value="BRANCH">Branch</asp:ListItem>
                    <asp:ListItem Value="REGION_ID">Region_ID</asp:ListItem>
                    <asp:ListItem Value="REGION">Region</asp:ListItem>
                    <asp:ListItem Value="PROCESS_ID">Process</asp:ListItem>
                    <asp:ListItem Value="PROCESS_GROUP">Process Group</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="FilterValueText3" runat="server"></asp:TextBox>
                <asp:DropDownList ID="FilterValueDDL3" runat="server" 
                    DataSourceID="CAYearDataSource" DataTextField="ANNALS_YEAR_TH" 
                    DataValueField="ANNALS_YEAR">
                </asp:DropDownList>
            <br />
                <asp:DropDownList ID="FilterColumnDDL4" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="ID">เลขที่หนังสือ</asp:ListItem>
                    <asp:ListItem Value="CIF">CIF</asp:ListItem>
                    <asp:ListItem Value="Undertaker">ผู้รับผิดชอบ</asp:ListItem>
                    <asp:ListItem Value="BRANCH_ID">Branch_ID</asp:ListItem>
                    <asp:ListItem Value="BRANCH">Branch</asp:ListItem>
                    <asp:ListItem Value="REGION_ID">Region_ID</asp:ListItem>
                    <asp:ListItem Value="REGION">Region</asp:ListItem>
                    <asp:ListItem Value="PROCESS_ID">Process</asp:ListItem>
                    <asp:ListItem Value="PROCESS_GROUP">Process Group</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="FilterValueText4" runat="server"></asp:TextBox>
                <asp:DropDownList ID="FilterValueDDL4" runat="server" 
                    DataSourceID="CAYearDataSource" DataTextField="ANNALS_YEAR_TH" 
                    DataValueField="ANNALS_YEAR">
                </asp:DropDownList>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="BranchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT Id_Branch, Branch_T FROM Id_Branch ORDER BY Id_Branch">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="RegionDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT Id_Region, Region_Name FROM Id_Region ORDER BY Id_Region">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ProcessDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT PROCESS_ID, PROCESS FROM ANNALS_PROCESS ORDER BY PROCESS_ID">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="ProcessGroupDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SELECT PEOCESS_HEAD, PROCESS_GROUP FROM ANNALS_PROCESS GROUP BY PEOCESS_HEAD, PROCESS_GROUP ORDER BY PROCESS_GROUP">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CAYearDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
            SelectCommand="SELECT DISTINCT ANNALS_YEAR, ANNALS_YEAR + 543 AS ANNALS_YEAR_TH FROM ANNALS ORDER BY ANNALS_YEAR DESC">
        </asp:SqlDataSource>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
            DisplayAfter="0">
            <ProgressTemplate>
                <div class="loadingStyle" style="top: 45%;">
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" />
                    <br />
                </asp:Panel>
                <br />
                <asp:GridView ID="CA_NO_CIF_GRID" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ANNALS_TYPE,ANNALS_SEQ_NO,ANNALS_YEAR,PROCESS_ID"
                    DataSourceID="SqlDataSource2" Font-Size="Small" ForeColor="#333333" GridLines="None"
                    PageSize="10" Width="100%" Caption="รายการ CA ที่ไม่มี CIF ในฐานข้อมูล" CaptionAlign="Top">
                    <PagerSettings Mode="NumericFirstLast" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField HeaderText="เลขที่หนังสือ">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + "/" + (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + "/" + (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Undertaker" HeaderText="รหัสผู้รับผิดชอบ" SortExpression="Undertaker">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UndertakerName" HeaderText="ชื่อผู้รับผิดชอบ" SortExpression="UndertakerName">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MAIN_CIF_NAME" HeaderText="ชื่อลูกค้า" SortExpression="MAIN_CIF_NAME" />
                        <asp:BoundField DataField="BRANCH_ID" HeaderText="BRANCH_ID" SortExpression="BRANCH_ID">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="REGION_ID" HeaderText="REGION_ID" SortExpression="REGION_ID">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROCESS" HeaderText="PROCESS" SortExpression="PROCESS">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROCESS_DATE" HeaderText="PROCESS_DATE" SortExpression="PROCESS_DATE">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/word.gif" OnClientClick='<%# "var creditPopup = window.open(""annalscredit.aspx?annals_id=" + Eval("ID") + """,""creditPopup"",""toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();" %>' />
                            </ItemTemplate>
                            <HeaderTemplate>
                                Detail
                            </HeaderTemplate>
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="Annals_Credit_No_Cif_Search_Filter" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="VIEWER" SessionField="EMP_ID" Type="String" />
                        <asp:ControlParameter ControlID="FilterHiddenField" Name="FILTER" PropertyName="Value"
                            Type="String" DefaultValue=" " />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:HiddenField ID="FilterHiddenField" runat="server" />
                <asp:GridView ID="CA_GRID" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="Small" ForeColor="#333333"
                    GridLines="None" HorizontalAlign="Center" Width="100%" Caption="รายการ CA ทั้งหมด"
                    CaptionAlign="Top">
                    <PagerSettings Mode="NumericFirstLast" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" Wrap="True" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                        Wrap="True" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" HorizontalAlign="Center"
                        VerticalAlign="Middle" Wrap="True" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Wrap="True" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                        VerticalAlign="Middle" Wrap="True" />
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                        Wrap="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="เลขที่หนังสือ">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + "/" + (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ANNALS_TYPE") + Eval("ANNALS_SEQ_NO") + "/" + (CInt(Eval("ANNALS_YEAR"))+543).ToString() %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Undertaker" HeaderText="รหัสผู้รับผิดชอบ" SortExpression="Undertaker">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UndertakerName" HeaderText="ชื่อผู้รับผิดชอบ" SortExpression="UndertakerName">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MAIN_CIF_NAME" HeaderText="ชื่อลูกค้า" SortExpression="MAIN_CIF_NAME" />
                        <asp:BoundField DataField="BRANCH_ID" HeaderText="BRANCH_ID" SortExpression="BRANCH_ID">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="REGION_ID" HeaderText="REGION_ID" SortExpression="REGION_ID">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROCESS" HeaderText="PROCESS" SortExpression="PROCESS">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROCESS_DATE" HeaderText="PROCESS_DATE" SortExpression="PROCESS_DATE">
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgDetail" runat="server" ImageUrl="~/images/word.gif" OnClientClick='<%# "var creditPopup = window.open(""annalscredit.aspx?annals_id=" + Eval("ID") + """,""creditPopup"",""toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();" %>' /> 
                                              
                            </ItemTemplate>
                            <HeaderTemplate>
                                Detail
                            </HeaderTemplate>
                            <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:TemplateField>
                          <asp:TemplateField>
                          <HeaderTemplate>
                                          COVENANT
                            </HeaderTemplate>
                            <ItemTemplate>
                 
                               <asp:ImageButton ID="imgCov" runat="server" ImageUrl="~/images/C.png" OnClientClick='<%# "var creditPopup = window.open(""AnnalsCovenant.aspx?id=" + Eval("ID") + """,""creditPopup"",""width=1000,toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();" %>' />
                                  <asp:ImageButton ID="imgCov2" runat="server" ImageUrl="~/images/Cgreen.png" OnClientClick='<%# "var creditPopup = window.open(""AnnalsCovenant.aspx?id=" + Eval("ID") + """,""creditPopup"",""width=1000,toolbar=No,resizable=yes,scrollbars=yes"");creditPopup.focus();" %>' />
                          </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                            <FooterStyle Wrap="False" />
                        </asp:TemplateField>      
                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <EmptyDataRowStyle Wrap="True" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                    SelectCommand="Annals_Credit_Search_Filter" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="VIEWER" SessionField="EMP_ID" Type="String" />
                        <asp:ControlParameter ControlID="FilterHiddenField" Name="FILTER" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
