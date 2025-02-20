from setuptools import setup, find_packages

setup(
    name="geojson_composer",
    version="0.1.1",
    packages=find_packages(),
    install_requires=[
        "Jinja2>=3.0",
    ],
    entry_points={
        "console_scripts": [
            "geojson-composer=geojson_composer.cli:main",
        ],
    },
    author="Krvss",
    description="A CLI tool to render GeoJSON data using Jinja2 templates.",
    long_description=open("README.rst").read(),
    long_description_content_type="text/x-rst",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
)
