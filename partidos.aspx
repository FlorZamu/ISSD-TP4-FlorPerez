<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partidos.aspx.cs" Inherits="TP4.Partidos" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión Deporte - Proyecto 2025</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --celeste-fondo: #e3f2fd; --azul-primario: #0d47a1; }
        body { background-color: var(--celeste-fondo); font-family: 'Segoe UI', Tahoma, sans-serif; }
        .navbar { background-color: var(--azul-primario); box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .card { border: none; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        .btn-guardar { background-color: var(--azul-primario); border: none; color: white; padding: 10px; border-radius: 8px; }
        .header-grilla { background-color: #bbdefb; color: #0d47a1; font-weight: bold; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark mb-4 p-3">
        <div class="container"><span class="navbar-brand fw-bold">PROYECTO 2025 - Gestión Deporte</span></div>
    </nav>

    <form id="form1" runat="server" class="container">
        <div class="row">
            <div class="col-md-5 mb-4">
                <div class="card p-4 shadow">
                    <h3 class="text-primary mb-4">Registrar Equipo</h3>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Nombre del Equipo</label>
                        <asp:TextBox ID="txtNombreEquipo" runat="server" CssClass="form-control" placeholder="Ej: Los Robots de Moreno"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Equipo" CssClass="btn btn-guardar w-100" OnClick="btnGuardar_Click" />
                </div>
            </div>

            <div class="col-md-7">
                <div class="card p-4 shadow">
                    <h3 class="text-primary mb-4">Estadísticas por Equipo</h3>
                    <asp:GridView ID="gvEstadisticas" runat="server" CssClass="table table-hover border-0" AutoGenerateColumns="False">
                        <HeaderStyle CssClass="header-grilla" />
                        <Columns>
                            <asp:BoundField DataField="Equipo" HeaderText="Equipo" />
                            <asp:BoundField DataField="Goles" HeaderText="Total Goles" />
                            <asp:BoundField DataField="Tarjetas" HeaderText="Total Tarjetas" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
