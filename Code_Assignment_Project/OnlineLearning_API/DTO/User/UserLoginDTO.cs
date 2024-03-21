using OnlineLearning_API.Models;

namespace OnlineLearning_API.DTO.User
{
    public class UserLoginDTO
    {
        public int UserId { get; set; }
        public string? UserName { get; set; }
        public string? Image { get; set; }
        public string TokenString { get; set; }
        public string Role { get; set; } = null!;
    }
}
