using System;
using System.Configuration;
using System.Web;
using System.Web.Security;
using log4net;

namespace UserSystem.WebPages.LoginOut
{
    public partial class Login : MyWebPage
    {
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static readonly bool isDebugEnabled = log.IsDebugEnabled;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                FormsAuthenticationTicket authTicket = this.getAuthTicket();

                //ถ้าถูก redirect มาหน้านี้แล้วมี ReturnUrl แสดงว่าไม่มีสิทธิ์ดูข้อมูลหน้าที่เรียกหรือ Server timeout
                if (this.hasQueryString("ReturnUrl"))
                {
                    if (null != authTicket)
                    {
                        FailureText.Text = "คุณไม่มีสิทธิ์ในการดูข้อมูลนี้";
                    }
                    else
                    {
                        FailureText.Text = "คุณไม่ได้ใช้งานนานเกินกว่า 30 นาที<br />กรุณา Login ใหม่อีกครั้ง";
                    }
                }
                else //แสดงว่าไม่ได้ถูก redirect มา
                {
                    //do nothing
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            FormsAuthenticationTicket authTicket = this.getAuthTicket();
            //ทำการเคลียร์ cookie ที่ค้างอยู่(ถ้ามี)
            if (null != authTicket)
            {
                string username = authTicket.Name;

                FormsAuthentication.SignOut();
                Session.Abandon();
                Context.Request.Cookies.Clear();

                //Insert log to DB
                logActivity(username, "logout");
                //Debug with log4net
                if (isDebugEnabled)
                {
                    log.Debug(username + " logout.");
                }
            }

            //processing login
            UserService client = new UserService();
            UserModel result = client.Authenticate(UserName.Text, Password.Text,
                ConfigurationManager.AppSettings["APPLICATION_NAME"]);

            if (null == result)
            {
                FailureText.Text = "Authenticate fail : Invalid username or password";
            }
            else
            {
                if (result.RoleList.Count > 0)
                {
                    //Concat RoleList
                    String roles = String.Empty;

                    foreach (RoleModel role in result.RoleList)
                    {
                        roles = roles + "|" + role.ROLE_KEY;
                    }

                    //ตัด | ตัวแรกออก
                    roles = roles.Substring(1);

                    //Create the authentication ticket.
                    authTicket = new FormsAuthenticationTicket(
                        1, result.EMP_ID, DateTime.Now, DateTime.Now.AddMinutes(30), false,
                        roles);

                    //Now encrypt the ticket.
                    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                    //Create a cookie and add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName,
                        encryptedTicket);
                    //set authCookie Expires
                    authCookie.Expires = authTicket.Expiration;

                    //Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    //Insert log to DB
                    logActivity(authTicket.Name, "login");
                    //Debug with log4net
                    if (isDebugEnabled)
                    {
                        log.Info(result.EMP_ID + " login with roles " + roles);
                    }

                    //Redirect the user to the originally requested page
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(result.EMP_ID, false));
                }
                else
                {
                    FailureText.Text = "Authorize fail : Invalid roles";
                }
            }
        }
    }
}