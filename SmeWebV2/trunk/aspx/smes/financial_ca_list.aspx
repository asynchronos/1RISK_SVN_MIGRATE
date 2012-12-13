<%@ Page Language="VB" AutoEventWireup="false" CodeFile="financial_ca_list.aspx.vb"
    MasterPageFile="~/MasterPage.master" Inherits="aspx_smes_financial_ca_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
        <style>
            body
            {
                font-size: 12pt;
                font-family: Tahoma;
                background-image: url("images/gradient2.png");
                background-repeat: repeat-x;
                padding: 1px;
                margin-left: 1px;
                margin-top: 1px;
            }
            table 
            {
                padding:2px;
             }
            input[type="submit"]
            {
                text-align: center;
                height: 30px;
            }
            .header
            {
                font-size: large;
                width: 100%;
            }

            #LogoutButton
            {
                position: absolute;
                top: 0;
                right: 0px;
                width: 100px;
            }
            #divMain
            {
                margin-left: 10px;
            }
        </style>
        <title></title>
        <script src="js/jquery-1.7.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui-1.8.18/js/jquery-ui-1.8.18.custom.min.js" type="text/javascript"></script>
        <%--    <link href="js/jquery-ui-1.8.18/css/redmond/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
        <%--    <link href="js/jquery-ui-1.8.18/css/sunny/jquery-ui-1.8.18.custom.css" rel="stylesheet"    type="text/css" />--%>
        <link href="js/jquery-ui-1.8.18/css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet"
            type="text/css" />
        <script type="text/javascript">
            $(document).ready(function () {
                $("input[type=submit]").button();
            });
            function jsPop(jsURL, jsWindowNm, jsWidth, jsHeight) {
                var hdl;
                if (jsURL != "") {
                    //            var jsoption = "scrollbars=yes,resizable=no,width=" + jsWidth + ",height=" + jsHeight;
                    //            hdl = window.open(jsURL, jsWindowNm, jsoption);

                    window.location = jsURL;
                }
            }
        </script>

        <div class="ui-widget-header">
            <span class="header">โปรแกรมคำนวณความสามารถในการก่อหนี้ </span>
        </div>
        
        <div id="divMain">
            &nbsp;<div>
                <asp:Label ID="LabelGrid" runat="server" Text="ข้อมูล template (ss,flood,3x) จากหน้า ca"
                    Style="font-weight: 700"></asp:Label>
                <br />
                &nbsp;<asp:Label ID="Label1" runat="server" Text="ค้นหาข้อมูลจาก"></asp:Label>
                &nbsp;
                <asp:DropDownList ID="SearchDropDownList" runat="server">
                    <asp:ListItem>...โปรดเลือก...</asp:ListItem>
                    <asp:ListItem Value="CIF" Text="CIF"></asp:ListItem>
                    <asp:ListItem Value="ID" Text="CA ID"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
                <asp:Button ID="SearchButton" runat="server" Text="ค้นหา" />
                &nbsp;<asp:Button ID="AllButton" runat="server" Text="ทั้งหมด" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" PageSize="15" AllowPaging="True"
                    EnableModelValidation="True" AutoGenerateColumns="False" OnSorting="GridView1_Sorting"
                    HeaderStyle-CssClass=" ui-widget-header" DataKeyNames="SMES_ID" BackColor="White"
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" RowStyle-CssClass="table"
                    GridLines="Vertical" CssClass="ui-corner-all">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="เลขที่ CA" InsertVisible="False" SortExpression="CA_ID">
                            <ItemTemplate>
                                <a href="#" title="click to view detail" onclick="return jsPop('financial_main.aspx?REF_ID=<%# DataBinder.Eval (Container.DataItem,"ID")%>&TEMPLATE_ID=<%#  DataBinder.Eval (Container.DataItem,"TEMPLATE_ID")%>&SMES_ID=<%# DataBinder.Eval(Container.DataItem, "SMES_ID")%>', 'win01', 700, 600);">
                                    <%# DataBinder.Eval(Container.DataItem, "CA_ID")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TEMPLATE_NAME" HeaderText="Template" SortExpression="TEMPLATE_NAME" />
                        <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
                        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="ลูกค้า" SortExpression="CUSTOMER_NAME" />
                        <asp:BoundField DataField="CREATE_USER" HeaderText="ผู้เพิ่มข้อมูล" SortExpression="CREATE_USER" />
                        <asp:BoundField DataField="CREATE_DATE" HeaderText="วันที่เพิ่ม" SortExpression="CREATE_DATE" />
                        <asp:BoundField DataField="UPDATE_USER" HeaderText="ผู้บันทึกข้อมูลล่าสุด" SortExpression="UPDATE_USER" />
                        <asp:BoundField DataField="UPDATE_DATE" HeaderText="วันที่บันทึกล่าสุด" SortExpression="UPDATE_DATE" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE"  VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
</asp:Content>
