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
    public partial class Process : System.Web.UI.Page
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
                GrdRequirements.DataSource = data.GetRefOrTemDocuments("PROS", "REQ");
                GrdRequirements.DataBind();
                //Reference Templates
                GrdDCUT.DataSource = data.GetRefOrTemDocuments("PROS","DCUT");
                GrdDCUT.DataBind();
                GrdImplementation.DataSource = data.GetRefOrTemDocuments("PROS", "IMP");
                GrdImplementation.DataBind();
                GrdOthers.DataSource = data.GetRefOrTemDocuments("PROS", "OTH");
                GrdOthers.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);
            }
        }
        protected void GrdRequirements_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdRequirements.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
        protected void GrdDCUT_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdDCUT.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
		//added
        protected void GrdImplementation_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdImplementation.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }
		//added
        protected void GrdOthers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdOthers.PageIndex = e.NewPageIndex;
            GetRefOrTemDocuments();
        }

    }
}
