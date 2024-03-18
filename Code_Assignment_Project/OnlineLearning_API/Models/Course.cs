using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class Course
{
    public int CourseId { get; set; }

    public string CourseName { get; set; } = null!;

    public int CategoryId { get; set; }

    public int ExpertId { get; set; }

    public string? Image { get; set; }

    public bool Status { get; set; }

    public string? Description { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? UpdateAt { get; set; }

    public decimal? Price { get; set; }

    public decimal? SalePercent { get; set; }

    public int Duration { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();

    public virtual User Expert { get; set; } = null!;

    public virtual ICollection<Lesson> Lessons { get; set; } = new List<Lesson>();

    public virtual ICollection<Quiz> Quizzes { get; set; } = new List<Quiz>();
}
