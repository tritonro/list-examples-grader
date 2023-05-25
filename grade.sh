CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cp student-submission/ListExamples.java ./
if [-f student-submission/ListExamples.java]
then 
    echo "ListExamples.java found"
else 
    echo "Error: File not found"
fi 

cp -r lib grading-area 
cp TestListExamples.java grading-area
cp studentsubmission/ListExamples.java grading-area 

cd grading-area

javac -cp $CPATH *.java

if [$? -ne 0 ]
then 
    echo "Compiler Error"
    exit 1
fi 

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples

if [$? -ne 0]
then 
    echo "FAILURE"
else 
    echo "YOU PASSED !!"

fi 

