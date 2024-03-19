using OnlineLearning_API.Models;

namespace OnlineLearning_API.IService
{
    public interface IAuthService
    {
        string GenerateTokenString(User user);
    }
}
