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
    public partial class ReferDocuments : System.Web.UI.Page
    {
        DataAccess data = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {                               
                    GetRefOrTemDocuments();
                }
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);  
            }
        }
        public void GetRefOrTemDocuments()
        {
            try
            {
                //Reference Documents
                //GrdDocuments.DataSource = data.GetRefOrTemDocuments("REF");
                //GrdDocuments.DataBind();
                //Reference Templates
                //GrdTemplates.DataSource = data.GetRefOrTemDocuments("TEM");
                //GrdTemplates.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);  
            }
        }
       
        protected void GrdDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdDocuments.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
       
        protected void GrdTemplates_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdTemplates.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();

        }
          
    }
}
