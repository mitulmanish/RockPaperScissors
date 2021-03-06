//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Mitul Manish on 6/07/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var userSelection = 0
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userSelection)
        
        let decision = decisionBox(userSelection, computerSelection: randomValue())
    
        setUpResults(decision)
    }
    
    func setUpResults(decision : (String, String)) {
        self.summaryLabel.text = decision.0
        self.resultImage.image = UIImage(named: decision.1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMain(sender: AnyObject) {
        if (self.presentingViewController != nil) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func decisionBox(userSelection: Int, computerSelection: Int) ->
        (summary: String, imageString: String) {
            
            let selection = (userSelection, computerSelection)
            var decision: (summary: String, imageString: String) = (summary: "", imageString: "")
            
            switch(selection) {
            case (1,1):
                decision.summary = "Computer also selected Stone"
                decision.imageString = "tie"
            case (2,2):
                decision.summary = "Computer also selected Paper"
                decision.imageString = "tie"
            case (3,3):
                decision.summary = "Computer also selected Scissors"
                decision.imageString = "tie"
            case (1,2):
                decision.summary = "Computer selected Paper. You lost"
                decision.imageString = "PaperCoversRock"
            case (2,1):
                decision.summary = "Computer selected Stone. You win"
                decision.imageString = "PaperCoversRock"
            case (1,3):
                decision.summary = "Computer selected Scissors. You win"
                decision.imageString = "RockCrushesScissors"
            case (3,1):
                decision.summary = "Computer selected Stone. You lost"
                decision.imageString = "RockCrushesScissors"
            case (3,2):
                decision.summary = "Computer selected Paper. You win"
                decision.imageString = "ScissorsCutPaper"
            case (2,3):
                decision.summary = "Computer selected Scissors.You lost"
                decision.imageString = "ScissorsCutPaper"
            default: break
            }
            return decision
    }
    
    
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
}
