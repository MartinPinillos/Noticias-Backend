using NoticiasClases.AccesoADatos;
using Npgsql;
using System;
using System.Collections.Generic;
using Conexion = NoticiasClases.AccesoADatos.Conexion;


namespace NoticiasClases.AccesoADatos
{
    public class Noticia_ORA
    {
        private readonly string _cadenaConexion;

        public Noticia_ORA(string cadenaConexion)
        {
            _cadenaConexion = cadenaConexion;
        }

        public List<Noticia> Listar()
        {
            var lista = new List<Noticia>();
            var con = new Conexion(_cadenaConexion);

            using var conexion = con.ObtenerConexion();
            string query = @"SELECT id, titulo, subtitulo, descripcion, categoria, autor, url_imagen, fecha
                             FROM noticias ORDER BY fecha DESC";

            using var cmd = new NpgsqlCommand(query, conexion);
            using var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(CargarEntidad(dr));
            }

            return lista;
        }

        public Noticia ObtenerPorId(int id)
        {
            Noticia noticia = null;
            var con = new Conexion(_cadenaConexion);

            using var conexion = con.ObtenerConexion();
            string query = @"SELECT id, titulo, subtitulo, descripcion, categoria, autor, url_imagen, fecha
                             FROM noticias WHERE id = @id";

            using var cmd = new NpgsqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@id", id);

            using var dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                noticia = CargarEntidad(dr);
            }

            return noticia;
        }

        public void Crear(Noticia noticia)
        {
            var con = new Conexion(_cadenaConexion);
            using var conexion = con.ObtenerConexion();

            string query = @"INSERT INTO noticias (titulo, subtitulo, descripcion, categoria, autor, url_imagen, fecha)
                             VALUES (@titulo, @subtitulo, @descripcion, @categoria, @autor, @url_imagen, @fecha)";

            using var cmd = new NpgsqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@titulo", noticia.titulo);
            cmd.Parameters.AddWithValue("@subtitulo", noticia.subtitulo ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@descripcion", noticia.descripcion);
            cmd.Parameters.AddWithValue("@categoria", noticia.categoria);
            cmd.Parameters.AddWithValue("@autor", noticia.autor ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@url_imagen", noticia.urlImagen ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@fecha", noticia.fecha);

            cmd.ExecuteNonQuery();
        }

        public void Editar(Noticia noticia)
        {
            var con = new Conexion(_cadenaConexion);
            using var conexion = con.ObtenerConexion();

            string query = @"UPDATE noticias
                             SET titulo = @titulo,
                                 subtitulo = @subtitulo,
                                 descripcion = @descripcion,
                                 categoria = @categoria,
                                 autor = @autor,
                                 url_imagen = @url_imagen,
                                 fecha = @fecha
                             WHERE id = @id";

            using var cmd = new NpgsqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@titulo", noticia.titulo);
            cmd.Parameters.AddWithValue("@subtitulo", noticia.subtitulo ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@descripcion", noticia.descripcion);
            cmd.Parameters.AddWithValue("@categoria", noticia.categoria);
            cmd.Parameters.AddWithValue("@autor", noticia.autor ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@url_imagen", noticia.urlImagen ?? (object)DBNull.Value);
            cmd.Parameters.AddWithValue("@fecha", noticia.fecha);
            cmd.Parameters.AddWithValue("@id", noticia.id);

            cmd.ExecuteNonQuery();
        }

        public void Eliminar(int id)
        {
            var con = new Conexion(_cadenaConexion);
            using var conexion = con.ObtenerConexion();

            string query = "DELETE FROM noticias WHERE id = @id";

            using var cmd = new NpgsqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }

        public List<Noticia> Buscar(string texto)
        {
            var lista = new List<Noticia>();
            var con = new Conexion(_cadenaConexion);

            using var conexion = con.ObtenerConexion();
            string query = @"SELECT id, titulo, subtitulo, descripcion, categoria, autor, url_imagen, fecha
                             FROM noticias
                             WHERE LOWER(titulo) LIKE LOWER(@texto)
                                OR LOWER(autor) LIKE LOWER(@texto)
                             ORDER BY fecha DESC";

            using var cmd = new NpgsqlCommand(query, conexion);
            cmd.Parameters.AddWithValue("@texto", $"%{texto}%");

            using var dr = cmd.ExecuteReader();
            while (dr.Read())
            { 
                lista.Add(CargarEntidad(dr));
            }

            return lista;
        }
        
        private Noticia CargarEntidad(NpgsqlDataReader dr)
        {
            Noticia noticia = new();
            {
                noticia.id = Convert.ToInt32(dr["id"]);
                noticia.titulo = dr["titulo"].ToString();
                noticia.subtitulo = dr["subtitulo"].ToString();
                noticia.descripcion = dr["descripcion"].ToString();
                noticia.categoria = dr["categoria"].ToString();
                noticia.autor = dr["autor"].ToString();
                noticia.urlImagen = dr["url_imagen"].ToString();
                noticia.fecha = Convert.ToDateTime(dr["fecha"]);
            };
            return noticia;
        }

    }
}
