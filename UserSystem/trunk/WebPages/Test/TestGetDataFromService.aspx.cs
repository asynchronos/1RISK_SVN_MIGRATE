using System;

namespace UserSystem.WebPages.Test
{
    public partial class TestGetDataFromService : System.Web.UI.Page
    {
        System.Globalization.CultureInfo cul = System.Threading.Thread.CurrentThread.CurrentCulture;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (MyEntities.RISKEntities ent = new MyEntities.RISKEntities())
            {
                System.Data.Objects.ObjectQuery<MyEntities.USER_DATA> tbuser = ent.USER_DATA;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ThaiCalendarExtender1.SelectedDate.HasValue)
            {
                Label1.Text = ThaiCalendarExtender1.SelectedDate.Value.ToString(new System.Globalization.CultureInfo("th-TH"));
            }

            Label1.Text = cul.DisplayName;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2_CalendarExtender.SelectedDate.HasValue)
            {
                Label2.Text = TextBox2_CalendarExtender.SelectedDate.Value.ToString(new System.Globalization.CultureInfo("th-TH"));
            }

            Label2.Text = cul.Name;
        }
    }
}