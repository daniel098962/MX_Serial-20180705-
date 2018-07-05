//
//  Setting.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/15.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

import SwiftSocket;

class Setting: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var client: TCPClient!
    
    let Lab_Video = UILabel()
    var Segmented_Video = UISegmentedControl()
    
    let screensize: CGRect = UIScreen.main.bounds
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Setting"
        
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.contentSize = CGSize(width: screenWidth, height: 500)
        
        view.addSubview(scrollView)
        print("app.Setting_AV==>")
        print(app.Setting_AV)
        Segmented_Video.selectedSegmentIndex = app.Setting_AV
        
        Layout()
        app.SetDeviceInfo(Field: "comeFromPage", Value: "Setting")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func Layout(){
        //=========== IP Label ===========//
        scrollView.addSubview(Lab_Video)
        Lab_Video.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Video = NSLayoutConstraint(item: Lab_Video,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: 5.0)
        
        let top_Lab_Video = NSLayoutConstraint(item: Lab_Video,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 5.0)
        
        let width_Lab_Video = NSLayoutConstraint(item: Lab_Video,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 60.0)
        
        let hight_Lab_Video = NSLayoutConstraint(item: Lab_Video,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 70.0)
        
        NSLayoutConstraint.activate([top_Lab_Video,leading_Lab_Video,width_Lab_Video,hight_Lab_Video])
        
        Lab_Video.text = "Video"
        Lab_Video.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Video.textColor = uicolor
        //Lab_IP.textAlignment = NSTextAlignment.left
        
        
        
        
        
        let width_Segmented_Video_Setting = (screensize.width - 40.0)/5*5
        
        //=========== AV Segment ===========//
        var item = ["FHD" , "OUT1", "4K30" , "4K60","720P" ]
        
        if(app.DN == "HX-2562" || app.DN == "HX-2544"){
            item = ["FHD" , "OUT1", "4K30" , "4K60" ]
            //item = ["FHD" , "OUT1", "4K30" , "4K60","720P" ]
        }
        Segmented_Video = UISegmentedControl(items: item)
        //Segmented_Video.selectedSegmentIndex = 0
        Segmented_Video.selectedSegmentIndex = app.Setting_AV
        // Segmented_AV.isEnabled = false
        
        
        //Segmented_AV.backgroundColor = UIColor.white
        Segmented_Video.tintColor = uicolor
        //Segmented_AV.addTarget(self, action: "changeColor", for: .valueChanged)
        Segmented_Video.addTarget(self, action: #selector(SettingVideo(sender:)), for: .valueChanged)
        Segmented_Video.layer.cornerRadius = 10.0
        //self.Content_View.addSubview(Segmented_AV)
        scrollView.addSubview(Segmented_Video)
        
        Segmented_Video.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Video = NSLayoutConstraint(item: Segmented_Video,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: 30.0)
        
        let top_Segmented_Video = NSLayoutConstraint(item: Segmented_Video,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_Video,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: 60.0)
        
        let width_Segmented_Video = NSLayoutConstraint(item: Segmented_Video,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: width_Segmented_Video_Setting)//180.0)
        
        let hight_Segmented_Video = NSLayoutConstraint(item: Segmented_Video,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 45.0)
        
        NSLayoutConstraint.activate([top_Segmented_Video , leading_Segmented_Video , width_Segmented_Video , hight_Segmented_Video])
        
        
    }
    
    @objc func SettingVideo(sender: UISegmentedControl){
        
        app.SetDeviceInfo(Field: "Setting_AV", Value: String(sender.selectedSegmentIndex))
        
        let witch_AV = UInt8(sender.selectedSegmentIndex)
        
        var bytes: [UInt8] = [ 0x00 , 0x00 , 0x00 , 0x00]
        
        let crc16table = CRC16Util()
        
        if app.Connect_state == true
        {
            
            bytes = [0x20, 0x20, 0x00, witch_AV]
            
            let senddata: [UInt8] = crc16table.CRC(data: bytes)
            
            switch app.client.send(data: senddata){
            case .success:
                guard app.client.read(1024*10) != nil else { return}
                //guard let data = app.client.read(1024*10) else { return}
                //print (data)
                
            case .failure( _):
                //case .failure(let error):
                print("No==> Error!!")
            }
        }
        
        
        
//
//
//
//
//
//        switch sender.selectedSegmentIndex{
//        case 0:
//
//
//            break
//
//        case 1:
//
//
//            break
//
//        case 2:
//
//
//            break
//
//        case 3:
//
//
//            break
//
//        case 4:
//
//
//            break
//
//        default:
//            break
//        }
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
