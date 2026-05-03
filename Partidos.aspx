<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partidos.aspx.cs" Inherits="parcialTP4.Partidos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Parcial TP4 - Flor Perez</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 30px; background-color: #f4f4f9; }
        .box { background: white; padding: 25px; border-radius: 8px; border: 1px solid #ddd; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; border-bottom: 2px solid #2980b9; padding-bottom: 10px; }
        .grid { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .grid th { background: #34495e; color: white; padding: 10px; }
        .grid td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .btn { background: #2980b9; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        .btn:hover { background: #1f6391; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Gestión de Partidos - parcialTP4</h2>
            <asp:Button ID="btnActualizar" runat="server" Text="Cargar Datos del Sistema" CssClass="btn" OnClick="btnActualizar_Click" />
            <hr />
            <asp:GridView ID="gvPartidos" runat="server" CssClass="grid" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="EquipoLocal" HeaderText="Equipo Local" />
                    <asp:BoundField DataField="EquipoVisitante" HeaderText="Equipo Visitante" />
                    <asp:BoundField DataField="Resultado" HeaderText="Resultado" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>