#!/bin/bash

LINE_BREAK_STRING="========================================================================================================================"

line_break() {
    echo "$LINE_BREAK_STRING"
}

# Prints the menu header
menu_header() {
    local menu_name="$1"
    local date_str
    local time_str

    date_str=$(date +"%Y-%m-%d")
    time_str=$(date +%H:%M:%S)

    line_break
    menu_line "$date_str" "$menu_name" "$time_str"
    menu_line "$date_str" "" "$time_str"
    menu_line "$date_str"
    line_break
}

# Prints up to three items in columns from left to right. 
# Columns are left aligned | middle aligned | right aligned
# Can skip a column with an empty string
menu_line() {
    local left="$1"
    local middle="$2"
    local right="$3"

    # Get the width of the line break string
    local width=${#LINE_BREAK_STRING}
    
    # Calculate the total length of the left, middle, and right columns
    local total_length=$(( ${#left} + ${#middle} + ${#right} ))

    # Calculate the available space for padding (spaces between columns)
    local available_space=$(( width - total_length ))

    # Calculate the number of spaces to insert between left and middle, and middle and right
    local left_padding=$(( available_space / 2 ))  # Spaces between left and middle
    local right_padding=$(( available_space - left_padding ))  # Spaces between middle and right
    # Adjust the printf formatting to print with spaces between columns
    printf "%s%${left_padding}s%s%${right_padding}s%s\n" "$left" "" "$middle" "" "$right"
}

# Prints the menu footer
menu_footer() {
    line_break
}

# Prints a menu
handle_menu() {
    clear
    menu_header "$1"
    echo "This is where the options go"
    menu_footer
}

