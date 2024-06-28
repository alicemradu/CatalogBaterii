using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalog_de_baterii
{
    public partial class Catalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = null;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {           
            //Pentru GridView
            int selectedConsumatorID = Convert.ToInt32(DropDownList1.SelectedValue); //Preia valoarea selectata din dropdown
            SqlDataSource2.SelectParameters["ConsumatorId"].DefaultValue = selectedConsumatorID.ToString();  // Actualizează parametrul SqlDataSource2
            GridView1.DataBind(); // Reîncarcă datele în GridView

            //Pentru imagine
            string imageUrl = GetImageUrl(selectedConsumatorID); //Apeleaza functia creata
            Image1.ImageUrl = imageUrl; //Ofera URL-ul dorit controlului Imagine
            Image1.Visible = !string.IsNullOrEmpty(imageUrl); //Face control Imagine vizibil daca nu este gol
        }

        //Functie pentru transmitere URL imagine
        private string GetImageUrl(int consumatorId) //Primeste ca parametru consumatorID
        {

            //1 Creez conexiunea la baza de date
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                //2 Selecteaza url corespunzator pentru Dispozitivul Consumator selectat
                using (SqlCommand cmd = new SqlCommand("SELECT ConsumatorUrl FROM Consumator WHERE ConsumatorId = @ConsumatorId", con))
                {
                    cmd.Parameters.AddWithValue("@ConsumatorId", consumatorId); //3 Trimit parametrul primit din functie la comanda de SELECT
                    con.Open();
                    string imageUrl = cmd.ExecuteScalar()?.ToString(); //4 Execut comanda de SELECT prin ExecuteScalar
                    con.Close();
                    return imageUrl; // 5 Returnez adresa imaginii
                }
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }
    }
}