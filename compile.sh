BRANCH_NAME=$(git symbolic-ref --short -q HEAD)
OUTPUT_DIRECTORY="Output"

if [[ "$BRANCH_NAME" != "master" ]]; then
	YEAR=`date +'%Y'`
	MONTH=`date +'%B'`

	# Create directories if they are not there
	mkdir -p OUTPUT_DIRECTORY

	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$YEAR"
	mkdir -p OUTPUT_DIRECTORY

	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$MONTH"
	mkdir -p OUTPUT_DIRECTORY

	OUTPUT_DIRECTORY="$OUTPUT_DIRECTORY/$BRANCH_NAME"
	mkdir -p OUTPUT_DIRECTORY
else
	mkdir -p OUTPUT_DIRECTORY
fi

output=`pdflatex -halt-on-error -output-directory $OUTPUT_DIRECTORY resume.tex`
echo "$output"