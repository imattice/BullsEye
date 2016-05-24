//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Ike Mattice on 5/23/16.
//  Copyright © 2016 Michael Mattice. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var guessValue = 0
    var targetValue = 0
    var totalScore = 0
    var roundCount = 1
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        guessValue = 50
        guessSlider.value = Float(guessValue)
        if roundCount > 0 {
            roundCount += 1
        }
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        totalScoreLabel.text = String(totalScore)
        roundCountLabel.text = String(roundCount)
    }
    func rewindTime() {
        totalScore = 0
        roundCount = 1
        startNewRound()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func showAlert() {
        let diff = abs(targetValue - guessValue)
        var score = 100 - diff
        var message = "You hit \(guessValue)! \n" + "Your target was \(targetValue). \n"
        var title = ""
    
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
            title += "Spot on! Perfect score!"
            score += 50
        } else if (diff <= 3) {
            if diff == 1 {
                score += 25
            }
            title += "Agh! So close!"
        } else if (diff <= 10) {
            title += "Almost had it!"
        } else {
            title += "Oops!"
        }
        
        message += "\nYou scored \(score) points!"
        
        totalScore += score
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "Next Round",
                                   style: .Default,
                                   handler: { action in 
                                                self.startNewRound() 
                                                self.updateLabels()
                                            })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(slider: UISlider) {
        guessValue = lroundf(slider.value)
    }
    @IBAction func startOver() {
        rewindTime()
        updateLabels()
    }

    
    @IBOutlet weak var guessSlider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var roundCountLabel: UILabel!
}