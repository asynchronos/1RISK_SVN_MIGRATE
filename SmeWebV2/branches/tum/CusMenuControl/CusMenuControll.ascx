<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CusMenuControll.ascx.vb" Inherits="CusMenuControl_CusMenuControll" %>

<table width="100%" style="visibility:hidden">
    <tr>
        <td>
            <asp:LinkButton ID="CusDetailLink" runat="server">รายละเอียดลูกค้า/สถานที่ติดต่อ</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusDebtLink" runat="server">รายละเอียดภาระหนี้</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusDebtPrevLink" runat="server">รายละเอียดภาระหนี้ย้อนหลัง</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusClassDebtLink" runat="server">ชั้นหนี้ย้อนหลัง/Rating</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusCollateralLink" runat="server">รายละเอียดหลักประกัน</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusCollateralPersonLink" runat="server">ผู้คำประกัน</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusLawLink" runat="server">รายละเอียดกฎหมาย</asp:LinkButton>
         </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <td align="center">
            <table>
                <tr>
                    <td>
                        CIF : <asp:Label ID="cifLabel" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        NAME : <asp:Label ID="nameLabel" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

    
    
