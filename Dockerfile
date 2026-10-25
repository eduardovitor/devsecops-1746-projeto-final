# Compilando dependências
FROM python:3.13.17-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Criando a imagem hardenizada
FROM python:3.13.17-slim
WORKDIR /app
RUN groupadd -g 10001 app && useradd -u 10001 -g app -s /sbin/nologin appuser
COPY --from=builder /root/.local/ /home/appuser/.local
COPY --chown=appuser:app . .
ENV PATH=/home/appuser/.local/bin:$PATH
USER 10001
EXPOSE 8080
# Adicionando o healthcheck usando lib própria do Python
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/').status == 200 or exit(1)"
# Execução da aplicação
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8080", "app:create_app()"]
