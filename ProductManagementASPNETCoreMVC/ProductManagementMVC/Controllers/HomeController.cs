using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using ProductManagementMVC.Models;
using System.Net.Http;

public class HomeController : Controller
{
    private readonly HttpClient _client;
    private readonly string _baseUrl;

    public HomeController(IConfiguration config)
    {
        _baseUrl = config["ApiSettings:BaseUrl"];
        _client = new HttpClient { BaseAddress = new Uri(_baseUrl) };
    }

    public async Task<IActionResult> Index()
    {
        var dashboard = new DashboardViewModel();

        var products = await _client.GetFromJsonAsync<List<Product>>("products");
        dashboard.TotalProducts = products?.Count ?? 0;

        return View(dashboard);
    }
}
