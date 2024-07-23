using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OnlineLearning_API.DTO.User;
using OnlineLearning_API.IService;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class AuthenticationController : ControllerBase
    {
        private readonly Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();
        private readonly IAuthService _authService;

        public AuthenticationController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Login(LoginUserDTO loginUserDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            User checkUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == loginUserDTO.Email);

            if (checkUser == null)
            {
                return NotFound("Email does not exist.");
            }

            if (checkUser.Password  != loginUserDTO.Password)
            {
                return BadRequest("Wrong Password.");
            }

            checkUser.Role = _context.Roles.FirstOrDefault(r => r.RoleId == checkUser.RoleId);

            var tokenString = _authService.GenerateTokenString(checkUser);

            var user = new UserLoginDTO
            {
                UserId = checkUser.UserId,
                UserName = checkUser.UserName,
                Image = checkUser.Image != null ? checkUser.Image : "images/pic-1.jpg",
                Role = checkUser.Role.RoleName,
                TokenString = tokenString
            };

            return Ok(user);
        }

        [HttpPost("Register")]
        public async Task<IActionResult> Register(RegisterUserDTO registerUserDTO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            User checkUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == registerUserDTO.Email);

            if (checkUser != null)
            {
                return BadRequest("Email has been exist.");
            }

            if (registerUserDTO.Password != registerUserDTO.ConfirmPassword)
            {
                return BadRequest("Confirm Password does not match the Password.");
            }

            User newUser = new User
            {
                UserName = registerUserDTO.UserName,
                Email = registerUserDTO.Email,
                Password = registerUserDTO.Password,
                RoleId = registerUserDTO.RoleId != null ? registerUserDTO.RoleId : 3,
                Status = true,
                Role = _context.Roles.FirstOrDefault(r => r.RoleId == registerUserDTO.RoleId),
                CreateAt = DateTime.Now
            };

            try
            {
                _context.Users.Add(newUser);
                _context.SaveChanges();

                return Ok("New user has been created.");
            }
            catch (Exception ex)
            {
                return Conflict(ex);
            }
            
        }

        [HttpGet("Logout")]
        public async Task<IActionResult> logOut()
        {
            await HttpContext.SignOutAsync(JwtBearerDefaults.AuthenticationScheme);

            return Ok();
        }
    }
}
