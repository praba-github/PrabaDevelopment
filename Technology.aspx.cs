using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace GWMPortal
{
    public partial class Technology : System.Web.UI.Page
    {
        DataAccess data = new DataAccess();
        #region "Page_Load"
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
        #endregion
        #region "Binding  Documents to Technology"
        public void GetRefOrTemDocuments()
        {    
            try
            {
                //CoP Sessions Documents
                GrdCoPSessions.DataSource = data.GetRefOrTemDocuments("TECH", "COP");
                GrdCoPSessions.DataBind();
                //WhitePapers Templates
                GrdWhitePapers.DataSource = data.GetRefOrTemDocuments("TECH", "WTP");
                GrdWhitePapers.DataBind();
                //Reports & Articles 
                GrdReports.DataSource = data.GetRefOrTemDocuments("TECH", "REP");
                GrdReports.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);
            }
        }

        protected void GrdCoPSessions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdCoPSessions.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
        protected void GrdWhitePapers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdWhitePapers.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
        protected void GrdReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {            
            GrdReports.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
        #endregion
    }
}
