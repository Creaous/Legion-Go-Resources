# Scripts

This folder contains scripts that are used to generate the data for the project. Due to the nature of some of these scripts, they _could_ get you IP banned.

## scrape-and-download-legion-space.py

**Author:** [Creaous](https://github.com/Creaous)

### Purpose

The script scrapes Lenovo's S3 bucket to find all versions of Legion Space, downloads the executables, and extracts the version number from the executable to output to a text file.

### Usage

To run the script, simply execute the following command:

```shell
python scrape-and-download-legion-space.py
```

## scrape-and-download-legion-space.ps1

**Author:** [brt5586](https://github.com/brt5586)

### Purpose

The script scrapes Lenovo's S3 bucket to find all versions of Legion Space.

### Usage

To run the script, simply execute the following command:

```shell
powershell -ExecutionPolicy Bypass -File scrape-and-download-legion-space.ps1
```
