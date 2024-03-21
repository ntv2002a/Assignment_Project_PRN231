using OnlineLearning_API.Models;

namespace OnlineLearning_API.DTO.Course
{
    public class CourseDTO
    {
        public int CourseId { get; set; }

        public string CourseName { get; set; } = null!;

        public int CategoryId { get; set; }

        public string ExpertName { get; set; }
        public string ExpertImage { get; set; }

        public string? Image { get; set; }

        public string CreateAt { get; set; }

        public string Description { get; set; }
    }
}
