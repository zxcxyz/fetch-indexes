VENV = .env
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

.PHONY: data clean

all: data data400 data600

data: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape.py

$(VENV)/bin/activate: scripts/requirements.txt
	python3 -m venv $(VENV)
	$(PIP) install -r scripts/requirements.txt

data400: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape_400.py

data600: $(VENV)/bin/activate
	$(PYTHON) scripts/scrape_600.py

validate:
	$(PYTHON) -m frictionless validate data/constituents.csv

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
