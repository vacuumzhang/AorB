//
//  NewPostViewController.swift
//  AorB.demo.0.01
//
//  Created by Ruiyon.Z on 1/18/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class NewPostViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var questionTitel: UITextField!
    
    @IBOutlet var questionDescription: UITextView!
    
    @IBOutlet weak var choiceA: UITextField!
    
    @IBOutlet weak var choiceB: UITextField!
    
    @IBAction func postQuestion(sender: AnyObject) {
        
        var question            = PFObject(className: "Question")

        question["title"]       = questionTitel.text!
        question["description"] = questionDescription.text!
        question["choiceA"]     = choiceA.text!
        question["choiceB"]     = choiceB.text!
        
        question.saveInBackgroundWithBlock { (sucess, error) -> Void in
            if sucess == true {
                print("Object saved with ID \(question.objectId)")
            } else {
                print("Failed")
                print(error)
            }
        }

        questionsTitles.append(questionTitel.text!)
        questionTitel.text      = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.tabBarController?.tabBar.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
//        var product = PFObject(className: "Products")
//        
//        product["name"] = "Ice Cream"
//        
//        product["description"] = "Tutti Fruiti"
//        
//        product["price"] = 4.99
//        
//        product.saveInBackgroundWithBlock { (sucess, error) -> Void in
//            if sucess == true {
//                
//                print("Object saved with ID \(product.objectId)")
//                
//                
//            } else {
//                print("Failed")
//                print(error)
//            }
//        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}