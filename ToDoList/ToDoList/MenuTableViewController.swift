//
//  MenuTableViewController.swift
//  ToDoList
//
//  Created by Nicole Rasquinha on 3/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var taskList: NSMutableArray = NSMutableArray()
    var numComplete = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func toggleComplete(sender: AnyObject) {
        //let time:NSTimeInterval = sender.timestamp
        
        numComplete++
        let button: UISwitch = sender as! UISwitch
        button.enabled = false
    }
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let userTaskList: NSMutableArray? = userDefaults.objectForKey("taskList") as? NSMutableArray
        
        if(userTaskList != nil){
            taskList = userTaskList!
        }
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let task: NSMutableDictionary = taskList.objectAtIndex(indexPath.row) as! NSMutableDictionary
        cell.textLabel?.text = task.objectForKey("taskName") as? String

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            let taskList: NSMutableArray = userDefaults.objectForKey("taskList") as! NSMutableArray
            let newMutableList: NSMutableArray = NSMutableArray()
            for dict:AnyObject in taskList {
                newMutableList.addObject(dict as! NSDictionary)
            }
            newMutableList.removeObjectAtIndex(indexPath.row)
            
            userDefaults.removeObjectForKey("taskList")
            userDefaults.setObject(newMutableList, forKey: "taskList")
            
            userDefaults.synchronize()
            viewDidAppear(true)
            
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showInfo"){
            let indexPath:NSIndexPath = self.tableView!.indexPathForSelectedRow!
            let descripViewController: DescriptionViewController = segue.destinationViewController as! DescriptionViewController
            descripViewController.data = taskList.objectAtIndex(indexPath.row) as! NSMutableDictionary
        }
        else if(segue.identifier == "showStats"){
            let statsViewController: StatsViewController = segue.destinationViewController as! StatsViewController
            statsViewController.numComplete = numComplete
        }
    }
    

}
