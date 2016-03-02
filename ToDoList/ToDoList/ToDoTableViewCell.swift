//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Nicole Rasquinha on 3/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var completeSwitch: UISwitch!
    var row:Int?

    @IBAction func toggleComplete(sender: AnyObject) {
            let button: UISwitch = sender as! UISwitch
            button.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(86400.0, target: self, selector: "deleteItem", userInfo: nil, repeats: false)
            //NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "deleteItem", userInfo: nil, repeats: false)
            let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            let taskList: NSMutableArray = userDefaults.objectForKey("taskList") as! NSMutableArray
        let newMutableList: NSMutableArray = NSMutableArray()
        for dict:AnyObject in taskList {
            newMutableList.addObject(dict as! NSDictionary)
        }
        
        let data = NSMutableDictionary()
        data.setObject(taskList[row!].objectForKey("taskName")!, forKey: "taskName")
        data.setObject(taskList[row!].objectForKey("taskDescrip")!, forKey: "taskDescrip")
        data.setObject(true, forKey: "taskCompleted")
        newMutableList[row!] = data
        
        userDefaults.removeObjectForKey("taskList")
        userDefaults.setObject(newMutableList, forKey: "taskList")

    }
        
    func deleteItem(){
            //Delete this cell
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let taskList: NSMutableArray = userDefaults.objectForKey("taskList") as! NSMutableArray
        let newMutableList: NSMutableArray = NSMutableArray()
        for dict:AnyObject in taskList {
            newMutableList.addObject(dict as! NSDictionary)
        }
        
        newMutableList.removeObjectAtIndex(row!)
        
        userDefaults.removeObjectForKey("taskList")
        userDefaults.setObject(newMutableList, forKey: "taskList")
        
        userDefaults.synchronize()
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
