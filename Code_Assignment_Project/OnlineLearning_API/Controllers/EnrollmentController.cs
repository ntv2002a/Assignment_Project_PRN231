using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLearning_API.DTO.Enrollment;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnrollmentController : ControllerBase
    {
        Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();
        [HttpPost("EnrollCourse")]
        [Authorize(Policy = "student")]
        public IActionResult Enroll(EnrollCourseDTO enrollCourseDTO)
        {
            var enrollmentCourse = new Enrollment
            {
                CourseId = enrollCourseDTO.CourseId,
                UserId = enrollCourseDTO.UserId,
                IsArchived = false,
                JoinAt = DateTime.Now,
                EndAt = DateTime.Now.AddMonths(_context.Courses.FirstOrDefault(c => c.CourseId == enrollCourseDTO.CourseId).Duration)
            };

            _context.Enrollments.Add(enrollmentCourse);
            _context.SaveChanges();

            return Ok();
        }
        
    }
}
