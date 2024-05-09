using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Services;
using Sabio.Web.Controllers;
using Sabio.Web.Models.Responses;
using System;

namespace Sabio.Web.Api.Controllers
{
    [Route("api/letters")]
    [ApiController]
    public class LettersApiController : BaseApiController
    {
        private ILettersService _service = null;
        public LettersApiController(ILettersService service,
            ILogger<LettersApiController> logger) : base(logger)
        {
            _service = service;
        }

        [HttpGet("paginate")]
        public ActionResult<ItemResponse<Paged<Letters>>> GetAllPagination(int pageIndex, int pageSize)
        {
            int code = 200;
            BaseResponse response = null;

            try
            {
                Paged<Letters> lettersPaged = _service.GetAllPagination(pageIndex, pageSize);

                if (lettersPaged == null)
                {
                    code = 404;
                    response = new ErrorResponse("not found");
                }
                else
                {
                    response = new ItemResponse<Paged<Letters>>()
                    {
                        Item = lettersPaged
                    };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
            }
            return StatusCode(code, response);
        }
    }
}
