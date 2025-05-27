#!/bin/bash
# Script para executar todos os testes da API ReqRes

# Cria diretório de resultados se não existir
mkdir -p results

# Executa todos os testes e gera relatórios
robot -d results tests/auth/auth_tests.robot tests/users/users_tests.robot tests/resources/resources_tests.robot