<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="CreditPerformance.aspx.vb" Inherits="aspx_customer_CreditPerformance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
     <div>
        <asp:Label ID="lblHeader" runat="server" Text="Credit performance search" Font-Bold="True"
            ForeColor="#0000CC"></asp:Label>
        &nbsp;<table>
            <tr>
                <td valign="top">
                    ค้นหา :<asp:DropDownList ID="listFilter" runat="server" AutoPostBack="true">
                        <asp:ListItem>CIF</asp:ListItem>
                        <asp:ListItem Value="Name">Name</asp:ListItem>
                        <asp:ListItem>NameEng</asp:ListItem>
                        <asp:ListItem>ID_Number</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td valign="top">
                    <div id="divfiltertextBox" runat="server" style="display: inline;">
                        <asp:TextBox ID="filterTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div id="divdlControllingUnit" runat="server" style="display: inline;">
                    </div>
                    <div id="divSBC" runat="server" style="display: inline;">
                    </div>
                    <div id="divId_CustSize" runat="server" style="display: inline;">
                    </div>
                    <div id="divLendingSubT" runat="server" style="display: inline;">
                    </div>
                </td>
                <td valign="top">
                    <asp:Button ID="Button1" runat="server" Text="Search" ValidationGroup="submitSearch" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="CIF must is number only."
                        ControlToValidate="filterTextBox" ValidationExpression="^\d+$" ValidationGroup="submitSearch">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnByCustomer" runat="server" ScrollBars="Auto" Width="1000px" Height="300px">
            <asp:GridView ID="gvByCustomer" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Double"
                BorderWidth="1px" CellPadding="1" CellSpacing="1" DataKeyNames="CIF" DataSourceID="SqlDataByCustomer"
                EnableModelValidation="True" GridLines="Horizontal" PageSize="5" CssClass="myTable">
                <PagerSettings Mode="NumericFirstLast" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="False" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NameEng" HeaderText="NameEng" SortExpression="NameEng">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ID_Number" HeaderText="ID_Number" SortExpression="ID_Number">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="เคยปรับปรุงโครงสร้างหนี้ (TDR)" 
                        SortExpression="TDR_Flag">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TDR_Flag") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTDR_Flag" runat="server" Text='<%# Bind("TDR_Flag") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="เคยเป็น NPL" SortExpression="Npl_Flag">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Npl_Flag") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNPL_Flag" runat="server" Text='<%# Bind("Npl_Flag") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="เคย Write off / NPL Sale" 
                        SortExpression="WriteOff_Sale_Flag">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("WriteOff_Sale_Flag") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWriteoff_Flag" runat="server" Text='<%# Bind("WriteOff_Sale_Flag") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Left" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="Data customer not found !!"></asp:Label>
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" Font-Size="Small" ForeColor="#F7F7F7" />
                <AlternatingRowStyle BackColor="#F7F7F7" />
            </asp:GridView>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataByCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
            SelectCommand="SP_TDR_NPL_WriteOff" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="listFilter" Name="CritiriaField" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="filterTextBox" DefaultValue="0" Name="Critiria"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table>
            <tr>
                <td valign="top">
                    <asp:Label ID="Label2" runat="server" Text="ข้อมูลปรับปรุงโครงสร้างหนี้ (TDR)" 
                        BackColor="#FFFF66"></asp:Label>
                    <asp:FormView ID="FormView3" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataTDRSection"
                        EnableModelValidation="True" GridLines="Both">
                        <EditItemTemplate>
                            เคยทำ TDR
                            <asp:TextBox ID="TDR_FlagTextBox" runat="server" Text='<%# Bind("TDR_Flag") %>' />
                            <br />
                            TdrCount:
                            <asp:TextBox ID="TdrCountTextBox" runat="server" Text='<%# Bind("TdrCount") %>' />
                            <br />
                            FirstTdrDate:
                            <asp:TextBox ID="FirstTdrDateTextBox" runat="server" Text='<%# Bind("FirstTdrDate") %>' />
                            <br />
                            LastTdrDate:
                            <asp:TextBox ID="LastTdrDateTextBox" runat="server" Text='<%# Bind("LastTdrDate") %>' />
                            <br />
                            ชั้นหนี้หลังทำTdr
                            <asp:TextBox ID="TdrClassTextBox" runat="server" Text='<%# Bind("TdrClass") %>' />
                            <br />
                            ภาระหนี้หลังทำTdr
                            <asp:TextBox ID="LastTdrBalanceTextBox" runat="server" Text='<%# Bind("LastTdrBalance") %>' />
                            <br />
                            Method:
                            <asp:TextBox ID="MethodTextBox" runat="server" Text='<%# Bind("Method") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblTDRSectiondetail" runat="server" ForeColor="Red" Text="Data TDR Section not found."></asp:Label>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            เคยทำ TDR
                            <asp:TextBox ID="TDR_FlagTextBox" runat="server" Text='<%# Bind("TDR_Flag") %>' />
                            <br />
                            TdrCount:
                            <asp:TextBox ID="TdrCountTextBox" runat="server" Text='<%# Bind("TdrCount") %>' />
                            <br />
                            FirstTdrDate:
                            <asp:TextBox ID="FirstTdrDateTextBox" runat="server" Text='<%# Bind("FirstTdrDate") %>' />
                            <br />
                            LastTdrDate:
                            <asp:TextBox ID="LastTdrDateTextBox" runat="server" Text='<%# Bind("LastTdrDate") %>' />
                            <br />
                            ชั้นหนี้หลังทำTdr
                            <asp:TextBox ID="TdrClassTextBox" runat="server" Text='<%# Bind("TdrClass") %>' />
                            <br />
                            ภาระหนี้หลังทำTdr
                            <asp:TextBox ID="LastTdrBalanceTextBox" runat="server" Text='<%# Bind("LastTdrBalance") %>' />
                            <br />
                            Method:
                            <asp:TextBox ID="MethodTextBox" runat="server" Text='<%# Bind("Method") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            เคยทำ TDR:
                            <asp:Label ID="TDR_FlagLabel" runat="server" Text='<%# Bind("TDR_Flag") %>' 
                                Font-Bold="True" />
                            <br />
                            จำนวนครั้งที่ทำ Tdr:
                            <asp:Label ID="TdrCountLabel" runat="server" Text='<%# Bind("TdrCount") %>' 
                                ForeColor="#0000CC" />
                            <br />
                            วันที่เริ่มเป็น Tdr ครั้งแรก:
                            <asp:Label ID="FirstTdrDateLabel" runat="server" 
                                Text='<%# Bind("FirstTdrDate", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            วันที่เริ่มเป็น Tdr ครั้งล่าสุด:
                            <asp:Label ID="LastTdrDateLabel" runat="server" 
                                Text='<%# Bind("LastTdrDate", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            ชั้นหนี้หลังทำTdr:
                            <asp:Label ID="TdrClassLabel" runat="server" Text='<%# Bind("TdrClass") %>' 
                                ForeColor="#0000CC" />
                            <br />
                            ภาระหนี้หลังทำTdr:
                            <asp:Label ID="LastTdrBalanceLabel" runat="server" 
                                Text='<%# Bind("LastTdrBalance", "{0:N}") %>' ForeColor="#0000CC" />
                            <br />
                            วิธีปรับปรุงโครงสร้างหนี้ :
                            <asp:Label ID="MethodLabel" runat="server" Text='<%# Bind("Method") %>' 
                                ForeColor="#0000CC" />
                            <br />
                        </ItemTemplate>
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFF99" ForeColor="#8C4510" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataTDRSection" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SELECT TDR_Flag, TdrCount, FirstTdrDate, LastTdrDate, TdrClass, LastTdrBalance, Method FROM TDR_NPL_WriteOff WHERE (Cif = @cif)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvByCustomer" Name="cif" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    <asp:Label ID="lblNPLSection" runat="server" Text="ข้อมูล NPL" 
                        BackColor="#FF6600"></asp:Label>
                    <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataNPLSection"
                        EnableModelValidation="True" GridLines="Both">
                        <EditItemTemplate>
                            เคยเป็น Npl
                            <asp:TextBox ID="Npl_FlagTextBox" runat="server" Text='<%# Bind("Npl_Flag") %>' />
                            <br />
                            NplCount:
                            <asp:TextBox ID="NplCountTextBox" runat="server" Text='<%# Bind("NplCount") %>' />
                            <br />
                            FirstNPLDate:
                            <asp:TextBox ID="FirstNPLDateTextBox" runat="server" Text='<%# Bind("FirstNPLDate") %>' />
                            <br />
                            LastNPLDate:
                            <asp:TextBox ID="LastNPLDateTextBox" runat="server" Text='<%# Bind("LastNPLDate") %>' />
                            <br />
                            LastClass:
                            <asp:TextBox ID="LastClassTextBox" runat="server" Text='<%# Bind("LastClass") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblNPLSectiondetail" runat="server" ForeColor="Red" Text="Data NPL Section not found."></asp:Label>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            เคยเป็น Npl
                            <asp:TextBox ID="Npl_FlagTextBox" runat="server" Text='<%# Bind("Npl_Flag") %>' />
                            <br />
                            NplCount:
                            <asp:TextBox ID="NplCountTextBox" runat="server" Text='<%# Bind("NplCount") %>' />
                            <br />
                            FirstNPLDate:
                            <asp:TextBox ID="FirstNPLDateTextBox" runat="server" Text='<%# Bind("FirstNPLDate") %>' />
                            <br />
                            LastNPLDate:
                            <asp:TextBox ID="LastNPLDateTextBox" runat="server" Text='<%# Bind("LastNPLDate") %>' />
                            <br />
                            LastClass:
                            <asp:TextBox ID="LastClassTextBox" runat="server" Text='<%# Bind("LastClass") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            เคยเป็น Npl :
                            <asp:Label ID="Npl_FlagLabel" runat="server" Text='<%# Bind("Npl_Flag") %>' 
                                Font-Bold="True" />
                            <br />
                            จำนวนครั้งที่เป็น NPL:
                            <asp:Label ID="NplCountLabel" runat="server" Text='<%# Bind("NplCount") %>' 
                                ForeColor="#0000CC" />
                            <br />
                            วันที่เริ่มเป็น NPL ครั้งแรก:
                            <asp:Label ID="FirstNPLDateLabel" runat="server" 
                                Text='<%# Bind("FirstNPLDate", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            วันที่เริ่มเป็น NPL ครั้งล่าสุด:
                            <asp:Label ID="LastNPLDateLabel" runat="server" 
                                Text='<%# Bind("LastNPLDate", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            LastClass:
                            <asp:Label ID="LastClassLabel" runat="server" Text='<%# Bind("LastClass") %>' 
                                ForeColor="#0000CC" />
                            <br />
                        </ItemTemplate>
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FF9933" ForeColor="#8C4510" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataNPLSection" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SELECT Npl_Flag, NplCount, FirstNPLDate, LastNPLDate, LastClass FROM TDR_NPL_WriteOff WHERE (Cif = @cif)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvByCustomer" Name="cif" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top">
                    <asp:Label ID="lblWriteOffSection" runat="server" Text="ข้อมูล Write off / NPL Sale Section"
                        BackColor="Red"></asp:Label>
                    <asp:FormView ID="FormView2" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataWriteoffSection"
                        EnableModelValidation="True" GridLines="Both" CellSpacing="2">
                        <EditItemTemplate>
                            เคย WriteOff/NPL Sale
                            <asp:TextBox ID="WriteOff_Sale_FlagTextBox" runat="server" Text='<%# Bind("WriteOff_Sale_Flag") %>' />
                            <br />
                            เคย WriteOff
                            <asp:TextBox ID="WriteOff_FlagTextBox" runat="server" Text='<%# Bind("WriteOff_Flag") %>' />
                            <br />
                            WriteOff_Date:
                            <asp:TextBox ID="WriteOff_DateTextBox" runat="server" Text='<%# Bind("WriteOff_Date") %>' />
                            <br />
                            เคย NPL Sale
                            <asp:TextBox ID="NPLSaleFlagTextBox" runat="server" Text='<%# Bind("NPLSaleFlag") %>' />
                            <br />
                            NPLSaleDate:
                            <asp:TextBox ID="NPLSaleDateTextBox" runat="server" Text='<%# Bind("NPLSaleDate") %>' />
                            <br />
                            Investor:
                            <asp:TextBox ID="InvestorTextBox" runat="server" Text='<%# Bind("Investor") %>' />
                            <br />
                            <%--DateBeforeSale:
                            <asp:TextBox ID="DateBeforeSaleTextBox" runat="server" Text='<%# Bind("DateBeforeSale") %>' />
                            <br />--%>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <EmptyDataTemplate>
                            <asp:Label ID="lblNPLSectiondetail" runat="server" ForeColor="Red" Text="Data Write off / NPL Sale not found."></asp:Label>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <InsertItemTemplate>
                            เคย WriteOff/NPL Sale
                            <asp:TextBox ID="WriteOff_Sale_FlagTextBox" runat="server" Text='<%# Bind("WriteOff_Sale_Flag") %>' />
                            <br />
                            เคย WriteOff
                            <asp:TextBox ID="WriteOff_FlagTextBox" runat="server" Text='<%# Bind("WriteOff_Flag") %>' />
                            <br />
                            WriteOff_Date:
                            <asp:TextBox ID="WriteOff_DateTextBox" runat="server" Text='<%# Bind("WriteOff_Date") %>' />
                            <br />
                            เคย NPL Sale
                            <asp:TextBox ID="NPLSaleFlagTextBox" runat="server" Text='<%# Bind("NPLSaleFlag") %>' />
                            <br />
                            NPLSaleDate:
                            <asp:TextBox ID="NPLSaleDateTextBox" runat="server" Text='<%# Bind("NPLSaleDate") %>' />
                            <br />
                            Investor:
                            <asp:TextBox ID="InvestorTextBox" runat="server" Text='<%# Bind("Investor") %>' />
                            <br />
                            <%--DateBeforeSale:
                            <asp:TextBox ID="DateBeforeSaleTextBox" runat="server" Text='<%# Bind("DateBeforeSale") %>' />
                            <br />--%>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            เคย WriteOff/NPL Sale :
                            <asp:Label ID="WriteOff_Sale_FlagLabel" runat="server" 
                                Text='<%# Bind("WriteOff_Sale_Flag") %>' Font-Bold="True" />
                            <br />
                            เคย WriteOff :
                            <asp:Label ID="WriteOff_FlagLabel" runat="server" 
                                Text='<%# Bind("WriteOff_Flag") %>' Font-Bold="True" />
                            <br />
                            วันที่ WriteOff:
                            <asp:Label ID="WriteOff_DateLabel" runat="server" 
                                Text='<%# Bind("WriteOff_Date", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            เคย NPL Sale :
                            <asp:Label ID="NPLSaleFlagLabel" runat="server" 
                                Text='<%# Bind("NPLSaleFlag") %>' Font-Bold="True" />
                            <br />
                            วันที่ขาย NPL:
                            <asp:Label ID="NPLSaleDateLabel" runat="server" 
                                Text='<%# Bind("NPLSaleDate", "{0:d}") %>' ForeColor="#0000CC" />
                            <br />
                            Investor:
                            <asp:Label ID="InvestorLabel" runat="server" Text='<%# Bind("Investor") %>' 
                                ForeColor="#0000CC" />
                            <br />
                            <%--DateBeforeSale:
                            <asp:Label ID="DateBeforeSaleLabel" runat="server" Text='<%# Bind("DateBeforeSale", "{0:d}") %>' />
                            <br />--%>
                        </ItemTemplate>
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FF9999" ForeColor="Black" />
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataWriteoffSection" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>"
                        SelectCommand="SELECT WriteOff_Sale_Flag, WriteOff_Flag, WriteOff_Date, NPLSaleFlag, NPLSaleDate, Investor, DateBeforeSale FROM TDR_NPL_WriteOff WHERE (Cif = @cif)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvByCustomer" Name="cif" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
