<%@ Page Language="VB" AutoEventWireup="true" CodeFile="stop_update_detail.aspx.vb"  Inherits="stop_update_detail" %>
<html>
<head>

    <style type="text/css">
        .style1
        {
            height: 8px;
        }
        .style2
        {
            background-color: #CCFFCC;
            width: 225px;
        }
        .style3
        {
            height: 8px;
            background-color: #CCFFCC;
            width: 225px;
        }
        .style4
        {
            background-color: #FFFFCC;
            width: 225px;
        }
        .table
        {
          width:100%;
            font-size:12;
        }
        .style9
        {
            width: 232px;
        }
        .style10
        {
            height: 8px;
            width: 232px;
        }
        .style11
        {
            width: 225px;
        }
        .style12
        {
            background-color: #FFFFCC;
            width: 239px;
        }
        .style13
        {
            height: 8px;
            background-color: #CCFFCC;
            width: 239px;
        }
        .style14
        {
            background-color: #CCFFCC;
            width: 239px;
        }
        .style15
        {
            width: 239px;
        }
    </style>
</head>

<body style=" margin-left:0; margin-top:0">
<form id="formStopCustomerDescFull"  runat="server">


<table border="0"  class="table">
<tr><td 26" class="style12"><asp:Label ID="lblCIF" text="CIF" runat="server" 
        style="font-weight: 700"></asp:Label></td>
    <td 42" class="style9">
    <asp:Label ID="tbCIF" runat="server" maxlength="10" ReadOnly="True" 
            style="font-weight: 700"></asp:Label>
</td>
    <td 21" class="style4">
        <asp:Label ID="lblCUSTOMER_NAME" text="�����١���" runat="server" 
            style="font-weight: 700"></asp:Label>
    </td>
    <td 10">
        <asp:Label ID="tbCUSTOMER_NAME" runat="server" maxlength="72" ReadOnly="True" 
            style="font-weight: 700"></asp:Label>
    </td></tr>
<tr><td 26" class="style12">
    <asp:Label ID="lblPRINCIPAL" 
        text="�Թ�鹻Ѩ�غѹ" runat="server"></asp:Label></td>
    <td 42" class="style9">
        <asp:label ID="tbPRINCIPAL" runat="server" ></asp:label>
    </td>
    <td 21" class="style4">
            <asp:Label ID="lblClass_h" text=" ���˹����͹��ѧ " 
                runat="server"></asp:Label>
    </td>
    <td 10">
            <asp:Label ID="tbCLASS_H" runat="server"></asp:Label>
    </td></tr>
<tr><td 26" class="style12">
    <asp:Label ID="lblAGING_DPD" 
        text="AGING �Ѩ�غѹ" runat="server"></asp:Label></td>
    <td 42" class="style9">
        <asp:label ID="tbAGING_DPD" runat="server" 
            maxlength="19"></asp:label>
    </td>
    <td 21" class="style4">
        &nbsp;</td>
    <td 10">
        &nbsp;</td></tr>
<tr>
        <td 38" class="style13"><asp:Label ID="lblDATE_IN" text="�ѹ����������� " runat="server"></asp:Label>
        </td>
        <td 39" class="style10">
            <asp:Label ID="tbDATE_IN" runat="server" ReadOnly="True" maxlength="23"></asp:Label>
</td>
    <td 40" class="style3"></td>
    <td 41" class="style1"></td></tr>
    <tr>
        <td 36" class="style14"><asp:Label ID="lblAGING_DPD_IN" text="Aging �ѹ������" 
                runat="server"></asp:Label></td>
        <td 42" class="style9">
    <asp:Label ID="tbAGING_DPD_IN" runat="server" maxlength="19" ReadOnly="True"></asp:Label>
</td>
    <td 6" class="style2"><asp:Label ID="lblAGING_CRITERIA_IN" 
            text=" ����������Ҵ��� Aging " runat="server"></asp:Label>
</td>
    <td 11"><asp:Label ID="tbAGING_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td>
    </tr>
<tr>
        <td 36" class="style14"><asp:Label ID="lblIS_TDR_IN" text=" �·� TDR �������" 
        runat="server"></asp:Label></td>
    <td 42" class="style9">
        <asp:Label ID="tbIS_TDR_IN" runat="server" maxlength="1"></asp:Label>
