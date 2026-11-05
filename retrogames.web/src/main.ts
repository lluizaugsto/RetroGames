import 'bootstrap/dist/css/bootstrap.min.css';

const app = document.querySelector<HTMLDivElement>('#app')!;

app.innerHTML = `
  <div class="container my-4">
    <header className="pb-3 mb-4 border-bottom d-flex justify-content-between align-items-center">
      <h1 class="text-primary fw-bold">🎮 RetroGames Store</h1>
      <span class="badge bg-success fs-6">API: Online (http://localhost:5257)</span>
    </header>

    <div class="p-5 mb-4 bg-light rounded-3 shadow-sm">
      <div class="container-fluid py-2">
        <h2 class="display-6 fw-bold">Bem-vindo ao RetroGames!</h2>
        <p class="col-md-8 fs-5 text-muted">
          Catálogo completo de jogos retrô integrados com a API em .NET 10 e MySQL.
        </p>
      </div>
    </div>
  </div>
`;