# Hacking With Swift Projects

Projects to work through the [Hacking With Swift](https://www.hackingwithswift.com) tutorials.

## Project 1
Use a table view controller to display a list of image names. Tapping an image name
will display a detail view controller to show the image. Both views are wrapped in
a split view controller to be able to work on the iPhone or iPad.

## Project 2
Simple game to display three flags. A random country is display in the navigation
controller title. Select the correct flag that corresponds to the country listed.
An alert controller is displayed to specify the results and a label displays the
score at the bottom of the view.

## Project 3
Copy of Project 1 to add an action button to show the share sheet for sharing the
photo in the detail view.

## Project 4
Use WKWebView to display a selected web page. Display button on the navigation
controller to display an action sheet with a list of sites to choose from. Add a
refresh button and a progress bar to the views tool bar.

## Project 5
Read a list of words from a file and shuffle them to select a random word. Display
word as the navigation controllers title. Use an action button to prompt for input.
Enter a word that can be created out of the word in the title. If the word is
valid then add the word to the table view.

## Project 6
a) Copy project 2 and use auto layout to control position of the flags in both
portrait and landscape mode.
b) Use the Visual Format Language to position some labels on the screen and adjust
for both portrait and landscape modes.

## Project 7
Use the SwiftyJSON library to pull in data from an API. Then display the title of
that data in a table view controller. When a table row is selected format the body
of the JSON request in HTML to display in the detail view controller.

## Project 8
Create a clone of 7 Little Words. Read a text file that has seven clues along
with their answer. Split each line of the text file to make arrays for build the
random list of buttons to select the words from. Compare the positions in the arrays
to determine right answers and update the labels accordingly. Show and hide the
buttons as selections are made. Use an observer for the score variable to update
the label on the screen whenever the score variable changes.

## Project 9
Copy project 7 and add logic to use GCD (Grand Central Dispatch) to fetch the JSON
data from the web instead of on the main queue.

## Project 10
Use a collection view to display a grid of images with an associated name. Use an
action button in the navigation controller to display the image picker to set an
image for each cell added. Then tap each cell to show an alert controller to prompt
for a name that will be added to each cell.

## Project 11
Use SpriteKit to build a Pachinko like game.

## Project 12
Copy project 10. Use the NSCoding protocol to encode and decode the name and image
name. Use NSUserDefaults to save an array that can be reloaded whenever the app
is closed and reopened.
