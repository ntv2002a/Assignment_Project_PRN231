using OnlineLearning_API.Models;

namespace OnlineLearning_API.IService
{
    public interface IAuthService2
    {
        string GenerateTokenString(User user);
    }
}
