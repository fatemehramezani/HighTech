using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_OwnerShip : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        OwnerShipGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (OwnerShipNameTextBox.Text != string.Empty)
        {
            OwnerShipFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        OwnerShipNameTextBox.Text = string.Empty;
        OwnerShipFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        OwnerShipFormView.ChangeMode(FormViewMode.Insert);
        OwnerShipFormView.DataBind();
    }
    protected void OwnerShipGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        OwnerShipFormView.PageIndex = (OwnerShipGridView.PageSize * OwnerShipGridView.PageIndex) + OwnerShipGridView.SelectedIndex;        
        OwnerShipFormView.ChangeMode(FormViewMode.Edit);        
        OwnerShipGridView.SelectedIndex = -1;
    }
    protected void OwnerShipEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        OwnerShipGridView.DataBind();
        OwnerShipFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void OwnerShipFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        OwnerShipFormView.DataBind();
    }
}