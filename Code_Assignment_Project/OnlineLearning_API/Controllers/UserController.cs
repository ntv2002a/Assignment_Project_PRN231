using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using OnlineLearning_API.DTO.Course;
using OnlineLearning_API.DTO.User;
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

        [EnableQuery]
        [HttpGet("GetHotLecturer")]
        public IActionResult GetHotLecturer()
        {
            var listAllLecturer = _context.Users.Where(l => l.RoleId == 2).ToList();

            var listLecturerWithCount = new List<HotLecturerDTO>();

            foreach (var item in listAllLecturer)
            {
                int counting = 0;
                var listCourseOfThis = _context.Courses.Where(c => c.ExpertId == item.UserId).ToList();
                var courseList = new List<CourseDTO>();


                foreach (var course in listCourseOfThis)
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
                        NumberOfEnrolled = _context.Enrollments.Where(e => e.CourseId == course.CourseId).Count()
                    });
                }

                foreach (var item1 in courseList)
                {
                    counting += item1.NumberOfEnrolled;
                }

                listLecturerWithCount.Add(
                    new HotLecturerDTO
                    {
                        UserId = item.UserId,
                        UserName = item.UserName,
                        Image = item.Image != null ? item.Image : "images/pic-1.jpg",
                        Count = counting
                    }
                 );
            }
            return Ok(listLecturerWithCount.AsQueryable());
        }
    }
}
