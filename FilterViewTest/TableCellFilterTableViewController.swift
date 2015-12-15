//
//  TableCellFilterTableViewController.swift
//  FilterViewTest
//
//  Created by Paul Wallace on 12/12/15.
//  Copyright © 2015 BuLeaf. All rights reserved.
//

import UIKit

class TableCellFilterTableViewController: UITableViewController {
    
    var settingsArray = ["Max Distance", "Price Range", "Food Types", "Priorities", "Find restaurants!"]
    var colorArray = [UIColor.whiteColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.orangeColor(), UIColor.greenColor()]
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = screenSize.height / CGFloat(settingsArray.count)
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        // Configure the cell...
        
        cell.backgroundColor = colorArray[indexPath.row]
        
        let firstLabel = cell.viewWithTag(1) as! UILabel
        let secondLabel = cell.viewWithTag(2) as! UILabel
        
        //firstLabel.textAlignment = NSTextAlignment.Center
        firstLabel.adjustsFontSizeToFitWidth = true
        
        //secondLabel.textAlignment = NSTextAlignment.Center
        secondLabel.adjustsFontSizeToFitWidth = true
        
        //firstLabel.frame = CGRectMake(firstLabel.frame.minX, firstLabel.frame.minY, 300, firstLabel.frame.height)
        //secondLabel.frame = CGRectMake(0/*screenSize.width - secondLabel.frame.width - (screenSize.width * 0.05)*/, 0, 100, 100)
        
        
        firstLabel.text = settingsArray[indexPath.row]
        secondLabel.text = "Not set!"
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
