using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GWMPortal.Common;
using System.Configuration;
using System.Globalization;
namespace GWMPortal
{
    public partial class EventsPage : System.Web.UI.Page
    {
        DataAccess data = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.SetFocus(EventName);
            string userName = Page.User.Identity.Name.ToString();
            string admin = ConfigurationManager.AppSettings["AdminUsers"];
            string[] stringArray = admin.Split(';');
            int position = Array.IndexOf(stringArray, userName);
            if (position > -1)
            {
                //Do Nothing
            }
            else
            {
                Response.Redirect("GWMPortalHome.aspx");
            }
        }
		#region "AddingEvents"
        protected void AddEvent_Click(object sender, EventArgs e)
        {
            try
            {
                Events events = new Events();
                events.EventName = EventName.Text.ToString();
                events.Descripton = Description.Text.ToString();
                events.DateFrom = Convert.ToDateTime(DateFrom.Text);
                events.DateTo = Convert.ToDateTime(DateTo.Text);
                TimeSpan ts = Convert.ToDateTime(DateTo.Text)-Convert.ToDateTime(DateFrom.Text);
                events.Days = Convert.ToInt32(ts.TotalDays);
                events.Location = Location.Text;
                data.InsertEvents(events);
                //Response.Write("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["EventsAddedSuccessMsg"] + "')</script>");
                lblMessage.Text = ConfigurationManager.AppSettings["EventsAddedSuccessMsg"];
            }
            catch (Exception ex)
            {
                //Response.Write("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["EventsFailureErrorMsg"] + "')</script>");
                lblMessage.Text = ConfigurationManager.AppSettings["EventsFailureErrorMsg"];
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                throw ex;
            }
            EventName.Text= "";
            DateFrom.Text = "";
            DateTo.Text = "";
            Location.Text = "";
            Description.Text = "";
        }
		#endregion
		#region "selecting Date from Calendar"
        protected void DateFromCalendar_SelectionChanged(object sender, EventArgs e)
        {
           // DateFromCalendar.Visible = false;
            //DateFrom.Text = DateFromCalendar.SelectedDate.ToString();
        }
        protected void DateToCalendar_SelectionChanged(object sender, EventArgs e)
        {
            //DateTo.Text = DateToCalendar.SelectedDate.ToString();
            //DateToCalendar.Visible = false;
        }
		#endregion
    }
}