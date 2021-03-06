using System;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;

namespace Classify.UserControl.WebMenu
{
    public class MenuModel
    {
        //constructor
        public MenuModel()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //constructor
        public MenuModel(int key, string title, string url, string option, string rel, string target, string tooltip, int priority, bool delFlag, int parentKey, int roleKey)
        {
            this.menuKey = key;
            this.menuTitle = title;
            this.menuUrl = url;
            this.menuPopupOption = option;
            this.menuRel = rel;
            this.menuTarget = target;
            this.menuTooltip = tooltip;
            this.menuPriority = priority;
            this.menuDelFlag = delFlag;
            this.menuParentKey = parentKey;
            this.roleKey = roleKey;
        }

        public const string defaultTitle = "undefined";
        public const string defaultUrl = "javascript:void(0);";

        private int _menuKey;
        private string _menuTitle = defaultTitle;
        private string _menuUrl = defaultUrl;
        private string _menuPopupOption;
        private string _menuRel;
        private string _menuTarget;
        private string _menuTooltip;
        private int _menuPriority;
        private bool _menuDelFlag;
        private int _menuParentKey;
        private int _roleKey;

        public int menuKey { get { return this._menuKey; } set { this._menuKey = value; } }

        public string menuTitle { get { return this._menuTitle; } set { this._menuTitle = value; } }

        public string menuUrl { get { return this._menuUrl; } set { this._menuUrl = value; } }

        public string menuPopupOption { get { return this._menuPopupOption; } set { this._menuPopupOption = value; } }

        public string menuRel { get { return this._menuRel; } set { this._menuRel = value; } }

        public string menuTarget { get { return this._menuTarget; } set { this._menuTarget = value; } }

        public string menuTooltip { get { return this._menuTooltip; } set { this._menuTooltip = value; } }

        public int menuPriority { get { return this._menuPriority; } set { this._menuPriority = value; } }

        public bool menuDelFlag { get { return this._menuDelFlag; } set { this._menuDelFlag = value; } }

        public int menuParentKey { get { return this._menuParentKey; } set { this._menuParentKey = value; } }

        public int roleKey { get { return this._roleKey; } set { this._roleKey = value; } }
    }

    public partial class WebMenuControl : System.Web.UI.UserControl
    {
        private static readonly ILog log = LogManager.GetLogger(
            System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Only proceed if the user is authenticated
            if (Request.IsAuthenticated)
            {
                try
                {
                    Literal_MM.Text = (string)Session["MM"];
                    Literal_MS.Text = (string)Session["MS"];
                }
                catch (Exception ex)
                {
                    Literal_MM.Text = string.Empty;
                    Literal_MS.Text = string.Empty;
                }

                //session ไม่มีค่า โหลดเมนูจาก Database
                if (Literal_MM.Text.Trim().Equals(string.Empty) || Literal_MS.Text.Trim().Equals(string.Empty))
                {
                    loadMenu();
                    Session.Add("MM", Literal_MM.Text);
                    Session.Add("MS", Literal_MS.Text);
                }
            }
        }

        protected void loadMenu()
        {
            FormsAuthenticationTicket authTicket = getAuthTicket();

            if (null != authTicket)
            {
                service.menu.MenuService menu = new service.menu.MenuService();

                Literal_MM.Text = menu.getMainMenu(authTicket.UserData
                    , "|", ConfigurationManager.AppSettings["APPLICATION_NAME"], Page.ResolveUrl("~"));
                Literal_MS.Text = menu.getSubMenu(authTicket.UserData
                    , "|", ConfigurationManager.AppSettings["APPLICATION_NAME"], Page.ResolveUrl("~"));
            }
        }

        //ใช้ผ่าน method เดียวกับ web service แทน
        //protected void loadMenu2()
        //{
        //    FormsAuthenticationTicket authTicket = getAuthTicket();

        //    if (null != authTicket)
        //    {
        //        System.Data.DataView dv = (System.Data.DataView)SqlDS_Menu.Select(DataSourceSelectArguments.Empty);

        //        List<MenuModel> mainMenus = new List<MenuModel>();
        //        List<MenuModel> subMenus = new List<MenuModel>();

