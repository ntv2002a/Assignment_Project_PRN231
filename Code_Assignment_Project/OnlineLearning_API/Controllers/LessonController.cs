using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using OnlineLearning_API.DTO.Lesson;
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

        [EnableQuery]
        [HttpGet("LessonInfo")]
        //[Authorize(Policy = "student")]
        public IActionResult lessonInfo()
        {
            var lessonListRaw = _context.Lessons.ToList();
            var lessonList = new List<LessonDTO>();

            foreach (var item in lessonListRaw)
            {
                lessonList.Add(new LessonDTO
                {
                    LessonId = item.LessonId,
                    LessonName = item.LessonName,
                    LessonContent = item.LessonContent,
                    CourseId = item.CourseId,
                    VideoUrl = item.VideoUrl,
                    LecturerName = _context.Users.FirstOrDefault(u => u.UserId == _context.Courses.FirstOrDefault(c => c.CourseId == item.CourseId).ExpertId).UserName,
                    LecturerImage = _context.Users.FirstOrDefault(u => u.UserId == _context.Courses.FirstOrDefault(c => c.CourseId == item.CourseId).ExpertId).Image != null ? _context.Users.FirstOrDefault(u => u.UserId == _context.Courses.FirstOrDefault(c => c.CourseId == item.CourseId).ExpertId).Image : "images/pic-1.jpg",
                    CreateAt = _context.Courses.FirstOrDefault(c => c.CourseId == item.CourseId).CreateAt.Value.ToString("dd/MM/yyyy")
                });
            }

            return Ok(lessonList.AsQueryable());

        }
    }
}
