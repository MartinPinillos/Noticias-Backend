using NoticiasClases.AccesoADatos;

namespace NoticiasClases.Negocio
{
    public class Noticia_BO
    {
        private readonly Noticia_ORA _noticiaOra;

        public Noticia_BO(string cadenaConexion)
        {
            _noticiaOra = new Noticia_ORA(cadenaConexion);
        }

        public List<Noticia> Listar()
        {
            return _noticiaOra.Listar();
        }

        public Noticia ObtenerPorId(int id)
        {
            return _noticiaOra.ObtenerPorId(id);
        }

        public void Crear(Noticia noticia)
        {
            _noticiaOra.Crear(noticia);
        }

        public void Editar(Noticia noticia)
        {
            _noticiaOra.Editar(noticia);
        }

        public void Eliminar(int id)
        {
            _noticiaOra.Eliminar(id);
        }

        public List<Noticia> Buscar(string texto)
        {
            return _noticiaOra.Buscar(texto);
        }
    }
}