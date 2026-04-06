.PHONY: setup lint typecheck test bench run docker

## setup: Install pinned deps, configure virtualenv, install pre-commit hooks
setup:
	pip install --upgrade pip
	pip install -r requirements-dev.txt
	pre-commit install

## lint: Run ruff linter and formatter check (zero warnings policy)
lint:
	ruff check src/ tests/
	ruff format --check src/ tests/

## typecheck: Run mypy strict type checking
typecheck:
	mypy src/ --strict

## test: Run full unit + integration suite
test:
	pytest tests/ -v --tb=short

## bench: Run benchmark stubs and output JSON report
bench:
	python scripts/bench.py --output docs/bench_results.json

## run: Start service locally with hot-reload
run:
	uvicorn src.main:app --reload --port 8000

## docker: Build and run the container
docker:
	docker build -t gem-template . && docker run --rm -p 8000:8000 gem-template
