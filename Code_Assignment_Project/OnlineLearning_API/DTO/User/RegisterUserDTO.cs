namespace OnlineLearning_API.DTO.User
{
    public class RegisterUserDTO
    {
        public string UserName { get; set; } = null!;
        public int RoleId { get; set; }
        public string Email { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string ConfirmPassword { get; set; } = null!;
    }
}
