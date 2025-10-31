# 🧪 Repositório de Testes da Aplicação — *Cinema App*

## 📖 Descrição do Projeto
Este repositório contém os testes automatizados e manuais desenvolvidos para validar as funcionalidades do **frontend e backend** da aplicação *Cinema App*.  
O objetivo é garantir a qualidade, estabilidade e integridade do sistema em cada release.


Este projeto de teste foi desenvolvido como Challenge Final do programa de bolsas em Software Quality da Compass UOL.

## 👩 Apresentação Pessoal
Sou a Ana Carolina, tenho 22 anos, curso Análise e Desenvolvimento de Sistemas, estou no 3º semestre, sou de Ji-Paraná/RO, meus olhos são castanhos, tenho cabelos castanhos, minha pele é parda e estou usando uma blusa branca.

## 📁 Estrutura do Projeto
```
challengeFinalPBCompassUol/
├── backend/
│   ├── resources/
│   │   ├── authentication.resource
│   │   ├── movies.resource
│   │   ├── reservations.resource
│   │   ├── sessions.resource
│   │   └── theaters.resource
│   └── tests/
│       ├── authentication.robot
│       ├── movies.robot
│       ├── reservations.robot
│       ├── sessions.robot
│       └── theaters.robot
├── frontend/
│   ├── resources/
│   │   └── authentication.resource
│   └── tests/
│       └── authentication.robot
├── docs/
└── README.md
```

## ⚙️ Tecnologias e Ferramentas

**Backend:**
- Python/pip
- Robot Framework 
- Libs: RequestsLibrary/String
- Postman

**Frontend:**
- Python/pip
- Robot Framework 
- Libs: SeleniumLibrary/String
- Navegador: Chrome
- Drivers: ChromeDriver/Selenium WebDriver


## 💻 Repositório da Aplicação
Os testes foram desenvolvidos com base no código da aplicação principal disponível em:

🔗 **Backend:** [cinema-challenge-back](https://github.com/juniorschmitz/cinema-challenge-back)  
🔗 **Frontend:** [cinema-challenge-front](https://github.com/juniorschmitz/cinema-challenge-front)



## 🚀 Como Executar os Testes

### 🔹 Pré-requisitos
Certifique-se de ter instalado:
- Python (versão >= 3.8)
- pip (gerenciador de pacotes Python)
- Git
- Google Chrome
- ChromeDriver (compatível com a versão do Chrome instalada)

Aplicação Cinema App:
- Backend rodando em http://localhost:3000/api/v1
- Frontend rodando em http://localhost:3002
- Banco de dados configurado e acessível
---

### 🔹 Passo a Passo Completo

#### 1️⃣ **Clonar o Repositório**
```bash
git clone https://github.com/anacamorims/challengeFinalPBCompassUol

cd challengeFinalPBCompassUol
```

#### 2️⃣ **Instalar Dependências Python**
```bash
pip install robotframework
pip install robotframework-requests
pip install robotframework-seleniumlibrary
```

#### 3️⃣ **Configurar Aplicação Cinema App**
```bash
# Backend
git clone https://github.com/juniorschmitz/cinema-challenge-back
cd cinema-challenge-back
npm install
npm run dev  
# Deve rodar em http://localhost:3000

# Frontend
git clone https://github.com/juniorschmitz/cinema-challenge-front
cd cinema-challenge-front
npm install
npm start  
# Deve rodar em http://localhost:3002
```

#### 4️⃣ **Executar Testes do Backend**
```bash
cd backend

# Executar todos os testes
robot -d results tests/

# Executar teste específico
robot -d results tests/authentication.robot
robot -d results tests/movies.robot
robot -d results tests/sessions.robot
robot -d results tests/theaters.robot
robot -d results tests/reservations.robot
```

#### 5️⃣ **Executar Testes do Frontend**
```bash
cd frontend

robot -d results tests/authentication.robot
```

### 📊 Relatórios
Os relatórios são gerados automaticamente na pasta `results/`:
- **report.html** → resumo geral da execução
- **log.html** → logs de execução detalhados  
- **output.xml** → dados estruturados para integração
- **screenshots/** → evidências visuais de falhas (frontend)


### ❗ Troubleshooting
- **ChromeDriver não encontrado**: Verificar se está no PATH
- **Aplicação não responde**: Confirmar se backend/frontend estão rodando
- **Testes falhando**: Verificar se as URLs estão corretas
- **Permissões**: Executar terminal como administrador se necessário