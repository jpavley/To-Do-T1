//
//  SecondViewController.swift
//  To Do T1
//
//  Created by John Pavley on 5/5/16.
//  Copyright © 2016 Epic Loot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemField: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        todoList.append(itemField.text!)
        
        itemField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.itemField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

