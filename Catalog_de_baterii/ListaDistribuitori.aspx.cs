using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Catalog_de_baterii
{
    public partial class ListaDistribuitori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           if (e.CommandName == "Insert" && Page.IsValid)
            {
                SqlDataSource1.Insert();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
 
        }
        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        { 
            TextBox newRetailer = (TextBox)GridView1.FooterRow.FindControl("txtNumeRetailer");
           // Aici este validarea 
            LabelEroareInserareDistribuitor.ForeColor = Color.Red;
            if (newRetailer.Text.Trim().Length <= 2)
            {
             
                LabelEroareInserareDistribuitor.Text = "Numele trebuie sa aiba minim 3 caractere! \n";
                e.Cancel = true;
            }
            else 
            {
                e.Command.Parameters["@NumeRetailer"].Value = newRetailer.Text;
                LabelEroareInserareDistribuitor.ForeColor = Color.Green;
                LabelEroareInserareDistribuitor.Text = "Distribuitor adaugat! \n";
            }
        }
    }
}