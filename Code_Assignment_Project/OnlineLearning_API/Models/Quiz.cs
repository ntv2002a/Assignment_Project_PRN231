using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class Quiz
{
    public int QuizId { get; set; }

    public int CourseId { get; set; }

    public string? QuizName { get; set; }

    public string? Description { get; set; }

    public int TimeLimit { get; set; }

    public virtual Course Course { get; set; } = null!;

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<UserResult> UserResults { get; set; } = new List<UserResult>();
}
