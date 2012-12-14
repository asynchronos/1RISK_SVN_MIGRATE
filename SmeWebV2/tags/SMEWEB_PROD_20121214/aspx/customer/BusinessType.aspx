<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BusinessType.aspx.vb" Inherits="aspx_customer_BusinessType" EnableViewStateMac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Business Risk Search</title>
    <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript">
        function getEleByClientSelector(ClientSelector) {
            var result = null;

            var eleArray = $("span[ClientSelector='" + ClientSelector + "']");

            if (eleArray.length > 0) {
                result = eleArray[0];
            } else {
                alert("Can not find ClientSelector=" + ClientSelector + ".\nPlease, contact administrator.");
            }

            return result;
        }
    </script>
</head>
<body style="margin-bottom: 0;margin-left: 0; margin-right:0; margin-top:0;">
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label2" runat="server" Text="ค้นหาตามหมวด : " Font-Bold="True" 
                ForeColor="Red"></asp:Label>
            
            <br />
            
            <asp:DropDownList ID="BusinessType1List" runat="server" AutoPostBack="True" 
                DataSourceID="BusinessType1DS" DataTextField="DETAIL" 
                DataValueField="TYPE1_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BusinessType1DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                
                
                
                
                SelectCommand="SELECT TYPE1_ID, DESCRIPTION + '/' + DESCRIPTION_EN AS DETAIL, DESCRIPTION, DESCRIPTION_EN, RESEARCH_CODE, NOTE, PRIORITY, UPDATE_BY, UPDATE_DATE FROM BUSINESS_TYPE_1">
            </asp:SqlDataSource>
            
            <br />
            
            <asp:DropDownList ID="BusinessType2List" runat="server" AutoPostBack="True" 
                DataSourceID="BusinessType2DS" DataTextField="DETAIL" 
                DataValueField="TYPE2_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BusinessType2DS" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                
                
                
                SelectCommand="SELECT TYPE2_ID, DESCRIPTION + '/' + DESCRIPTION_EN AS DETAIL, DESCRIPTION, DESCRIPTION_EN, RESEARCH_CODE, NOTE, TYPE1_ID, PRIORITY, UPDATE_BY, UPDATE_DATE FROM BUSINESS_TYPE_2 WHERE (TYPE1_ID = @TYPE1_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BusinessType1List" Name="TYPE1_ID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />
            
            <asp:DropDownList ID="BusinessType3List" runat="server" 
                DataSourceID="BusinessType3DS" DataTextField="DETAIL" 
                DataValueField="TYPE3_ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BusinessType3DS" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                
                
                
                SelectCommand="SELECT TYPE3_ID,DESCRIPTION +'/'+ DESCRIPTION_EN AS DETAIL, DESCRIPTION, DESCRIPTION_EN, RESEARCH_CODE, NOTE, TYPE2_ID, PRIORITY, UPDATE_BY, UPDATE_DATE FROM BUSINESS_TYPE_3 WHERE (TYPE2_ID = @TYPE2_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BusinessType2List" Name="TYPE2_ID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />
            
            <asp:DropDownList ID="BusinessType4List" runat="server" 
                DataSourceID="BusinessType4DS" DataTextField="DETAIL" 
                DataValueField="TYPE4_ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BusinessType4DS" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                OldValuesParameterFormatString="original_{0}" 
                
                
                
                SelectCommand="SELECT TYPE4_ID,DESCRIPTION +'/'+ DESCRIPTION_EN AS DETAIL, DESCRIPTION, DESCRIPTION_EN, RESEARCH_CODE, NOTE, TYPE3_ID, PRIORITY, UPDATE_BY, UPDATE_DATE FROM BUSINESS_TYPE_4 WHERE (TYPE3_ID = @TYPE3_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BusinessType3List" Name="TYPE3_ID" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        </asp:Panel>
        
        <br />
        
        <asp:Panel ID="Panel2" runat="server">
        
            <asp:Label ID="Label1" runat="server" Text="ค้นหาด้วย Keywords : " 
                Font-Bold="True" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="keywordsTextBox" runat="server" Width="50ex"></asp:TextBox>
            <asp:HiddenField ID="keywordsField" runat="server" />
            <asp:Button ID="SearchButton" runat="server" Text="Search" />
            
            <br />
            
            <asp:DropDownList ID="BusinessTypeKeyList" runat="server" 
                DataSourceID="BusinessTypeKeyDS" DataTextField="DESCRIPTION" 
                DataValueField="TYPE4_ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="BusinessTypeKeyDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
                
                
                
                
                
                SelectCommand="SELECT TYPE4_ID, DESCRIPTION + '/' + DESCRIPTION_EN AS DESCRIPTION FROM BUSINESS_TYPE_4 WHERE (DESCRIPTION + '/' + DESCRIPTION_EN LIKE @KEYWORDS)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="keywordsField" Name="KEYWORDS" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        </asp:Panel>        
        
        <br />
        
        <asp:Panel ID="Panel3" runat="server">
            <asp:Button ID="returnButton" runat="server" Text="เลือก Business นี้" />
        </asp:Panel>
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TYPE4_ID" 
        DataSourceID="BusinessTypeChooseDS" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" Wrap="False" />
        <Columns>
            <asp:TemplateField HeaderText="ID" SortExpression="TYPE4_ID">
                <EditItemTemplate>
                    <asp:Label ID="TYPE4_ID_Label" runat="server" Text='<%# Eval("TYPE4_ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="TYPE4_ID_Label" runat="server" Text='<%# Bind("TYPE4_ID") %>' clientSelector="TYPE4_ID_Label" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION" SortExpression="DESCRIPTION">
                <EditItemTemplate>
                    <asp:TextBox ID="DESCRIPTION_TextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DESCRIPTION_Label" runat="server" Text='<%# Bind("DESCRIPTION") %>' clientSelector="DESCRIPTION_Label" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DESCRIPTION_EN" SortExpression="DESCRIPTION_EN">
                <EditItemTemplate>
                    <asp:TextBox ID="DESCRIPTION_EN_TextBox" runat="server" Text='<%# Bind("DESCRIPTION_EN") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="DESCRIPTION_EN_Label" runat="server" Text='<%# Bind("DESCRIPTION_EN") %>' clientSelector="DESCRIPTION_EN_Label" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NOTE" HeaderText="NOTE" SortExpression="NOTE" 
                Visible="False" />
            <asp:BoundField DataField="TYPE3_ID" HeaderText="TYPE3_ID" 
                SortExpression="TYPE3_ID" Visible="False" />
            <asp:BoundField DataField="PRIORITY" HeaderText="PRIORITY" 
                SortExpression="PRIORITY" Visible="False" />
            <asp:BoundField DataField="UPDATE_BY" HeaderText="UPDATE_BY" 
                SortExpression="UPDATE_BY" Visible="False" />
            <asp:BoundField DataField="UPDATE_DATE" HeaderText="UPDATE_DATE" 
                SortExpression="UPDATE_DATE" Visible="False" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="BusinessTypeChooseDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" 
        
        SelectCommand="SELECT TYPE4_ID, DESCRIPTION, DESCRIPTION_EN, NOTE, TYPE3_ID, PRIORITY, UPDATE_BY, UPDATE_DATE FROM BUSINESS_TYPE_4 WHERE (TYPE4_ID = @TYPE4_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="BusinessType4List" Name="TYPE4_ID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
