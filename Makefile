project-name = $(notdir $(CURDIR))

default:
	@echo "Current project: $(project-name)"

data: data/raw/train.csv
data/raw/train.csv:
	kaggle competitions download -c $(subst kaggle-,,$(project-name)) -p data/raw
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
