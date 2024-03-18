using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class Lesson
{
    public int LessonId { get; set; }

    public int CourseId { get; set; }

    public string? LessonName { get; set; }

    public string? LessonContent { get; set; }

    public string? VideoUrl { get; set; }

    public int LessonOrder { get; set; }

    public virtual Course Course { get; set; } = null!;
}
