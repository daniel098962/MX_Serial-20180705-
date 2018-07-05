//
//  Device_List1.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/12/6.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit
import Foundation

class Device_List: UIViewController , MainPresenterDelegate, UITableViewDelegate, UITableViewDataSource
{
    
    let app = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var progressView: UIProgressView!
    //@IBOutlet weak var progressView: UIProgressView!
    //@IBOutlet weak var TableV: UITableView!
    
    
    //class MainVC: UIViewController, MainPresenterDelegate, UITableViewDelegate, UITableViewDataSource
    //@IBOutlet weak var TableV: UITableView!
    
    @IBOutlet weak var Label_IP: UILabel!
    @IBOutlet weak var TableV: UITableView!
    private var myContext = 0
    var presenter: MainPresenter!
    var IP_Array = [String]()
    var DeviceIndicatorView : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 建立一個 UIActivityIndicatorView
        DeviceIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:.whiteLarge)
        
        // 環狀進度條的顏色
        DeviceIndicatorView.color = UIColor.gray
        
        // 底色   clear為透明
        DeviceIndicatorView.backgroundColor = UIColor.clear
        
        // 設置位置並放入畫面中
        DeviceIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5,
            y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(DeviceIndicatorView);
        
        self.title = "Device List"
        // Do any additional setup after loading the view.
        
        
        //Init presenter. Presenter is responsible for providing the business logic of the MainVC (MVVM)
        self.presenter = MainPresenter(delegate:self)
        
        //Add observers to monitor specific values on presenter. On change of those values MainVC UI will be updated
        self.addObserversForKVO()
        
        //self.showProgressBar()
        //self.navigationBarTitle.title = self.presenter.ssidName()
        self.presenter.scanButtonClicked()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //override func viewDidAppear(_ animated: Bool) {
    
    //    //Setting the title of the navigation bar with the SSID of the WiFi
    //    self.navigationBarTitle.title = self.presenter.ssidName()
    //}
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //MARK: - KVO Observers
    func addObserversForKVO ()->Void {
        
        self.presenter.addObserver(self, forKeyPath: "connectedDevices", options: .new, context:&myContext)
        self.presenter.addObserver(self, forKeyPath: "progressValue", options: .new, context:&myContext)
        self.presenter.addObserver(self, forKeyPath: "isScanRunning", options: .new, context:&myContext)
    }
    
    func removeObserversForKVO ()->Void {
        
        self.presenter.removeObserver(self, forKeyPath: "connectedDevices")
        self.presenter.removeObserver(self, forKeyPath: "progressValue")
        self.presenter.removeObserver(self, forKeyPath: "isScanRunning")
    }
    
    //MARK: - Button Action
    @IBAction func refresh(_ sender: Any) {
        //Shows the progress bar and start the scan. It's also setting the SSID name of the WiFi as navigation bar title
        self.showProgressBar()
        //self.navigationBarTitle.title = self.presenter.ssidName()
        self.presenter.scanButtonClicked()
    }
    
    //MARK: - Show/Hide Progress Bar
    func showProgressBar()->Void {
        
        self.progressView.progress = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            
            //self.tableVTopContraint.constant = 40
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    func hideProgressBar()->Void {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            //self.tableVTopContraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    //MARK: - Presenter Delegates
    //The delegates methods from Presenters.These methods help the MainPresenter to notify the MainVC for any kind of changes
    func mainPresenterIPSearchFinished() {
        
        self.hideProgressBar()
        self.showAlert(title: "Scan Finished", message: "Number of devices connected to the Local Area Network : \(self.presenter.connectedDevices.count)")
    }
    
    func mainPresenterIPSearchCancelled() {
        
        self.hideProgressBar()
        //self.tableV.reloadData()
    }
    
    func mainPresenterIPSearchFailed() {
        
        self.hideProgressBar()
        self.showAlert(title: "Failed to scan", message: "Please make sure that you are connected to a WiFi before starting LAN Scan")
    }
    
    //MARK: - Alert Controller
    func showAlert(title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in}
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - UITableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.presenter.connectedDevices!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = self.presenter.connectedDevices[indexPath.row]
        print("device.ipAddress")
        print(device.ipAddress)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as! DeviceCell
        
        //let device = self.presenter.connectedDevices[indexPath.row]
        
        //cell.ipLabel.text = device.ipAddress
        //cell.Label_IP.text = device.ipAddress
        cell.textLabel?.text = device.ipAddress
        //cell.macAddressLabel.text = device.macAddress
        //cell.hostnameLabel.text = device.hostname
        //cell.brandLabel.text = device.brand
        cell.textLabel?.font = UIFont.systemFont(ofSize: 19)
        IP_Array.append(device.ipAddress)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell!
        
        var IP: String
        IP = (currentCell?.textLabel!.text)!
        
        
        print(IP)
        
        queueWithDelay(IP: IP)
        
//        //print("Get==>" + String(describing: app.Connect_state))
//        if app.Connect_state
//        {
//            print("Prepare Disconnect!!")
//            app.client.close()
//        }
//
//        app.Connect_Device(address: IP, Port: 5000)
//
//        app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
//        if app.Connect_state == true
//        {
//            app.Connect_Write(true)
//            //app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
//            app.SetDeviceInfo(Field: "IP", Value: IP)
//        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
//        }
    }
    
    //MARK: - KVO
    //This is the KVO function that handles changes on MainPresenter
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (context == &myContext) {
            
            switch keyPath! {
            case "connectedDevices":
                self.TableV.reloadData()
                
            case "progressValue":
                self.progressView.progress = self.presenter.progressValue
            case "isScanRunning":
                let isScanRunning = change?[.newKey] as! BooleanLiteralType
            //self.scanButton.image = isScanRunning ? #imageLiteral(resourceName: "stopBarButton") : #imageLiteral(resourceName: "refreshBarButton")
            default:
                print("Not valid key for observing")
            }
            
        }
    }
    //建立一個queue執行緒
    func queueWithDelay(IP : String){
        //let delayQueue = DispatchQueue(label: "com.appcoda.delayqueue", qos: .userInitiated)
        
        DeviceIndicatorView.startAnimating()
        
        let additionalTime: DispatchTimeInterval = .milliseconds(200)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
            
            //print("Get==>" + String(describing: app.Connect_state))
            if self.app.Connect_state
            {
                print("Prepare Disconnect!!")
                self.app.client.close()
            }
            
            self.app.Connect_Device(address: IP, Port: 5000)
            
            self.app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
            if self.app.Connect_state == true
            {
                self.app.Connect_Write(true)
                //app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
                self.app.SetDeviceInfo(Field: "IP", Value: IP)
                self.DeviceIndicatorView.stopAnimating()
                self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
            }
            else
            {
                self.DeviceIndicatorView.stopAnimating()
            }
            
        }
    }
    
    //MARK: - Deinit
    deinit {
        
        self.removeObserversForKVO()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

