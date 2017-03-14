//
//  ViewController.swift
//  Vacation Planner
//
//  Created by Sam on 2017-03-13.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IB outlets
    
    @IBOutlet weak var usernameButton: UITextField!
    @IBOutlet weak var passwordButton: UITextField!
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
        usernameButton.center.x  -= view.bounds.width
        passwordButton.center.x -= view.bounds.width
        loginButton.center.x -= view.bounds.width
    }
    
    // Gets called right after the view apears
    
    override func viewDidAppear(_ animated: Bool) {
        
        spinner.isHidden = true
        
        UIView.animate(withDuration: 0.5, animations: {
            self.usernameButton.center.x += self.view.bounds.width
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [], animations: {
            self.passwordButton.center.x += self.view.bounds.width
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

