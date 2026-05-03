<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partidos.aspx.cs" Inherits="ISSD_TP4_FlorPerez.Partidos" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8">
    <title>Gestión Deportiva - ISSD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; padding-top: 30px; font-family: 'Segoe UI', sans-serif; }
        .card-sistema { background: white; padding: 25px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); margin-bottom: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center text-primary fw-bold mb-4">⚽ SISTEMA DE GESTIÓN DE EQUIPOS</h2>

            <!-- FORMULARIO PARA CARGAR EQUIPOS -->
            <div class="card-sistema">
                <h5 class="mb-3">Registrar Equipo Nuevo</h5>
                <div class="row g-2">
                    <div class="col-9">
                        <asp:TextBox ID="txtEquipo" runat="server" CssClass="form-control" placeholder="Nombre del equipo..."></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <asp:Button ID="btnCargar" runat="server" Text="Cargar" CssClass="btn btn-success w-100" OnClick="btnCargar_Click" />
                    </div>
                </div>
            </div>

            <!-- TABLA CON EL BOTÓN -->
            <div class="card-sistema">
                <h5 class="mb-3">Partidos Programados</h5>
                <asp:GridView ID="gvPartidos" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="Local" HeaderText="Local" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Visitante" HeaderText="Visitante" ItemStyle-Font-Bold="true" />
                        <asp:TemplateField HeaderText="Acción">
                            <ItemTemplate>
                                <asp:Button ID="btnVer" runat="server" Text="Ver Detalles" CssClass="btn btn-sm btn-primary shadow-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>