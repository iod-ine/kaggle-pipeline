project-name = 

ifndef project-name
$(error Project name is not set!)
endif

default:
	@echo "Project: $(project-name)\n"
	@echo "Commands:"
	@echo "  data: Fetch the dataset from Kaggle"
	@echo "  setup-python: Setup environment and a Jupyter kernel"
	@echo "  teardown-python: Remove the Jupyter kernel and the environment"

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
