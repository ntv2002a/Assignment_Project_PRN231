using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet("admin")]
        [Authorize(Policy = "Admin")]
        public IActionResult AdminAction()
        {
            return Ok("Admin Action Done");
        }

        [HttpGet("student")]
        [Authorize(Policy = "Student")]
        public IActionResult StudentAction()
        {
            return Ok("Student Action Done");
        }
    }
}
