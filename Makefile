VENV = .env
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

.PHONY: data clean

$(VENV)/bin/activate: scripts/requirements.txt
	python3 -m venv $(VENV)
	$(PIP) install -r scripts/requirements.txt

all: data500 data400 data600

data500: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape_500.py

data400: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape_400.py

data600: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape_600.py

validate:
	$(PYTHON) -m frictionless validate data/constituents.csv

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
