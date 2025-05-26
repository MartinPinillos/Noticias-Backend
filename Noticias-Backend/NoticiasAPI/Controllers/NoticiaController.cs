using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using NoticiasAPI.DTOs;
using NoticiasAPI.Negocio;
using System;
using System.Collections.Generic;

namespace NoticiasAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NoticiaController : ControllerBase
    {
        private readonly API_Noticia_BO _apiBO;

        public NoticiaController(IConfiguration config)
        {
            string cadenaConexion = config.GetConnectionString("PostgresConnection");
            _apiBO = new API_Noticia_BO(cadenaConexion);
        }

        [HttpGet]
        public ActionResult<List<NoticiaDTO>> Get()
        {
            return Ok(_apiBO.Listar());
        }

        [HttpGet("{id}")]
        public ActionResult<NoticiaDTO> Get(int id)
        {
            var noticia = _apiBO.ObtenerPorId(id);
            if (noticia == null)
                return NotFound();

            return Ok(noticia);
        }

        [HttpPost]
        public IActionResult Post([FromBody] NoticiaDTO dto)
        {
            try
            {
                _apiBO.Crear(dto);
                return Ok(new { mensaje = "Noticia creada exitosamente" });
            }
            catch (Exception ex)
            {
                return BadRequest($"Error al crear noticia: {ex.Message}");
            }
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] NoticiaDTO dto)
        {
            try
            {
                _apiBO.Editar(id, dto);
                return Ok(new { mensaje = "Noticia actualizada correctamente" });
            }
            catch (Exception ex)
            {
                return BadRequest($"Error al editar noticia: {ex.Message}");
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            try
            {
                _apiBO.Eliminar(id);
                return Ok("Noticia eliminada correctamente");
            }
            catch (Exception ex)
            {
                return BadRequest($"Error al eliminar noticia: {ex.Message}");
            }
        }

        [HttpGet("buscar")]
        public ActionResult<List<NoticiaDTO>> Buscar([FromQuery] string q)
        {
            return Ok(_apiBO.Buscar(q));
        }
    }
}
