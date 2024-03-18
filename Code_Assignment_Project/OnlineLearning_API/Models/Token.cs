using System;
using System.Collections.Generic;

namespace OnlineLearning_API.Models;

public partial class Token
{
    public int TokenId { get; set; }

    public int UserId { get; set; }

    public string TokenString { get; set; } = null!;

    public DateTime ExpiredDate { get; set; }

    public virtual User User { get; set; } = null!;
}
