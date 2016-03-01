//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by Nicole Rasquinha on 3/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet var taskName: UITextField!
    @IBOutlet var taskDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneButton(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var taskList: NSMutableArray? = userDefaults.objectForKey("taskList") as? NSMutableArray
        
        let data = NSMutableDictionary()
        data.setObject(taskName.text!, forKey: "taskName")
        data.setObject(taskDescription.text, forKey: "taskDescrip")
        
        if(taskList != nil){
            let newMutableList: NSMutableArray = NSMutableArray()
            for dict:AnyObject in taskList! {
                newMutableList.addObject(dict as! NSDictionary)
            }
            userDefaults.removeObjectForKey("taskList")
            newMutableList.addObject(data)
            userDefaults.setObject(newMutableList, forKey: "taskList")
        } else {
            userDefaults.removeObjectForKey("taskList")
            taskList = NSMutableArray()
            taskList!.addObject(data)
            userDefaults.setObject(taskList, forKey: "taskList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
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
