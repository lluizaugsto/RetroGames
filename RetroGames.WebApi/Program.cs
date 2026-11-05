var builder = WebApplication.CreateBuilder(args);

// 1. Registrar Controladores e OpenAPI nativo (.NET 10)
builder.Services.AddControllers();
builder.Services.AddOpenApi();

// 2. Configurar política de CORS para o front-end React (Vite)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowViteApp", policy =>
    {
        policy.WithOrigins("http://localhost:5173")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

var app = builder.Build();

// 3. Pipeline de requisições HTTP
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

// 4. Aplicar CORS (deve vir ANTES de UseAuthorization e MapControllers)
app.UseCors("AllowViteApp");

app.UseAuthorization();

app.MapControllers();

app.Run();