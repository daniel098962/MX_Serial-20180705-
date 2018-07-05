//
//  Information1.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/14.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

class Information1: UITableViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    

    
    var itemsSource = ["Name" , "ID" , "Audio", "Video" , "EDID Type", "Total Memory" , "Total Output", "Total Input" , "Protocol Ver.", "Firmware Ver."]
    var itemsContentSource = ["" , "" , "", "" , "", "" , "", "" , "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Information"
        app.SetDeviceInfo(Field: "comeFromPage", Value: "Information")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cellidentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath)
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as! DeviceCell
        
        
        
        
        
        
        
        itemsContentSource = [app.DN , "0" , app.Audio, app.Video , app.EDID, app.Memory , app.Output, app.Input, app.Protocal_Version, app.Firmware_Version]
        //itemsContentSource = ["1" , "2" , "3", "4" , "5", "6" , "7", "8" , "9", "0"]
        
        
        
        
        
        
        // Configure the cell...
        cell.textLabel?.text = itemsSource[indexPath.row]
        cell.detailTextLabel?.text = itemsContentSource[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
