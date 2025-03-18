# Define Python interpreter
PYTHON ?= python3

# Directories
TEST_DIR = tests
SRC_DIR = geojson_composer

# Test command using unittest
test:
	$(PYTHON) -m unittest discover $(TEST_DIR) -v

# Run tests with coverage
test-coverage:
	coverage run --source=$(SRC_DIR) -m unittest discover $(TEST_DIR)
	coverage report -m

# Run linting with flake8
lint:
	flake8 $(SRC_DIR) $(TEST_DIR) --count --show-source --statistics

# Install production dependencies
install:
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt

# Install development dependencies
install-dev: install
	$(PYTHON) -m pip install -r requirements-dev.txt

# Clean up temporary files
clean:
	rm -rf .coverage htmlcov
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -exec rm -rf {} +

# Build
build:
	rm -rf dist
	$(PYTHON) -m build --wheel

# Publish to PyPI
publish: build
	$(PYTHON) -m twine check dist/*
	$(PYTHON) -m twine upload dist/*	

.PHONY: test test-coverage lint install install-dev clean build publish
