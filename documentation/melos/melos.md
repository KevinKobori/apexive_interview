Para centralizar configurações compartilhadas entre os pacotes em um projeto Flutter dividido em pacotes (`app`, `core`, `design_system`), você pode criar uma configuração central que facilite a manutenção, como linters, dependências e scripts. Aqui está um guia detalhado:

---

### **1. Configuração do projeto monorepo**
Transforme seu projeto em um **monorepo**, utilizando o arquivo `melos.yaml` para gerenciar os pacotes.

#### **Passos para configurar o Melos**
1. **Instale o Melos**
   Adicione o Melos ao seu sistema:
   ```bash
   dart pub global activate melos
   ```

2. **Crie um arquivo `melos.yaml` no diretório raiz do projeto:**
   ```yaml
   name: my_monorepo
   packages:
     - app
     - core
     - design_system
   scripts:
     bootstrap: melos bootstrap
     analyze: melos exec -- flutter analyze
     format: melos exec -- flutter format .
     test: melos exec -- flutter test
   ```
   Isso define os pacotes e os scripts que podem ser executados de forma centralizada.

3. **Estrutura do diretório do projeto:**
   ```
   my_project/
   ├── app/
   ├── core/
   ├── design_system/
   ├── analysis_options.yaml
   ├── melos.yaml
   ├── pubspec.yaml
   ├── shared_pubspec.yaml
   └── sync_pubspec.yaml
   ...
   ```

4. **Sincronize os pacotes:**
   Rode o comando para instalar dependências e vincular os pacotes:
   ```bash
   melos bootstrap
   ```

---

### **2. Configuração de Linters Centralizados**
1. Crie um arquivo `analysis_options.yaml` no diretório raiz:
   ```yaml
   include: package:lints/recommended

   linter:
     rules:
       - avoid_print
       - prefer_final_locals
       - unnecessary_null_checks

   analyzer:
     exclude:
       - '**/build/**'
       - '**/generated/**'
   ```

2. Em cada pacote (`app`, `core`, `design_system`), referencie este arquivo no `analysis_options.yaml`:
   ```yaml
   include: ../../analysis_options.yaml
   ```

---

### **3. Centralizar Dependências**
Você pode gerenciar dependências compartilhadas centralmente utilizando o `melos.yaml`:

1. Adicione as dependências comuns no `pubspec.yaml` principal:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     shared_preferences: ^2.0.15
   ```

2. Em cada pacote, configure o `pubspec.yaml` para usar as dependências transitivas:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     shared_preferences:
   ```

Com o `melos bootstrap`, todas as dependências serão automaticamente sincronizadas.

---

### **4. Scripts de Build e Formatação Centralizados**
Configure scripts no `melos.yaml` para ações comuns:
```yaml
scripts:
  format:
    run: melos exec -- flutter format .
  lint:
    run: melos exec -- flutter analyze
  test:
    run: melos exec -- flutter test
```

Execute os scripts com:
```bash
melos run format
melos run lint
melos run test
```

---

### **5. Pubspec.yaml Centralizado (opcional)**
Se quiser centralizar configurações padrão do `pubspec.yaml`, use o `melos` para propagar atualizações entre os pacotes.

Crie um script para copiar configurações compartilhadas para cada pacote:
```bash
#!/bin/bash
cp shared_pubspec.yaml app/pubspec.yaml
cp shared_pubspec.yaml core/pubspec.yaml
cp shared_pubspec.yaml design_system/pubspec.yaml
melos bootstrap
```

---

### **Vantagens**
- **Centralização**: Configurações de linters, dependências e scripts em um só lugar.
- **Manutenção facilitada**: Menos redundância entre pacotes.
- **Flexibilidade**: Scripts personalizados para ações recorrentes.

Com essa abordagem, você cria um ambiente modular, bem organizado e fácil de manter para o desenvolvimento de projetos em múltiplos pacotes Flutter.