&nbsp;</td>
    <td 6" class="style2"><asp:Label ID="lblOD_UTILIZE_CRITERIA_IN" 
        text="����������Ҵ��� O/D" runat="server"></asp:Label>
</td>
    <td 11"><asp:Label ID="tbOD_UTILIZE_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td></tr>
<tr><td 27" class="style14">
            <asp:Label ID="lblBUSINESS_CIM_FLAG_IN" 
        text=" ���������áԨ�ҡ�к� CIM " runat="server"></asp:Label></td>
    <td 8" class="style9">
            <asp:Label ID="tbBUSINESS_CIM_FLAG_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
    </td>
    <td 35" class="style2"><asp:Label ID="lblCLASS_CRITERIA_IN" 
        text=" ����������Ҵ��ª��˹��" runat="server"></asp:Label>
</td>
    <td 34"><asp:Label ID="tbCLASS_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td></tr>
<tr><td 27" class="style14">
        <asp:Label ID="lblOD_UTILIZE_IN" text=" % �����ǧ�Թ OD �ѹ������ " runat="server"></asp:Label>
    </td>
    <td 8" class="style9">
        <asp:Label ID="tbOD_UTILIZE_IN" runat="server" ReadOnly="True" maxlength="19"></asp:Label>
</td>
    <td 35" class="style2"><asp:Label ID="lblTDR_CRITERIA_IN" text=" ����������Ҵ��� TDR" 
            runat="server"></asp:Label>
</td>
    <td 34"><asp:Label ID="tbTDR_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td></tr>
<tr><td 36" class="style14"><asp:Label ID="lblBUSINESS_CODE_IN" 
            text="���ʻ�������áԨ�ѹ������" runat="server"></asp:Label>
    </td>
    <td 42" class="style9"><asp:Label ID="tbBUSINESS_CODE_IN" runat="server" ReadOnly="True" maxlength="10"></asp:Label>
</td>
    <td 24" class="style2"><asp:Label ID="lblJUDGEMENT_CRITERIA_IN" 
            text=" ����������Ҵ��� JUDGEMENT" runat="server"></asp:Label>
</td>
    <td 25"><asp:Label ID="tbJUDGEMENT_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td></tr>
<tr><td 36" class="style14"><asp:Label ID="lblBUSINESS_DESC_IN" 
        text=" ��������áԨ�ѹ������ " runat="server"></asp:Label></td>
    <td 42" class="style9"><asp:Label ID="tbBUSINESS_DESC_IN" runat="server" ReadOnly="True" maxlength="255"></asp:Label>
</td>
    <td 6" class="style2"><asp:Label ID="lblBUSINESS_CRITERIA_IN" 
        text=" ����������Ҵ��� BUSINESS" runat="server"></asp:Label>
</td>
    <td 11"><asp:Label ID="tbBUSINESS_CRITERIA_IN" runat="server" ReadOnly="True" maxlength="1"></asp:Label>
</td></tr>
<tr><td 26" class="style14"><asp:Label ID="lblJUDGEMENT_ID_IN" 
        text="JUDGEMENT �ѹ�����������" runat="server"></asp:Label></td>
    <td 29" colspan="3">
    <asp:DropDownList ID="ddlJUDGEMENT_ID_IN" runat="server" Height="17px" ></asp:DropDownList>
</td>
    </tr>
<tr><td 26" class="style15">
        <asp:Label ID="lblJUDGEMENT_ID" text=" JUDGEMENT �Ѩ�غѹ " 
            runat="server"></asp:Label>
    </td>
    <td 20" colspan="3">
    <asp:DropDownList ID="ddlJUDGEMENT_ID" runat="server" Height="17px" 
                AutoPostBack="True" ></asp:DropDownList>
    &nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="Blue" 
            NavigateUrl="~/aspx/customer/SmeCustomerManagement.aspx">&gt;&gt; ��� JUDGEMENT</asp:HyperLink>
</td>
    </tr>
<tr><td 26" class="style15">
    <asp:Label ID="lblUPDATE_PAY_ABILITY_IDSM" 
        text=" ��������ö㹡�ê���˹���Ҩҡ RM " runat="server"></asp:Label></td>
    <td 20" colspan="3">
    <asp:DropDownList ID="ddlUPDATE_PAY_ABILITY_IDSM" runat="server" Height="20px" 
                AutoPostBack="True" ></asp:DropDownList>
