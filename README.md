# pLTV Decision Layer

Decides per customer whether to send, wait, shrink or block a predicted lifetime value (pLTV) before it reaches a value-based bidder. Work in progress: the repository holds the project setup, the pipeline is not implemented yet.

## Setup

Requires Docker with Compose.

## Usage

```bash
docker compose run --rm pipeline
```

## Project structure

- `ltv_decision_layer/`: the pipeline.
- `tests/`: the tests.
- `data/`: input datasets, downloaded by hand and never committed.
- `Dockerfile`, `compose.yaml`: the container that runs the pipeline.
- `pyproject.toml`, `uv.lock`: dependencies.

## Develop

Requires [uv](https://docs.astral.sh/uv/).

- `uv run python -m ltv_decision_layer` runs the pipeline without Docker.
- `uv run pytest` runs the tests.
- `uv run ruff format .` formats the code.
- `uv run ruff check --fix .` lints and fixes what it can.
- `uv add <package>` adds a dependency and pins it in `uv.lock`.