        //        System.Data.DataRow[] mainMenu = dv.Table.Select("MENU_PARENT_KEY IS NULL", "MENU_PRIORITY ASC");
        //        System.Data.DataRow[] subMenu = dv.Table.Select("MENU_PARENT_KEY IS NOT NULL", "MENU_PRIORITY ASC");

        //        StringBuilder builder = new StringBuilder();
        //        for (int i = 0; i < mainMenu.Length; i++)
        //        {
        //            MenuModel mainMenuModel = bindModel(mainMenu[i]);
        //            mainMenus.Add(mainMenuModel);

        //            builder.Append(buildMainMenuString(mainMenuModel));
        //        }

        //        Literal_MM.Text = builder.ToString();

        //        for (int i = 0; i < subMenu.Length; i++)
        //        {
        //            MenuModel subMenuModel = bindModel(subMenu[i]);
        //            subMenus.Add(subMenuModel);

        //            //วนลูป mainMenu เพื่อหา MenuRel ที่ตรงกับ MenuParentKey
        //            for (int j = 0; j < mainMenus.Count; j++)
        //            {
        //                if (subMenuModel.menuParentKey.Equals(mainMenus[j].menuKey))
        //                {
        //                    //เช็คว่า menuRel มีค่าหรือไม่
        //                    if (mainMenus[j].menuRel != null)
        //                    {
        //                        System.Xml.XmlDocument subMenuXml = new System.Xml.XmlDocument();

        //                        //load xml ของ sub menu มา
        //                        if (!Literal_MS.Text.Equals(string.Empty))
        //                        {
        //                            subMenuXml.LoadXml(Literal_MS.Text);
        //                        }

        //                        System.Xml.XmlNode xmlNode = subMenuXml.SelectSingleNode("//div[@id=\"" + mainMenus[j].menuRel + "\"]");

        //                        System.Xml.XmlElement aElement = subMenuXml.CreateElement("a");
        //                        aElement.SetAttribute("id", "Link_" + subMenuModel.menuKey.ToString());
        //                        aElement.SetAttribute("title", subMenuModel.menuTooltip);
        //                        if (subMenuModel.menuTarget == null)
        //                        {
        //                            aElement.SetAttribute("rel", subMenuModel.menuRel);
        //                        }
        //                        else
        //                        {
        //                            aElement.SetAttribute("target", subMenuModel.menuTarget);
        //                        }
        //                        //check ว่ามี popup หรือไม่
        //                        if (subMenuModel.menuPopupOption != null)
        //                        {
        //                            aElement.SetAttribute("onclick", "openPopup('menu_" + subMenuModel.menuKey + "_Popup', '"
        //                                + Page.ResolveUrl(subMenuModel.menuUrl) + "', false, '" + subMenuModel.menuPopupOption + "');");
        //                            aElement.SetAttribute("href", MenuModel.defaultUrl);
        //                        }
        //                        else
        //                        {
        //                            //ไม่มี popup set href
        //                            aElement.SetAttribute("href", subMenuModel.menuUrl);
        //                        }
        //                        aElement.InnerText = subMenuModel.menuTitle;

        //                        xmlNode.AppendChild(aElement);

        //                        Literal_MS.Text = subMenuXml.InnerXml;
        //                    }

        //                    //ถ้าเจอที่ตรงกันแล้ว set sub menu เสร็จก็ break ได้เลย
        //                    break;
        //                }
        //            }
        //        }

        //        //add start script
        //        builder = new StringBuilder();
        //        builder.Append("<script type=\"text/javascript\">cssdropdown.startchrome(\"chromemenu\");</script>");

        //        //add sub menu and start script
        //        Literal_MS.Text = Literal_MS.Text + builder.ToString();

        //    }
        //}

        protected Object getDbValue(System.Data.DataRow dr, string columnName)
        {
            Object result = null;

            if (!dr.IsNull(columnName))
            {
                result = dr[columnName];
            }

            return result;
        }

