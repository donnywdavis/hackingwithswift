//
//  MasterViewController.swift
//  HWS-Project9
//
//  Created by Donny Davis on 3/10/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [[String: String]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        // USE GCD to fetch the JSON data in the background
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { [unowned self] in
            // Get the JSON data from the url
            if let url = NSURL(string: urlString) {
                if let data = try? NSData(contentsOfURL: url, options: []) {
                    let json = JSON(data: data)
                
                    // Check that we get a valid response back
                    if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                        self.parseJSON(json)
                    } else {
                        self.showError()
                    }
                } else {
                    self.showError()
                }
            } else {
                self.showError()
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object["title"]
        cell.detailTextLabel!.text = object["body"]
        return cell
    }
    
    func parseJSON(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            objects.append(obj)
        }
        
        // Use GCD to switch back to the main queue before showing the table view
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    func showError() {
        // Use GCD to switch back to the main queue to display the alert controller
        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
            let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed; please check your connection     and try again.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            self.presentViewController(ac, animated: true, completion: nil)
        }
    }


}

