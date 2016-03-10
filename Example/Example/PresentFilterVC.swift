//
//  ViewController.swift
//  Example
//
//  Created by luojie on 16/3/10.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit
import BNFilter
// This VC is just a demo, and it is presenting FilterVC, it use unwindSegue to hanlde FilterVC's call back
class PresentFilterVC: UIViewController {
    @IBAction func presentFilterVCAndDoCancel(segue: UIStoryboardSegue) {}
    @IBAction func presentFilterVCAndDoFilter(segue: UIStoryboardSegue) {
        let filterTableViewController = segue.sourceViewController as! FilterTableViewController
        print(filterTableViewController.filterText) // get model from FilterTableViewController
    }
    
}

// This VC is just a demo, and it is use for filter
class FilterTableViewController: UITableViewController {
    var filterText = "hallo" // model
}