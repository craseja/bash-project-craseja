#!/bin/bash

# CSV Processor Script

# Function to display usage information
display_usage() {
    echo "Usage: $0 [-f FILE] [-c COLUMN] [-s] [-a OPERATION]"
    echo "Options:"
    echo "  -f FILE       Specify the CSV file to process"
    echo "  -c COLUMN     Specify the column for sorting or calculation"
    echo "  -s            Sort the data based on the specified column"
    echo "  -a OPERATION  Perform a calculation on the specified column (e.g., sum, average)"
    echo "  -h            Display this help message"
}

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Parse command line options
while getopts ":f:c:sa:h" opt; do
    case $opt in
        f)
            file="$OPTARG"
            ;;
        c)
            column="$OPTARG"
            ;;
        s)
            sort=true
            ;;
        a)
            operation="$OPTARG"
            ;;
        h)
            display_usage
            exit 0
            ;;
        \?)
            handle_error "Invalid option: -$OPTARG"
            ;;
        :)
            handle_error "Option -$OPTARG requires an argument"
            ;;
    esac
done

# Check if the required arguments are provided
if [ -z "$file" ]; then
    handle_error "Missing required argument: -f FILE"
fi

# Check if the file exists
if [ ! -f "$file" ]; then
    handle_error "File not found: $file"
fi

# Check if column is provided when sorting or performing calculations
if { [ "$sort" = true ] || [ -n "$operation" ]; } && [ -z "$column" ]; then
    handle_error "Missing required argument: -c COLUMN"
fi

# Process CSV file
if [ "$sort" = true ]; then
    # Sort based on the specified column
    sort -t',' -k"${column}n" "$file"
elif [ -n "$operation" ]; then
    # Perform calculation on the specified column
    awk -F',' -v col="$column" -v op="$operation" 'NR>1 {sum+=$col} END {if (op=="sum") print sum; else if (op=="average") print sum/NR}' "$file"
else
    # Default: display the content of the CSV file
    cat "$file"
fi
