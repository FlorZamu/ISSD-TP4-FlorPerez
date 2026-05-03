using System;

namespace parcialTP4
{
    public class Partido
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string EquipoLocal { get; set; }
        public string EquipoVisitante { get; set; }
        public string Resultado { get; set; }
    }
}