<%@ Page Title="NPL Movement Data" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NPLMovementData.aspx.vb" Inherits="aspx.report.NPLMovementData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table>
        <tr>
            <td>
                <div id="div_butt_back" style="width:32px;cursor:pointer;" onclick='<% Response.Write("window.location.replace(&quot;" + Page.ResolveUrl("~/aspx/report/NPLMovementChart.aspx?regionId=" + getQueryString("regionId")) + "&quot;)") %>'>
                    <img id="img_back" alt="Back" runat="server" src="~/images/back.ico" 
                        width="32" />
                    Back
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GV_SmeHistoryByClass" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Cif,YM" 
                    DataSourceID="DS_SmeHistoryByClass" ForeColor="#333333" 
                    AllowPaging="True" AllowSorting="True" PageSize="20">
                    <PagerSettings Mode="NumericFirstLast" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="Cif" HeaderText="Cif" ReadOnly="True" 
                            SortExpression="Cif" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="YM" HeaderText="YM" ReadOnly="True" 
                            SortExpression="YM" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Principal" HeaderText="Principal" 
                            SortExpression="Principal" DataFormatString="{0:#,##0.00}" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Id_Region" HeaderText="Id_Region" 
                            SortExpression="Id_Region" >
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Region_Name" HeaderText="Region_Name" 
                            ReadOnly="True" SortExpression="Region_Name" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STATUS_ID" HeaderText="STATUS_ID" 
                            SortExpression="STATUS_ID" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STATUS_DETAIL" HeaderText="STATUS_DETAIL" 
                            SortExpression="STATUS_DETAIL" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="DS_SmeHistoryByClass" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                    
                    SelectCommand="SELECT Cif, YM, Class, Principal, Id_Region, Region_Name, STATUS_ID, STATUS_DETAIL FROM V_SM_NPL_HISTORY WHERE (Class = @Class) AND (YM = @YM) AND (Id_Region = @Id_Region)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Class" QueryStringField="class" />
                        <asp:QueryStringParameter Name="YM" QueryStringField="ym" />
                        <asp:QueryStringParameter Name="Id_Region" QueryStringField="regionId" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

