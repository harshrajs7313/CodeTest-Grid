using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"].ToString());
    SqlDataAdapter ad = new SqlDataAdapter();
    SqlCommand cmd = new SqlCommand();
    DataTable dataTable;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrid();

        }
    }

    private void FillGrid()
    {
        dataTable = new DataTable();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT Name,ProductNumber,Color,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice FROM Production.Product";
        ad = new SqlDataAdapter(cmd);
        ad.Fill(dataTable);
        ResultGridView.DataSource = dataTable;
        ResultGridView.DataBind();
        ViewState["dirState"] = dataTable;
        ViewState["sortdr"] = "Asc";
    }

    protected void ResultGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ResultGridView.EditIndex = e.NewEditIndex;
        FillGrid();
    }


    protected void ResultGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ResultGridView.PageIndex = e.NewPageIndex;
        FillGrid();
    }

    protected void ResultGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cmd.Connection = conn;
        cmd.CommandText = "DELETE FROM Production.Product WHERE Name='" + ResultGridView.DataKeys[e.RowIndex].Values[0].ToString() + "'";
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();

    }

    protected void ResultGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtFName = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("Name");
        TextBox txtLName = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("ProductNumber");
        TextBox txtCity = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("txtColor");
        TextBox txtState = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("SafetyStockLevel");
        TextBox txtCountry = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("txtReorderPoint");
        TextBox txtDescription = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("txtStandardCost");
        TextBox txtListPrice = (TextBox)ResultGridView.Rows[e.RowIndex].FindControl("txtListPrice");

        cmd.Connection = conn;
        cmd.CommandText = "UPDATE Production.Product SET Name ='" + txtFName.Text + "',ProductNumber ='" + txtLName.Text + "',Color ='" + txtCity.Text + "',SafetyStockLevel ='" + txtState.Text + "',ReorderPoint ='" + txtCountry.Text + "',StandardCost ='" + txtDescription.Text + "'   WHERE Name='" + ResultGridView.DataKeys[e.RowIndex].Values[0].ToString() + "'";
        conn.Open();
        cmd.ExecuteNonQuery();
        ResultGridView.EditIndex = -1;
        FillGrid();
        conn.Close();

    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            ResultGridView.DataSource = dtrslt;
            ResultGridView.DataBind();


        }

    }

    protected void ResultGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ResultGridView.EditIndex = -1;
        FillGrid();

    }

    protected void ResultGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {

            TextBox txtFName = (TextBox)ResultGridView.FooterRow.FindControl("txtFName1");
            TextBox txtLName = (TextBox)ResultGridView.FooterRow.FindControl("txtLName1");
            TextBox txtCity = (TextBox)ResultGridView.FooterRow.FindControl("txtColor1");
            TextBox txtState = (TextBox)ResultGridView.FooterRow.FindControl("txtState1");
            TextBox txtCountry = (TextBox)ResultGridView.FooterRow.FindControl("txtReorderPoint1");
            TextBox txtDescription = (TextBox)ResultGridView.FooterRow.FindControl("txtStandardCost1");
            TextBox txtListPrice = (TextBox)ResultGridView.FooterRow.FindControl("txtListPrice1");
            cmd.Connection = conn;
            cmd.CommandText = "INSERT INTO Production.Product(Name,ProductNumber,Color,SafetyStockLevel,ReorderPoint,StandardCost) Values('" + txtFName.Text + "', '" + txtLName.Text + "', '" + txtCity.Text + "', '" + txtState.Text + "', '" + txtCountry.Text + "' , '" + txtDescription.Text + "')";
            conn.Open();
            cmd.ExecuteNonQuery();
            FillGrid();
            conn.Close();
        }
    }
}
