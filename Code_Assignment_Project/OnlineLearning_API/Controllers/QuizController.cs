using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineLearning_API.Models;

namespace OnlineLearning_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        Prn231OnlineLearningContext _context = new Prn231OnlineLearningContext();

        // Endpoint API để lấy danh sách các câu hỏi cho một bài quiz cụ thể
        [HttpGet("{quizId}/questions")]
        public ActionResult<IEnumerable<Question>> GetQuestionsForQuiz(int quizId)
        {
            var questions = _context.Questions.Where(q => q.QuizId == quizId).ToList();
            return Ok(questions);
        }

        // Endpoint API để nhận kết quả từ người dùng và lưu trữ nó vào cơ sở dữ liệu
        [HttpPost("submit")]
        public IActionResult SubmitQuizResult([FromBody] UserResult userResult)
        {
            // Lưu trữ kết quả vào cơ sở dữ liệu
            _context.UserResults.Add(userResult);
            _context.SaveChanges();
            return Ok();
        }
    }
}
