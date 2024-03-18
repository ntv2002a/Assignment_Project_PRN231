using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class UserResult
{
    public int ResultId { get; set; }

    public int UserId { get; set; }

    public int QuizId { get; set; }

    public decimal Score { get; set; }

    public DateTime ResultDate { get; set; }

    public virtual Quiz Quiz { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
