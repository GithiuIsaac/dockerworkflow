setup:
	# Create python virtualenv & source it
	# source ~/.dockerworkflow/bin/activate
	python3 -m venv ~/.dockerworkflow

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	circleci config process .circleci/config.yml
	
run-circleci-local:
	circleci local execute

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test
