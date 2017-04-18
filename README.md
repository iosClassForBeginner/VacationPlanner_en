# vacationPlanner_en
This is a tutorial for learning how to use basic animations.

  <div style="text-align:center;width:500px;"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/screen.PNG" /></div>
  
  Thank you for visiting our account. We are going to learn about some basic animations by making a Vacation Planner app login page in an hour. If would you like to study yourself before hands-on, or review what you have learned in the session, please use the following material.

## Meetup
  We are providing free hands-on on a monthly basis<br>
  https://www.meetup.com/iOS-Development-Meetup-for-Beginner/

## Do you need a tutor?
  We also hold face-to-face or group lesson for individual interested in making iOS app themselves<br>
  http://ios-class-for-beginner.esy.es/

## Development Environment
  XCode 8.1 / Swift 3

## Full procedure

#### 0, Create your project

> 0-1. Open XCode  

> 0-2. Select "Create a new XCode project"

> 0-3. Select "Single View Application" and then tap "Next"

> 0-4. Fill "Product name" and then tap "Next"

> 0-5. Select the place for saving your project and then tap "Create"

  <div style="text-align:center"><img src="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid1.gif" /></div>

#### 1, Collect photos → Drag & Drop your resources into your projects Assets.xcassets
  <a href="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources">resources</a>
  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid2.gif" /></div>

#### 2, Design app
> 2-1. 
>> 1. Drap & Drop "UIImageView" from UI components
>> 2. Resize the imageView to 375 points by 375 or any other square dimensions that fits the screen
>> 3. Center the image
>> 4. Set the background image

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid3.gif" /></div>

> 2-2. Add a button on top of your background "board" image
>> 1. Drap & Drop "UIButton" from UI components
>> 2. Resize the button to a third of the background image for both width and height
>> 3. Add an image to the button so its visible
>> 4. Copy the button (Comm ⌘ + C) and paste (Comm ⌘ + V) it 8 more times.
>> 5. Reposition the buttons so they all fit adjacent to one another from left,right,top, and bottom.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid4.gif" /></div>
  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid5.gif" /></div>

> 2-3. Add a different tag to each button from 0 to 8 (9 in total)
>> 1. While button is highlighted, in the attribute inspector, scroll down.
>> 2. Change the tag number for each button

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid6.gif" /></div>

> 2-4. Action connections for states
>> 1. While viewing your storyboard click on "Assistant Editor" to split the view in two. You will see the code from "ViewController.swift" file on your right side. If not then select that file manually.
>> 2. Right click (two finger tap-drag) from first button to "ViewController" class and right above viewDidLoad() function.
>> 3. Create an "Action" connection and give it a name (eg. "buttonPressed")
>> 4. for the remaining 8 button you only need to drag to the same @IBAction

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid7.gif" /></div>

> 2-5. Create a label to show the winner. A button to restart the game.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid8.gif" /></div>
  
> 2-6. Create 1 IBOutlet connection for each label and button and 1 @IBAction for you restart button
>> 1. Right click (two finger tap-drag) from Label to "ViewController" class.
>> 2. Leave the connection type to be an "Outlet" and give it a name (eg. "winner")
>> 3. Do the same for your restart button.
>> 4. Create an @IBAction for the restart button just like how you created one for the first state button.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/tic_tac_toe_en/blob/master/videos/vid9.gif" /></div>

#### 3, Add code blocks in ViewController.swift
  ★  It's preferable to write following code yourself. It will help you to understand code more.

```Swift  
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    // Players by their number reference 
    // 0 is unplayed button
    // 1 is Cross
    // 2 is Noughts
    
    var activePlayer = 1 // We start with Cross || Challenge: Try starting with the winner i.e. store the value of the winner
    var gameState = [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ] // From left to right and top to bottom these numbers represent the status of each button
    var gameIsActive = true
    
    /*
        Tag representation of our button matrix
     
                | 0 | 1 | 2 |
                | 3 | 4 | 5 |
                | 6 | 7 | 8 |
     
        Possible combinations are:
 */
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
                               [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
                               [0, 4, 8], [2, 4, 6]] // Diagonals
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if gameState[sender.tag] == 0 { // We get the tag of the button and if its state is 0 it means it hasnt been altered.
            gameState[sender.tag] = activePlayer // We change the state of that position to the players number
            
            
            // Now we need to change the buttons image to the right representation of the player and change the active player to the other player
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "x") , for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "o") , for: .normal)
                activePlayer = 1
            }
            
            
            
            // It's possible at this point someone has won the game, so we need to check if the states of our buttons match any of the winning combinations. We need to use a for loop to search through each winning combination and if we found a match, game is over
            
            for combination in winningCombinations {
                // This will go through all the possible combinations in the winningCombinations array. Combination could be [2, 5, 8] as an example here
                
                if (gameState[combination[0]] != 0) && (gameState[combination[0]] == gameState[combination[1]]) && (gameState[combination[1]] == gameState[combination[2]]) {
                    // Here we want to make sure the state number is not 0 and all 3 positions are the same state. For example, 1 for the cross.
                    
                    gameIsActive = false // Game ends because a winning condition is found
                    
                    // Check to see who won
                    if gameState[combination[0]] == 1 {
                        winner.text = "Cross has won"
                    } else {
                        winner.text = "Nought has won"
                    }
                    winner.isHidden = false
                    playButton.isHidden = false
                }
            }
            
            // Its possible that all states have changed to 1 or 2 and no winner has been found so we also need to check if any 0s are left. In that case its a draw.
            
            gameIsActive = false // Automaticaly assume game has ended as a draw unless there are more states to be played.
            
            for state in gameState {
                if state == 0 {
                    gameIsActive = true
                    break
                }
            }
            
            if !gameIsActive {
                winner.text = "It's a draw"
                winner.isHidden = false
                playButton.isHidden = false
            }
            
            // Challenge: In case there is a winner by the last state we get a draw. How can we make sure we get the winner?
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        winner.isHidden = true
        playButton.isHidden = true
        
        gameState = [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ]
        gameIsActive = true
        activePlayer = 1
        
        resetImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winner.isHidden = true
        playButton.isHidden = true
        resetImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func resetImages() {
        for button in view.subviews {
            if let button = button as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }
    }

}


```
## Challenges

1. Try starting the game with the last winner. i.e. Store the value of the winner
2. In case there is a winner by the very last state change we get a draw. How can we make sure we get the winner displayed instead of the game ending in a draw? 

## Suggestions

Please let us know what you like to learn about next...
