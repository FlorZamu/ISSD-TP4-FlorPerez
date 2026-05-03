<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partidos.aspx.cs" Inherits="TP4.Partidos" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>ISSD - Gestión Deportiva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { background-color: #f0f8ff; font-family: 'Segoe UI', sans-serif; }
        .main-card { background: white; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); padding: 2rem; }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="main-card">
            <h2 class="text-primary mb-4 border-bottom pb-2">Registro de Equipos</h2>
            <div class="mb-3">
                <label class="form-label fw-bold">Nombre del Equipo:</label>
                <asp:TextBox ID="txtNombreEquipo" runat="server" CssClass="form-control" placeholder="Ej: Moreno FC"></asp:TextBox>
            </div>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Equipo" CssClass="btn btn-primary px-4" OnClick="btnGuardar_Click" />
            <hr />
            <a href="index.html" class="btn btn-link text-decoration-none">← Volver al Inicio</a>
        </div>
    </form>
</body>
</html>