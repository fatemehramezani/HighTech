using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class Account_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void LoadApplicant()
    {
        DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        Applicant applicant = databaseEntities.Applicants.FirstOrDefault(item => item.Id == Profile.ApplicantId);
        if (applicant != null)
        {
            FirstNameTextBox.Text = applicant.FirstName;
            LastNameTextBox.Text = applicant.LastName;
            MobileTextBox.Text = applicant.Mobile;
            PhoneTextBox.Text = applicant.Phone;
            EmailTextBox.Text = applicant.Email;
            CompanyTextBox.Text = applicant.Company;
            WebSiteTextBox.Text = applicant.WebSite;
            FaxTextBox.Text = applicant.Fax;
            NationalCodeTextBox.Text = applicant.NationalCode;
            AddressTextBox.Text = applicant.Address;
            PresenterCompanyTextBox.Text = applicant.PresenterCompany;
            ZipCodeTextBox.Text = applicant.ZipCode;
            IsRealRadioButton.Checked = applicant.IsReal != null ? (bool)applicant.IsReal : true;
            if (applicant.DegreeId!=null)
                DegreeDropDownList.SelectedValue = applicant.DegreeId.ToString();
            if (applicant.Id != null)
               applicantImage.Src = "Handler.ashx?ApplicantId=" + Profile.ApplicantId;
            if (applicant.DegreeId != null)
            {
                //DegreeDropDownList.SelectedValue = applicant.DegreeId.ToString();
                 DegreeDropDownList.Items.FindByValue(applicant.DegreeId.ToString()).Selected = true;
            }

        }
        else
        {
            FirstNameTextBox.Text = Profile.FirstName;
            LastNameTextBox.Text = Profile.LastName;
            MobileTextBox.Text = Profile.Mobile;
            PhoneTextBox.Text = Profile.Phone;
            EmailTextBox.Text = Profile.Email;
        }
    }
    protected void ConfirmButton_Click(object sender, EventArgs e)
    {
        DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        User newUser = databaseEntities.Users.First(user => user.Username == Profile.UserName);
        newUser.FirstName = FirstNameTextBox.Text;
        newUser.LastName = LastNameTextBox.Text;
        newUser.Mobile = MobileTextBox.Text;
        newUser.Phone = PhoneTextBox.Text;
        newUser.Email = EmailTextBox.Text;
        databaseEntities.SaveChanges();
        Applicant applicant = databaseEntities.Applicants.FirstOrDefault(item => item.UserId == newUser.Id);
        if (applicant == null)
            applicant = new Applicant();
        Profile.SetPropertyValue("ApplicantId", applicant.Id);
        Profile.SetPropertyValue("LastName", LastNameTextBox.Text);
        Profile.SetPropertyValue("FirstName", FirstNameTextBox.Text);
        Profile.SetPropertyValue("FullName", FirstNameTextBox.Text + " " + LastNameTextBox.Text);
        Profile.SetPropertyValue("Mobile", MobileTextBox.Text);
        Profile.SetPropertyValue("Phone", PhoneTextBox.Text);
        applicant.FirstName = FirstNameTextBox.Text;
        applicant.LastName = LastNameTextBox.Text;
        applicant.Mobile = MobileTextBox.Text;
        applicant.Phone = PhoneTextBox.Text;
        applicant.Email = EmailTextBox.Text;
        applicant.Company = CompanyTextBox.Text;
        applicant.WebSite = WebSiteTextBox.Text;
        applicant.Fax = FaxTextBox.Text;
        applicant.NationalCode = NationalCodeTextBox.Text;
        applicant.Address = AddressTextBox.Text;
        applicant.PresenterCompany = PresenterCompanyTextBox.Text;
        applicant.ZipCode = ZipCodeTextBox.Text;
        applicant.IsReal = IsRealRadioButton.Checked;
        applicant.Image = InsertImage();
        applicant.DegreeId = byte.Parse(DegreeDropDownList.SelectedValue);
        databaseEntities.SaveChanges();
        Response.Redirect("~/Applicant/Default.aspx");
    }
    protected byte[] InsertImage()
    {
        bool isChanged = PictureCheckBox.Checked;
        if (isChanged)
        {
            HtmlInputFile pictureFileUpload = (HtmlInputFile)ImageFileUpload;
            if (pictureFileUpload.PostedFile == null || pictureFileUpload.PostedFile.ContentLength == 0)
                return null;
            System.Drawing.Image fullSizeImg = System.Drawing.Image.FromStream(pictureFileUpload.PostedFile.InputStream);
            System.Drawing.Image.GetThumbnailImageAbort maxDummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
            System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(Math.Min(fullSizeImg.Width, 128), Math.Min(fullSizeImg.Height, 128), maxDummyCallBack, IntPtr.Zero);
            if (thumbNailImg != null)
                return ImageToByteArray(thumbNailImg);
        }
            return null;//new Image().(HttpContext.Current.Server.MapPath());applicantImage.;
    }
    public byte[] ImageToByteArray(System.Drawing.Image imageIn)
    {
        MemoryStream ms = new MemoryStream();
        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        return ms.ToArray();
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
    protected void DegreeDropDownList_DataBound(object sender, EventArgs e)
    {
        LoadApplicant();
    }
}