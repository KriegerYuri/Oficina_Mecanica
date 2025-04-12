# Como o estado foi reiniciado, precisamos recriar o conteúdo do README.md e salvar novamente

readme_content = """
# Projeto de Banco de Dados - Oficina Mecânica

## 📌 Visão Geral  
Este projeto consiste no desenvolvimento de um banco de dados relacional para o gerenciamento de uma **oficina mecânica**. O sistema foi modelado a partir de uma narrativa realista e implementado com base nas boas práticas de modelagem lógica e normalização de dados.

## 🎯 Objetivo  
Controlar e registrar as **ordens de serviço**, integrando informações sobre clientes, veículos, equipes de mecânicos, serviços executados, peças utilizadas e valores cobrados.

## 🧱 Estrutura do Banco de Dados  

**Entidades principais:**

- **Cliente:** CPF, nome, endereço e telefone.
- **Veículo:** Placa, modelo, marca, ano e vínculo com cliente.
- **Equipe:** Nome da equipe de mecânicos.
- **Mecânico:** Nome, endereço, especialidade e vínculo com equipe.
- **Serviço:** Descrição e valor de referência.
- **Peça:** Descrição e valor unitário.
- **Ordem de Serviço (OS):** Número, data de emissão, status, data de conclusão, veículo e equipe.
- **Serviço_OS e Peca_OS:** Registro dos serviços e peças usados em cada OS.

## 🔎 Funcionalidades e Consultas SQL  
Foram criadas queries com foco em:

- `SELECT` simples
- Filtros com `WHERE`
- Atributos derivados com expressões
- Ordenações com `ORDER BY`
- Agrupamentos com `GROUP BY` e condições com `HAVING`
- Junções entre tabelas para análises mais complexas

## 🛠 Utilização  

O script `MySQL_Oficina_Mecanica.sql` inclui:

- Criação do esquema lógico
- Inserção de dados reais para testes
- Consultas SQL para extração de relatórios e análises

## 🧰 Requisitos  

- MySQL ou sistema compatível  
- Ferramentas como MySQL Workbench, DBeaver ou VSCode com extensão SQL
