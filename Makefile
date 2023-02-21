project-name = $(notdir $(CURDIR))

default:
	@echo "Current project: $(project-name)"

data: data/raw/train.csv
data/raw/train.csv:
	kaggle competitions download -c $(subst kaggle-,,$(project-name)) -p data/raw
	unzip -d data/raw $$(find data/raw -name '*zip')
