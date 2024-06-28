using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalog_de_baterii
{
    public partial class Proceduri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreeazaProcedura_Click(object sender, EventArgs e)
        {
            LabelMesaj.Text = "";

            // 1 Creeaza conexiunea
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


            // 2 
            string procedura1 = "CREATE OR ALTER PROCEDURE AfiseazaDetaliiBaterii( @numeProducator NVARCHAR(50)) AS " +
                  "SELECT Capacitate.Capacitate, Baterii.Materiale, Baterii.TipBaterie FROM Baterii INNER JOIN Producator ON Baterii.ProducatorId= Producator.ProducatorId INNER JOIN Capacitate  ON Baterii.CapacitateId = Capacitate.CapacitateId WHERE Producator.NumeProducator = @numeProducator";
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(procedura1, sqlConnection);

                sqlCommand.ExecuteNonQuery();
                LabelMesaj.ForeColor = Color.Green;
                LabelMesaj.Text += "Procedura a fost creata cu succes!";


            sqlConnection.Close();
        }

        protected void ApelProcedura_Click(object sender, EventArgs e)
        {
            LabelMesaj.Text = "";

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("AfiseazaDetaliiBaterii", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

           
                SqlParameter sqlParameter = new SqlParameter("@numeProducator", SqlDbType.NVarChar);
                sqlParameter.Value = TextBoxNumeProducator.Text;
                sqlParameter.Direction = ParameterDirection.Input;
                sqlCommand.Parameters.Add(sqlParameter);



                using (sqlConnection)
                {
                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                    if (sqlDataReader.HasRows)
                    {
                        GridView3.DataSource = sqlDataReader;
                        GridView3.DataBind();
                        sqlDataReader.Close();
                        LabelMesaj.ForeColor = Color.Green;
                        LabelMesaj.Text += "Cautare realizata cu succes!";
                    }
                       else
                    {
                        // Nu există rezultate, afișează un mesaj de eroare
                        LabelMesaj.ForeColor = Color.Red;
                        LabelMesaj.Text += "Nu s-au găsit rezultate pentru numele de producător introdus.";
                    }

                }
                sqlConnection.Close();
                   
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedProducatorId = Convert.ToInt32(DropDownList1.SelectedValue);
            SqlDataSource2.SelectParameters["ProducatorId"].DefaultValue = selectedProducatorId.ToString();
            GridView2.DataBind();
        }

        protected void TextBoxNumeProducator_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CreeazaProcedura2_Click(object sender, EventArgs e)
        {
            LabelMesaj2.Text = "";

            // 1 Creeaza conexiunea
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


            // 2 
            string procedura1 = "CREATE OR ALTER PROCEDURE AfiseazaNivelCompatibilitate (@tipBaterie NVARCHAR(50)=NULL) AS BEGIN SELECT B.TipBaterie, COUNT(C.CompatibilitateId) AS NivelCompatibilitate FROM Baterii AS B LEFT JOIN Compatibilitate AS C ON B.BaterieId = C.BaterieId WHERE (@tipBaterie IS NULL OR B.TipBaterie = @tipBaterie) GROUP BY B.TipBaterie; END;";
            
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(procedura1, sqlConnection);

            // 3 in cazul in care procedura nu functioneaza sa imi dea detalii despre eroare + 
            try
            {
                sqlCommand.ExecuteNonQuery();
                LabelMesaj2.ForeColor = Color.Green;
                LabelMesaj2.Text += "Procedura a fost creata cu succes!";
            }
            catch (Exception ex)
            {
                LabelMesaj2.ForeColor = Color.Red;
                LabelMesaj2.Text += "A apărut o eroare: " + ex.Message;
            }
            sqlConnection.Close();
        }

        protected void ApelProcedura2_Click(object sender, EventArgs e)
        {
            LabelMesaj2.Text = "";

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("AfiseazaNivelCompatibilitate", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter sqlParameter = new SqlParameter("@tipBaterie", SqlDbType.NVarChar);
                sqlParameter.Value = TextBoxTipBaterie.Text;
                sqlParameter.Direction = ParameterDirection.Input;
                sqlCommand.Parameters.Add(sqlParameter);



                using (sqlConnection)
                {
                    SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                    if (sqlDataReader.HasRows)
                    {
                        GridView4.DataSource = sqlDataReader;
                        GridView4.DataBind();
                        sqlDataReader.Close();
                        LabelMesaj2.ForeColor = Color.Green;
                        LabelMesaj2.Text += "Cautare realizata cu succes!";
                    }
                    else
                    {
                        // Nu există rezultate, afișează un mesaj de eroare
                        LabelMesaj2.ForeColor = Color.Red;
                        LabelMesaj2.Text += "Nu s-au găsit rezultate pentru tipul de baterie introdus.";
                    }

                }
                sqlConnection.Close();


            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }
    }
}