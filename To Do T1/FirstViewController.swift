//
//  FirstViewController.swift
//  To Do T1
//
//  Created by John Pavley on 5/5/16.
//  Copyright © 2016 Epic Loot. All rights reserved.
//

import UIKit

var todoList:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var itemList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil) {
        
            todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            itemList.reloadData()
            
        }
                
    }
    
    override func viewDidAppear(animated: Bool) {
        itemList.reloadData()
    }

}

