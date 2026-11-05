import 'bootstrap/dist/css/bootstrap.min.css';
import api from './services/api';

interface Jogo {
  idJogo: number;
  titulo: string;
  descricao?: string;
  preco: number;
  anoLancamento: number;
  imagemUrl?: string;
}

const app = document.querySelector<HTMLDivElement>('#app')!;

async function carregarJogos() {
  app.innerHTML = `
    <div class="container my-4">
      <header class="pb-3 mb-4 border-bottom d-flex justify-content-between align-items-center">
        <h1 class="text-primary fw-bold">🎮 RetroGames Store</h1>
        <span class="badge bg-success fs-6">API: Online (http://localhost:5257)</span>
      </header>
      <div class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Carregando...</span>
        </div>
        <p class="mt-2 text-muted">A carregar catálogo do MySQL...</p>
      </div>
    </div>
  `;

  try {
    const response = await api.get<Jogo[]>('/jogo');
    const jogos = response.data;

    let cardsHtml = '';
    jogos.forEach(jogo => {
      cardsHtml += `
        <div class="col-md-4 mb-4">
          <div class="card h-100 shadow-sm">
            <img src="${jogo.imagemUrl || 'https://via.placeholder.com/300x200?text=RetroGame'}" class="card-img-top" alt="${jogo.titulo}" style="height: 200px; object-fit: cover;">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title fw-bold">${jogo.titulo}</h5>
              <p class="card-text text-muted flex-grow-1">${jogo.descricao || 'Sem descrição disponível.'}</p>
              <div class="d-flex justify-content-between align-items-center mt-3">
                <span class="fs-5 fw-bold text-success">R$ ${jogo.preco.toFixed(2)}</span>
                <span class="badge bg-secondary">${jogo.anoLancamento}</span>
              </div>
            </div>
          </div>
        </div>
      `;
    });

    app.innerHTML = `
      <div class="container my-4">
        <header class="pb-3 mb-4 border-bottom d-flex justify-content-between align-items-center">
          <h1 class="text-primary fw-bold">🎮 RetroGames Store</h1>
          <span class="badge bg-success fs-6">Conectado ao MySQL</span>
        </header>
        <div class="row">
          ${cardsHtml.length > 0 ? cardsHtml : '<p class="text-muted">Nenhum jogo encontrado na base de dados.</p>'}
        </div>
      </div>
    `;
  } catch (error) {
    console.error("Erro ao carregar jogos:", error);
    app.innerHTML = `
      <div class="container my-4">
        <header class="pb-3 mb-4 border-bottom d-flex justify-content-between align-items-center">
          <h1 class="text-primary fw-bold">🎮 RetroGames Store</h1>
          <span class="badge bg-danger fs-6">Erro de Conexão</span>
        </header>
        <div class="alert alert-danger shadow-sm">
          <h4 class="alert-heading">Não foi possível carregar os dados!</h4>
          <p>Verifique se a API em .NET 10 está a rodar na porta 5257 e se o MySQL está ativo.</p>
        </div>
      </div>
    `;
  }
}

carregarJogos();