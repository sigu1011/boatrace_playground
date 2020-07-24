RUN_CONTEXT ?= docker-compose exec tools
TARGET ?= jake
TEST_TARGET ?= tests

default: up

up:
	docker-compose up -d

down:
	docker-compose down

tools/fmt: tools/fmt/.isort tools/fmt/.black tools/fmt/.tests

tools/lint: tools/lint/.isort tools/lint/.flake8 tools/lint/.mypy tools/lint/actions

tools/test: tools/test/.pytest

# fmt *.py, isort, black
tools/fmt/.isort:
	$(RUN_CONTEXT) poetry run isort -rc ${TARGET}

tools/fmt/.black:
	$(RUN_CONTEXT) poetry run black ${TARGET}

tools/fmt/.tests: tools/fmt/tests/.isort tools/fmt/tests/.black

tools/fmt/tests/.isort:
	$(RUN_CONTEXT) poetry run isort -rc ${TEST_TARGET}

tools/fmt/tests/.black:
	$(RUN_CONTEXT) poetry run black ${TEST_TARGET}

# lint *.py, isort, flake8, mypy
tools/lint/.isort:
	$(RUN_CONTEXT) poetry run isort -rc --check-only ${TARGET}

tools/lint/.flake8:
	$(RUN_CONTEXT) poetry run flake8 ${TARGET}

tools/lint/.mypy:
	$(RUN_CONTEXT) poetry run mypy ${TARGET}

# lint *.yml, yamllint
tools/lint/actions: tools/lint/actions/.yamllint

tools/lint/actions/.yamllint:
	$(RUN_CONTEXT) poetry run yamllint .github/workflows/*.yml

# test pytest
tools/test/.pytest:
	$(RUN_CONTEXT) poetry run pytest --cov=${TEST_TARGET} --cov-branch --cov-report=xml ${TEST_TARGET}