</td>
    </tr>
<tr><td 26" class="style15"><asp:Label ID="lblUPDATE_PAY_ABILITY_ID" 
        text=" ��������ö㹡�ê���˹���Ҩҡ CM" runat="server"></asp:Label></td>
    <td colspan="3">
    <asp:DropDownList ID="ddlUPDATE_PAY_ABILITY_ID" runat="server" Height="20px" 
                AutoPostBack="True" ></asp:DropDownList>
</td>
    </tr>
<tr><td 26" class="style15"><asp:Label ID="lblUPDATE_ACTION_ID" text="��ô��Թ��� " 
        runat="server"></asp:Label></td>
    <td 42" class="style9">
    <asp:DropDownList ID="ddlUPDATE_ACTION_ID" runat="server" Height="16px" 
            AutoPostBack="True" ></asp:DropDownList>
</td>
    <td 21" rowspan="3" class="style11"><asp:Label ID="lblUPDATE_COMMENT" text="�����˵� " 
        runat="server"></asp:Label></td>
    <td 10" rowspan="3">
        <asp:TextBox  ID="tbUPDATE_COMMENT" runat="server" Height="57px" Width="199px" 
            Rows="3" TextMode="MultiLine" ></asp:Textbox>
    </td></tr>
<tr><td 26" class="style15"><asp:Label ID="lblUPDATE_DEPT_RESOLVE_ID" 
            text=" �Ըա�����˹��" runat="server"></asp:Label>
    </td>
    <td 42" class="style9">
    <asp:DropDownList ID="ddlUPDATE_DEPT_RESOLVE_ID" runat="server" Height="16px" ></asp:DropDownList>
</td>
    </tr>
<tr><td 26" class="style15">
    <asp:Label ID="lblUPDATE_PREDICT_NPL" 
            text=" �Ҵ��Ҩ��� NPL ���� " runat="server"></asp:Label>
    </td>
    <td 42" class="style9">
    <asp:DropDownList ID="ddlUPDATE_PREDICT_NPL" runat="server" Height="16px" ></asp:DropDownList>
    </td>
    </tr>
<tr><td 26" class="style15"><asp:Label ID="lblUPDATE_TDR_DATE" text="�ѹ���� TDR" 
        runat="server"></asp:Label></td>
    <td 42" class="style9">
    <asp:Label ID="tbUPDATE_TDR_DATE" runat="server" ReadOnly="True" maxlength="23"></asp:Label>
</td>
    <td 21" class="style11" rowspan="2">�ѭ��</td>
    <td 10" rowspan="2">
        <asp:TextBox  ID="tbUPDATE_PROBLEM" runat="server" Height="57px" Width="199px" 
            Rows="3" TextMode="MultiLine" ></asp:Textbox>
</td></tr>
<tr><td 26" class="style15"><asp:Label ID="lblUPDATE_ACTION_USER" text="������¡��" 
        runat="server"></asp:Label></td>
    <td 42" class="style9"><asp:Label ID="tbUPDATE_ACTION_USER" runat="server" maxlength="10"></asp:Label>
</td>
    </tr>
<tr><td>
    <asp:Label ID="lblUPDATE_ACTION_DATE" 
            text="�ѹ���ѹ�֡������ " runat="server"></asp:Label>
</td><td>
        <asp:Label ID="tbUPDATE_ACTION_DATE" runat="server" ReadOnly="True" maxlength="23"></asp:Label>
</td><td>
        &nbsp;</td><td>
        &nbsp;</td></tr>
<tr><td colspan="4">
    &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="�ѹ�֡������" Height="24px" 
        style="background-color: #CCFFCC" Width="132px" /> 
    &nbsp; 
    </b> 
    <asp:Button ID="btnDelete" runat="server" Text="���¢������͡" 
        style="background-color: #FFCC99" />
    <b>&nbsp;
</b>
<asp:Button ID="btnDeleteToBMR" runat="server" Text="���¢�����仺��." 
        style="background-color: #FF6666"  />
&nbsp;
<asp:Button ID="btnClose" runat="server" Text="�Դ˹�ҹ��  [X] " Height="24px" 
        style="background-color: #CCFF00" Width="132px"  /> </td></tr>
<tr><td colspan="4">
    &nbsp;</td></tr>
</table>
</form>
</body>
</html>

