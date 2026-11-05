FROM python:3.12.13-slim
COPY --from=ghcr.io/astral-sh/uv:0.12.4 /uv /bin/uv
# C++ compiler used by PyTensor for BG/NBD fitting
RUN apt-get update && apt-get install -y --no-install-recommends g++ && rm -rf /var/lib/apt/lists/*

# The environment lives outside /app, where compose mounts the project
ENV UV_PROJECT_ENVIRONMENT=/opt/venv
WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev
ENV PATH="/opt/venv/bin:$PATH"
# The container user has no writable home for the Matplotlib and PyTensor caches
ENV MPLCONFIGDIR=/tmp/matplotlib
ENV PYTENSOR_FLAGS=base_compiledir=/tmp/pytensor
# Keeps the mounted project free of bytecode written by the container user
ENV PYTHONDONTWRITEBYTECODE=1

ENTRYPOINT ["python", "-m", "ltv_decision_layer"]
