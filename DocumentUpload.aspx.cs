using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Configuration;
using GWMPortal;
using GWMPortal.Common;
using System.Text.RegularExpressions;
namespace GWMPortal
{
    /// <summary>
    /// DocumentUpload
    /// </summary>
    public partial class DocumentUpload : System.Web.UI.Page
    {
        DataAccess data = new DataAccess();
        string UserName;
        #region "pageLoad"
        protected void Page_Load(object sender, EventArgs e)
        {            
            Page.SetFocus(DocumentName);
        }
        #endregion
        #region "Upload Click"
        protected void Upload_Click(object sender, EventArgs e)
        {
            if (UploadFile.HasFile)
                SaveFile(UploadFile.PostedFile);
            else
                UploadStatusLabel.Text = ("<script LANGUAGE='JavaScript' >alert('" + ConfigurationManager.AppSettings["FileNotSpecifiedError"] + "')</script>");
        }
        #endregion
        #region "SaveFile"
        void SaveFile(HttpPostedFile file)
        {
            string savePath = ConfigurationManager.AppSettings["sourcePath"];
            string tempfileName = UploadFile.FileName;
            string fileName = tempfileName.Replace(".",
            string.Format("{0:yyyyMMddhhmmss}", DateTime.Now.ToString("yyyyMMddhhmmss")) + ".");
            savePath += fileName;
            UploadFile.SaveAs(savePath);
            try
            {
                string IsApproved = "0";
                Document document = new Document();
                document.DocumentId = DocumentId.Text.ToString();
                document.DocumentName = DocumentName.Text.ToString();
                document.Description = Description.Text.ToString();
                document.Email = Email.Text.ToString();
                document.FileName = fileName;
                document.UploadedBy = HttpContext.Current.User.Identity.Name;
                document.ApprovedBy = "";
                document.IsApproved = IsApproved.ToString();
                data.UploadingDocuments(savePath, document);
               // UploadFile.PostedFile.SaveAs(Server.MapPath(@".\Uploads\" + fileName));
                lblMessage.Text = ConfigurationManager.AppSettings["DocUploadSuccessMessage"];
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:Upload('" + ConfigurationManager.AppSettings["DocUploadFailureMessage"] + "'); ", true);
                ErrorLog.CreateLogFile(ex, DateTime.Now.ToString());
                throw ex;
            }
            DocumentName.Text = "";
            Description.Text = "";
            Email.Text = "";
            UploadFile.Attributes.Clear();
        }
        #endregion
        protected void Clear_Click(object sender, EventArgs e)
        {
            DocumentName.Text = "";
            Description.Text = "";
            Email.Text = "";
            lblMessage.Text = "";
        }

    }
}





