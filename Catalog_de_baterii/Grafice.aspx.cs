using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZedGraph;
using ZedGraph.Web;

namespace Catalog_de_baterii
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSourceSelectArguments arguments = new DataSourceSelectArguments();
            SqlDataSource sqlDataSource = new SqlDataSource(SqlDataSource1.ConnectionString, "SELECT Capacitate.Capacitate, COUNT(*) AS Count FROM Baterii JOIN Capacitate ON Baterii.CapacitateId = Capacitate.CapacitateId GROUP BY Capacitate.Capacitate");
            DataView dataView = (DataView)sqlDataSource.Select(arguments);
            DataTable dataTable = dataView.ToTable();
            Cache["Capacitate"] = dataTable;

            ZedGraphWeb2.RenderGraph += this.ZedGraphWeb2_RenderGraph;
        }
        private void ZedGraphWeb2_RenderGraph(ZedGraph.Web.ZedGraphWeb webObject, System.Drawing.Graphics g, ZedGraph.MasterPane pane)
        {
            DataTable dt = (DataTable)Cache["Capacitate"];
            GraphPane myPane = pane[0];
            myPane.Title.Text = "Distributie bateii in functie de capacitate";
            myPane.XAxis.Title.Text = "Capacitate";
            Color[] colors =
        {
              Color.Red, Color.Yellow, Color.Green, Color.Blue,
              Color.Purple,Color.Pink,Color.Plum,Color.Silver, Color.Salmon
            };
            if (DropDownList1.SelectedValue != "Selecteaza")
            {
                List<String> puncte = new List<string>();
                PointPairList list = new PointPairList();
                foreach (DataRow dr in dt.Rows)
                {
                    puncte.Add(dr[0].ToString());
                    list.Add(0, float.Parse(dr[1].ToString()));
                }

                switch (DropDownList1.SelectedValue)
                {
                    case "Bare":
                        {
                            BarItem barItem = myPane.AddBar("Capacitate", list, Color.Bisque);
                            barItem.Bar.Fill = new Fill(colors);
                            barItem.Bar.Fill.RangeMin = 0;
                            barItem.Bar.Fill.RangeMax = list.Count();
                            myPane.XAxis.Type = AxisType.Text;
                            myPane.XAxis.Scale.TextLabels = puncte.ToArray();
                            break;
                        };

                    case "Pie":
                        {
                            int i = 0;
                            foreach (DataRow dr in dt.Rows)
                            {
                                //PieItem segment1 = myPane.AddPieSlice((double)dr[1], colors[(i++) % colors.Length], Color.White, 45f, (i % 2 == 0) ? 0.2 : 0, dr[0].ToString());
                                double pieValue = Convert.ToDouble(dr[1]);
                                PieItem segment1 = myPane.AddPieSlice(pieValue, colors[(i++) % colors.Length], Color.White, 45f, (i % 2 == 0) ? 0.2 : 0, dr[0].ToString());
                            }
                            break;
                        }
                }
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSourceSelectArguments arguments = new DataSourceSelectArguments();
            SqlDataSource sqlDataSource = new SqlDataSource(SqlDataSource2.ConnectionString, "EXEC AfiseazaNivelCompatibilitate;");
            DataView dataView = (DataView)sqlDataSource.Select(arguments);
            DataTable dataTable = dataView.ToTable();
            Cache["NivelCompatibilitate"] = dataTable;

            ZedGraphWeb3.RenderGraph += this.ZedGraphWeb3_RenderGraph;
        }
        private void ZedGraphWeb3_RenderGraph(ZedGraph.Web.ZedGraphWeb webObject, System.Drawing.Graphics g, ZedGraph.MasterPane pane)
        {
            DataTable dt = (DataTable)Cache["NivelCompatibilitate"];
            GraphPane myPane = pane[0];
            myPane.Title.Text = "Distributie nivelului de compatibilitate al bateriilor";
            myPane.XAxis.Title.Text = "NivelCompatibilitate";
            Color[] colors =
        {
              Color.Red, Color.Yellow, Color.Green, Color.Blue,
              Color.Purple,Color.Pink,Color.Plum,Color.Silver, Color.Salmon
            };
            if (DropDownList2.SelectedValue != "Selecteaza")
            {
                List<String> puncte = new List<string>();
                PointPairList list = new PointPairList();
                foreach (DataRow dr in dt.Rows)
                {
                    puncte.Add(dr[0].ToString());
                    list.Add(0, float.Parse(dr[1].ToString()));
                }

                switch (DropDownList2.SelectedValue)
                {
                    case "Bare":
                        {
                            BarItem barItem = myPane.AddBar("NivelCompatibilitate", list, Color.Bisque);
                            barItem.Bar.Fill = new Fill(colors);
                            barItem.Bar.Fill.RangeMin = 0;
                            barItem.Bar.Fill.RangeMax = list.Count();
                            myPane.XAxis.Type = AxisType.Text;
                            myPane.XAxis.Scale.TextLabels = puncte.ToArray();
                            break;
                        };

                    case "Pie":
                        {
                            int i = 0;
                            foreach (DataRow dr in dt.Rows)
                            {
                                //PieItem segment1 = myPane.AddPieSlice((double)dr[1], colors[(i++) % colors.Length], Color.White, 45f, (i % 2 == 0) ? 0.2 : 0, dr[0].ToString());
                                double pieValue = Convert.ToDouble(dr[1]);
                                PieItem segment1 = myPane.AddPieSlice(pieValue, colors[(i++) % colors.Length], Color.White, 45f, (i % 2 == 0) ? 0.2 : 0, dr[0].ToString());
                            }
                            break;
                        }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaginaPrincipala.aspx");
        }
    }
}
