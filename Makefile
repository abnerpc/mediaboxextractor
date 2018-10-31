.PHONY: build

clean:
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf
	@rm -rf build
	@rm -rf dist

install:
	pip install -r requirements.txt

install-dev:
	pip install -r requirements-dev.txt

test: clean
	pytest -x

build: clean
	pyinstaller src/extractor.py

run: clean
	python src/extractor.py
