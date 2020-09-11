help:
	cat Makefile

deploy_minor_version: distcheck
	python ./scripts/bump_version_number.py && \
	git add blaseball_core_game_data/__init__.py && \
	git commit blaseball_core_game_data/__init__.py -m 'auto-update to new version' && \
	make build && \
	make dist && \
	make distcheck && \
	make testpypi && \
	make pypi

requirements:
	python3 -m pip install --upgrade -r requirements.txt

dev:
	python3 -m pip install --upgrade -r requirements-dev.txt

update:
	python3 scripts/fetch_games_data.py

testpypi: dist
	twine upload --repository testpypi dist/* --verbose

pypi: dist
	twine upload --repository pypi dist/*

distcheck: dist
	twine check dist/*

dist: build
	python3 setup.py sdist bdist_wheel

build: clean
	python3 setup.py build install

clean:
	rm -fr build dist __pycache__ *.egg-info/
