//
//  DescriptionViewController.swift
//  ToDoList
//
//  Created by Nicole Rasquinha on 3/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskDescription: UITextView!
    
    var data: NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskName.userInteractionEnabled = false
        taskDescription.userInteractionEnabled = false
        
        taskName.text = data.objectForKey("taskName") as? String
        taskDescription.text = data.objectForKey("taskDescrip") as? String
    }

    @IBAction func deleteItem(sender: AnyObject) {
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let taskList: NSMutableArray = userDefaults.objectForKey("taskList") as! NSMutableArray
        let newMutableList: NSMutableArray = NSMutableArray()
        for dict:AnyObject in taskList {
            newMutableList.addObject(dict as! NSDictionary)
        }
        newMutableList.removeObject(data)
        
        userDefaults.removeObjectForKey("taskList")
        userDefaults.setObject(newMutableList, forKey: "taskList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
