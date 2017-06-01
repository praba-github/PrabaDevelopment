using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using GWMPortal.Common;
using System.Configuration;
using GWMPortal;
namespace GWMPortal
{
    public partial class ApprovalPage : System.Web.UI.Page
    {
        /// <summary>
        /// Approval Page
        /// </summary>
        ///
        #region "Constants"
        DataAccess data = new DataAccess();
        string UserName = "";
        #endregion
        #region "PageLoad"
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.SetFocus(DocumentName);
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
            if (!IsPostBack)
            {
                try
                {
                    int Id = 0;
                    string FileName = string.Empty;
                    BindDropDownList(ddlCategory, Id, "DocCategory", "Id", "Select Category");
                    ddlSubCategory.Enabled = false;
                    ddlSubCategory.Items.Insert(0, new ListItem("Select Subcategory", "0"));
                    DocumentId.Text = Request.QueryString["DocumentID"].ToString();
                    DocumentName.Text = Request.QueryString["DocumentName"].ToString();
                    Description.Text = Request.QueryString["Description"].ToString();
                    UserName = Page.User.Identity.Name.ToString();
                    string DocumentID = DocumentId.Text;
                    //Taking Filename from the Upload file control
                    FileName = data.GetFileName(DocumentID);
                    if (FileName == "")
                    {
                        ViewState["FileName"] = "";
                    }
                    else
                    {
                        ViewState["FileName"] = FileName.ToString();
                    }
                }
                catch (Exception ex)
                {
                    ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                    throw ex;
                }
            }
        }
        #endregion
        #region "Approve click"
        protected void Approve_Click(object sender, EventArgs e)
        {
            try
            {
                int upDocID = 0;
                Document document = new Document();
                document.DocumentId = DocumentId.Text.ToString();
                document.DocumentName = DocumentName.Text.ToString();
                document.Description = Description.Text.ToString();
                document.DocumentCategory = ddlCategory.SelectedItem.Text;
                document.DocSubCategory = ddlSubCategory.SelectedItem.Text;
                document.UrlName = "Documents/" + ddlCategory.SelectedItem.Text + "/" + ViewState["FileName"].ToString();
                upDocID = Convert.ToInt32(Request.QueryString["DocumentID"]);
                document.CreatedBy = Page.User.Identity.Name.ToString();
                document.Createdon = DateTime.Now.ToShortDateString();
                document.Url = document.UrlName;
                data.ApprovingDocuments(document, upDocID);
                document.FileName = DocumentName.Text.ToString();
                bool result = MovingFiles(ViewState["FileName"].ToString());
                if (result)
                {
                    //Response.Write("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["ApprovalSuccessMesage"] + "')</script>");
                    lblMessage.Text = ConfigurationManager.AppSettings["ApprovalSuccessMesage"];
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["ApprovalFailureMessage"] + "')</script>");
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                throw ex;
            }
            DocumentName.Text = "";
            Description.Text = "";
            DocumentUrlName.Text = "";
            DocumentUrl.Text = "";
            ddlCategory.SelectedItem.Text = "";
            ddlSubCategory.SelectedItem.Text = "";
        }
        #endregion
        #region "Moving Files"
        private bool MovingFiles(string filename)
        {
            bool validate = true;
            if (ddlCategory.SelectedItem.Text == "Technology")
            {
                string sourcePath = ConfigurationManager.AppSettings["sourcePath"] + filename;
                string destinationPath = ConfigurationManager.AppSettings["Technology"] + filename;
                System.IO.File.Move(sourcePath, destinationPath);
            }
            else if (ddlCategory.SelectedItem.Text == "Domain")
            {
                string sourcePath = ConfigurationManager.AppSettings["sourcePath"] + filename;
                string destinationPath = ConfigurationManager.AppSettings["Domain"] + filename;
                System.IO.File.Move(sourcePath, destinationPath);
            }
            else if (ddlCategory.SelectedItem.Text == "Process")
            {
                string sourcePath = ConfigurationManager.AppSettings["sourcePath"] + filename;
                string destinationPath = ConfigurationManager.AppSettings["Process"] + filename;
                System.IO.File.Move(sourcePath, destinationPath);
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["MovingFilesError"] + "')</script>");
                validate = false;
            }
            return validate;
        }
        #endregion
        #region "selecting subcategory from dropdown"
        protected void ddlcategory_changed(object sender, EventArgs e)
        {
            ddlSubCategory.Enabled = false;
            ddlSubCategory.Items.Clear();
            ddlSubCategory.Items.Insert(0, new ListItem("Select subcategory", "0"));
            int Id = int.Parse(ddlCategory.SelectedItem.Value);
            if (Id > 0)
            {
                BindDropDownList(ddlSubCategory, Id, "DocSubcategory", "SubCategoryId", "Select Subcategory");
                ddlSubCategory.Enabled = true;
            }
        }
        #endregion
        #region "Binding items to Dropdownlist"
        private void BindDropDownList(DropDownList ddl, int Id, string text, string value, string defaultText)
        {
            if (text == "DocSubcategory")
            {
                ddl.DataSource = data.BindingSubcategoryValues(Id);
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
            }
            else
            {
                ddl.DataSource = data.BindingValues();
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
            }
            ddl.Items.Insert(0, new ListItem(defaultText, "0"));
        }
        #endregion
    }
}

















