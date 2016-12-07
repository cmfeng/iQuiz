iQuiz: A Multiple-Choice Q-and-A application
users can choose from a collection of quizzes
each quiz has a number (1-to-many) of questions
each question is a multiple-choice answer
users progress through each question one at a time
app will track their answers
app could upload their scores
quizzes are updated from a server

## Part 1: Basic interaction
we need a TableView for the quizzes
each element will lead the user to a list of questions
so we start with the TableView filled with subjects
use Mathematics, Marvel Super Heroes, and Science
for now, use an in-memory array
make sure to build this as a UITableViewSource

Part 1: TableView cells
icon on the left (any image works)
subject: title (30 characters)
description: short sentence

Part 1: ToolBar across the top
put a button on the Toolbar, title it "Settings"
"Settings" should (for now) pop a UIAlertController
have it read "Settings go here"/"OK"

Grading: 5 points
repo should be called 'iQuiz'
TableView appears with nonempty cells: 1 pt
TableView has the right number of cells: 1 pt
TableCells have the right data: 1 pt
TableCells display icons and subtext: 1 pt
Settings alert: 1 pt

## Part2 A Multiple-Choice Q-and-A application  
users can choose from a collection of quizzes  
each quiz has a number (1-to-many) of questions  
each question is a multiple-choice answer  
users progress through each question one at a time  
app will track their answers  
app could upload their scores  
quizzes are updated from a server  
when the user selects a quiz, take them to the first "question" scene  
when the user selects an answer in the "question" scene, take them to the "answer" scene  
when the user pushes "next" from the "answer" scene...  
... if there are more questions, take them to the next "question" scene  
... if there are no questions left, take them to the "finished" scene  
when the users pushes the "back" button, they go back to the main list of topics  
### "Qestion" scene - UI elements required  
question text  
four answer possibilities (only one of which can be selected)  
a "submit" button to indicate they are ready to go on  
### "Answer" scene - UI elements required
question text  
the correct answer text  
some indicator whether they got it right or wrong  
a "next" button to indicate they are ready to go on  
### "Finished" scene - UI elements required  
some kind of descriptive text ("Perfect!" "Almost!" etc)  
the user's score on the quiz (x of y correct)  
a "next" button to indicate they are ready to go on  
### Points  
continue to develop in "iQuiz"  
question scene acts as intended: 1 pt  
answer scene acts as intended: 1 pt  
finished scene acts as intended: 1 pt  
segues to each scene: 1 pt  
"back" button goes to the beginning: 1 pt  

## Part3: Network and storage  
all quizzes/questions should come from online  
store the quizzes/questions to local storage  
if offline, use locally-stored data  
initial URL to use:  
http://tednewardsandbox.site44.com/questions.json  
Settings should be a popover  
include a URL field to use instead of the above  
include a "check now" button to retrieve  
### Points  
continue to develop in "iQuiz"  
download JSON from site  
store JSON to local storage  
use local storage offline  
refresh on Settings "check now"  









