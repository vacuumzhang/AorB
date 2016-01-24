//
//  PostViewController.swift
//  AorB.demo.0.01
//
//  Created by Ruiyon.Z on 1/18/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class PostViewController: UIViewController {
    
    @IBOutlet var postTitle: UILabel!
    
    @IBOutlet weak var choiceA: UIButton!
    
    @IBOutlet weak var choiceB: UIButton!
    
    @IBOutlet weak var postDescription: UITextView!
    var titleString: String!
    var questionId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.tabBarController?.tabBar.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.postTitle.text = "haha"
        
//        self.choiceA.setTitle("hehe", forState: UIControlState.Normal)
        
        
        var query = PFQuery(className: "Question")
        query.getObjectInBackgroundWithId(questionId) { (object: PFObject?, error: NSError?) -> Void in
            
            if error != nil {
                
                print(error)
                
            } else if let post = object {
                self.postTitle.text = post["title"] as? String
                self.postDescription.text = post["description"] as! String
                
                self.choiceA.setTitle(post["choiceA"] as? String, forState: UIControlState.Normal)
                self.choiceB.setTitle(post["choiceB"] as? String, forState: UIControlState.Normal)
                
//                print(object!.objectForKey("title"))
                
            }
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}