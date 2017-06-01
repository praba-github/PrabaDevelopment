using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace GWMPortal
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "GWM Portal - Error Page!";
            Exception ex = (Exception) Session["Errors"];
            if (ex != null)
            {
                lblErrorMessage.Text = ex.Message.ToString() + Environment.NewLine;
            }
            else
                lblErrorMessage.Text = "No exception found!";
        }
    }
}
