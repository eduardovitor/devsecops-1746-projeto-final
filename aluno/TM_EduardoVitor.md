# Relatório Teórico Complementar - Clube Aurora (Trilha 2 — Mista)

**Nome do Aluno(a):** Eduardo Vitor Vieira Torres  
**Turma:** DevSecOps 1746  
**Data:** 26/10/2026

---

## 1. Análise de Ameaças (STRIDE & Tríade CIA)

Preencha a matriz de análise para os 4 achados conceituais da Trilha 2 (Mista):

| Achado | Componente / Arquivo | Categoria STRIDE | Pilar CIA Afetado | Impacto no Negócio do Clube Aurora |
|---|---|---|---|---|
| **F3: SQL Injection** | `app/db.py` (`search_clients`) | Elevation of Privilege | Todos | Risco de vazamento de dados, adulteração indevida de informações e até mesmo tentativas de negação de serviço com consultas não-performáticas|
| **F5: Ausência de Headers HTTP** | `app/main.py` e `app/__init__.py` | Information Disclosure | Confidencialidade e Integridade| Má configuração de segurança pode ocasionar alguns tipos de ataque, como alteração indevida de dados, vazamento de informações, etc|
| **F6: Quebra de Menor Privilégio** | `app/db.py` / `app/main.py` | Elevation of Privilege | Todos | Quebra do privilégio mínimo é um risco gigantesco para qualquer organização, tendo em vista que pode causar todos os tipos de ameaças/problemas do STRIDE|
| **F7: IaC Permissiva (Docker Compose)** | `docker-compose.yml` | Elevation of Privilege | Todos | Imagens Docker permissivas anulam o isolamento do sistema e maximizam os riscos do STRIDE. Elas permitem a Fuga de Contêiner (Elevação de Privilégio), a adulteração de arquivos do host e o vazamento de dados sensíveis. Tal problema também facilita ataques de DOS, enquanto o uso do usuário root possibilita falsificações e apaga rastros (repúdio).
 |

---

## 2. Decisão de Arquitetura & Governança (F6)

O Tio Armando solicitou que a nova gerente de atendimento, Carla, receba privilégios de **Admin geral** do sistema.
1. Analise o pedido sob a ótica de **Segregação de Funções (SoD)** e **Menor Privilégio**.
2. Qual modelo de controle de acesso (RBAC) você recomenda para o Clube Aurora (papéis, permissões por rota)?
3. Como você responderia ao Tio Armando para recusar o admin total e propor a solução adequada?

---

## 3. Observabilidade e Detecção de Intrusão

Caso uma conta de funcionário seja comprometida ou ocorram tentativas de força bruta na API:
1. Quais eventos mínimos devem ser registrados no log de auditoria (`audit_log`)?
2. Como a equipe de operações saberia que um ataque de SQL Injection ou login malicioso está ocorrendo em tempo hábil?
