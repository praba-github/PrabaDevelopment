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
    public partial class Search : System.Web.UI.Page
    {
        DataAccess data = new DataAccess();
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.SetFocus(txtSearchCriteria);

            GrdSearchResults.DataSource = null;
            GrdSearchResults.DataBind();

        }
        /// <summary>
        /// btnSearch_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetSearchResults();
        }
        /// <summary>
        /// GetSearchResults
        /// </summary>
        private void GetSearchResults()
        {
            try
            {
                GrdSearchResults.DataSource = data.GetSearchResults(txtSearchCriteria.Text);
                GrdSearchResults.DataBind();
            }
            catch (Exception ex)
            {
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                Session["Errors"] = ex;
                Response.Redirect("~/ErrorPage.aspx", true);
            }
            txtSearchCriteria.Text = "";
        } 
        /// <summary>
        /// Gridview PageIndexChanging
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GrdSearchResults_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            GrdSearchResults.PageIndex = e.NewPageIndex;
            GetSearchResults();
        }
    }
}