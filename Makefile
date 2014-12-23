VERSION=`python -c "import game_of_thrones;print(game_of_thrones.__version__, end='')"`

install:
	pip install -r requirements.txt
	pip install -e .

bump:
	git commit -m "Bump version to \`$(VERSION)\`"
	git tag v$(VERSION)

check:
	isort -rc .
	flake8 --max-line-length=99 .

test:
	py.test

dist:
	python setup.py sdist bdist_wheel --universal upload

clean:
	rm -rf dist *.egg-info build .coverage
