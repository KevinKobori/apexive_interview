#!/bin/bash

echo "Iniciando sincronização de dependências compartilhadas..."

# Caminhos para os arquivos de dependências compartilhadas
COMMON_SHARED="shared_dependencies/common.yaml"
APP_CORE_SHARED="shared_dependencies/app_core.yaml"
CORE_DESIGN_SHARED="shared_dependencies/core_design.yaml"

# Lista de pacotes a sincronizar
PACKAGES=("app" "core" "design_system" "test_utils")

# # Função para verificar se o arquivo de dependências compartilhadas está vazio
# is_file_empty() {
#   FILE=$1
#   if [[ -z $(yq eval '.dependencies, .dev_dependencies | keys | length > 0' "$FILE") ]]; then
#     return 0 # Vazio
#   else
#     return 1 # Não está vazio
#   fi
# }

# Função para aplicar dependências compartilhadas a um pacote
apply_shared_dependencies() {
  PACKAGE_PATH=$1
  SHARED_FILE=$2

  # # Verifica se o arquivo compartilhado está vazio
  # if is_file_empty "$SHARED_FILE"; then
  #   echo "Arquivo $SHARED_FILE está vazio. Pulando..."
  #   return
  # fi

  echo "Mesclando dependências de $SHARED_FILE em $PACKAGE_PATH/pubspec.yaml..."

  # Mescla as dependências compartilhadas com as do pacote, mantendo as existentes
  yq eval-all '. as $item ireduce ({}; . *+ $item)' "$PACKAGE_PATH/pubspec.yaml" "$SHARED_FILE" > tmp_pubspec.yaml

  # Ordena as dependências alfabeticamente
  yq eval 'with(.dependencies; . |= (to_entries | sort_by(.key) | from_entries))' tmp_pubspec.yaml -i
  yq eval 'with(.dev_dependencies; . |= (to_entries | sort_by(.key) | from_entries))' tmp_pubspec.yaml -i

  # Substitui o pubspec.yaml original pelo atualizado
  mv tmp_pubspec.yaml "$PACKAGE_PATH/pubspec.yaml"

  echo "Dependências aplicadas e ordenadas em $PACKAGE_PATH/pubspec.yaml"
}

# Função para executar flutter pub get em um pacote
run_flutter_pub_get() {
  PACKAGE_PATH=$1
  echo "Executando flutter pub get em $PACKAGE_PATH..."
  (cd "$PACKAGE_PATH" && flutter pub get)
}

# Sincronizar dependências compartilhadas para cada combinação de pacotes
for PACKAGE in "${PACKAGES[@]}"; do
  # Dependências comuns a todos os pacotes
  apply_shared_dependencies "$PACKAGE" "$COMMON_SHARED"
  
  # Dependências específicas para app e core
  if [[ "$PACKAGE" == "app" || "$PACKAGE" == "core" ]]; then
    apply_shared_dependencies "$PACKAGE" "$APP_CORE_SHARED"
  fi

  # Dependências específicas para core e design_system
  if [[ "$PACKAGE" == "core" || "$PACKAGE" == "design_system" ]]; then
    apply_shared_dependencies "$PACKAGE" "$CORE_DESIGN_SHARED"
  fi

  # Executa flutter pub get para instalar as dependências
  run_flutter_pub_get "$PACKAGE"
done

echo "Sincronização concluída com sucesso!"
