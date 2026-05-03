using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;

namespace TP4
{
    public partial class Partidos : Page
    {
        string db = ConfigurationManager.ConnectionStrings["ConexionDeportes"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) CargarEstadisticas();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombreEquipo.Text)) return;

            try {
                using (SqlConnection con = new SqlConnection(db)) {
                    string sql = "INSERT INTO Equipos (nombre) VALUES (@nombre)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@nombre", txtNombreEquipo.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Punto obligatorio: El Log en .txt solicitado en el Excel
                RegistrarLog($"ALTA: Se registró el equipo '{txtNombreEquipo.Text}'.");

                txtNombreEquipo.Text = "";
                CargarEstadisticas();
            } catch (Exception ex) {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private void RegistrarLog(string mensaje) {
            string ruta = Server.MapPath("~/operaciones_abm.txt");
            using (StreamWriter sw = new StreamWriter(ruta, true)) {
                sw.WriteLine($"{DateTime.Now:dd/MM/yyyy HH:mm:ss} | {mensaje}");
            }
        }

        private void CargarEstadisticas() {
            // Lógica para llenar gvEstadisticas con los datos de SQL Server
        }
    }
}
