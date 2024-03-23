using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.IdentityModel.Tokens;
using OnlineLearning_API.DTO.Course;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();

        [EnableQuery]
        [HttpGet("GetCourseList")]
        public IActionResult Get()
        {
            var courseListRaw = _context.Courses.ToList();

            if(courseListRaw.IsNullOrEmpty())
            {
                return BadRequest(ModelState);
            }

            var courseList = new List<CourseDTO>();
            
            foreach (var course in courseListRaw)
            {
                courseList.Add(new CourseDTO
                {
                    CourseId = course.CourseId,
                    CourseName = course.CourseName,
                    CategoryId = course.CategoryId,
                    ExpertName = _context.Users.FirstOrDefault(e => e.UserId == course.ExpertId).UserName,
                    ExpertImage = _context.Users.FirstOrDefault(e => e.UserId == course.ExpertId).Image != null ? _context.Users.FirstOrDefault(e => e.UserId == course.ExpertId).Image : "images/pic-1.jpg",
                    Image = course.Image != null ? course.Image : "images/thumb-1.png",
                    CreateAt = course.CreateAt.Value.ToString("dd/MM/yyyy"),
                    Description = course.Description != null ? course.Description : "This course has no description yet.",
                    NumberOfEnrolled = _context.Enrollments.Where(e => e.CourseId ==  course.CourseId).Count()
                });
            }

            return Ok(courseList.AsQueryable());
        }

    }
}
