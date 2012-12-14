<%@ Page Title="บุคคลค้ำประกัน" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false"
    CodeFile="CustomerCollateralPerson.aspx.vb" Inherits="aspx.customer.CustomerCollateralPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table cellpadding="10">
        <tr>
            <td align="left">
                <asp:Label ID="lblCID" runat="server" BackColor="White" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                <br />
                <asp:Label ID="lblHeader" runat="server" Text="ผู้ค้ำประกัน"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dtgColl" runat="server" ForeColor="#333333" HorizontalAlign="Left"
                    DataSourceID="SqldtsCOLL_Person" CaptionAlign="Left" AutoGenerateColumns="False"
                    AllowSorting="True" CellPadding="4" PageSize="30" 
                    HeaderStyle-HorizontalAlign="center">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Cif_Person" HeaderText="CIF" SortExpression="Cif_Person">
                        </asp:BoundField>
                        <asp:BoundField DataField="Person" HeaderText="ผู้ค้ำประกัน" SortExpression="Person">
                        </asp:BoundField>
                        <asp:BoundField HtmlEncode="False" DataField="GUAR_AMT" HeaderText="วงเงิน" SortExpression="GUAR_AMT"
                            DataFormatString="{0:#,#.00}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="NoDataLabel" runat="server" Font-Bold="True" Font-Names="tahoma" ForeColor="Red"
                                        Text="No Data"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqldtsCOLL_Person" runat="server" SelectCommand="Coll_Person_Select"
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="Cif" QueryStringField="cif" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
