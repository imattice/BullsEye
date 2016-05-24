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
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
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
        let diff = abs(targetValue - currentValue)
        var score = 100 - diff
        
        
        var message = ""
    
//        switch diff {
//            case (diff == 0):
//                message = "Spot on! Perfect score!"
//                score += 50
//            case diff <=3:
//                message = "Agh! So close!"
//            case diff <=5:
//                message = "Almost had it!"
//            case diff <=10:
//                message = ""
//            default:
//                message = "Oops!"
//                score -= diff
//        }
        
        if (diff == 0) {
            message += "Spot on! Perfect score!"
            score += 50
        } else if (diff <= 3) {
            message += "Agh! So close!"
        } else if (diff <= 5) {
            message += "Almost had it!"
        } else if (diff <= 10) {
            message += "Maybe next time."
        } else {
            message += "Oops!"
            score -= diff
        }
        
        message += "\nYou scored \(score) points!"
        
        
        let alert = UIAlertController(title: "You hit \(currentValue)!",
                                      message: message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "Next Round",
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