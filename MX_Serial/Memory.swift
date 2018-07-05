//
//  Memory.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/14.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

class Memory: UITableViewController {
    let app = UIApplication.shared.delegate as! AppDelegate
    var MemoryIndicatorView : UIActivityIndicatorView!
    var itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4", "Memory 5" , "Memory 6" , "Memory 7", "Memory 8" ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = "Memory"
        
        let Memory_num = Int(app.Memory)
        
        if(Memory_num == 4){
            itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4" ]
            //itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4", "Memory 5" , "Memory 6" , "Memory 7", "Memory 8" ]
        }else if(Memory_num == 8){
            itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4", "Memory 5" , "Memory 6" , "Memory 7", "Memory 8" ]
        }else if(Memory_num == 16){
            itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4", "Memory 5" , "Memory 6" , "Memory 7", "Memory 8","Memory 9" , "Memory 10" , "Memory 11", "Memory 12", "Memory 13" , "Memory 14" , "Memory 15", "Memory 16" ]
        }else if(Memory_num == 32){
            itemsSource = ["Memory 1" , "Memory 2" , "Memory 3", "Memory 4", "Memory 5" , "Memory 6" , "Memory 7", "Memory 8","Memory 9" , "Memory 10" , "Memory 11", "Memory 12", "Memory 13" , "Memory 14" , "Memory 15", "Memory 16","Memory 17" , "Memory 18" , "Memory 19", "Memory 20", "Memory 21" , "Memory 22" , "Memory 23", "Memory 24","Memory 25" , "Memory 26" , "Memory 27", "Memory 28", "Memory 29" , "Memory 30" , "Memory 31", "Memory 32" ]
        }
        app.SetDeviceInfo(Field: "comeFromPage", Value: "Memory")
        
        // 建立一個 UIActivityIndicatorView
        MemoryIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:.whiteLarge)
        
        // 環狀進度條的顏色
        MemoryIndicatorView.color = UIColor.gray
        
        // 底色   clear為透明
        MemoryIndicatorView.backgroundColor = UIColor.clear
        
        // 設置位置並放入畫面中
        MemoryIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5,
            y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(MemoryIndicatorView);
        
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
        
        // Configure the cell...
        cell.textLabel?.text = itemsSource[indexPath.row]
        //cell.detailTextLabel?.text = itemsContentSource[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont.systemFont(ofSize: 19)
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemsSource[indexPath.row])
        let app = UIApplication.shared.delegate as! AppDelegate
        let witch_Memory = UInt8(indexPath.row+1)
        
        var bytes: [UInt8] = [ 0x00 , 0x00 , 0x00 , 0x00]
        let crc16table = CRC16Util()
        
        if app.Connect_state == true
        {
            if(app.Memory_LoadSave=="Save"){
                bytes = [0x20, 0x03, 0x00, witch_Memory]
                app.SetDeviceInfo(Field: "comeFromPage", Value: "Memory_Save")
            }
            else//Load
            {
                bytes = [0x20, 0x05, 0x00, witch_Memory]
                app.SetDeviceInfo(Field: "comeFromPage", Value: "Memory_Load")
            }
            print("111")
            print(app.Memory_LoadSave)
            print(bytes)
            let senddata: [UInt8] = crc16table.CRC(data: bytes)
            
            switch app.client.send(data: senddata){
            case .success:
                guard let data = app.client.read(1024*10) else { return}
                //print (data)
                
            case .failure(let error):
                print("No==> Error!!")
            }
        }
        Loading()
        //self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
    }
    
    func Loading()
    {
        MemoryIndicatorView.startAnimating()
        
        let additionalTime: DispatchTimeInterval = .milliseconds(200)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
            self.MemoryIndicatorView.stopAnimating()
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
        }
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
