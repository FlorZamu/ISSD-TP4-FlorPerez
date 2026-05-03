using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace parcialTP4
{
    public partial class Partidos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarLista();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            CargarLista();
            RegistrarAuditoria("Se presionó el botón Cargar Datos");
        }

        private void CargarLista()
        {
            // Datos de prueba para verificar que la grilla funciona
            List<Partido> lista = new List<Partido>
            {
                new Partido { Id = 1, Fecha = DateTime.Now, EquipoLocal = "Moreno FC", EquipoVisitante = "Atlas", Resultado = "2-1" },
                new Partido { Id = 2, Fecha = DateTime.Now.AddDays(2), EquipoLocal = "Deportivo", EquipoVisitante = "Unión", Resultado = "Pendiente" }
            };

            gvPartidos.DataSource = lista;
            gvPartidos.DataBind();
        }

        private void RegistrarAuditoria(string accion)
        {
            try {
                string ruta = Server.MapPath("operaciones_abm.txt");
                string log = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - {accion} (Usuario: Flor)\n";
                File.AppendAllText(ruta, log);
            } catch { }
        }
    }
}