using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LessonController : ControllerBase
    {
        Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();

        [EnableQuery]
        [HttpGet("LessonList")]
        //[Authorize(Policy = "student")]
        public IActionResult actionResult()
        {
            var lessonList = _context.Lessons.ToList();

            return Ok(lessonList.AsQueryable());
        }
    }
}
