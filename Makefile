install:
	python3 -m pip install -U pip setuptools wheel pip-tools &&\
    python3 -m piptools compile &&\
    python3 -m pip install -r requirements.txt

test:
	pytest tests --doctest-modules --junitxml=junit/test-results.xml --cov=. --cov-report=xml

lint:
	bandit -r src tests -n 3 --severity-level high --confidence-level medium
	flake8 . --exit-zero

style:
	black *.py