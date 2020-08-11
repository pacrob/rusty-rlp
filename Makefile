.PHONY: all
all:
	@echo "Run my targets individually!"

.PHONY: venv
.ONESHELL:
venv:
	test -d venv || python3 -m venv venv
	. venv/bin/activate
	pip install maturin


.PHONY: develop
.ONESHELL:
develop: venv
	. venv/bin/activate
	maturin develop

.PHONY: lint
.ONESHELL:
lint: 
	cargo clippy

.PHONY: test
.ONESHELL:
test: develop
	. venv/bin/activate
	python -m unittest test/test_procmaps.py

.PHONY: build
.ONESHELL:
build: venv
	. venv/bin/activate
	maturin build

.PHONY: dist
.ONESHELL:
dist: venv
	. venv/bin/activate
	docker run --rm -v $(shell pwd):/io konstin2/maturin build --release --strip