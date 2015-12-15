//
//  FilterViewController.swift
//  FilterViewTest
//
//  Created by Paul Wallace on 12/4/15.
//  Copyright © 2015 BuLeaf. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var maxDistanceLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//    var maxDistanceSlider: UISlider = UISlider()
//    var maxDistanceIndicator: UILabel = UILabel()
//    var priceRangeLabel: UILabel = UILabel()
//    var priceRangeSegmentControl: UISegmentedControl = UISegmentedControl()
//    var foodTypeButton: UIButton = UIButton()
//    var foodTypeDisplay: UIView = UIView()
//    var foodSortLabel: UILabel = UILabel()
//    var foodSortSegmentControl:UISegmentedControl = UISegmentedControl()
//    var randomButton:UIButton = UIButton()
    
//    override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        self.init(nibName: nil, bundle:nil)
//    }
    
    /*The actual prototype*/

    @IBOutlet weak var tableView: UITableView!
    
    var settingsArray = ["Max Distance", "Price Range", "Food Types", "Priorities"]
    var colorArray = [UIColor.whiteColor(), UIColor.blueColor(), UIColor.brownColor(), UIColor.orangeColor()]
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var findButton : UIButton!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let topOffset = (self.navigationController?.navigationBar.frame.height)! + 20
        tableView.frame = CGRectMake(0,
            topOffset,
            screenSize.width,
            ((screenSize.height - topOffset) * 0.80))
        
        findButton = UIButton(frame: CGRectMake(0,
            tableView.frame.maxY,
            screenSize.width,
            (screenSize.height - topOffset ) * 0.20))
        
        
        self.tableView.rowHeight = (tableView.frame.height) / CGFloat(settingsArray.count)
        
        findButton.setTitle("Find", forState: UIControlState.Normal)
        findButton.titleLabel?.font = UIFont.systemFontOfSize(44)
        findButton.backgroundColor = UIColor.orangeColor()
        
        
        self.view.addSubview(findButton)

//        self.view.addSubview(maxDistanceLabel)
//        maxDistanceLabel.textAlignment = NSTextAlignment.Center
//        maxDistanceLabel.adjustsFontSizeToFitWidth = true 
//        self.maxDistanceLabel.text = "Max Distance"
//        self.navigationItem.title = "FilterViewController"
        // Do any additional setup after loading the view.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        // Configure the cell...
        
        //cell.backgroundColor = colorArray[indexPath.row]
        
        let firstLabel = cell.viewWithTag(1) as! UILabel
        //let secondLabel = cell.viewWithTag(2) as! UILabel
        let view = cell.viewWithTag(4)
        //let thirdLabel = cell.viewWithTag(3) as! UISlider
        
        if(settingsArray[indexPath.row] == "Price Range"){
            let options = ["$", "$$", "$$$"/*, "🤑"*/]
            let thirdLabel = UISegmentedControl(items: options)
            thirdLabel.frame = CGRectMake(self.tableView.frame.width * 0.50, firstLabel.frame.minY - firstLabel.frame.height * 0.25, self.tableView.frame.width * 0.45, firstLabel.frame.height * 2)
             view!.addSubview(thirdLabel)
        } else if(settingsArray[indexPath.row] == "Max Distance"){
            let thirdLabel = UISlider(frame: CGRectMake(self.tableView.frame.width * 0.50, firstLabel.frame.minY, self.tableView.frame.width * 0.45, firstLabel.frame.height))
             view!.addSubview(thirdLabel)
        } else if(settingsArray[indexPath.row] == "Food Types"){
            let thirdLabel = UIButton(frame: CGRectMake(self.tableView.frame.width * 0.50, firstLabel.frame.minY - firstLabel.frame.height * 0.25, self.tableView.frame.width * 0.45, firstLabel.frame.height * 2))
            thirdLabel.setTitle("Tap me!", forState: UIControlState.Normal)
            thirdLabel.titleLabel?.font = UIFont.systemFontOfSize(22)
            thirdLabel.backgroundColor = UIColor.orangeColor()
            //var test = UIButton(UIButtonType.Custom)
            view!.addSubview(thirdLabel)
            //cell.addSubview(thirdLabel)
            print("Segmented controller should show up")
        } else if(settingsArray[indexPath.row] == "Priorities"){
            let options = ["⭐️", "❤️", "🚗"/*, "🤑"*/]
            let thirdLabel = UISegmentedControl(items: options)
            thirdLabel.frame = CGRectMake(self.tableView.frame.width * 0.50, firstLabel.frame.minY - firstLabel.frame.height * 0.25, self.tableView.frame.width * 0.45, firstLabel.frame.height * 2)
            
            view!.addSubview(thirdLabel)
        }
        
        firstLabel.text = settingsArray[indexPath.row]
//        secondLabel.text = "Not set!"
        //firstLabel.textAlignment = NSTextAlignment.Center
        //firstLabel.adjustsFontSizeToFitWidth = true
        //firstLabel.sizeToFit()
        firstLabel.font = UIFont(name: "ArialRoundedMTBold", size: 22)
        firstLabel.font = UIFont.systemFontOfSize(22)
        //secondLabel.textAlignment = NSTextAlignment.Center
        //secondLabel.adjustsFontSizeToFitWidth = true
        //secondLabel.sizeToFit()
        //secondLabel.font = UIFont(name: "ArialRoundedMTBold", size: 22)
//        secondLabel.hidden = true
//        secondLabel.frame.size.height = self.tableView.rowHeight
//        secondLabel.backgroundColor = UIColor.redColor()
//        secondLabel.layer.cornerRadius = 10;
//        secondLabel.font = UIFont.systemFontOfSize(22)
        
        /*teacherButton.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 22)*/
        
        
        //firstLabel.frame = CGRectMake(firstLabel.frame.minX, firstLabel.frame.minY, 300, firstLabel.frame.height)
        //secondLabel.frame = CGRectMake(0/*screenSize.width - secondLabel.frame.width - (screenSize.width * 0.05)*/, 0, 100, 100)
        
        
       

        cell.contentView.layer.borderColor = UIColor.redColor().CGColor
//        cell.contentView.layer.borderWidth = 1.0;
        cell.backgroundColor = UIColor.redColor()
        return cell
        
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

