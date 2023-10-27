using BLL.Interfaces;
using DTO;
using Microsoft.AspNetCore.Mvc;

namespace Nguoidung.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class HangHoaController : ControllerBase
    {
        private IHangHoaBLL _HangHoaBLL;

        public HangHoaController(IHangHoaBLL hangHoaBLL)
        {
            _HangHoaBLL = hangHoaBLL;
        }
        [Route("getall")]
        [HttpGet]
        public List<HangHoaDTO> GetallHH()
        {
            return _HangHoaBLL.GetallHH();
        }
        [Route("getTHH")]
        [HttpGet]
        public HangHoaDTO GetTHH(string ten)
        {
            return _HangHoaBLL.GetTHH(ten);
        }
    }
}
