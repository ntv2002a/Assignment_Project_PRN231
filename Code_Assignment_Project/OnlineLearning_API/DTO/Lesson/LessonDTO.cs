namespace OnlineLearning_API.DTO.Lesson
{
    public class LessonDTO
    {
        public int LessonId { get; set; }

        public int CourseId { get; set; }

        public string? LessonName { get; set; }

        public string? LessonContent { get; set; }

        public string? VideoUrl { get; set; }

        public string? LecturerName { get; set; }

        public string? LecturerImage { get; set; }

        public string? CreateAt { get; set; }
    }
}
