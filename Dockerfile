FROM python:3.11

WORKDIR /app

COPY pyproject.toml poetry.lock ./

# Install dependencies
RUN pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-dev

# Copy the rest of your application code
COPY . .

CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]

