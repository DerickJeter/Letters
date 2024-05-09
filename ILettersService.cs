using Sabio.Models;
using Sabio.Models.Domain;

namespace Sabio.Services
{
    public interface ILettersService
    {
        Paged<Letters> GetAllPagination(int pageIndex, int pageSize);
    }
}