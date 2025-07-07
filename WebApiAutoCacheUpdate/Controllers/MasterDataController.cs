using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class MasterDataController : ControllerBase
{
   //private readonly ICacheService _cacheService;

    public MasterDataController()
    {
        //_cacheService = cacheService;
    }

    [HttpPost("UpdateCache")]
    public async Task<IActionResult> UpdateCache()
    {

        return Ok("Cache updated successfully.");
    }
}