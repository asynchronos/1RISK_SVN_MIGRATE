<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SmeGroupExposure.aspx.vb" Inherits="aspx_customer_SmeGroupExposure" %>

<%@ Register Assembly="Mytextbox" Namespace="Mytextbox" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Group Exposure</title>
    <style type="text/css">
        .textBoxReadOnlyAlignRight
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        	text-align: right;
        }
        
        .textBoxNormalAlignRight
        {
        	border-width: 1px;
        	text-align: right;
        }
        
        .textBoxReadOnlyAlignCen
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        	text-align: center;
        }
        
        .textBoxNormalAlignCen
        {
        	border-width: 1px;
        	text-align: center;
        }
        
        
        .textBoxReadOnly
        {
        	border-width: 1px;
        	background-color: #F0F0F0;
        }
        
        .textBoxNormal
        {
        	border-width: 1px;
        }
        
        .alternativeRow{
            background-color: White;
        }
        
        .defaultRow{
            color: #333333;
            background-color: #FFFBD6;
        }
        
        .selectRow{
            color: Navy;
            background-color: rgb(255, 204, 102);
            font-weight: bold;
        }
    </style>
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    
    <link rel="stylesheet" type="text/css" href="../../js/ext3.0/resources/css/ext-all.css" />
    <script type="text/javascript" src="../../js/ext3.0/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="../../js/ext3.0/ext-all.js"></script>
    <script type="text/javascript" src="../../js/ext3.0/iframeComponent.js"></script>
    
    <script type="text/javascript" >
        Ext.onReady(function() {
            var expoDetailWin;
            var button = Ext.select('[category=expoDetailButt]');

            button.on('click', function(e, t) {
                // create the window on the first click and reuse on subsequent clicks
                if (!expoDetailWin) {
                    expoDetailWin = new Ext.Window({
                        id: 'expoDetailWindow',
                        title: 'LTV Detail',
                        layout: 'fit',
                        width: 590,
                        height: 300,
                        closable: false,
                        closeAction: 'hide',
                        buttonAlign: 'left',
                        plain: true,

                        items: new Ext.ux.IFrameComponent({
                            id: 'expoDetailIframe',
                            url: 'SmeGroupExposureDetail.aspx',
                            myId: 'expoDetailIframe'
                        }),

                        buttons: [{
                            text: 'Close',
                            handler: function() {
                                window.location.reload();
                                //window.parent.location.reload();
                                //expoDetailWin.hide();
                            }
                        }]
                    });
                }

                expoDetailWin.show(this);

                //change iframe src by use hiddenfield value next of button
                var iframe;
                if (iframe = Ext.select('iframe[myId=expoDetailIframe]').item(0))
                    iframe.dom.src = Ext.fly(t.id).next().dom.value;

                //change class
                Ext.fly(t.id).findParent('tr', null, true).radioClass('selectRow');
            });

            var smeGroupWin;
            if (!smeGroupWin) {
                smeGroupWin = new Ext.Window({
                    id: 'smeGroupWindow',
                    title: 'Group',
                    layout: 'fit',
                    width: 425,
                    height: 225,
                    closable: false,
                    plain: true,
                    y: 0,

                    items: new Ext.ux.IFrameComponent({
                        id: 'smeGroupIframe',
                        url: 'smeGroupDetail.aspx?groupId=' + getValueFromQueryString('groupId'),
                        myId: 'smeGroupIframe'
                    })
                });
            }
            
            smeGroupWin.show(this);

        });
    </script>
