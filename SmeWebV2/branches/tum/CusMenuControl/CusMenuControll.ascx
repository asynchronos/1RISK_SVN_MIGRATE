<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CusMenuControll.ascx.vb" Inherits="CusMenuControl_CusMenuControll" %>

<table width="100%" style="visibility:hidden">
    <tr>
        <td>
            <asp:LinkButton ID="CusDetailLink" runat="server">��������´�١���/ʶҹ���Դ���</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusDebtLink" runat="server">��������´����˹��</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusDebtPrevLink" runat="server">��������´����˹����͹��ѧ</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusClassDebtLink" runat="server">���˹����͹��ѧ/Rating</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusCollateralLink" runat="server">��������´��ѡ��Сѹ</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusCollateralPersonLink" runat="server">���ӻ�Сѹ</asp:LinkButton>
         </td>
         <td>
            <asp:LinkButton ID="CusLawLink" runat="server">��������´������</asp:LinkButton>
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

    
    
