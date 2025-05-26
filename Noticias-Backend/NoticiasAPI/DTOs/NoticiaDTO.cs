namespace NoticiasAPI.DTOs
{
    public class NoticiaDTO
    {
        public string titulo { get; set; }
        public string subtitulo { get; set; }
        public string descripcion { get; set; }
        public string categoria { get; set; }
        public string autor { get; set; }
        public string urlImagen { get; set; }
        public DateTime fecha { get; set; }
    }
}