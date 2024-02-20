# CSV Processor Script
## Purpose
This Bash script is designed to process CSV files, providing users with the ability to filter, sort, or perform calculations on the data within the file. The script offers a flexible set of options to cater to various data manipulation needs.
## Usage 
```bash
./csv_processor.sh -f FILE [-c COLUMN] [-s] [-a OPERATION] [-h]
```
## Options 
* -f FILE: Specify the CSV file to be processed.

* -c COLUMN: Specify the column for sorting or calculation.

* -s: Sort the data based on the specified column.

* -a OPERATION: Perform a calculation on the specified column (e.g., sum, average).

* -h: Display the help message with information on how to use the script.
## Examples 
1. Display the content of the CSV file:
```bash
./csv_processor.sh -f data.csv
```
2. Sort the CSV file based on a specific column:
```bash
./csv_processor.sh -f data.csv -c 2 -s
```
3. Perform a calculation on a specific column:
```bash
./csv_processor.sh -f data.csv -c 3 -a sum
```
## Handling Errors
The script checks for valid options and arguments, providing appropriate error messages in case of invalid inputs or missing required parameters.
