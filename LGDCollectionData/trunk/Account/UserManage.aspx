<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManage.aspx.cs" Inherits="LGDCollectionData.Account.UserManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" DataKeyNames="EMP_ID">
        <EditItemTemplate>
            EMP_ID:
            <asp:Label ID="EMP_IDLabel1" runat="server" Text='<%# Eval("EMP_ID") %>' />
            <br />
            EMP_ID_DISPLAY:
            <asp:TextBox ID="EMP_ID_DISPLAYTextBox" runat="server" 
                Text='<%# Bind("EMP_ID_DISPLAY") %>' />
            <br />
            EMP_TITLE:
            <asp:TextBox ID="EMP_TITLETextBox" runat="server" 
                Text='<%# Bind("EMP_TITLE") %>' />
            <br />
            EMP_NAME:
            <asp:TextBox ID="EMP_NAMETextBox" runat="server" 
                Text='<%# Bind("EMP_NAME") %>' />
            <br />
            EMP_SURNAME:
            <asp:TextBox ID="EMP_SURNAMETextBox" runat="server" 
                Text='<%# Bind("EMP_SURNAME") %>' />
            <br />
            EMP_TITLE_E:
            <asp:TextBox ID="EMP_TITLE_ETextBox" runat="server" 
                Text='<%# Bind("EMP_TITLE_E") %>' />
            <br />
            EMP_NAME_E:
            <asp:TextBox ID="EMP_NAME_ETextBox" runat="server" 
                Text='<%# Bind("EMP_NAME_E") %>' />
            <br />
            EMP_SURNAME_E:
            <asp:TextBox ID="EMP_SURNAME_ETextBox" runat="server" 
                Text='<%# Bind("EMP_SURNAME_E") %>' />
            <br />
            PASSWD:
            <asp:TextBox ID="PASSWDTextBox" runat="server" Text='<%# Bind("PASSWD") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            PHONE_OFFICE:
            <asp:TextBox ID="PHONE_OFFICETextBox" runat="server" 
                Text='<%# Bind("PHONE_OFFICE") %>' />
            <br />
            PHONE_HOME:
            <asp:TextBox ID="PHONE_HOMETextBox" runat="server" 
                Text='<%# Bind("PHONE_HOME") %>' />
            <br />
            PHONE_MOBILE:
            <asp:TextBox ID="PHONE_MOBILETextBox" runat="server" 
                Text='<%# Bind("PHONE_MOBILE") %>' />
            <br />
            CREATE_DATE:
            <asp:TextBox ID="CREATE_DATETextBox" runat="server" 
                Text='<%# Bind("CREATE_DATE") %>' />
            <br />
            EXPIRE_DATE:
            <asp:TextBox ID="EXPIRE_DATETextBox" runat="server" 
                Text='<%# Bind("EXPIRE_DATE") %>' />
            <br />
            UPDATE_DATE:
            <asp:TextBox ID="UPDATE_DATETextBox" runat="server" 
                Text='<%# Bind("UPDATE_DATE") %>' />
            <br />
            LAST_SIGN_ON_DATE:
            <asp:TextBox ID="LAST_SIGN_ON_DATETextBox" runat="server" 
                Text='<%# Bind("LAST_SIGN_ON_DATE") %>' />
            <br />
            LAST_CHANGE_PASS_DATE:
            <asp:TextBox ID="LAST_CHANGE_PASS_DATETextBox" runat="server" 
                Text='<%# Bind("LAST_CHANGE_PASS_DATE") %>' />
            <br />
            DEL_FLAG:
            <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                Checked='<%# Bind("DEL_FLAG") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            EMP_ID:
            <asp:TextBox ID="EMP_IDTextBox" runat="server" Text='<%# Bind("EMP_ID") %>' />
            <br />
            EMP_ID_DISPLAY:
            <asp:TextBox ID="EMP_ID_DISPLAYTextBox" runat="server" 
                Text='<%# Bind("EMP_ID_DISPLAY") %>' />
            <br />
            EMP_TITLE:
            <asp:TextBox ID="EMP_TITLETextBox" runat="server" 
                Text='<%# Bind("EMP_TITLE") %>' />
            <br />
            EMP_NAME:
            <asp:TextBox ID="EMP_NAMETextBox" runat="server" 
                Text='<%# Bind("EMP_NAME") %>' />
            <br />
            EMP_SURNAME:
            <asp:TextBox ID="EMP_SURNAMETextBox" runat="server" 
                Text='<%# Bind("EMP_SURNAME") %>' />
            <br />
            EMP_TITLE_E:
            <asp:TextBox ID="EMP_TITLE_ETextBox" runat="server" 
                Text='<%# Bind("EMP_TITLE_E") %>' />
            <br />
            EMP_NAME_E:
            <asp:TextBox ID="EMP_NAME_ETextBox" runat="server" 
                Text='<%# Bind("EMP_NAME_E") %>' />
            <br />
            EMP_SURNAME_E:
            <asp:TextBox ID="EMP_SURNAME_ETextBox" runat="server" 
                Text='<%# Bind("EMP_SURNAME_E") %>' />
            <br />
            PASSWD:
            <asp:TextBox ID="PASSWDTextBox" runat="server" Text='<%# Bind("PASSWD") %>' />
            <br />
            EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            PHONE_OFFICE:
            <asp:TextBox ID="PHONE_OFFICETextBox" runat="server" 
                Text='<%# Bind("PHONE_OFFICE") %>' />
            <br />
            PHONE_HOME:
            <asp:TextBox ID="PHONE_HOMETextBox" runat="server" 
                Text='<%# Bind("PHONE_HOME") %>' />
            <br />
            PHONE_MOBILE:
            <asp:TextBox ID="PHONE_MOBILETextBox" runat="server" 
                Text='<%# Bind("PHONE_MOBILE") %>' />
            <br />
            CREATE_DATE:
            <asp:TextBox ID="CREATE_DATETextBox" runat="server" 
                Text='<%# Bind("CREATE_DATE") %>' />
            <br />
            EXPIRE_DATE:
            <asp:TextBox ID="EXPIRE_DATETextBox" runat="server" 
                Text='<%# Bind("EXPIRE_DATE") %>' />
            <br />
            UPDATE_DATE:
            <asp:TextBox ID="UPDATE_DATETextBox" runat="server" 
                Text='<%# Bind("UPDATE_DATE") %>' />
            <br />
            LAST_SIGN_ON_DATE:
            <asp:TextBox ID="LAST_SIGN_ON_DATETextBox" runat="server" 
                Text='<%# Bind("LAST_SIGN_ON_DATE") %>' />
            <br />
            LAST_CHANGE_PASS_DATE:
            <asp:TextBox ID="LAST_CHANGE_PASS_DATETextBox" runat="server" 
                Text='<%# Bind("LAST_CHANGE_PASS_DATE") %>' />
            <br />
            DEL_FLAG:
            <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                Checked='<%# Bind("DEL_FLAG") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            EMP_ID:
            <asp:Label ID="EMP_IDLabel" runat="server" Text='<%# Eval("EMP_ID") %>' />
            <br />
            EMP_ID_DISPLAY:
            <asp:Label ID="EMP_ID_DISPLAYLabel" runat="server" 
                Text='<%# Bind("EMP_ID_DISPLAY") %>' />
            <br />
            EMP_TITLE:
            <asp:Label ID="EMP_TITLELabel" runat="server" Text='<%# Bind("EMP_TITLE") %>' />
            <br />
            EMP_NAME:
            <asp:Label ID="EMP_NAMELabel" runat="server" Text='<%# Bind("EMP_NAME") %>' />
            <br />
            EMP_SURNAME:
            <asp:Label ID="EMP_SURNAMELabel" runat="server" 
                Text='<%# Bind("EMP_SURNAME") %>' />
            <br />
            EMP_TITLE_E:
            <asp:Label ID="EMP_TITLE_ELabel" runat="server" 
                Text='<%# Bind("EMP_TITLE_E") %>' />
            <br />
            EMP_NAME_E:
            <asp:Label ID="EMP_NAME_ELabel" runat="server" 
                Text='<%# Bind("EMP_NAME_E") %>' />
            <br />
            EMP_SURNAME_E:
            <asp:Label ID="EMP_SURNAME_ELabel" runat="server" 
                Text='<%# Bind("EMP_SURNAME_E") %>' />
            <br />
            PASSWD:
            <asp:Label ID="PASSWDLabel" runat="server" Text='<%# Bind("PASSWD") %>' />
            <br />
            EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />
            PHONE_OFFICE:
            <asp:Label ID="PHONE_OFFICELabel" runat="server" 
                Text='<%# Bind("PHONE_OFFICE") %>' />
            <br />
            PHONE_HOME:
            <asp:Label ID="PHONE_HOMELabel" runat="server" 
                Text='<%# Bind("PHONE_HOME") %>' />
            <br />
            PHONE_MOBILE:
            <asp:Label ID="PHONE_MOBILELabel" runat="server" 
                Text='<%# Bind("PHONE_MOBILE") %>' />
            <br />
            CREATE_DATE:
            <asp:Label ID="CREATE_DATELabel" runat="server" 
                Text='<%# Bind("CREATE_DATE") %>' />
            <br />
            EXPIRE_DATE:
            <asp:Label ID="EXPIRE_DATELabel" runat="server" 
                Text='<%# Bind("EXPIRE_DATE") %>' />
            <br />
            UPDATE_DATE:
            <asp:Label ID="UPDATE_DATELabel" runat="server" 
                Text='<%# Bind("UPDATE_DATE") %>' />
            <br />
            LAST_SIGN_ON_DATE:
            <asp:Label ID="LAST_SIGN_ON_DATELabel" runat="server" 
                Text='<%# Bind("LAST_SIGN_ON_DATE") %>' />
            <br />
            LAST_CHANGE_PASS_DATE:
            <asp:Label ID="LAST_CHANGE_PASS_DATELabel" runat="server" 
                Text='<%# Bind("LAST_CHANGE_PASS_DATE") %>' />
            <br />
            DEL_FLAG:
            <asp:CheckBox ID="DEL_FLAGCheckBox" runat="server" 
                Checked='<%# Bind("DEL_FLAG") %>' Enabled="false" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LGDConnectionString1 %>" 
        DeleteCommand="DELETE FROM [USER_DATA] WHERE [EMP_ID] = @EMP_ID" 
        InsertCommand="INSERT INTO [USER_DATA] ([EMP_ID], [EMP_ID_DISPLAY], [EMP_TITLE], [EMP_NAME], [EMP_SURNAME], [EMP_TITLE_E], [EMP_NAME_E], [EMP_SURNAME_E], [PASSWD], [EMAIL], [PHONE_OFFICE], [PHONE_HOME], [PHONE_MOBILE], [CREATE_DATE], [EXPIRE_DATE], [UPDATE_DATE], [LAST_SIGN_ON_DATE], [LAST_CHANGE_PASS_DATE], [DEL_FLAG]) VALUES (@EMP_ID, @EMP_ID_DISPLAY, @EMP_TITLE, @EMP_NAME, @EMP_SURNAME, @EMP_TITLE_E, @EMP_NAME_E, @EMP_SURNAME_E, @PASSWD, @EMAIL, @PHONE_OFFICE, @PHONE_HOME, @PHONE_MOBILE, @CREATE_DATE, @EXPIRE_DATE, @UPDATE_DATE, @LAST_SIGN_ON_DATE, @LAST_CHANGE_PASS_DATE, @DEL_FLAG)" 
        SelectCommand="SELECT * FROM [EMPLOYEE].[USER_DATA] WHERE ([EMP_ID] = @EMP_ID)" 
        UpdateCommand="UPDATE [USER_DATA] SET [EMP_ID_DISPLAY] = @EMP_ID_DISPLAY, [EMP_TITLE] = @EMP_TITLE, [EMP_NAME] = @EMP_NAME, [EMP_SURNAME] = @EMP_SURNAME, [EMP_TITLE_E] = @EMP_TITLE_E, [EMP_NAME_E] = @EMP_NAME_E, [EMP_SURNAME_E] = @EMP_SURNAME_E, [PASSWD] = @PASSWD, [EMAIL] = @EMAIL, [PHONE_OFFICE] = @PHONE_OFFICE, [PHONE_HOME] = @PHONE_HOME, [PHONE_MOBILE] = @PHONE_MOBILE, [CREATE_DATE] = @CREATE_DATE, [EXPIRE_DATE] = @EXPIRE_DATE, [UPDATE_DATE] = @UPDATE_DATE, [LAST_SIGN_ON_DATE] = @LAST_SIGN_ON_DATE, [LAST_CHANGE_PASS_DATE] = @LAST_CHANGE_PASS_DATE, [DEL_FLAG] = @DEL_FLAG WHERE [EMP_ID] = @EMP_ID">
        <DeleteParameters>
            <asp:Parameter Name="EMP_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EMP_ID" Type="String" />
            <asp:Parameter Name="EMP_ID_DISPLAY" Type="String" />
            <asp:Parameter Name="EMP_TITLE" Type="String" />
            <asp:Parameter Name="EMP_NAME" Type="String" />
            <asp:Parameter Name="EMP_SURNAME" Type="String" />
            <asp:Parameter Name="EMP_TITLE_E" Type="String" />
            <asp:Parameter Name="EMP_NAME_E" Type="String" />
            <asp:Parameter Name="EMP_SURNAME_E" Type="String" />
            <asp:Parameter Name="PASSWD" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="PHONE_OFFICE" Type="String" />
            <asp:Parameter Name="PHONE_HOME" Type="String" />
            <asp:Parameter Name="PHONE_MOBILE" Type="String" />
            <asp:Parameter Name="CREATE_DATE" Type="DateTime" />
            <asp:Parameter Name="EXPIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
            <asp:Parameter Name="LAST_SIGN_ON_DATE" Type="DateTime" />
            <asp:Parameter Name="LAST_CHANGE_PASS_DATE" Type="DateTime" />
            <asp:Parameter Name="DEL_FLAG" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="EMP_ID" QueryStringField="empid" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="EMP_ID_DISPLAY" Type="String" />
            <asp:Parameter Name="EMP_TITLE" Type="String" />
            <asp:Parameter Name="EMP_NAME" Type="String" />
            <asp:Parameter Name="EMP_SURNAME" Type="String" />
            <asp:Parameter Name="EMP_TITLE_E" Type="String" />
            <asp:Parameter Name="EMP_NAME_E" Type="String" />
            <asp:Parameter Name="EMP_SURNAME_E" Type="String" />
            <asp:Parameter Name="PASSWD" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="PHONE_OFFICE" Type="String" />
            <asp:Parameter Name="PHONE_HOME" Type="String" />
            <asp:Parameter Name="PHONE_MOBILE" Type="String" />
            <asp:Parameter Name="CREATE_DATE" Type="DateTime" />
            <asp:Parameter Name="EXPIRE_DATE" Type="DateTime" />
            <asp:Parameter Name="UPDATE_DATE" Type="DateTime" />
            <asp:Parameter Name="LAST_SIGN_ON_DATE" Type="DateTime" />
            <asp:Parameter Name="LAST_CHANGE_PASS_DATE" Type="DateTime" />
            <asp:Parameter Name="DEL_FLAG" Type="Boolean" />
            <asp:Parameter Name="EMP_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
