using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class User
{
    public int UserId { get; set; }

    public string? UserName { get; set; }

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string? Phone { get; set; }

    public string? Address { get; set; }

    public string? Country { get; set; }

    public bool? Gender { get; set; }

    public string? Image { get; set; }

    public decimal? AccountBalance { get; set; }

    public bool Status { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? LastUpdate { get; set; }

    public int RoleId { get; set; }

    public virtual ICollection<Course>? Courses { get; set; } = new List<Course>();

    public virtual ICollection<Enrollment>? Enrollments { get; set; } = new List<Enrollment>();

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<Token>? Tokens { get; set; } = new List<Token>();

    public virtual ICollection<UserResult>? UserResults { get; set; } = new List<UserResult>();
}
