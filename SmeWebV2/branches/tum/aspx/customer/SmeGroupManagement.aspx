<%@ Page Title="จัดกลุ่มลูกค้า" Language="VB" MasterPageFile="~/Iframe.master" AutoEventWireup="false" CodeFile="SmeGroupManagement.aspx.vb" Inherits="aspx.customer.SmeGroupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <div style="vertical-align:top;">
        <table width="100%" style="background-color:#CCFFFF;">
            <tr>
                <td>
                    <div id="div1" style="width:100%;vertical-align:middle;">
                        <div id="div1_1" style="width:50%;float:left;text-align:left;">
                            CIF:<asp:TextBox ID="CIFTextBox1" runat="server" onkeypress="return onKeypressEnter(this,event,'SearchCIFButton1');" ></asp:TextBox>
                            <asp:Button ID="SearchCIFButton1" runat="server" Text="VIEW" clientSelector="SearchCIFButton1" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="CIFTextBox1" ErrorMessage="กรุณาระบุ CIF ก่อนทำการรวมกลุ่ม" 
                                ValidationGroup="MergeCIFValidate"></asp:RequiredFieldValidator>
                        </div>
                        <div id="div1_2" style="width:49%;float:right;text-align:right;">
                            <asp:Button ID="MergeCIFButton1" runat="server" Text="รวมกลุ่ม CIF" 
                                ValidationGroup="MergeCIFValidate" Visible="False" />
                        </div>
                    </div>
                    
                    <iframe id="SmeCusIframe1" myid="SmeCusIframe1" name="SmeCusIframe1" runat="server" width="100%" height="600px" scrolling="auto" frameborder="0" ></iframe>
                </td>
            </tr>
            
            <tr>
                <td>
                    <div id="div2" style="width:100%;vertical-align:middle;">
                        <div id="div2_1" style="width:50%;float:left;text-align:left;">
                            CIF:<asp:TextBox ID="CIFTextBox2" runat="server" onkeypress="return onKeypressEnter(this,event,'SearchCIFButton2');" ></asp:TextBox>
                            <asp:Button ID="SearchCIFButton2" runat="server" Text="VIEW" clientSelector="SearchCIFButton2" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="CIFTextBox2" ErrorMessage="กรุณาระบุ CIF ก่อนทำการรวมกลุ่ม" 
                                ValidationGroup="MergeCIFValidate"></asp:RequiredFieldValidator>
                        </div>
                        <div id="div2_2" style="width:49%;float:right;text-align:right;">
                            <asp:Button ID="MergeCIFButton2" runat="server" Text="รวมกลุ่ม CIF" 
                                ValidationGroup="MergeCIFValidate" />
                        </div>
                    </div>

                    <iframe id="SmeCusIframe2" myid="SmeCusIframe2" name="SmeCusIframe2" runat="server" width="100%" height="600px" scrolling="auto" frameborder="0" ></iframe>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
