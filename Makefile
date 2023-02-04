default:

data: data/raw/train.csv

data/raw/train.csv:
	kaggle competitions download -c spaceship-titanic -p data/raw
	unzip -d data/raw $$(find data/raw -name '*zip')
