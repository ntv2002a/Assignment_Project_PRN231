using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class Question
{
    public int QuestionId { get; set; }

    public int QuizId { get; set; }

    public string? QuestionContent { get; set; }

    public string Options { get; set; } = null!;

    public int CorrectAnswer { get; set; }

    public bool QuestionLevel { get; set; }

    public virtual Quiz Quiz { get; set; } = null!;
}
