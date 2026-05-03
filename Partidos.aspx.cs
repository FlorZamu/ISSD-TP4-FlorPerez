using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace TP4 {
    public partial class Partidos : Page {
        protected void btnGuardar_Click(object sender, EventArgs e) {
            if (string.IsNullOrWhiteSpace(txtNombreEquipo.Text)) return;

            string connString = ConfigurationManager.ConnectionStrings["ConexionDeportes"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString)) {
                try {
                    string sql = "INSERT INTO Equipos (nombre) VALUES (@nombre)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@nombre", txtNombreEquipo.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    // --- GENERAR LOG (Archivo de texto) ---
                    string rutaLog = Server.MapPath("~/operaciones_abm.txt");
                    string registro = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - ALTA: {txtNombreEquipo.Text}{Environment.NewLine}";
                    File.AppendAllText(rutaLog, registro);

                    txtNombreEquipo.Text = "";
                    Response.Write("<script>alert('Equipo guardado y log actualizado con éxito.');</script>");
                }
                catch (Exception ex) {
                    Response.Write("<script>alert('Error técnico: " + ex.Message + "');</script>");
                }
            }
        }
    }
}