        protected MenuModel bindModel(System.Data.DataRow dr)
        {
            MenuModel menu = new MenuModel();

            if (!dr.IsNull("MENU_KEY"))
            {
                menu.menuKey = (int)getDbValue(dr, "MENU_KEY");
            }

            if (!dr.IsNull("MENU_TITLE"))
            {
                menu.menuTitle = (string)getDbValue(dr, "MENU_TITLE");
            }

            if (!dr.IsNull("MENU_URL"))
            {
                menu.menuUrl = Page.ResolveUrl((string)getDbValue(dr, "MENU_URL"));
            }

            if (!dr.IsNull("MENU_POPUP_OPT"))
            {
                menu.menuPopupOption = (string)getDbValue(dr, "MENU_POPUP_OPT");
            }

            if (!dr.IsNull("MENU_REL"))
            {
                menu.menuRel = (string)getDbValue(dr, "MENU_REl");
            }

            if (menu.menuRel == null)
            {
                menu.menuTarget = "_self";
            }

            if (!dr.IsNull("MENU_TOOLTIP"))
            {
                menu.menuTooltip = (string)getDbValue(dr, "MENU_TOOLTIP");
            }

            if (!dr.IsNull("MENU_PRIORITY"))
            {
                menu.menuPriority = (int)getDbValue(dr, "MENU_PRIORITY");
            }

            if (!dr.IsNull("MENU_PARENT_KEY"))
            {
                menu.menuParentKey = (int)getDbValue(dr, "MENU_PARENT_KEY");
            }

            return menu;
        }

        protected string buildMainMenuString(MenuModel menu)
        {
            StringBuilder builder = new StringBuilder();

            builder.Append("<li id=\"" + "Menu_" + menu.menuKey.ToString() + "\" style=\"white-space: nowrap;\">");
            builder.Append(buildTagA(menu));
            builder.Append("</li>");

            return builder.ToString();
        }

        protected string buildTagA(MenuModel menu)
        {
            StringBuilder builder = new StringBuilder();

            builder.Append("<a id=\"" + "Link_" + menu.menuKey.ToString() + "\" "
                    + "title=\"" + menu.menuTooltip + "\" ");

            if (menu.menuTarget == null)
            {
                builder.Append("rel=\"" + menu.menuRel + "\" ");

                //create dropmenudiv ของ sub menu รอไว้
                System.Xml.XmlDocument subMenuXml = new System.Xml.XmlDocument();

                //load xml ของ sub menu มา(ถ้ามี)
                if (!Literal_MS.Text.Equals(string.Empty))
                {
                    subMenuXml.LoadXml(Literal_MS.Text);
                }

                System.Xml.XmlElement div = subMenuXml.CreateElement("div");
                div.SetAttribute("id", menu.menuRel);
                div.SetAttribute("class", "dropmenudiv");

                subMenuXml.AppendChild(div);
                Literal_MS.Text = subMenuXml.InnerXml;
            }
            else
            {
                builder.Append("target=\"" + menu.menuTarget + "\" ");
            }

            //check ว่ามี popup หรือไม่
            if (menu.menuPopupOption != null)
            {
                builder.Append("onclick=\"openPopup('menu_" + menu.menuKey + "_Popup', '"
                                    + Page.ResolveUrl(menu.menuUrl) + "', false, '" + menu.menuPopupOption + "');\" ");
                builder.Append("href=\"" + MenuModel.defaultUrl + "\" ");
            }
            else
            {
                builder.Append("href=\"" + menu.menuUrl + "\" ");
            }

            builder.Append(">" + menu.menuTitle + "</a>");

            return builder.ToString();
        }

        protected void SqlDS_Menu_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            FormsAuthenticationTicket authTicket = getAuthTicket();

            if (null != authTicket)
            {
                e.Command.Parameters["@roles"].Value = authTicket.UserData;
                e.Command.Parameters["@delimeter"].Value = model.UserModel.DELIMITER;
                e.Command.Parameters["@appName"].Value = ConfigurationManager.AppSettings["APPLICATION_NAME"];
            }
        }

        protected FormsAuthenticationTicket getAuthTicket()
        {
            HttpCookie authCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            FormsAuthenticationTicket authTicket = null;
            try
            {
                authTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch (ArgumentException argEx)
            {
                log.Error(argEx.Message, argEx);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);
            }

            return authTicket;
        }

        protected void LoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            string username = string.Empty;
            FormsAuthenticationTicket authTicket = this.getAuthTicket();

            if (null != authTicket)
            {
                username = authTicket.Name;

                FormsAuthentication.SignOut();
                Session.RemoveAll();
                Session.Abandon();
                Context.Request.Cookies.Clear();

                log.Info(username + " logout.");
            }
        }
    }
}