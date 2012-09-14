<%@ Page Title="Untitled Page" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="stop_summary.aspx.vb" Inherits="aspx_stop_stop_summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <style type="text/css">
        .style1
        {
            width: 290px;
        }
        .style2
        {
            width: 290px;
            height: 8px;
        }
        .style3
        {
        }
        .style4
        {
            width: 464px;
            height: 8px;
        }
        .style5
        {
        }
        .style6
        {
            width: 290px;
            height: 42px;
        }
        .style7
        {
            width: 464px;
            height: 42px;
        }
        .style8
        {
            height: 42px;
        }
        .style9
        {
            font-size: small;
            font-weight: bold;
        }
        .style10
        {
            width: 464px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <script  type="text/javascript">
      jQuery.fn.NumericOnly =
        function() {
            return this.each(function() {
                $(this).keydown(function(e) {
                    var key = e.charCode || e.keyCode || 0;
                    // allow backspace, tab, delete, arrows, numbers and keypad numbers ONLY
                    return (
                        key == 8 ||
                        key == 9 ||
                        key == 46 ||
                        (key >= 37 && key <= 40) ||
                        (key >= 48 && key <= 57) ||
                        (key >= 96 && key <= 105));
                })
            })
};

  </script>  
    <table style="width: 100%;">
        <tr>
            <td class="style6">
                <br />
                <asp:Label ID="Label1" runat="server" Style="font-weight: 700; font-size: medium;
                    color: #0033CC;" Text="PLEASE   SELECT"></asp:Label>
                <br />
            </td>
            <td class="style7">
                &nbsp;
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblSme" runat="server" Style="font-weight: 700" Text="Customers "></asp:Label>
            </td>
            <td class="style4">
                &nbsp;
                <asp:Label ID="lblupdate" runat="server" Text="" 
                    style="font-size: small"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" rowspan="9">
                <img alt="STOP" src="images[8].jpg" style="width: 86px; height: 106px" />
            </td>
            <td class="style10">
                <asp:HyperLink ID="hlss" runat="server" Font-Bold="True" ForeColor="#FF0066" NavigateUrl="~/aspx/stop/stop_in.aspx?type=ss">SPECIAL  MENTION CUSTOMERS</asp:HyperLink>
            </td>
            <td class="style3">
                &nbsp;
                </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hlsm" runat="server" Font-Bold="True" ForeColor="#FF0066" NavigateUrl="~/aspx/stop/stop_in.aspx?type=sm"
                    Style="color: #009900">TDR  REQUESTED  CUSTOMERS </asp:HyperLink>
            </td>
            <td class="style3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;
            </td>
            <td class="style3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hlst" runat="server" Font-Bold="True" ForeColor="#FF66FF" NavigateUrl="~/aspx/stop/stop_in.aspx?type=st">  STOP  CUSTOMERS</asp:HyperLink>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:Label ID="Label2" runat="server" Text="ค้นหารายลูกค้าที่นี่" 
                    style="font-weight: 700; text-decoration: underline; color: #3333CC; font-size: small"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                <span class="style9">CIF :</span>
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="12"></asp:TextBox>
                &nbsp;<asp:Button ID="ButtonFindCIF" runat="server" Text="ค้นหา"  OnClientClick="findCIF();return false;" />
            &nbsp;
                <br />
                <br />
                <asp:label ID="lnkUpdateCIF" runat="server" Font-Bold="True" ForeColor="#FF0066" 
                    NavigateUrl="~/aspx/stop/stop_in.aspx?type=ss" 
                    style="color: #0033CC; font-size: small"></asp:label>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:STOPConnectionString %>">
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true"  runat="server" />
    <script type="text/javascript">
        $(document).ready(function() {
            try {
                findSUM('<%=session("EMP_ID")%>');
                $('#ctl00_ContentPlaceHolder2_TextBox1').NumericOnly();
            }
            catch (err) {
                txt = "There was an error on this page.\n\n";
                txt += "Error description: " + err.description + "\n\n";
                txt += "Click OK to continue.\n\n";
                // alert(txt);
                document.title = txt;
            }
        });
    
         function findSUM(empID) {
            PageMethods.findSUM(empID ,
               OnSucceededFindSUM, OnFailedFindSUM);
        }
        function OnSucceededFindSUM(result) {
        try {
                        var myObject = eval('(' + result + ')');
                        $('#ctl00_ContentPlaceHolder2_hlss').html($('#ctl00_ContentPlaceHolder2_hlss').html() + " : " + myObject.count_ss + " ราย");
                        $('#ctl00_ContentPlaceHolder2_hlsm').html($('#ctl00_ContentPlaceHolder2_hlsm').html() + " : " + myObject.count_sm +  " ราย");
                        $('#ctl00_ContentPlaceHolder2_hlst').html($('#ctl00_ContentPlaceHolder2_hlst').html() + " : " + myObject.count_st + " ราย");
                        $('#ctl00_ContentPlaceHolder2_lblupdate').html('ข้อมูลวันที่ :' + $('#ctl00_ContentPlaceHolder2_lblupdate').html() + "" + myObject.date_ss + "");
            }
            catch (err) {
                        txt = "There was an error on this page.\n\n";
                        txt += "Error description: " + err.description + "\n\n";
                        txt += "Click OK to continue.\n\n";
                        alert(txt);
            }
        }
        function OnFailedFindSUM(error) {
                  alert(' ไม่สามารถสรุปจำนวนลูกค้าในขณะนี้ได้ ');
        }

        var cif='';
        function findCIF() {
            cif = $('#ctl00_ContentPlaceHolder2_TextBox1').val();
            if (cif != '') {
                $('#ctl00_ContentPlaceHolder2_lnkUpdateCIF').html('');
                PageMethods.findCIF('<%=session("EMP_ID")%>', cif.toString(), OnSucceededFindCIF, OnFailedFindCIF);
            }   
        }
        function OnSucceededFindCIF(result) {
            var myObject = eval('(' + result + ')');
           try {
                        if (parseInt(myObject.count_ss) > 0) {
                            $('#ctl00_ContentPlaceHolder2_lnkUpdateCIF').html(' พบข้อมูลใน SPECIAL MENTION CUSTOMER >> คลิกที่นี่เพื่อบันทึกข้อมูล ').click(function() {
                                window.open('stop_update.aspx?cif=' + cif.toString() + '&type=ss', 'pop', 'width=800, height=600');
                            }).css("cursor", "pointer");
                        }
                        else if (parseInt(myObject.count_sm) > 0) {
                            $('#ctl00_ContentPlaceHolder2_lnkUpdateCIF').html(' พบข้อมูลใน  TDR REQUEST CUSTOMER  >> คลิกที่นี่เพื่อบันทึกข้อมูล ').click(function() {
                                window.open('stop_update.aspx?cif=' + cif.toString() + '&type=sm', 'pop', 'width=800, height=600');
                            }).css("cursor", "pointer");
                        }
                        else if (parseInt(myObject.count_st) > 0) {
                            $('#ctl00_ContentPlaceHolder2_lnkUpdateCIF').html(' พบข้อมูลใน STOP  CUSTOMER  >> คลิกที่นี่เพื่อบันทึกข้อมูล ').click(function() {
                                window.open('stop_update.aspx?cif=' + cif.toString() + '&type=st', 'pop', 'width=800, height=600');
                            }).css("cursor", "pointer");
                        }
                        else {
                            $('#ctl00_ContentPlaceHolder2_lnkUpdateCIF').html(' ไม่พบข้อมูล CIF : ' + cif.toString());
                        }
                }
                catch (err) {
                    txt = "There was an error on this page.\n\n";
                    txt += "Error description: " + err.description + "\n\n";
                    txt += "Click OK to continue.\n\n";
                    alert(txt);
                }
        }
        function OnFailedFindCIF(error) {
           alert(' ไม่สามารถค้นหาในขณะนี้ได้ ');
         }
    </script>
</asp:Content>
