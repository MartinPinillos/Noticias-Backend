using Npgsql;
using System;

namespace NoticiasClases.AccesoADatos
{
    public class Conexion
    {
        private readonly string _cadenaConexion;

        public Conexion(string cadenaConexion)
        {
            _cadenaConexion = cadenaConexion;
        }

        public NpgsqlConnection ObtenerConexion()
        {
            try
            {
                var conexion = new NpgsqlConnection(_cadenaConexion);
                conexion.Open();
                return conexion;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al conectar con la base de datos", ex);
            }
        }
    }
}