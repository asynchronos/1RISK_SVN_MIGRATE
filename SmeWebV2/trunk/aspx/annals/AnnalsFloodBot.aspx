<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AnnalsFloodBot.aspx.vb"
    Inherits="aspx_annals_AnnalsFloodBot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:TextBox ID="REFTextbox" runat="server"></asp:TextBox>
    <br />
    รายชื่อลูกค้า&nbsp;<asp:Button ID="AddCustomerButton" runat="server" Text="เพิ่มรายชื่อลูกค้า"
        Style="margin-top: 2px" />
    <div id="divGridCustomer" runat="server">
        &nbsp;<asp:GridView ID="CustomerGridView" runat="server">
        </asp:GridView>
    </div>
    <div id="divFormCustomer" runat="server">
        กรุณากรอกข้อมูลให้ครบถ้วน
        <table>
            <tr>
                <td>
                    &nbsp;ชื่อลูกค้า&nbsp;
                </td>
                <td>
                    <asp:DropDownList ID="CustomerDropDownList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    1.มูลล่าหลักประกัน (Fixed Asset) ครั้งนี้
                </td>
                <td>
                    <asp:TextBox ID="FixAssetTextBox" runat="server"></asp:TextBox>
                    บาท
                </td>
            </tr>
            <tr>
                <td>
                    2.หลักประกัน(เงินฝาก) จำนวนเงิน
                </td>
                <td>
                    <asp:TextBox ID="DepositTextBox" runat="server"></asp:TextBox>
                    บาท
                </td>
            </tr>
            <tr>
                <td>
                    3.ครั้งนี้วงเงินสินเชื่อมีเงินฝาก 30% บสย 70%
                </td>
                <td>
                    <asp:DropDownList ID="DepositDropDownList" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    4.DSCR(x เท่า)
                </td>
                <td>
                    <asp:TextBox ID="DSCRTextBox" runat="server"></asp:TextBox>
                    เท่า
                </td>
            </tr>
            <tr>
                <td>
                    5.วงเงินที่ SME R ปกติ อนุมัติ 3x จำนวนวงเงินเท่าไร
                </td>
                <td>
                    <asp:TextBox ID="SMERLimitTextBox" runat="server"></asp:TextBox>
                    บาท
                </td>
            </tr>
            <tr>
                <td class="style1">
                    6.วงเงินที่ SME R Flood อนุมัติ 3x จำนวนวงเงินเท่าไร
                </td>
                <td class="style1">
                    <asp:TextBox ID="SMERFloodTextBox" runat="server"></asp:TextBox>
                    บาท
                </td>
            </tr>
            <tr>
                <td>
                    7.มี 3x ของ SME R ในนามชื่อคนอื่น รวมจำนวนวงเงินเท่าไร
                </td>
                <td>
                    <asp:TextBox ID="SMEROtherTextBox" runat="server"></asp:TextBox>
                    บาท
                </td>
            </tr>
            <tr>
                <td>
                    รายชื่อ Bank<br />
                    Bank
                    <asp:DropDownList ID="BankIDDropDownList" runat="server">
                    </asp:DropDownList>
                    &nbsp;ภาระ
                    <asp:TextBox ID="BankValueTextBox" runat="server"></asp:TextBox>
                    &nbsp;บาท
                    <asp:Button ID="AddBankButton" runat="server" Text="เพิ่ม Bank" Style="margin-top: 2px" />
                    <br />
                    <asp:GridView ID="GridViewBank" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="BtnEdit" runat="server" CommandName="Edit" ToolTip="Edit item"
                                        ImageUrl="~/images/qmv_bb_preview.gif" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Code">
                                <ItemTemplate>
                                    <asp:Label ID="BankIDLabel" runat="server" Text='<%# Eval("BankID")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bank">
                                <ItemTemplate>
                                    <asp:Label ID="BankNameLabel" runat="server" Text='<%# Eval("BankName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ภาระ">
                                <ItemTemplate>
                                    <asp:Label ID="BankValueLabel" runat="server" Text='<%# Eval("BankValue")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="SaveButton" runat="server" Text="บันทึกข้อมูล" Style="margin-top: 2px" />
                    <asp:Button ID="CancelButton" runat="server" Text="ย้อนกลับ" Style="margin-top: 2px" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="divGridAccount">
        <asp:GridView ID="GridViewAccount" runat="server">
        </asp:GridView>
    </div>
    <div id="divFormAccount">
    </div>
    </form>
</body>
</html>
