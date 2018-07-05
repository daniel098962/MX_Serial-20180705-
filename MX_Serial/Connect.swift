//
//  Connect.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/7.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

import SwiftSocket;

class Connect: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var client: TCPClient!
    
    var connectIndicatorView: UIActivityIndicatorView!
    
    let Lab_IP = UILabel()
    let Lab_Port = UILabel()
    
    var Txt_IP = UITextField()
    var Txt_Port = UITextField()
    
    
    let Btn_Connect = UIButton()
    let Btn_Disconnect = UIButton()
    let Btn_DeviceList = UIButton()
    
    let screensize: CGRect = UIScreen.main.bounds
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Connect"
        
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 500)
        
        view.addSubview(scrollView)
        Layout()
        app.SetDeviceInfo(Field: "comeFromPage", Value: "Connect")
        print("Connect==> Connet Page")
        print(app.comeFromPage)
        Txt_IP.keyboardType = UIKeyboardType.decimalPad
        Txt_Port.keyboardType = UIKeyboardType.numberPad
        Txt_IP.text = "192.168.0.3"
        Txt_Port.text = "5000"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //queueWithDelay()
        // 建立一個 UIActivityIndicatorView
        connectIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:.whiteLarge)
        
        // 環狀進度條的顏色
        connectIndicatorView.color = UIColor.gray
        
        // 底色   clear為透明
        connectIndicatorView.backgroundColor = UIColor.clear
        
        // 設置位置並放入畫面中
        connectIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5,
            y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(connectIndicatorView);
    }
    
    func queueWithDelay(){
        //let delayQueue = DispatchQueue(label: "com.appcoda.delayqueue", qos: .userInitiated)

        connectIndicatorView.startAnimating()

        let additionalTime: DispatchTimeInterval = .milliseconds(200)

        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
           
            self.ini()
            self.app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
            print("Get==>" + String(describing: self.app.Connect_state))
            if self.app.Connect_state
            {
                print("Prepare Disconnect!!")
                self.app.client.close()
            }
            self.app.Connect_Device(address: self.Txt_IP.text!, Port: Int32(self.Txt_Port.text!)!)
            print("Get==>" + String(describing: self.app.Connect_state))
            if self.app.Connect_state == true
            {
                
                self.app.SetDeviceInfo(Field: "IP", Value: self.Txt_IP.text!)
                self.connectIndicatorView.stopAnimating()
                self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
                
            }
            else
            {
                self.connectIndicatorView.stopAnimating()
            }
            
        }
        
    }
    
    func Loading()
    {
        //let delayQueue = DispatchQueue(label: "com.appcoda.delayqueue", qos: .userInitiated)
        
        connectIndicatorView.startAnimating()
        
        let additionalTime: DispatchTimeInterval = .milliseconds(200)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
            self.connectIndicatorView.stopAnimating()
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "DeviceList1") as UIViewController, animated: true)
        }
    }
    
    @objc func Btn_Connect_Clicked(sender: UIButton) {
        
        queueWithDelay()
        
//        ini()
//        app.SetDeviceInfo(Field: "comeFromPage", Value: "Re_Connect")
//        print("Get==>" + String(describing: app.Connect_state))
//        if app.Connect_state
//        {
//            print("Prepare Disconnect!!")
//            app.client.close()
//        }
//        app.Connect_Device(address: Txt_IP.text!, Port: Int32(Txt_Port.text!)!)
//        print("Get==>" + String(describing: app.Connect_state))
//        if app.Connect_state == true
//        {
//
//            app.SetDeviceInfo(Field: "IP", Value: Txt_IP.text!)
//            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
//
//
//        }
        
    }
    @objc func Btn_DeviceList_Clicked(sender: UIButton) {
        Loading()
        //self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "DeviceList1") as UIViewController, animated: true)
    }
    
    @objc func Btn_DisConnect_Clicked(sender: UIButton) {
        app.client.close()
        app.Connect_Write(false)
        ini()
//        app.Input = "6"
//        app.Output = "2"
//        app.SetDeviceInfo(Field: "comeFromPage", Value: "Dis_Connect")
        
    }
    
    func ini()
    {
        app.IN1 = "1"
        app.IN2 = "2"
        app.IN3 = "3"
        app.IN4 = "4"
        app.IN5 = "5"
        app.IN6 = "6"
        app.IN7 = "7"
        app.IN8 = "8"
        app.IN9 = "9"
        app.IN10 = "10"
        app.IN11 = "11"
        app.IN12 = "12"
        app.IN13 = "13"
        app.IN14 = "14"
        app.IN15 = "15"
        app.IN16 = "16"
        app.IN17 = "17"
        app.IN18 = "18"
        app.IN19 = "19"
        app.IN20 = "20"
        app.IN21 = "21"
        app.IN22 = "22"
        app.IN23 = "23"
        app.IN24 = "24"
        app.IN25 = "25"
        app.IN26 = "26"
        app.IN27 = "27"
        app.IN28 = "28"
        app.IN29 = "29"
        app.IN30 = "30"
        app.IN31 = "31"
        app.IN32 = "32"
        
        app.OUT1 = "1"
        app.OUT2 = "2"
        app.OUT3 = "3"
        app.OUT4 = "4"
        app.OUT5 = "5"
        app.OUT6 = "6"
        app.OUT7 = "7"
        app.OUT8 = "8"
        app.OUT9 = "9"
        app.OUT10 = "10"
        app.OUT11 = "11"
        app.OUT12 = "12"
        app.OUT13 = "13"
        app.OUT14 = "14"
        app.OUT15 = "15"
        app.OUT16 = "16"
        app.OUT17 = "17"
        app.OUT18 = "18"
        app.OUT19 = "19"
        app.OUT20 = "20"
        app.OUT21 = "21"
        app.OUT22 = "22"
        app.OUT23 = "23"
        app.OUT24 = "24"
        app.OUT25 = "25"
        app.OUT26 = "26"
        app.OUT27 = "27"
        app.OUT28 = "28"
        app.OUT29 = "29"
        app.OUT30 = "30"
        app.OUT31 = "31"
        app.OUT32 = "32"
    }
    func Layout(){
        //=========== IP Label ===========//
        scrollView.addSubview(Lab_IP)
        Lab_IP.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: scrollView,//self.Content_View,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: screensize.width/2-200)  ////////////////////10.0
        
        let top_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 20.0)
        
        let width_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 80.0)
        
        let hight_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IP,leading_Lab_IP,width_Lab_IP,hight_Lab_IP])
        
        Lab_IP.text = "IP"
        Lab_IP.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_IP.textColor = uicolor
        Lab_IP.textAlignment = NSTextAlignment.right
        
        //=========== Port Label ===========//
        scrollView.addSubview(Lab_Port)
        Lab_Port.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Port = NSLayoutConstraint(item: Lab_Port,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: scrollView,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: screensize.width/2-200)  ////////////////////////////10.0
        
        let top_Lab_Port = NSLayoutConstraint(item: Lab_Port,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: Lab_IP,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 50.0)
        
        let width_Lab_Port = NSLayoutConstraint(item: Lab_Port,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 80.0)
        
        let hight_Lab_Port = NSLayoutConstraint(item: Lab_Port,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 70.0)
        
        NSLayoutConstraint.activate([top_Lab_Port,leading_Lab_Port,width_Lab_Port,hight_Lab_Port])
        
        Lab_Port.text = "Port"
        Lab_Port.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Port.textColor = uicolor
        Lab_Port.textAlignment = NSTextAlignment.right
        
        
        //=========== IP TextField ===========//
        scrollView.addSubview(Txt_IP)
        Txt_IP.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IP = NSLayoutConstraint(item: Txt_IP,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: Lab_IP,//self.Content_View,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 100.0)
        
        let top_Txt_IP = NSLayoutConstraint(item: Txt_IP,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 20.0)
        
        let width_Txt_IP = NSLayoutConstraint(item: Txt_IP,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 220.0)
        
        let hight_Txt_IP = NSLayoutConstraint(item: Txt_IP,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 40.0)
        
        NSLayoutConstraint.activate([top_Txt_IP , leading_Txt_IP , width_Txt_IP , hight_Txt_IP])
        
        //Txt_IP.backgroundColor = uicolor
        //Txt_IP.layer.cornerRadius = 8.0
        //Txt_Port.backgroundColor = uicolor
        Txt_IP.layer.cornerRadius = 5.0
        Txt_IP.placeholder = "Please input IP"
        Txt_IP.borderStyle = .roundedRect
        Txt_IP.returnKeyType = .done
        Txt_IP.textColor = UIColor.black
        //Txt_Port.backgroundColor = UIColor.lightGray
        Txt_IP.layer.borderWidth = 1.0
        let CGColor = UIColor.lightGray
        Txt_IP.layer.borderColor = CGColor.cgColor
        
        
        //=========== Port TextField ===========//
        scrollView.addSubview(Txt_Port)
        Txt_Port.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_Port = NSLayoutConstraint(item: Txt_Port,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: Lab_Port,//self.Content_View,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 100.0)
        
        let top_Txt_Port = NSLayoutConstraint(item: Txt_Port,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: Txt_IP,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 60.0)
        
        let width_Txt_Port = NSLayoutConstraint(item: Txt_Port,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 220.0)
        
        let hight_Txt_Port = NSLayoutConstraint(item: Txt_Port,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 40.0)
        
        NSLayoutConstraint.activate([top_Txt_Port , leading_Txt_Port , width_Txt_Port , hight_Txt_Port])
        
        //Txt_Port.backgroundColor = uicolor
        Txt_Port.layer.cornerRadius = 5.0
        Txt_Port.placeholder = "Please input IP"
        Txt_Port.borderStyle = .roundedRect
        Txt_Port.returnKeyType = .done
        Txt_Port.textColor = UIColor.black
        //Txt_Port.backgroundColor = UIColor.lightGray
        Txt_Port.layer.borderWidth = 1.0
        //CGColor = UIColor.lightGray
        Txt_Port.layer.borderColor = CGColor.cgColor
        
        //=========== Connect Button ===========//
        scrollView.addSubview(Btn_Connect)
        Btn_Connect.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Btn_Connect = NSLayoutConstraint(item: Btn_Connect,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                    attribute: .leading,
                                                    multiplier: 1.0,
                                                    constant: screensize.width/2-180)  ////////////60.0
        
        let top_Btn_Connect = NSLayoutConstraint(item: Btn_Connect,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_Port,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: 80.0)
        
        let width_Btn_Connect = NSLayoutConstraint(item: Btn_Connect,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 130.0)
        
        let hight_Btn_Connect = NSLayoutConstraint(item: Btn_Connect,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Btn_Connect , leading_Btn_Connect , width_Btn_Connect , hight_Btn_Connect])
        Btn_Connect.addTarget(self, action: #selector(Btn_Connect_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_Connect.layer.cornerRadius = 5.0
        Btn_Connect.backgroundColor = uicolor
        Btn_Connect.setTitle("Connect", for: UIControlState.normal)
        
        //=========== DisConnect Button ===========//
        scrollView.addSubview(Btn_Disconnect)
        Btn_Disconnect.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Btn_Disconnect = NSLayoutConstraint(item: Btn_Disconnect,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Btn_Connect,               ///////////////Btn_Connect
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 130.0+100.0)  ////////////////180
        
        let top_Btn_Disconnect = NSLayoutConstraint(item: Btn_Disconnect,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_Port,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: 80.0)
        
        let width_Btn_Disconnect = NSLayoutConstraint(item: Btn_Disconnect,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 130.0)
        
        let hight_Btn_Disconnect = NSLayoutConstraint(item: Btn_Disconnect,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
        
        let trailing_Btn_Disconnect = NSLayoutConstraint(item: Btn_Disconnect,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: scrollView,
                                                        attribute: .trailing,
                                                        multiplier: 1.0,
                                                        constant: -(screensize.width/2+50))
        
        NSLayoutConstraint.activate([top_Btn_Disconnect , leading_Btn_Disconnect , width_Btn_Disconnect , hight_Btn_Disconnect])
        Btn_Disconnect.addTarget(self, action: #selector(Btn_DisConnect_Clicked(sender:)), for: .touchDown)
        Btn_Disconnect.layer.cornerRadius = 5.0
        Btn_Disconnect.backgroundColor = UIColor.darkGray//uicolor
        Btn_Disconnect.setTitle("Disconnect", for: UIControlState.normal)
        
        //=========== Device List Button ===========//
        scrollView.addSubview(Btn_DeviceList)
        Btn_DeviceList.translatesAutoresizingMaskIntoConstraints = false
        
        //let leading_Btn_DeviceList = NSLayoutConstraint(item: Btn_DeviceList,
//                                                        attribute: .leading,
//                                                        relatedBy: .equal,
//                                                        toItem: scrollView,
//                                                        attribute: .leading,
//                                                        multiplier: 1.0,
//                                                        constant: 180.0)
        let certerHorizontally_Btn_DeviceList = NSLayoutConstraint(item: Btn_DeviceList,
                                                        attribute: .centerX,
                                                        relatedBy: .equal,
                                                        toItem: scrollView,
                                                        attribute: .centerX,
                                                        multiplier: 1.0,
                                                        constant: 0.0)
        
//        let certerHorizontally_Btn_DeviceList1 = NSLayoutConstraint(item: Btn_DeviceList,
//                                                                   attribute: .centerX,
//                                                                   relatedBy: .equal,
//                                                                   toItem: scrollView,
//                                                                   attribute: .centerX,
//                                                                   multiplier: 1.0,
//                                                                   constant: 0.0)
        
        let top_Btn_DeviceList = NSLayoutConstraint(item: Btn_DeviceList,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: Btn_Connect,
                                                    attribute: .top,
                                                    multiplier: 1.0,
                                                    constant: 100.0)
        
        let width_Btn_DeviceList = NSLayoutConstraint(item: Btn_DeviceList,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 150.0)
        
        let hight_Btn_DeviceList = NSLayoutConstraint(item: Btn_DeviceList,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 40.0)
        
        NSLayoutConstraint.activate([top_Btn_DeviceList , certerHorizontally_Btn_DeviceList , width_Btn_DeviceList , hight_Btn_DeviceList])
        Btn_DeviceList.addTarget(self, action: #selector(Btn_DeviceList_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_DeviceList.layer.cornerRadius = 5.0
        Btn_DeviceList.backgroundColor = uicolor
        Btn_DeviceList.setTitle("Device List", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
