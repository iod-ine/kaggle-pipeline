project-name = "project-alpha"

default:
	@echo "Current project: $(project-name)"

data: data/raw/sample_submission.csv
data/raw/sample_submission.csv:
	kaggle competitions download -c $(project-name) -p data/raw
	unzip -d data/raw $$(find data/raw -name '*zip')

setup-python:
	poetry install --no-root
	poetry run ipython kernel install --user \
	 --name "$(project-name)" \
	 --display-name "Kaggle: $(project-name)" \
	 --env PYTHONPATH $$(pwd)

teardown-python:
	jupyter kernelspec remove "$(project-name)" -y
	poetry env remove --all
