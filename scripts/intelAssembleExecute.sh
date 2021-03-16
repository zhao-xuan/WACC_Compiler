#!/bin/bash

VALID_EXAMPLES=(
                "/advanced"
                "/array"
                "/basic"
                "/expressions"
                "/function"
                "/if"
                "/IO"
                "/pairs"
                "/runtimeErr"
                "/scope"
                "/sequence"
                "/variables"
                "/while"
                )

EXECUTE_OUTPUT_DIR="./log/output"
ASSEMBLY_OUTPUT_DIR="./log/assembly/intel"
VALID_EXAMPLE_DIR="./src/test/examples/valid"
REF_COMPILE="./src/test/examples/refCompile"

mkdir log
mkdir $EXECUTE_OUTPUT_DIR
mkdir log/assembly
mkdir $ASSEMBLY_OUTPUT_DIR

# counters to represent the total number of test files to be processed
TOTAL_COUNT=$(find "${VALID_EXAMPLES[@]/#/${EXECUTE_OUTPUT_DIR}}" -name "*.output.txt" | wc -l)
COUNTER=0

for folder in ${VALID_EXAMPLES[@]}; do
  ASSEMBLY_OUTPUT_VALID_FOLDER="${ASSEMBLY_OUTPUT_DIR}${folder}"
  OUTPUT_VALID_FOLDER="${EXECUTE_OUTPUT_DIR}${folder}"
  mkdir $ASSEMBLY_OUTPUT_VALID_FOLDER
  mkdir $OUTPUT_VALID_FOLDER
  for file in $(find "${VALID_EXAMPLE_DIR}${folder}" -name "*.wacc")
  do
    FILE_NAME=$(basename "${file%.*}")
    EXECUTABLE_OUTPUT_FILE="${OUTPUT_VALID_FOLDER}/${FILE_NAME}.output.txt"
    echo $file
    # Generate the result from reference compiler
    cat <(echo "N" | $REF_COMPILE $file -x) | awk '/===========================================================/ {x=!x; if(x) next} x==1 {print}' > temp
    # Use the result generated by our compiler
    OUR_RESULT=$EXECUTABLE_OUTPUT_FILE
    # Compare them to see the differences
    diff <(cat temp) <(cat $OUR_RESULT)
    ret=$?
    (( COUNTER += 1 ))
    echo "$COUNTER / $(($TOTAL_COUNT)) files have been executed"
  done

  echo "========================================================================================"
  echo "Test Folder" $folder "has been processed" "($COUNTER / $(($TOTAL_COUNT)))"
  echo "========================================================================================"
done