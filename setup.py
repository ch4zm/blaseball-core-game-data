from setuptools import setup, find_packages
import glob
import os
from blaseball_core_game_data import __version__

# read the contents of your README file
from os import path
this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'Readme.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='blaseball-core-game-data',
    version=__version__,
    packages=['blaseball_core_game_data'],
    package_data = {
      'blaseball_core_game_data': ['data/*.json']
    },
    description='blaseball-core-game-data is a package that makes blaseball game data available to other pakages',
    url='https://github.com/ch4zm/blaseball-core-game-data',
    author='Ch4zm of Hellmouth',
    author_email='ch4zm.of.hellmouth@gmail.com',
    license='MIT',
    #install_requires=required,
    keywords=[],
    zip_safe=False,
    long_description=long_description,
    long_description_content_type='text/markdown'
)
