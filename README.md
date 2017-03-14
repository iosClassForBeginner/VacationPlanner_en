# vacationPlanner_en
This is a tutorial for learning how to use basic animations.

  <div style="text-align:center"><img src ="https://github.com/samkerm/vacationPlanner/blob/master/appScreenShot.png" /></div>
  
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

  <div style="text-align:center"><img src="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid1.gif" /></div>

#### 1, Collect photos → Drag & Drop your resources into your projects Assets.xcassets
  <a href="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources">resources</a>
  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid2.gif" /></div>

#### 2, Design app
> 2-1. 
>> 1. Drap & Drop "UIImageView" from UI components
>> 2. Resize the imageView
>> 3. Apply constraints
>> 4. Set the background image
>> 5. Set Content Mode to "Aspect Fill"

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid3.gif" /></div>

> 2-2. Add username and password textfields to your view
>> 1. Drap & Drop "UITextField" from UI components
>> 2. Resize the textField
>> 3. Add the placeholder text accordingly
>> 4. Center the placeholder text or align to the left depending on your preference.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid4.gif" /></div>

> 2-3. Add "Login" button
>> 1. Drap & Drop "UIButton" from UI components
>> 2. Change the display text to "Login"
>> 3. In the attributes inspector change its background color and tint color to your preference
>> 4. Resize and align the button in your view to the center and below the password textField

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid5.gif" /></div>

> 2-4. Connections
>> 1. Click on "Assistant Editor" to split the view in two. You will see the code on your right side
>> 2. Right click (double tap-drag) from your username textField to "ViewController" class right above viewDidLoad() function.
>> 3. Create an "IBOutlet" and give it a name (eg. "username")
>> 4. Do the same for password textField and Login button.
>> 5. In addition to an IBOutlet create an "IBAction" for your login button to do a task when tapped.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid6.gif" /></div>

> 2-5. Create a label for your page and size it right and center it on the view.

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid7.gif" /></div>
  
> 2-6. Under the "Size Inspector" apply the following Autoresizing parameters

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/VacationPlanner_en/blob/master/Resources/vid8.gif" /></div>

#### 3, Add code blocks in ViewController.swift
  ★  It's preferable to write following code yourself. It will help you to understand code more.

```Swift  
import UIKit

class ViewController: UIViewController {

    // MARK: IB outlets
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: further UI
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    
    // MARK: IB actions
    
    @IBAction func login(_ sender: Any) {
       
        spinner.isHidden = !spinner.isHidden
        
    }
    
    // MARK: view controller methods
    
    
    // Gets called once during loading of the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the UI
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        
        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.center = CGPoint(x: spinner.bounds.midX + 5.0,
                                 y: loginButton.bounds.midY)
        loginButton.addSubview(spinner)
        
    }
    
    // Gets called every time before view appears
    
    override func viewWillAppear(_ animated: Bool) {
        username.center.x  -= view.bounds.width
        password.center.x -= view.bounds.width
        loginButton.center.x -= view.bounds.width
    }
    
    // Gets called right after the view apears
    
    override func viewDidAppear(_ animated: Bool) {
        
        spinner.isHidden = true
        
        UIView.animate(withDuration: 0.5, animations: {
            self.username.center.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.loginButton.center.x += self.view.bounds.width
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

```
