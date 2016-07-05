//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Mitul Manish on 5/07/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerSelection = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        self.playerSelection = sender.tag
        self.performSegueWithIdentifier("result", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "result" {
            let destinationController = segue.destinationViewController as! ResultViewController
            destinationController.userSelection = self.playerSelection
        }
    }


}

