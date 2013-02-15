<%@ Page Title="Download Page" Language="VB" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="false" CodeFile="downloadPage.aspx.vb" Inherits="aspx.download.downloadPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="width: 100%">
        <table width="auto" style="float: left">
            <tr valign="top">
                <td>
                    <fieldset>
                        <legend>คู่มือการใช้งาน</legend>
                        <div style="text-align: center; width: auto;">
                            <asp:HyperLink ID="ManualHyperLink" runat="server" NavigateUrl="~/download/Leader1_Manual_V1.1.ppt">คู่มือการใช้งาน(Update 20 มิ.ย. 2551)</asp:HyperLink>
                            <br />
                            <asp:HyperLink ID="Leader1FlowHyperLink" runat="server" NavigateUrl="~/download/Leader1flow.ppt">Leader1 Flow</asp:HyperLink>
                            <br />
                            <asp:HyperLink ID="JobDescriptionHyperLink" runat="server" NavigateUrl="~/download/SME Leader1 Job Description.doc">Job Description</asp:HyperLink>
                            <br />
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Krungsri Financial Spreading
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/KFS.PNG" Height="32px" />
                        </legend>
                        <div>
                            <asp:TreeView ID="TreeView3" runat="server" ExpandDepth="1" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>แบบฟอร์ม CA และ BIR</legend>
                        <div>
                            <asp:TreeView ID="TreeView5" runat="server" ExpandDepth="1" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                        <legend>SME Tip Over Preventive Program</legend>
                        <div style="text-align: center; width: auto;">
                            <table border="1">
                                <tr align="left" valign="top">
                                    <td colspan="2">
                                        <asp:TreeView ID="TreeView4" runat="server" ExpandDepth="1" NodeIndent="15">
                                            <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                                VerticalPadding="0px" />
                                            <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                                NodeSpacing="0px" VerticalPadding="2px" />
                                            <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                                <tr align="left" valign="top">
                                    <td>
                                        <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="2" NodeIndent="15">
                                            <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                                VerticalPadding="0px" />
                                            <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                                NodeSpacing="0px" VerticalPadding="2px" />
                                            <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                                        </asp:TreeView>
                                    </td>
                                    <td>
                                        <asp:TreeView ID="TreeView2" runat="server" ExpandDepth="2" NodeIndent="15">
                                            <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                                VerticalPadding="0px" />
                                            <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                            <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                                NodeSpacing="0px" VerticalPadding="2px" />
                                            <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table style="float: left; min-width: 300px;">
            <tr>
                <td>
                    <fieldset>
                        <legend>Port สินเชื่อลูกค้า</legend>
                        <div>
                            <asp:TreeView ID="TreeView6" runat="server" ExpandDepth="2" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table style="float: left; min-width: 300px;">
            <tr>
                <td>
                    <fieldset>
                        <legend>DSS Manual
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ani_new.gif" />
                        </legend>
                        <div>
                            <asp:TreeView ID="TreeView7" runat="server" ExpandDepth="2" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table style="float: left; min-width: 300px;">
            <tr>
                <td>
                    <fieldset>
                        <legend>Credit Rating New Model 21/02/2554
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/ani_new.gif" />
                        </legend>
                        <div>
                            <asp:TreeView ID="TreeView8" runat="server" ExpandDepth="2" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        <table style="float: left; min-width: 300px;">
            <tr>
                <td>
                    <fieldset>
                        <legend>คู่มือระบบ KEC(Krunsri External Credit)</legend>
                        <div>
                            <asp:TreeView ID="TreeView9" runat="server" ExpandDepth="2" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td>
                    <fieldset>
                        <legend>all_DSS_region</legend>
                        <div>
                            <asp:TreeView ID="TreeView10" runat="server" ExpandDepth="2" NodeIndent="15">
                                <ParentNodeStyle Font-Bold="False" ImageUrl="~/images/imageIcon/folder.gif" />
                                <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                                <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                                    VerticalPadding="0px" />
                                <RootNodeStyle ImageUrl="~/images/imageIcon/My Computer.ico" />
                                <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                                    NodeSpacing="0px" VerticalPadding="2px" />
                                <LeafNodeStyle ImageUrl="~/images/imageIcon/txt.gif" />
                            </asp:TreeView>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>