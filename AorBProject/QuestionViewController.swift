//
//  QuestionViewController.swift
//  AorB.demo.0.01
//
//  Created by Ruiyon.Z on 1/18/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

var questionsTitles = [""]
var questionIDs = [""]
var questionsDescription = [""]


class QuestionViewController: UIViewController {
    
    
    @IBOutlet var questionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.tabBarController?.tabBar.hidden = false
        // Do any additional setup after loading the view, typically from a nib.
        
//        var query = PFQuery(className: "Products")
//        query.getObjectInBackgroundWithId("te8ugUuoCu") { (object: PFObject?, error: NSError?) -> Void in
//            
//            if error != nil {
//                
//                print(error)
//                
//            } else if let product = object {
//                
//                product["description"] = "Rocky Road"
//                product["price"] = 5.99
//                product.saveInBackground()
//                
//                //                print(object!.objectForKey("description"))
//                
//            }
//        }
        
        var query = PFQuery(className: "Question")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if let posts = objects {
                
                questionsTitles.removeAll(keepCapacity: true)
                
                questionIDs.removeAll(keepCapacity: true)
                
                questionsDescription.removeAll(keepCapacity: true)
                
                for object in posts {
                    
                    if let post = object as PFObject? {
                        
//                        query.getObjectInBackgroundWithId(post.objectId!) { (object: PFObject?, error: NSError?) -> Void in
//                            
//                            if error != nil {
//                                
//                                print(error)
//                                
//                            } else if let temp = object {
//                                
//                            }
//                        }
                        
                        questionsTitles.append(post["title"] as! String)
                        questionsDescription.append(post["description"] as! String)
                        questionIDs.append(post.objectId!)
                        
                    }
                }
            }
            
            
            self.questionTable.reloadData()
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showQuestion") {
            
            var upcoming: PostViewController = segue.destinationViewController as! PostViewController
            
            let indexPath = self.questionTable.indexPathForSelectedRow!
            
            let postID = questionIDs[indexPath.row]
            
            upcoming.questionId = postID
        }
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return questionIDs.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! cell

        myCell.questionTitel.text = questionsTitles[indexPath.row]
        myCell.questionDescription.text = questionsDescription[indexPath.row]
        
        return myCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        not comment this show detial twice
//        self.performSegueWithIdentifier("showQuestion", sender: self)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "showQuestion") {
//            
//            var upcoming: PostViewController = segue.destinationViewController as! PostViewController
//            
//            let indexPath = self.tableView.indexPathForSelectedRow()!
//            
//            let postID = questionIDs[indexPath]
//            upcoming.questionId = postID
//        }
//    }
    
    
        
}