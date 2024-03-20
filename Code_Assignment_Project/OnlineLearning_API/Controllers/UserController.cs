using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();

        [HttpGet("GetUserInfo")]
        [Authorize]
        public IActionResult Get()
        {
            return Ok();
        }
    }
}
