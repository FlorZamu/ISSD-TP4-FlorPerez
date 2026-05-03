using System;
using System.Data;
using System.Web.UI.WebControls;

namespace ISSD_TP4_FlorPerez
{
    public partial class Partidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { CargarGrilla(); }
        }

        private void CargarGrilla()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id"); dt.Columns.Add("Local"); dt.Columns.Add("Visitante");

            // AQUÍ ESTÁN TUS DATOS CARGADOS[cite: 1, 2]
            dt.Rows.Add("1", "Moreno FC", "ISSD United");
            
            gvPartidos.DataSource = dt;
            gvPartidos.DataBind();
        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            // Lógica para el formulario que pediste
            string nombre = txtEquipo.Text;
            if (!string.IsNullOrEmpty(nombre)) {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Equipo {nombre} cargado!');", true);
                txtEquipo.Text = "";
            }
        }
    }
}