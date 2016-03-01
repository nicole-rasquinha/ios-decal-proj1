//
//  StatsViewController.swift
//  ToDoList
//
//  Created by Nicole Rasquinha on 3/1/16.
//  Copyright © 2016 Nicole Rasquinha. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet var tasksComplete: UITextField!
    var numComplete = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasksComplete.userInteractionEnabled = false
        tasksComplete.text = numComplete.description + " tasks"
        
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
