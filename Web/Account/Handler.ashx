<%@ WebHandler Language="C#" Class="Handler" %>
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.IO;
using DataLayer;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            DataLayer.DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
            if (context.Request.QueryString["ProductId"] != null)
            {
                int productId = Convert.ToInt32(context.Request.QueryString["ProductId"]);
                Product product = databaseEntities.Products.FirstOrDefault(item => item.Id == productId);
                context.Response.ContentType = "jpeg";
                context.Response.BinaryWrite((byte[])product.Image);
            }
            else if (context.Request.QueryString["ApplicantId"] != null)
            {
                int applicantId = Convert.ToInt32(context.Request.QueryString["ApplicantId"]);
                Applicant applicant = databaseEntities.Applicants.FirstOrDefault(item => item.Id == applicantId);
                context.Response.ContentType = "jpeg";
                context.Response.BinaryWrite((byte[]) applicant.Image);
            }
        }
        catch
        {}
    } 
    public bool IsReusable {
        get {
            return false;
        }
    }

}