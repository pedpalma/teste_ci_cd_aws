FROM python:3.11-slim
WORKDIR /app
RUN pip install --upgrade pip
COPY requiriments.txt .
RUN pip install -r requiriments.txt
COPY app/ ./app/

# Criar user
RUN addgroup --system appgroup
RUN adduser --system --ingroup appgroup appgroup

# Inicializa o container
USER appuser
EXPOSE 8080
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8080"]
