using DataLayer;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Applicant_Request_Technology : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void TechnologyFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        TechnologyFormView.DataBind();
    }
    protected void TechnologyFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
        {
            TechnologyMultiView.SetActiveView(ShowView);
            TechnologyFormView.ChangeMode(FormViewMode.Insert);
        }
    }
    protected void TechnologyGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        TechnologyFormView.PageIndex = (TechnologyGridView.PageSize * TechnologyGridView.PageIndex) + TechnologyGridView.SelectedIndex;
        TechnologyFormView.ChangeMode(FormViewMode.Edit);
        TechnologyMultiView.SetActiveView(EditView);
        TechnologyGridView.DataBind();
        TechnologyGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        PersianNameTextBox.Text = string.Empty;
        EnglishNameTextBox.Text = string.Empty;
        TechnologyFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        TechnologyGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (PersianNameTextBox.Text != string.Empty || EnglishNameTextBox.Text != string.Empty)
        {
            TechnologyFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        TechnologyMultiView.SetActiveView(EditView);
        TechnologyFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        TechnologyFormView.DataBind();
    }
    protected void TechnologyEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        TechnologyGridView.DataBind();
        TechnologyFormView.ChangeMode(FormViewMode.Insert);
        TechnologyMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        TechnologyGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void TechnologyEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        ((Technology)e.Entity).ApplicantId = Profile.ApplicantId;
        ((Technology)e.Entity).IsRequested = true;
        CheckBoxList fieldCheckListBox = (CheckBoxList)TechnologyFormView.FindControl("FieldCheckBoxList");
        if (fieldCheckListBox != null)
        {
            string fields = ";";
            foreach (ListItem listItem in fieldCheckListBox.Items)
                if (listItem.Selected == true)
                    fields += string.Format("{0};", listItem.Value);
            if (!string.IsNullOrEmpty(fields) && fields != ";")
                ((Technology)e.Entity).Fields = fields;
        }
        CheckBoxList specialServiceCheckListBox = (CheckBoxList)TechnologyFormView.FindControl("SpecialServiceCheckBoxList");
        if (specialServiceCheckListBox != null)
        {
            string specialServices = ";";
            foreach (ListItem listItem in specialServiceCheckListBox.Items)
                if (listItem.Selected == true)
                    specialServices += string.Format("{0};", listItem.Value);
            if (!string.IsNullOrEmpty(specialServices) && specialServices != ";")
                ((Technology)e.Entity).SpecialServices = specialServices;
        }
    }
    protected void TechnologyFormView_DataBound(object sender, EventArgs e)
    {
        CheckBoxList fieldCheckListBox = (CheckBoxList) TechnologyFormView.FindControl("FieldCheckBoxList");
        HiddenField fieldHiddenField = (HiddenField)TechnologyFormView.FindControl("FieldsHiddenField");
        if (fieldHiddenField.Value != null)
            foreach (ListItem listItem in fieldCheckListBox.Items)
                listItem.Selected = fieldHiddenField.Value.Contains(string.Format(";{0};", listItem.Value));

        CheckBoxList specialServiceCheckListBox = (CheckBoxList)TechnologyFormView.FindControl("SpecialServiceCheckBoxList");
        HiddenField specialServiceHiddenField = (HiddenField)TechnologyFormView.FindControl("SpecialServicesHiddenField");
        if (specialServiceHiddenField.Value != null)
            foreach (ListItem listItem in specialServiceCheckListBox.Items)
                listItem.Selected = specialServiceHiddenField.Value.Contains(string.Format(";{0};", listItem.Value));
    }
}