data: data/raw/train.csv

data/raw/train.csv:
	kaggle competitions download -c spaceship-titanic -p data/raw
	unzip "$$(find data/raw -name '*zip')" -d data/raw
