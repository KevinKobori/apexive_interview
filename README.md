# minicore_nasa_apod

Bem-vindo ao projeto **minicore_nasa_apod**! Este repositório utiliza uma arquitetura modular com múltiplos pacotes gerenciados pelo [Melos](https://melos.invertase.dev/), facilitando a organização e o desenvolvimento colaborativo.

---

## 🛠 Pré-requisitos

Certifique-se de que você possui as ferramentas abaixo instaladas no seu ambiente de desenvolvimento:

1. **Dart e Flutter**
   - [Instale o Flutter](https://docs.flutter.dev/get-started/install) seguindo as instruções para o seu sistema operacional.
   - Verifique se o Flutter está configurado corretamente:
     ```bash
     flutter doctor
     ```

2. **Melos**
   - Gerenciador de monorepos Dart/Flutter. Instale com o comando:
     ```bash
     dart pub global activate melos
     ```

3. **yq** (Manipulação de YAML via CLI)
   - O script `sync_pubspec.sh` utiliza o `yq`. Instale-o com:
     ```bash
     # macOS/Linux (Homebrew)
     brew install yq

     # Windows (via Chocolatey)
     choco install yq
     ```

---

## 🚀 Configuração do Projeto

Siga os passos abaixo para configurar e executar o projeto localmente:

### 1. **Sincronizar dependências com Melos**

Utilizamos o `Melos` para gerenciar as dependências entre os pacotes. Para buscar e sincronizar todas as dependências:

```bash
melos bootstrap
```

Se preferir, utilize o script customizado para sincronização e organização das dependências:

```bash
melos run sync-dependencies
```

### 2. **Configuração do arquivo `.env`**

- Crie um arquivo `.env` no diretório raiz do projeto.
- Copie o conteúdo do arquivo `.env_local` e cole no `.env`.

### 3. **Executar o projeto**

Para rodar o projeto, abra o pacote principal (`app`) no seu editor e inicie a execução com `F5` ou pelo terminal:
```bash
flutter run
```

---

## 📁 Estrutura do Projeto

O projeto utiliza uma abordagem modular com pacotes separados:

```
minicore_nasa_apod/
├── app/                 # Pacote principal (app Flutter)
├── core/                # Lógica de negócios e serviços compartilhados
├── design_system/       # Componentes visuais e UI compartilhados
├── test_utils/          # Utilitários e mocks para testes
├── shared_dependencies/ # Dependências compartilhadas entre pacotes
├── sync_pubspec.sh      # Script de sincronização de dependências
├── melos.yaml           # Configuração do Melos
└── pubspec_overrides.yaml # Overrides gerados automaticamente pelo Melos
```

---

## 📜 Scripts Importantes

### **Sincronizar dependências**
```bash
melos run sync-dependencies
```

### **Testar todos os pacotes**
```bash
melos exec -- flutter test
```

### **Formatar código em todos os pacotes**
```bash
melos run format
```

---

## 🔧 Dicas de Desenvolvimento

1. **Atualizar dependências compartilhadas:**
   - Edite os arquivos na pasta `shared_dependencies/` para adicionar/remover dependências compartilhadas.
   - Após a modificação, execute:
     ```bash
     melos run sync-dependencies
     ```

2. **Manter dependências ordenadas:**
   - O script `sync_pubspec.sh` organiza automaticamente as dependências de cada pacote em ordem alfabética.

---

## ❓ Problemas Comuns

1. **Erro ao executar `sync_pubspec.sh`:**
   - Certifique-se de que o `yq` está instalado no sistema. Veja a seção **Pré-requisitos**.

2. **Dependências não sincronizadas:**
   - Execute:
     ```bash
     melos bootstrap
     ```

3. **Ambiente local não configurado:**
   - Certifique-se de criar o arquivo `.env` com as informações corretas.