<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ControllingLine.aspx.vb" Inherits="aspx_employee_ControllingLine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Controlling Line</title>
    <script type="text/javascript" id="commonJs" src="../../js/common.js"></script>
    <script type="text/javascript" id="defaultJs">
        //ex 1 return 01, if digit = 2
        //ex 10 return 10, if digit = 2
        function convertInt2String(i,digit){
            var result = i;
            if (i < Math.pow(10,digit-1)){
                result = "0"+i
            }
            return result;
        }
        
        //checkAllFlag has value "true" when select all box
        var checkAllFlag = false;
        //function for ckecked all combo box
        function checkBoxAll(boxPrefix,boxMiddlefix,boxSuffix,startIndex){
	        for(var i=0+startIndex;;i++){
	            var num = convertInt2String(i,2);
		        //check has object or not
		        if(!ele(boxPrefix+boxMiddlefix+num+boxSuffix))	break;
        		
		        ele(boxPrefix+boxMiddlefix+num+boxSuffix).checked = true;
	        }
	        checkAllFlag = true;
        }
        //function for clear all combo box
        function unCheckBoxAll(boxPrefix,boxMiddlefix,boxSuffix,startIndex){
	        for(var i=0+startIndex;;i++){
	            var num = convertInt2String(i,2);
		        //check has object or not
		        if(!ele(boxPrefix+boxMiddlefix+num+boxSuffix))	break;
        		
		        ele(boxPrefix+boxMiddlefix+num+boxSuffix).checked = false;
	        }
	        checkAllFlag = false;
        }
        //event function when ckecked any combo box 
        //this for checked&clear combo box header(select all)
        function autoCheckBox(boxPrefix,boxMiddlefix,boxSuffix,headBoxName,startIndex){
	        //boxPrefix example box_? ===> box_1,box_2,box_3
	        var i=0+startIndex;
	        
	        do{
	            var num = convertInt2String(i,2);
		        //check has object or not
		        if(!ele((boxPrefix+boxMiddlefix+num+boxSuffix)))	break;

		        if(checkAllFlag){
			        if(!ele(headBoxName).checked){
				        unCheckBoxAll(boxPrefix,boxMiddlefix,boxSuffix,startIndex);
				        return false;
			        }else{
				        if(!ele(boxPrefix+boxMiddlefix+num+boxSuffix).checked){
					        checkAllFlag = false;
					        ele(headBoxName).checked = false;
					        return false
				        }
			        }
		        }else{
			        if(ele(headBoxName).checked){
				        checkBoxAll(boxPrefix,boxMiddlefix,boxSuffix,startIndex);
				        return true;
			        }else{
				        if(!ele(boxPrefix+boxMiddlefix+num+boxSuffix).checked){
					        checkAllFlag = false;
					        ele(headBoxName).checked = false;
					        return false;
				        }
			        }
		        }
        		
		        i++;
	        }while(true)
        	
	        //if do until break then mean all box are select
	        ele(headBoxName).checked = true;
	        checkAllFlag = true;
	        return true;
        }

        function returnTarget(){
            var openerObj = window.opener;
            
            if(!openerObj){
                return false;
            }else{
                var targetId = getValueFromQueryString("return_target_id");
                //setDomValue(ele(targetId,openerObj),ele("NAMETextBox").value);
                setPropertyValueById(targetId,openerObj,'value',getPropertyValueById('NAMETextBox','this','value'));
            }
            
            return true;
        }

    </script>
</head>
<body style="margin-left:0;margin-top:0;margin-right:0;margin-bottom:0">
    <form id="ControllingLineForm" runat="server">
    <div>
        <table>
            <tr valign="top" align="left">
                <td colspan="2">
                    <asp:TreeView ID="TreeView1" runat="server" ShowLines="True" ExpandDepth="2">
                    </asp:TreeView>
                </td>
            </tr>
            <tr valign="top" align="center">
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="EMP_ID">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="GridCheckBoxAll" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="GridCheckBox" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EMP_ID" HeaderText="EMP_ID" ReadOnly="True" SortExpression="EMP_ID" />
                            <asp:BoundField DataField="EMPNAME" HeaderText="EMPNAME" SortExpression="EMPNAME" />
                            <asp:BoundField DataField="EMPSURNAME" HeaderText="EMPSURNAME" SortExpression="EMPSURNAME" />
                            <asp:BoundField DataField="LEVEL_ID" HeaderText="LEVEL_ID" SortExpression="LEVEL_ID" Visible="False" />
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BAY01ConnectionString %>" SelectCommand="CLASSIFY.P_EMP_IN_CATEGORY_BY_KEY" SelectCommandType="StoredProcedure" DataSourceMode="DataReader">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TreeView1" DefaultValue="1156" Name="LEVEL_ID" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr valign="top" align="center">
                <td colspan="2">
                    <asp:Button ID="Grid2TextButton" runat="server" Text="Convert To Text" UseSubmitBehavior="False" />
                </td>
            </tr>
            <tr valign="middle">
                <td align="right" style="width:10%">
                    NAME : 
                </td>
                <td style="width: 441px">
                    <asp:TextBox ID="NAMETextBox" runat="server" Rows="5" TextMode="MultiLine" 
                        Width="90%"></asp:TextBox></td>
            </tr>
            <tr valign="top" align="center">
                <td colspan="2">
                    <asp:Button ID="CloseButton" runat="server" Text="Close" OnClientClick="window.close();return false;" UseSubmitBehavior="False" Width="100%" />
                </td>
            </tr>
        </table>    
    </div>
    </form>
</body>
</html>
