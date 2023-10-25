using DTO;
using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL. Interfaces;
using DAL;

namespace BTL_LeKhacManh.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserBLL _userBll;
        public UserController(IUserBLL userBusiness)
        {
            _userBll = userBusiness;
        }
        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] AuthenticateDTO model)
        {
            var user = _userBll.Login(model.Username, model.Password);
            if (user == null)
                return BadRequest(new { message = "Tài khoản hoặc mật khẩu không đúng!" });
            return Ok(new { taikhoan = user.TenTaiKhoan, email = user.Email, token = user.token });
        }
    }
}
