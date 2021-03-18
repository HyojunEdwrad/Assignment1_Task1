#!/bin/bash
# #!/bin/bash should be in the first line to invoke the bash shell to interpret the script.
# I am not sure what the question1 is actually asking. However, I made this script to be able to work all the conditions the quesion might ask for.
# This script is called older.sh
# Running this file without any parameters will return the file with the oldest modified date in the current directory, and running this file with less than or equal to three parameters will return the file with the oldest modified date out of the files with the same name as the parameters
# For example, ./older.sh foo goo will return foo, ./older.sh foo goo hoo will return foo and ./older.sh goo hoo will return goo as goo file was modified before hoo
if [ "$#" -eq 0 ]; then
#if...then is used this to create a conditional construction.
# $# indicates the total number of parameters
# n1 -eq n2 means True if number n1 is equal to number n2
# therefore <if [ "$#" -eq 0 ]; then> is the condition when there is no arguments(parameters) entered
	ls -t | tail -n 1
# ls is used to show the contents of the directory
# -t helps to list the contents by the date it was last modified. It will list the lastest file at the top, and the oldest file at the bottom
# | (pipe) makes send the output of "ls -t" as an input to "tail -n 1"
# tail -n <number> will display the last <number> of lines. In the script, I wrote tail -n 1, so it will display last one line of the list.
else
#else is used when there is only one condition in the if...then conditional construction.
	find . -type f \( -name "$1" -o -name "$2" -o -name "$3" \) -printf "%T@ %f\n" | sort | head -n 1 | awk '{print$2}'
#find is used to search for the file or folder, but in this script, it's used to find file.
# -type f searches for files, whereas -type d searches for directories
# -name "$1" searches file which has the same name as the first parameter
# -o means "or" in the code. \( -name "$1" -o -name "$2" -o -name "$3" \) searches for the files with their name the same as the first, second and third parameters.
# -printf "" will print the properties in between " "
# %Tk will display the last modification date in the format of k
# @ indicates seconds after Jan. 1, 1970, 00:00 GMT
# %f\n displays the file name only without the path
# sort is sorting the files by older
# head -n 1 displays the top one
# awk '{print$n}' displays n th field. Therefore, awk '{print$2}' displays second field, in this case, that is "file name"
fi
#fi finishes the if...then conditional construction.


