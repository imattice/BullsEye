//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Ike Mattice on 5/23/16.
//  Copyright © 2016 Michael Mattice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessSlider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        guessSlider.value = Float(currentValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value was: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "Nice!",
                                   style: .Default,
                                   handler: nil )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
    }
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}