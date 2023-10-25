using BLL.Interfaces;
using DTO;
using Microsoft.AspNetCore.Mvc;


namespace BTL_Lê_Khắc_Mạnh.Controller
{
    [Route("api/[controller]")]
    [ApiController]
    public class HangHoaController : ControllerBase
    {
        private IHangHoaBLL _HangHoaBLL;
        public HangHoaController(IHangHoaBLL sanphamBusiness)
        {
            _HangHoaBLL = sanphamBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public HangHoaDTO GetDatabyID(string id)
        {
            return _HangHoaBLL.GetDatabyID(id);
        }
        [Route("create-sanpham")]
        [HttpPost]
        public HangHoaDTO CreateItem([FromBody] HangHoaDTO model)
        {
            _HangHoaBLL.Create(model);
            return model;
        }
        [Route("update-sanpham")]
        [HttpPost]
        public HangHoaDTO UpdateItem([FromBody] HangHoaDTO model)
        {
            _HangHoaBLL.Update(model);
            return model;
        }

        [Route("delete-sanpham")]
        [HttpDelete]
        public IActionResult DeleteItem(int id)
        {
            _HangHoaBLL.Delete(id);
            return Ok(id);
        }
    }
}
