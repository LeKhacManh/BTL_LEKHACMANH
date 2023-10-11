using DTO;
using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL.Interfaces;
using DAL;

namespace BTL_LeKhacManh.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserRepository _userBusiness;
        public UserController(IUserRepository userBusiness)
        {
            _userBusiness = userBusiness;
        }
        [AllowAnonymous]
        [HttpPost("login")]
        public IActionResult Login([FromBody] AuthenticateModel model)
        {
            var user = _userBusiness.Login(model.Username, model.Password);
            if (user == null)
                return BadRequest(new { message = "Tài khoản hoặc mật khẩu không đúng!" });
            return Ok(new { taikhoan = user.TenTaiKhoan, email = user.Email, token = user.token });
        }
    }

    public class AuthenticateModel
    {
        internal string Username;

        public string Password { get; internal set; }
    }
   
    //[HttpPost("create")]
    //public IActionResult CreateUser([FromBody] UserBLL model)
    //{
    //    var newUser = UserRepository.CreateUser(model);
    //    if (newUser == null)
    //        return BadRequest(new { message = "Failed to create user" });

    //    return Created("", newUser);
    //}


}
