<%@ Page Language="VB" AutoEventWireup="false" 
 CodeFile="sm_history.aspx.vb" MasterPageFile="~/MasterPage.master"
 Inherits="aspx_stop_sm_history" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<%--<link  rel="stylesheet" type="text/css" href="../../js/ext3.0/resources/css/ext-all.css"  />
<script type="text/javascript" src="../../js/ext3.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../../js/ext3.0/ext-all.js"></script>
--%>
<link href="../../js/ext3.0/resources/css/xtheme-newgentheme.css" rel="stylesheet"   type="text/css" />
<script type="text/javascript">
 function refreshParent() {
     window.location = "sm_history.aspx";   
 }
 Ext.IframeWindow = Ext.extend(Ext.Window, {
            onRender: function () {
                this.bodyCfg = {
                    tag: 'iframe',
                    src: this.src,
                    cls: this.bodyCls,
                    style: {
                        border: '0px none'
                    }
                };
                Ext.IframeWindow.superclass.onRender.apply(this, arguments);
            }
 });

        function updateHistory(IDEN, CIF, CIFNAME) {
            //alert(IDEN);
            //alert(CIF);
            var w = new Ext.IframeWindow({
                id: id,
                width: 800,
                height: 500,
                modal: true,
                title: CIFNAME,
                src: "sm_update.aspx?iden=" + IDEN + "&cif=" + CIF
            })
            w.show();
        }

        function importHistory() {
            //alert(IDEN);
            //alert(CIF);
            var w = new Ext.IframeWindow({
                id: id,
                width: 700,
                height: 400,
                modal: true,
                title: 'Imprt data',
                src: "sm_import.aspx"
            })
            w.show();
        }


</script>
<title></title>
<style type="text/css">
        .outerPopup
        {
            background-color: Gray;
            padding: 1em 16px;
            border-style: solid;
            border-color:  Aqua;
            border-width: 1px;
        }
        .innerPopup
        {
            background-color: #fff;
        }
        .modalBackground1
        {
            background-color: #000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
</style>
</head>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="true"
        EnableScriptGlobalization="true">
    </asp:ScriptManager>

    <div>
   
             <asp:SqlDataSource ID="SqlDataSourceDateIn" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
             SelectCommand="SM.P_SM_HISTORY_SELECT_DATEIN"
             SelectCommandType="StoredProcedure">
             
             </asp:SqlDataSource>
                                            &nbsp;
                                            <br />
             <asp:Label ID="LabelDateIn" runat="server" Text="เลือกวันที่ข้อมูล"></asp:Label>
        &nbsp;<asp:DropDownList ID="DropDownListDateIn" runat="server"  AutoPostBack="true"
            DataSourceID="SqlDataSourceDateIn" 
            DataTextField="datein" 
            DataValueField="datein">
        </asp:DropDownList>
   
        <asp:SqlDataSource ID="SqlDataSourceHistory" runat="server" 
             ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
             SelectCommandType="StoredProcedure"
             SelectCommand="SM.P_SM_HISTORY_SELECT_BY_DATEIN">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListDateIn" Name="DateIn" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
             <asp:ImageButton ID="ImageButtonReturnMainPage" runat="server" ImageUrl="../../images/refreash.jpg"
                                                
                 OnClientClick="refreshParent(); return false;" ToolTip="กลับไปหน้าก่อนนี้" />
                                            <asp:ImageButton ID="ImageButtonAdd" 
                 runat="server" ImageUrl="../../images/qmv_bb_add.gif"
                                                Width="30px"  ToolTip="เพิ่มโครงการ" 
                 OnClientClick="importHistory(); return false;" Height="30px" />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             DataSourceID="SqlDataSourceHistory" EnableModelValidation="True" 
            ForeColor="#333333" AllowPaging="False"  
            AllowSorting="True" DataKeyNames="IDEN" style="font-size: small" 
             CellPadding="3" CellSpacing="1"  GridLines="None"  
            >
              <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="true" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="true" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                   <asp:TemplateField>
                    <ItemTemplate>
                       <img  alt="Edit" src="../../images/edit_button.jpg"  style="cursor:hand"
                        onclick='<%# "updateHistory(""" +Eval("IDEN").toString()+ """,""" +Eval("CIF").toString()+ """,""" + EVAL("CIFNAME").toString() + """);" %>'>
                  <%--     <asp:Button ID="ButtonEdit" runat="server" Text="Edit" OnClientClick='<%# "updateHistory(""" +Eval("IDEN").toString()+ """,""" +Eval("CIF").toString()+ """); return false;" %>' />
                  --%> </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="IDEN" HeaderText="IDEN" InsertVisible="False"  HeaderStyle-HorizontalAlign="Center"
                    ReadOnly="True" SortExpression="IDEN" Visible="false"  />
                <asp:BoundField DataField="CIF" HeaderStyle-Width="80"  HeaderStyle-HorizontalAlign="Center" HeaderText="CIF" SortExpression="CIF" />
                <asp:BoundField DataField="CIFNAME"  HeaderStyle-Width="200"  HeaderText="CIFNAME" SortExpression="CIFNAME" />
                <asp:BoundField DataField="CustomerSize" HeaderText="CustomerSize"  ItemStyle-HorizontalAlign="Center"
                    SortExpression="CustomerSize" />
                <asp:BoundField DataField="CM_NAME" HeaderText="CM Name"  ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150" 
                    SortExpression="CM_NAME" />
                <asp:BoundField DataField="DPD" HeaderText="DPD"  ItemStyle-HorizontalAlign="Right" 
                         HeaderStyle-Width="80" SortExpression="DPD" DataFormatString="{0:n} "/>
                <asp:BoundField DataField="Prin" HeaderText="Prin"  ItemStyle-HorizontalAlign="Right" 
                        HeaderStyle-Width="80" SortExpression="Prin" DataFormatString="{0:n}"/>
                <asp:BoundField DataField="MoveForm"   ItemStyle-HorizontalAlign="Center" 
                HeaderStyle-Width="80" HeaderText="MoveForm" 
                       SortExpression="MoveForm" />
                <asp:BoundField DataField="DateIn" HeaderText="DateIn" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center"
                    SortExpression="DateIn" DataFormatString="{0:d MMM yyyy }"  />
                <asp:BoundField DataField="COMMENT" HeaderText="COMMENT" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center"
                    SortExpression="COMMENT"  ItemStyle-Wrap="true" />
        

            </Columns>
     
        </asp:GridView>
           
    </div>
</asp:Content> 