from setuptools import setup

__version__ = ''
#pylint: disable=exec-used
exec(open('simplematcap/version.py').read())

setup(
    version=__version__,
    keywords='panda3d',
    packages=['simplematcap'],
    python_requires='>=3.6.0',
    install_requires=[
        'panda3d',
    ],
    setup_requires=[],
    tests_require=[],
)
