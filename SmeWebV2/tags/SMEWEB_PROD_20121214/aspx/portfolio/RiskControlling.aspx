<%@ Page Title="Sub Detail" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="RiskControlling.aspx.vb" Inherits="aspx.portfolio.RiskControlling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <asp:Panel ID="RiskControllingPanel" runat="server" HorizontalAlign="Center">
        <asp:GridView ID="RiskControllingGridView" runat="server" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" ShowFooter="True">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Cif" HeaderText="Cif" SortExpression="Cif" 
                    ItemStyle-HorizontalAlign="Right" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" 
                    ItemStyle-HorizontalAlign="Left" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Tdr" HeaderText="Tdr" SortExpression="Tdr" 
                    ItemStyle-HorizontalAlign="Left" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ClassDebt" HeaderText="ClassDebt" SortExpression="ClassDebt" />
                <asp:BoundField DataField="AgingTxt" HeaderText="AgingTxt" 
                    SortExpression="AgingTxt" ItemStyle-HorizontalAlign="Left" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Branch_T" HeaderText="Branch_T" 
                    SortExpression="Branch_T" ItemStyle-HorizontalAlign="Left" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Region_Name" HeaderText="Region_Name" 
                    SortExpression="Region_Name" ItemStyle-HorizontalAlign="Left" >
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Principal" HeaderText="Principal" SortExpression="Principal"
                    DataFormatString="{0:#,###0.00}" HtmlEncode="False" 
                    ItemStyle-HorizontalAlign="Right" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Accru" HeaderText="Accru" SortExpression="Accru" DataFormatString="{0:#,###0.00}"
                    HtmlEncode="False" ItemStyle-HorizontalAlign="Right" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Susp" HeaderText="Susp" SortExpression="Susp" DataFormatString="{0:#,###0.00}"
                    HtmlEncode="False" ItemStyle-HorizontalAlign="Right" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="DetailImageButton" runat="server" ImageUrl="~/images/Magnifying Glass.gif"
                            ToolTip="Detail" OnClick="DetailImageButton_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:Panel ID="PagingPanel" runat="server" HorizontalAlign="Center" Width="100%"
            Visible="False">
            <asp:ImageButton ID="PrevImgBt" runat="server" OnCommand="Paging_Click" CommandName="Prev"
                ImageUrl="~/images/previous.gif" ImageAlign="Baseline" />
            <asp:Label ID="CurrentPageLabel" runat="server"></asp:Label>
            <asp:Label ID="PageSeparateLabel" runat="server" Text="/"></asp:Label>
            <asp:Label ID="TotalPageLabel" runat="server"></asp:Label>
            <asp:ImageButton ID="NextImgBt" runat="server" OnCommand="Paging_Click" CommandName="Next"
                ImageUrl="~/images/next.gif" ImageAlign="Baseline" />
            GO TO PAGE :
            <asp:TextBox ID="CurrentPageText" runat="server" MaxLength="5" Width="5ex" Wrap="False"></asp:TextBox>
            <asp:Button ID="PageJumpBt" runat="server" OnCommand="Paging_Click" CommandName="Jump"
                Text="Go!" />
        </asp:Panel>
    </asp:Panel>
</asp:Content>
