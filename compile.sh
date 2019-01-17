BRANCH_NAME=$(git symbolic-ref --short -q HEAD)
OUTPUT_DIRECTORY="Output"
mkdir -p $OUTPUT_DIRECTORY

if [[ "$BRANCH_NAME" != "master" ]]; then
	YEAR=`date +'%Y'`
	MONTH=`date +'%B'`

	# Create directories if they are not there
	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$YEAR"
	mkdir -p $OUTPUT_DIRECTORY

	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$MONTH"
	mkdir -p $OUTPUT_DIRECTORY

	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$BRANCH_NAME"
	mkdir -p $OUTPUT_DIRECTORY
fi

OUTPUT=`pdflatex -halt-on-error -output-directory "$OUTPUT_DIRECTORY" resume.tex`

if [[ $? == 0 ]]; then
	echo "Successfully written to $OUTPUT_DIRECTORY/resume.pdf"	
else
	echo $OUTPUT
fi