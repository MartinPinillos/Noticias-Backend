using NoticiasAPI.DTOs;
using NoticiasClases.Negocio;
using System.Collections.Generic;
using NoticiasClases;

namespace NoticiasAPI.Negocio
{
    public class API_Noticia_BO
    {
        private readonly Noticia_BO _bo;

        public API_Noticia_BO(string cadenaConexion)
        {
            _bo = new Noticia_BO(cadenaConexion);
        }

        public List<Noticia> Listar() => _bo.Listar();

        public Noticia ObtenerPorId(int id) => _bo.ObtenerPorId(id);

        public void Crear(NoticiaDTO dto)
        {
            Noticia noticia = new()
            {
                titulo = dto.titulo,
                subtitulo = dto.subtitulo,
                descripcion = dto.descripcion,
                categoria = dto.categoria,
                autor = dto.autor,
                urlImagen = dto.urlImagen,
                fecha = dto.fecha
            };

            _bo.Crear(noticia);
        }
        
        public void Editar(int id, NoticiaDTO dto)
        {
            var noticiaOriginal = _bo.ObtenerPorId(id);

            if (noticiaOriginal == null)
                throw new Exception("La noticia no existe.");
            
            // Título
            if (dto.titulo != null &&
                !string.IsNullOrWhiteSpace(dto.titulo) &&
                dto.titulo != noticiaOriginal.titulo)
            {
                noticiaOriginal.titulo = dto.titulo;
            }

            // Subtítulo
            if (dto.subtitulo != null &&
                !string.IsNullOrWhiteSpace(dto.subtitulo) &&
                dto.subtitulo != noticiaOriginal.subtitulo)
            {
                noticiaOriginal.subtitulo = dto.subtitulo;
            }

            // Descripción
            if (dto.descripcion != null &&
                !string.IsNullOrWhiteSpace(dto.descripcion) &&
                dto.descripcion != noticiaOriginal.descripcion)
            {
                noticiaOriginal.descripcion = dto.descripcion;
            }

            // Categoría
            if (dto.categoria != null &&
                !string.IsNullOrWhiteSpace(dto.categoria) &&
                dto.categoria != noticiaOriginal.categoria)
            {
                noticiaOriginal.categoria = dto.categoria;
            }

            // Autor
            if (dto.autor != null &&
                !string.IsNullOrWhiteSpace(dto.autor) &&
                dto.autor != noticiaOriginal.autor)
            {
                noticiaOriginal.autor = dto.autor;
            }

            // URL Imagen
            if (dto.urlImagen != null &&
                !string.IsNullOrWhiteSpace(dto.urlImagen) &&
                dto.urlImagen != noticiaOriginal.urlImagen)
            {
                noticiaOriginal.urlImagen = dto.urlImagen;
            }

            // Fecha
            if (dto.fecha != DateTime.MinValue &&
                dto.fecha != noticiaOriginal.fecha)
            {
                noticiaOriginal.fecha = dto.fecha;
            }

            _bo.Editar(noticiaOriginal);
        }
        
        public void Eliminar(int id) => _bo.Eliminar(id);

        public List<Noticia> Buscar(string texto) => _bo.Buscar(texto);
    }
}