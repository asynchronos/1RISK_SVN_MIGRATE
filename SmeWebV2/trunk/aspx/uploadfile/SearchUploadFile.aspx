<%@  Page Title="Cif Filter" Language="VB" MasterPageFile="~/MasterPage.master" CodeFile="SearchUploadFile.aspx.vb"  Inherits="SearchUploadFile" %>

<asp:Content ID="Content5" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"
        EnableScriptLocalization="True">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    </asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
<p>
<asp:Label id='Label_SearchUploadFile' text="��������͡��� CA" runat='server'   style="font-weight: 700"></asp:Label>

<br/> 
    <br />
    <asp:Label ID="lblSearch" runat="server" Text="���Ҩҡ"></asp:Label>&nbsp;
 <asp:DropDownList ID="DDLSearch" runat="server"></asp:DropDownList>
 <asp:TextBox ID="TBSearch" runat="server" Width="113px" MaxLength="12"></asp:TextBox> 
 &nbsp;<asp:Button ID="BtnSearch"  runat="server" Text="����" /> 
<p/>
  <asp:GridView ID="GridViewForm" runat="server"  RowStyle-Font-Size="small"
    AutoGenerateColumns="False"  CellSpacing="0"
                CellPadding="1" ForeColor="Black" GridLines="Vertical" 
                DataKeyNames="id" Width="96%" BackColor="White" 
    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
      <RowStyle BackColor="#F7F7DE" />
   <Columns>      
   
            <asp:TemplateField HeaderText="���Ṻ">
            <EditItemTemplate>
            <asp:HyperLink ID="linkPath" runat="server"  target='_blank'  text='<%#EVAL("Path") %>' NavigateUrl='<%#  ".../../FileUpload/" & EVAL("FILE_YEAR")  & "/" & EVAL("FILE_TYPE")  & "/" &  EVAL("PATH") %>'>HyperLink</asp:HyperLink>
                <asp:FileUpload ID="upFile1" runat="server"   />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="linkPath" runat="server"  target='_blank'  text='<%#EVAL("Path") %>' NavigateUrl='<%#  "../../FileUpload/" & EVAL("FILE_YEAR") & "/" & EVAL("FILE_TYPE")  & "/" &  EVAL("PATH") %>'>HyperLink</asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>     <asp:BoundField DataField="REFERENCE" HeaderText="�Ţ����Ѻ���" 
           SortExpression="REFERENCE" />
        <asp:BoundField DataField="ANNALS_ID" HeaderText="�Ţ��� CA" 
           SortExpression="ANNALS_ID" />
       <asp:BoundField DataField="Process_Date" HeaderText="�ѹ���ʶҹ�����ش" 
           SortExpression="Process_Date" />
     
            <asp:BoundField DataField="PROCESS" HeaderText="ʶҹ�����ش" 
           SortExpression="PROCESS" />
     
       <asp:BoundField DataField="CIF" HeaderText="CIF" SortExpression="CIF" />
      <asp:BoundField DataField="CUSTOMERNAME" HeaderText="�����١���" SortExpression="CUSTOMERNAME" />
       <asp:BoundField DataField="TYPE" HeaderText="���������" 
           SortExpression="TYPE" />
    </Columns>
      <FooterStyle BackColor="#CCCC99" />
      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
      <EmptyDataTemplate>
       </EmptyDataTemplate>
      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
      <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<br />
</asp:Content>