</head>
<body style="background-color: #C0C0C0;margin-bottom: 0;margin-left: 0; margin-right:0; margin-top:0;">
    <form id="form1" runat="server">
        <div>
            <div id="rowDiv1" style="width:100%">
                <div style="float: left">
                    <fieldset>
                        <legend>
                            <asp:Label ID="Header_Label1" runat="server" Font-Bold="True" Text="LTV ใน กลุ่ม"></asp:Label>
                        </legend>
                        
                        Exposure Type : 
                        <asp:DropDownList ID="DDL_ExposureType" runat="server" 
                            DataSourceID="DS_EXPOSURE_TYPE" DataTextField="DESCRIPTION" 
                            DataValueField="EXPOSURE_TYPE_ID" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DS_EXPOSURE_TYPE" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                            SelectCommand="SME_EXPOSURE_GET_EXPO_TYPE" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                        
                        <asp:GridView ID="GV_GROUP_EXPOSURE" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataSourceID="DS_GROUP_EXPOSURE" 
                            CellPadding="4" ForeColor="Black" Font-Bold="False" 
                            DataKeyNames="G_EXPO_ID" >
                            <RowStyle CssClass="defaultRow" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButt_Select" runat="server" CausesValidation="False" 
                                            category="expoDetailButt"  
                                            Text="Select" PostBackUrl="javascript:void(0);">
                                        </asp:LinkButton>
                                        <asp:HiddenField runat="server" ID="targetLink" Value='<%# Page.ResolveUrl("~/aspx/customer/SmeGroupExposureDetail.aspx?id=") + Eval("G_EXPO_ID").toString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="G_EXPO_ID" HeaderText="G_EXPO_ID" SortExpression="G_EXPO_ID" 
                                    Visible="False" />
                                <asp:BoundField DataField="GROUP_ID" HeaderText="GROUP_ID" 
                                    SortExpression="GROUP_ID" Visible="False" />
                                <asp:TemplateField HeaderText="" ShowHeader="false" SortExpression="EXPOSURE_ID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EXPOSURE_ID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="Hid_Exposure_Id" runat="server" 
                                            Value='<%# Eval("EXPOSURE_ID") %>' />
                                        <asp:GridView ID="GV_CIF_IN_EXPOSURE" runat="server" 
                                            AutoGenerateColumns="False" DataKeyNames="EXPO_CIF_ID" 
                                            DataSourceID="DS_CIF_IN_EXPOSURE" Width="100%" CellPadding="4" 
                                            ForeColor="#333333" GridLines="None">
                                            <RowStyle HorizontalAlign="Right" BackColor="#E3EAEB" />
                                            <Columns>
                                                <asp:BoundField DataField="EXPO_CIF_ID" HeaderText="EXPO_CIF_ID" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="EXPO_CIF_ID" Visible="False" />
                                                <asp:BoundField DataField="EXPOSURE_ID" HeaderText="EXPOSURE_ID" 
                                                    SortExpression="EXPOSURE_ID" Visible="False" />
                                                <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
                                            </Columns>
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="DS_CIF_IN_EXPOSURE" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                                            SelectCommand="SME_EXPOSURE_GET_CIF_IN_GROUP"
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Hid_Exposure_Id" Name="EXPOSURE_ID" 
                                                    PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EXPOSURE_TYPE_ID" HeaderText="EXPOSURE_TYPE_ID" 
                                    SortExpression="EXPOSURE_TYPE_ID" Visible="False" />
                                <asp:BoundField DataField="EXPOSURE_TYPE" HeaderText="EXPOSURE TYPE" 
                                    SortExpression="EXPOSURE_TYPE" >
                                <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LTV" DataFormatString="{0:#,###.##}" 
                                    HeaderText="LTV" SortExpression="LTV">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle CssClass="alternativeRow" />
                        </asp:GridView>
                        <input id="addLTVButt" type="button" value="Add LTV" category="expoDetailButt" />
                        <% Response.Write("<input id='targetLink' type='hidden' value='" + Page.ResolveUrl("~/aspx/customer/SmeGroupExposureDetail.aspx?groupId=") + Request.QueryString.Get("groupId") + "' />")%>
                        
                        <asp:SqlDataSource ID="DS_GROUP_EXPOSURE" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                            SelectCommand="SME_EXPOSURE_GET_EXPO_BY_GROUP" SelectCommandType="StoredProcedure"
                            InsertCommand="SME_EXPOSURE_INSERT_EXPO" InsertCommandType="StoredProcedure" 
                            UpdateCommand="SME_EXPOSURE_UPDATE_EXPO" UpdateCommandType="StoredProcedure" 
                            DeleteCommand="SME_EXPOSURE_DELETE_EXPO" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="GROUP_ID" QueryStringField="groupId" />
                                <asp:ControlParameter ControlID="DDL_ExposureType" Name="EXPOSURE_TYPE_ID" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="EXPOSURE_ID" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="EXPOSURE_ID" Type="Int32" />
                                <asp:Parameter Name="EXPOSURE_TYPE_ID" Type="Int32" />
                                <asp:Parameter Name="TOTAL_EXPOSURE" Type="Decimal" />
                                <asp:Parameter Name="TOTAL_APPRAISAL" Type="Decimal" />
                                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                                <asp:Parameter Name="UPDATE_BY" Type="String" />
                                <asp:Parameter Name="CIFs" Type="String" />
                                <asp:Parameter Name="GROUP_ID" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="EXPOSURE_TYPE_ID" Type="Int32" />
                                <asp:Parameter Name="TOTAL_EXPOSURE" Type="Decimal" />
                                <asp:Parameter Name="TOTAL_APPRAISAL" Type="Decimal" />
                                <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
                                <asp:Parameter Name="UPDATE_BY" Type="String" />
                                <asp:Parameter Name="CIFs" Type="String" />
                                <asp:Parameter Name="GROUP_ID" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </fieldset>
                </div>
                
            </div>
            
            
        </div>
            
    </form>
</body>
</html>
