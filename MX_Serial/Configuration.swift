//
//  Configuration.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/8.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit
import SwiftSocket;

class Configuration: UIViewController {

    let app = UIApplication.shared.delegate as! AppDelegate
    var client: TCPClient!
    
    let common = Common()
    
    let crc16table = CRC16Util()
    
    var Input_num = 6
    var Output_num = 2
    
    let Lab_line_1 = UILabel()
    let Lab_line_2 = UILabel()
    let Lab_IP = UILabel()
    let Lab_Input = UILabel()
    let Lab_Output = UILabel()
    let Lab_IN1 = UILabel()
    let Lab_IN2 = UILabel()
    let Lab_IN3 = UILabel()
    let Lab_IN4 = UILabel()
    let Lab_IN5 = UILabel()
    let Lab_IN6 = UILabel()
    let Lab_IN7 = UILabel()
    let Lab_IN8 = UILabel()
    let Lab_IN9 = UILabel()
    let Lab_IN10 = UILabel()
    let Lab_IN11 = UILabel()
    let Lab_IN12 = UILabel()
    let Lab_IN13 = UILabel()
    let Lab_IN14 = UILabel()
    let Lab_IN15 = UILabel()
    let Lab_IN16 = UILabel()
    let Lab_IN17 = UILabel()
    let Lab_IN18 = UILabel()
    let Lab_IN19 = UILabel()
    let Lab_IN20 = UILabel()
    let Lab_IN21 = UILabel()
    let Lab_IN22 = UILabel()
    let Lab_IN23 = UILabel()
    let Lab_IN24 = UILabel()
    let Lab_IN25 = UILabel()
    let Lab_IN26 = UILabel()
    let Lab_IN27 = UILabel()
    let Lab_IN28 = UILabel()
    let Lab_IN29 = UILabel()
    let Lab_IN30 = UILabel()
    let Lab_IN31 = UILabel()
    let Lab_IN32 = UILabel()
    
    let Lab_OUT1 = UILabel()
    let Lab_OUT2 = UILabel()
    let Lab_OUT3 = UILabel()
    let Lab_OUT4 = UILabel()
    let Lab_OUT5 = UILabel()
    let Lab_OUT6 = UILabel()
    let Lab_OUT7 = UILabel()
    let Lab_OUT8 = UILabel()
    let Lab_OUT9 = UILabel()
    let Lab_OUT10 = UILabel()
    let Lab_OUT11 = UILabel()
    let Lab_OUT12 = UILabel()
    let Lab_OUT13 = UILabel()
    let Lab_OUT14 = UILabel()
    let Lab_OUT15 = UILabel()
    let Lab_OUT16 = UILabel()
    let Lab_OUT17 = UILabel()
    let Lab_OUT18 = UILabel()
    let Lab_OUT19 = UILabel()
    let Lab_OUT20 = UILabel()
    let Lab_OUT21 = UILabel()
    let Lab_OUT22 = UILabel()
    let Lab_OUT23 = UILabel()
    let Lab_OUT24 = UILabel()
    let Lab_OUT25 = UILabel()
    let Lab_OUT26 = UILabel()
    let Lab_OUT27 = UILabel()
    let Lab_OUT28 = UILabel()
    let Lab_OUT29 = UILabel()
    let Lab_OUT30 = UILabel()
    let Lab_OUT31 = UILabel()
    let Lab_OUT32 = UILabel()
    
    let Txt_IP = UITextField()
    let Txt_IN1 = UITextField()
    let Txt_IN2 = UITextField()
    let Txt_IN3 = UITextField()
    let Txt_IN4 = UITextField()
    let Txt_IN5 = UITextField()
    let Txt_IN6 = UITextField()
    let Txt_IN7 = UITextField()
    let Txt_IN8 = UITextField()
    let Txt_IN9 = UITextField()
    let Txt_IN10 = UITextField()
    let Txt_IN11 = UITextField()
    let Txt_IN12 = UITextField()
    let Txt_IN13 = UITextField()
    let Txt_IN14 = UITextField()
    let Txt_IN15 = UITextField()
    let Txt_IN16 = UITextField()
    let Txt_IN17 = UITextField()
    let Txt_IN18 = UITextField()
    let Txt_IN19 = UITextField()
    let Txt_IN20 = UITextField()
    let Txt_IN21 = UITextField()
    let Txt_IN22 = UITextField()
    let Txt_IN23 = UITextField()
    let Txt_IN24 = UITextField()
    let Txt_IN25 = UITextField()
    let Txt_IN26 = UITextField()
    let Txt_IN27 = UITextField()
    let Txt_IN28 = UITextField()
    let Txt_IN29 = UITextField()
    let Txt_IN30 = UITextField()
    let Txt_IN31 = UITextField()
    let Txt_IN32 = UITextField()
    
    let Txt_OUT1 = UITextField()
    let Txt_OUT2 = UITextField()
    let Txt_OUT3 = UITextField()
    let Txt_OUT4 = UITextField()
    let Txt_OUT5 = UITextField()
    let Txt_OUT6 = UITextField()
    let Txt_OUT7 = UITextField()
    let Txt_OUT8 = UITextField()
    let Txt_OUT9 = UITextField()
    let Txt_OUT10 = UITextField()
    let Txt_OUT11 = UITextField()
    let Txt_OUT12 = UITextField()
    let Txt_OUT13 = UITextField()
    let Txt_OUT14 = UITextField()
    let Txt_OUT15 = UITextField()
    let Txt_OUT16 = UITextField()
    let Txt_OUT17 = UITextField()
    let Txt_OUT18 = UITextField()
    let Txt_OUT19 = UITextField()
    let Txt_OUT20 = UITextField()
    let Txt_OUT21 = UITextField()
    let Txt_OUT22 = UITextField()
    let Txt_OUT23 = UITextField()
    let Txt_OUT24 = UITextField()
    let Txt_OUT25 = UITextField()
    let Txt_OUT26 = UITextField()
    let Txt_OUT27 = UITextField()
    let Txt_OUT28 = UITextField()
    let Txt_OUT29 = UITextField()
    let Txt_OUT30 = UITextField()
    let Txt_OUT31 = UITextField()
    let Txt_OUT32 = UITextField()
    
    let Btn_Save = UIButton()
    let Btn_Cancel1 = UIButton()
    let Btn_Modify = UIButton()
    let Btn_Cancel2 = UIButton()
    
    let Lab_Port = UILabel()
    let Txt_Port = UITextField()
    
    let Btn_Connect = UIButton()
    let Btn_Disconnect = UIButton()
    let Btn_DeviceList = UIButton()
    
    let screensize: CGRect = UIScreen.main.bounds
    var scrollView: UIScrollView!
    var configurIndicatorView : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Setting Config"
        
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        
        Input_num = (app.Input as NSString).integerValue
        Output_num = (app.Output as NSString).integerValue
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        let scroll_height = (CGFloat(650.0 + (Double(Input_num) * 42.0)))
        scrollView.contentSize = CGSize(width: screenWidth, height: scroll_height)
        
        view.addSubview(scrollView)
        
        // 建立一個 UIActivityIndicatorView
        configurIndicatorView = UIActivityIndicatorView(activityIndicatorStyle:.whiteLarge)
        
        // 環狀進度條的顏色
        configurIndicatorView.color = UIColor.gray
        
        // 底色   clear為透明
        configurIndicatorView.backgroundColor = UIColor.clear
        
        // 設置位置並放入畫面中
        configurIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5,
            y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(configurIndicatorView);

        
        Layout()
        //app.SetDeviceInfo(Field: "comeFromPage", Value: "Configuration")
        
    }

    func Layout(){
        
        //=========== Lab_line_1 ===========//
        scrollView.addSubview(Lab_line_1)
        Lab_line_1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_line_1 = NSLayoutConstraint(item: Lab_line_1,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: scrollView,//self.Content_View,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 0.0)
        
        let top_Lab_line_1 = NSLayoutConstraint(item: Lab_line_1,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: scrollView,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 0.0)
        
        let width_Lab_line_1 = NSLayoutConstraint(item: Lab_line_1,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: screensize.width)
        
        let hight_Lab_line_1 = NSLayoutConstraint(item: Lab_line_1,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_line_1,leading_Lab_line_1,width_Lab_line_1,hight_Lab_line_1])
        
        //Lab_line_1.text = "IP"
        //Lab_line_1.font = UIFont.boldSystemFont(ofSize: 20)
        //Lab_line_1.textColor = uicolor
        //Lab_line_1.textAlignment = NSTextAlignment.right
        Lab_line_1.backgroundColor = UIColor.lightGray
        
        
        
        
        //=========== IP Label ===========//
        scrollView.addSubview(Lab_IP)
        Lab_IP.translatesAutoresizingMaskIntoConstraints = false

        let leading_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-200)  //////////////////////////////10.0

        let top_Lab_IP = NSLayoutConstraint(item: Lab_IP,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: Lab_line_1,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 60.0)

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
                                            toItem: Lab_line_1,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 60.0)

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
        Txt_IP.keyboardType = UIKeyboardType.decimalPad


        //=========== Save & Reboot Button ===========//
        scrollView.addSubview(Btn_Save)
        Btn_Save.translatesAutoresizingMaskIntoConstraints = false

        let leading_Btn_Save = NSLayoutConstraint(item: Btn_Save,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: screensize.width/2-180)

        let top_Btn_Save = NSLayoutConstraint(item: Btn_Save,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IP,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: 60.0)

        let width_Btn_Save = NSLayoutConstraint(item: Btn_Save,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 130.0)

        let hight_Btn_Save = NSLayoutConstraint(item: Btn_Save,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)

        NSLayoutConstraint.activate([top_Btn_Save , leading_Btn_Save , width_Btn_Save , hight_Btn_Save])
        Btn_Save.addTarget(self, action: #selector(Btn_Save_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_Save.layer.cornerRadius = 5.0
        Btn_Save.backgroundColor = uicolor
        Btn_Save.setTitle("Save & Reboot", for: UIControlState.normal)

        //=========== Btn_Cancel1 Button ===========//
        scrollView.addSubview(Btn_Cancel1)
        Btn_Cancel1.translatesAutoresizingMaskIntoConstraints = false

        let leading_Btn_Cancel1 = NSLayoutConstraint(item: Btn_Cancel1,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: Btn_Save,
                                                        attribute: .leading,
                                                        multiplier: 1.0,
                                                        constant: 130.0+100.0)

        let top_Btn_Cancel1 = NSLayoutConstraint(item: Btn_Cancel1,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: Lab_IP,
                                                    attribute: .top,
                                                    multiplier: 1.0,
                                                    constant: 60.0)

        let width_Btn_Cancel1 = NSLayoutConstraint(item: Btn_Cancel1,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 130.0)

        let hight_Btn_Cancel1 = NSLayoutConstraint(item: Btn_Cancel1,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 40.0)

        NSLayoutConstraint.activate([top_Btn_Cancel1 , leading_Btn_Cancel1 , width_Btn_Cancel1 , hight_Btn_Cancel1])

        Btn_Cancel1.layer.cornerRadius = 5.0
        Btn_Cancel1.backgroundColor = UIColor.darkGray//uicolor
        Btn_Cancel1.setTitle("Cancel", for: UIControlState.normal)

        
        //=========== Lab_line_2 ===========//
        scrollView.addSubview(Lab_line_2)
        Lab_line_2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_line_2 = NSLayoutConstraint(item: Lab_line_2,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0)
        
        let top_Lab_line_2 = NSLayoutConstraint(item: Lab_line_2,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Btn_Save,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: 60.0)
        
        let width_Lab_line_2 = NSLayoutConstraint(item: Lab_line_2,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: screensize.width)
        
        let hight_Lab_line_2 = NSLayoutConstraint(item: Lab_line_2,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_line_2,leading_Lab_line_2,width_Lab_line_2,hight_Lab_line_2])
        

        Lab_line_2.backgroundColor = UIColor.lightGray
        
        
        
        
        
        
        //=========== Lab_Input ===========//
        scrollView.addSubview(Lab_Input)
        Lab_Input.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-207)  //////////////////////////////0.0
        
        let top_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Lab_line_2,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        let width_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 80.0)
        
        let hight_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_Input,leading_Lab_Input,width_Lab_Input,hight_Lab_Input])

        Lab_Input.text = "Input"
        Lab_Input.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Input.textColor = uicolor
        Lab_Input.textAlignment = NSTextAlignment.right
        
        
        
        //=========== Lab_Input IN1 ===========//
        scrollView.addSubview(Lab_IN1)
        Lab_IN1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN1 = NSLayoutConstraint(item: Lab_IN1,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-207)  /////////////////////////////0.0
        
        let top_Lab_IN1 = NSLayoutConstraint(item: Lab_IN1,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Lab_Input,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        let width_Lab_IN1 = NSLayoutConstraint(item: Lab_IN1,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 80.0)
        
        let hight_Lab_IN1 = NSLayoutConstraint(item: Lab_IN1,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN1,leading_Lab_IN1,width_Lab_IN1,hight_Lab_IN1])
        
        Lab_IN1.text = "IN1"
        Lab_IN1.textColor = uicolor
        Lab_IN1.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Input IN2 ===========//
        scrollView.addSubview(Lab_IN2)
        Lab_IN2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN2 = NSLayoutConstraint(item: Lab_IN2,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-47)  //////////////////////////////160.0
        
        let top_Lab_IN2 = NSLayoutConstraint(item: Lab_IN2,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Input,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 35.0)
        
        let width_Lab_IN2 = NSLayoutConstraint(item: Lab_IN2,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN2 = NSLayoutConstraint(item: Lab_IN2,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN2,leading_Lab_IN2,width_Lab_IN2,hight_Lab_IN2])
        
        Lab_IN2.text = "IN2"
        Lab_IN2.textColor = uicolor
        Lab_IN2.textAlignment = NSTextAlignment.right
        
        
        
        //=========== Lab_Input IN3 ===========//
        let Lab_top = 42.0
        scrollView.addSubview(Lab_IN3)
        Lab_IN3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN3 = NSLayoutConstraint(item: Lab_IN3,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-207)
        
        let top_Lab_IN3 = NSLayoutConstraint(item: Lab_IN3,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN1,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN3 = NSLayoutConstraint(item: Lab_IN3,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN3 = NSLayoutConstraint(item: Lab_IN3,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN3,leading_Lab_IN3,width_Lab_IN3,hight_Lab_IN3])
        
        Lab_IN3.text = "IN3"
        Lab_IN3.textColor = uicolor
        Lab_IN3.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Input IN4 ===========//
        scrollView.addSubview(Lab_IN4)
        Lab_IN4.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN4 = NSLayoutConstraint(item: Lab_IN4,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-47)
        
        let top_Lab_IN4 = NSLayoutConstraint(item: Lab_IN4,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN1,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN4 = NSLayoutConstraint(item: Lab_IN4,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN4 = NSLayoutConstraint(item: Lab_IN4,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN4,leading_Lab_IN4,width_Lab_IN4,hight_Lab_IN4])
        
        Lab_IN4.text = "IN4"
        Lab_IN4.textColor = uicolor
        Lab_IN4.textAlignment = NSTextAlignment.right
        
        
        if(Input_num>4){
        //=========== Lab_Input IN5 ===========//
        scrollView.addSubview(Lab_IN5)
        Lab_IN5.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN5 = NSLayoutConstraint(item: Lab_IN5,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-207)
        
        let top_Lab_IN5 = NSLayoutConstraint(item: Lab_IN5,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN3,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN5 = NSLayoutConstraint(item: Lab_IN5,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN5 = NSLayoutConstraint(item: Lab_IN5,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN5,leading_Lab_IN5,width_Lab_IN5,hight_Lab_IN5])
        
        Lab_IN5.text = "IN5"
        Lab_IN5.textColor = uicolor
        Lab_IN5.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Input IN6 ===========//
        scrollView.addSubview(Lab_IN6)
        Lab_IN6.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN6 = NSLayoutConstraint(item: Lab_IN6,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: screensize.width/2-47)
        
        let top_Lab_IN6 = NSLayoutConstraint(item: Lab_IN6,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN4,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN6 = NSLayoutConstraint(item: Lab_IN6,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN6 = NSLayoutConstraint(item: Lab_IN6,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN6,leading_Lab_IN6,width_Lab_IN6,hight_Lab_IN6])
        
        Lab_IN6.text = "IN6"
        Lab_IN6.textColor = uicolor
        Lab_IN6.textAlignment = NSTextAlignment.right
        }
        
        if(Input_num>7){
        
        
        //=========== Lab_Input IN7 ===========//
        scrollView.addSubview(Lab_IN7)
        Lab_IN7.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN7 = NSLayoutConstraint(item: Lab_IN7,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-207)
        
        let top_Lab_IN7 = NSLayoutConstraint(item: Lab_IN7,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN5,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN7 = NSLayoutConstraint(item: Lab_IN7,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN7 = NSLayoutConstraint(item: Lab_IN7,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN7,leading_Lab_IN7,width_Lab_IN7,hight_Lab_IN7])
        
        Lab_IN7.text = "IN7"
        Lab_IN7.textColor = uicolor
        Lab_IN7.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Input IN4 ===========//
        scrollView.addSubview(Lab_IN8)
        Lab_IN8.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_IN8 = NSLayoutConstraint(item: Lab_IN8,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-47)
        
        let top_Lab_IN8 = NSLayoutConstraint(item: Lab_IN8,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_IN6,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_IN8 = NSLayoutConstraint(item: Lab_IN8,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_IN8 = NSLayoutConstraint(item: Lab_IN8,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_IN8,leading_Lab_IN8,width_Lab_IN8,hight_Lab_IN8])
        
        Lab_IN8.text = "IN8"
        Lab_IN8.textColor = uicolor
        Lab_IN8.textAlignment = NSTextAlignment.right
        
        }
        
        
        if(Input_num > 8) {
            //=========== Lab_Input IN9 ===========//
            scrollView.addSubview(Lab_IN9)
            Lab_IN9.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN9 = NSLayoutConstraint(item: Lab_IN9,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-207)
            
            let top_Lab_IN9 = NSLayoutConstraint(item: Lab_IN9,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN7,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN9 = NSLayoutConstraint(item: Lab_IN9,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN9 = NSLayoutConstraint(item: Lab_IN9,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN9,leading_Lab_IN9,width_Lab_IN9,hight_Lab_IN9])
            
            Lab_IN9.text = "IN9"
            Lab_IN9.textColor = uicolor
            Lab_IN9.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN10 ===========//
            scrollView.addSubview(Lab_IN10)
            Lab_IN10.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN10 = NSLayoutConstraint(item: Lab_IN10,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-47)
            
            let top_Lab_IN10 = NSLayoutConstraint(item: Lab_IN10,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN8,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN10 = NSLayoutConstraint(item: Lab_IN10,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN10 = NSLayoutConstraint(item: Lab_IN10,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN10,leading_Lab_IN10,width_Lab_IN10,hight_Lab_IN10])
            
            Lab_IN10.text = "IN10"
            Lab_IN10.textColor = uicolor
            Lab_IN10.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Input IN11 ===========//
            scrollView.addSubview(Lab_IN11)
            Lab_IN11.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN11 = NSLayoutConstraint(item: Lab_IN11,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-207)
            
            let top_Lab_IN11 = NSLayoutConstraint(item: Lab_IN11,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN9,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN11 = NSLayoutConstraint(item: Lab_IN11,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN11 = NSLayoutConstraint(item: Lab_IN11,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN11 , leading_Lab_IN11 , width_Lab_IN11 , hight_Lab_IN11])
            
            Lab_IN11.text = "IN11"
            Lab_IN11.textColor = uicolor
            Lab_IN11.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN12 ===========//
            scrollView.addSubview(Lab_IN12)
            Lab_IN12.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN12 = NSLayoutConstraint(item: Lab_IN12,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-47)
            
            let top_Lab_IN12 = NSLayoutConstraint(item: Lab_IN12,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN10,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN12 = NSLayoutConstraint(item: Lab_IN12,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN12 = NSLayoutConstraint(item: Lab_IN12,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN12 , leading_Lab_IN12 , width_Lab_IN12 , hight_Lab_IN12])
            
            Lab_IN12.text = "IN12"
            Lab_IN12.textColor = uicolor
            Lab_IN12.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Input IN13 ===========//
            scrollView.addSubview(Lab_IN13)
            Lab_IN13.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN13 = NSLayoutConstraint(item: Lab_IN13,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-207)
            
            let top_Lab_IN13 = NSLayoutConstraint(item: Lab_IN13,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN11,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN13 = NSLayoutConstraint(item: Lab_IN13,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN13 = NSLayoutConstraint(item: Lab_IN13,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN13,leading_Lab_IN13,width_Lab_IN13,hight_Lab_IN13])
            
            Lab_IN13.text = "IN13"
            Lab_IN13.textColor = uicolor
            Lab_IN13.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN6 ===========//
            scrollView.addSubview(Lab_IN14)
            Lab_IN14.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN14 = NSLayoutConstraint(item: Lab_IN14,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-47)
            
            let top_Lab_IN14 = NSLayoutConstraint(item: Lab_IN14,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN12,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN14 = NSLayoutConstraint(item: Lab_IN14,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN14 = NSLayoutConstraint(item: Lab_IN14,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN14,leading_Lab_IN14,width_Lab_IN14,hight_Lab_IN14])
            
            Lab_IN14.text = "IN14"
            Lab_IN14.textColor = uicolor
            Lab_IN14.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Input IN15 ===========//
            scrollView.addSubview(Lab_IN15)
            Lab_IN15.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN15 = NSLayoutConstraint(item: Lab_IN15,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-207)
            
            let top_Lab_IN15 = NSLayoutConstraint(item: Lab_IN15,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN13,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN15 = NSLayoutConstraint(item: Lab_IN15,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN15 = NSLayoutConstraint(item: Lab_IN15,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN15,leading_Lab_IN15,width_Lab_IN15,hight_Lab_IN15])
            
            Lab_IN15.text = "IN15"
            Lab_IN15.textColor = uicolor
            Lab_IN15.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN16 ===========//
            scrollView.addSubview(Lab_IN16)
            Lab_IN16.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN16 = NSLayoutConstraint(item: Lab_IN16,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,//self.Content_View,
                attribute: .leading,
                multiplier: 1.0,
                constant: screensize.width/2-47)
            
            let top_Lab_IN16 = NSLayoutConstraint(item: Lab_IN16,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN14,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN16 = NSLayoutConstraint(item: Lab_IN16,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN16 = NSLayoutConstraint(item: Lab_IN16,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN16,leading_Lab_IN16,width_Lab_IN16,hight_Lab_IN16])
            
            Lab_IN16.text = "IN16"
            Lab_IN16.textColor = uicolor
            Lab_IN16.textAlignment = NSTextAlignment.right

        }
        
        
        if(Input_num>16){
            //=========== Lab_Input IN17 ===========//
            scrollView.addSubview(Lab_IN17)
            Lab_IN17.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN17 = NSLayoutConstraint(item: Lab_IN17,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: screensize.width/2-207)
            
            let top_Lab_IN17 = NSLayoutConstraint(item: Lab_IN17,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN15,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN17 = NSLayoutConstraint(item: Lab_IN17,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN17 = NSLayoutConstraint(item: Lab_IN17,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN17 , leading_Lab_IN17 , width_Lab_IN17 , hight_Lab_IN17])
            
            Lab_IN17.text = "IN17"
            Lab_IN17.textColor = uicolor
            Lab_IN17.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN18 ===========//
            scrollView.addSubview(Lab_IN18)
            Lab_IN18.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN18 = NSLayoutConstraint(item: Lab_IN18,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: screensize.width/2-47)
            
            let top_Lab_IN18 = NSLayoutConstraint(item: Lab_IN18,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN16,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN18 = NSLayoutConstraint(item: Lab_IN18,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN18 = NSLayoutConstraint(item: Lab_IN18,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN18,leading_Lab_IN18,width_Lab_IN18,hight_Lab_IN18])
            
            Lab_IN18.text = "IN18"
            Lab_IN18.textColor = uicolor
            Lab_IN18.textAlignment = NSTextAlignment.right
            

                //=========== Lab_Input IN19 ===========//
                scrollView.addSubview(Lab_IN19)
                Lab_IN19.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN19 = NSLayoutConstraint(item: Lab_IN19,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: scrollView,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: screensize.width/2-207)
                
                let top_Lab_IN19 = NSLayoutConstraint(item: Lab_IN19,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN17,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: CGFloat(Lab_top))
                
                let width_Lab_IN19 = NSLayoutConstraint(item: Lab_IN19,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 80.0)
                
                let hight_Lab_IN19 = NSLayoutConstraint(item: Lab_IN19,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN19 , leading_Lab_IN19 , width_Lab_IN19 , hight_Lab_IN19])
                
                Lab_IN19.text = "IN19"
                Lab_IN19.textColor = uicolor
                Lab_IN19.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN20 ===========//
                scrollView.addSubview(Lab_IN20)
                Lab_IN20.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN20 = NSLayoutConstraint(item: Lab_IN20,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN20 = NSLayoutConstraint(item: Lab_IN20,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN18,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN20 = NSLayoutConstraint(item: Lab_IN20,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN20 = NSLayoutConstraint(item: Lab_IN20,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN20,leading_Lab_IN20,width_Lab_IN20,hight_Lab_IN20])
                
                Lab_IN20.text = "IN20"
                Lab_IN20.textColor = uicolor
                Lab_IN20.textAlignment = NSTextAlignment.right
                
                
                
                //=========== Lab_Input IN21 ===========//
                scrollView.addSubview(Lab_IN21)
                Lab_IN21.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN21 = NSLayoutConstraint(item: Lab_IN21,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_IN21 = NSLayoutConstraint(item: Lab_IN21,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN19,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN21 = NSLayoutConstraint(item: Lab_IN21,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN21 = NSLayoutConstraint(item: Lab_IN21,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN21,leading_Lab_IN21,width_Lab_IN21,hight_Lab_IN21])
                
                Lab_IN21.text = "IN21"
                Lab_IN21.textColor = uicolor
                Lab_IN21.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN22 ===========//
                scrollView.addSubview(Lab_IN22)
                Lab_IN22.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN22 = NSLayoutConstraint(item: Lab_IN22,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN22 = NSLayoutConstraint(item: Lab_IN22,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN20,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN22 = NSLayoutConstraint(item: Lab_IN22,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN22 = NSLayoutConstraint(item: Lab_IN22,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN22,leading_Lab_IN22,width_Lab_IN22,hight_Lab_IN22])
                
                Lab_IN22.text = "IN22"
                Lab_IN22.textColor = uicolor
                Lab_IN22.textAlignment = NSTextAlignment.right
                
                
                
                //=========== Lab_Input IN23 ===========//
                scrollView.addSubview(Lab_IN23)
                Lab_IN23.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN23 = NSLayoutConstraint(item: Lab_IN23,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_IN23 = NSLayoutConstraint(item: Lab_IN23,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN21,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN23 = NSLayoutConstraint(item: Lab_IN23,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN23 = NSLayoutConstraint(item: Lab_IN23,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN23,leading_Lab_IN23,width_Lab_IN23,hight_Lab_IN23])
                
                Lab_IN23.text = "IN23"
                Lab_IN23.textColor = uicolor
                Lab_IN23.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN24 ===========//
                scrollView.addSubview(Lab_IN24)
                Lab_IN24.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN24 = NSLayoutConstraint(item: Lab_IN24,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN24 = NSLayoutConstraint(item: Lab_IN24,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN22,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN24 = NSLayoutConstraint(item: Lab_IN24,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN24 = NSLayoutConstraint(item: Lab_IN24,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN24,leading_Lab_IN24,width_Lab_IN24,hight_Lab_IN24])
                
                Lab_IN24.text = "IN24"
                Lab_IN24.textColor = uicolor
                Lab_IN24.textAlignment = NSTextAlignment.right
                
                
                
                //=========== Lab_Input IN25 ===========//
                scrollView.addSubview(Lab_IN25)
                Lab_IN25.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN25 = NSLayoutConstraint(item: Lab_IN25,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_IN25 = NSLayoutConstraint(item: Lab_IN25,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN23,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN25 = NSLayoutConstraint(item: Lab_IN25,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN25 = NSLayoutConstraint(item: Lab_IN25,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN25,leading_Lab_IN25,width_Lab_IN25,hight_Lab_IN25])
                
                Lab_IN25.text = "IN25"
                Lab_IN25.textColor = uicolor
                Lab_IN25.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN26 ===========//
                scrollView.addSubview(Lab_IN26)
                Lab_IN26.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN26 = NSLayoutConstraint(item: Lab_IN26,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN26 = NSLayoutConstraint(item: Lab_IN26,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN24,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN26 = NSLayoutConstraint(item: Lab_IN26,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN26 = NSLayoutConstraint(item: Lab_IN26,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN26,leading_Lab_IN26,width_Lab_IN26,hight_Lab_IN26])
                
                Lab_IN26.text = "IN26"
                Lab_IN26.textColor = uicolor
                Lab_IN26.textAlignment = NSTextAlignment.right
                
            
            //=========== Lab_Input IN27 ===========//
            scrollView.addSubview(Lab_IN27)
            Lab_IN27.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN27 = NSLayoutConstraint(item: Lab_IN27,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: screensize.width/2-207)
            
            let top_Lab_IN27 = NSLayoutConstraint(item: Lab_IN27,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN25,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN27 = NSLayoutConstraint(item: Lab_IN27,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN27 = NSLayoutConstraint(item: Lab_IN27,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN27 , leading_Lab_IN27 , width_Lab_IN27 , hight_Lab_IN27])
            
            Lab_IN27.text = "IN27"
            Lab_IN27.textColor = uicolor
            Lab_IN27.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN4 ===========//
            scrollView.addSubview(Lab_IN28)
            Lab_IN28.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_IN28 = NSLayoutConstraint(item: Lab_IN28,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: scrollView,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: screensize.width/2-47)
            
            let top_Lab_IN28 = NSLayoutConstraint(item: Lab_IN28,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN26,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Lab_top))
            
            let width_Lab_IN28 = NSLayoutConstraint(item: Lab_IN28,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 80.0)
            
            let hight_Lab_IN28 = NSLayoutConstraint(item: Lab_IN28,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_IN28 , leading_Lab_IN28 , width_Lab_IN28 , hight_Lab_IN28])
            
            Lab_IN28.text = "IN28"
            Lab_IN28.textColor = uicolor
            Lab_IN28.textAlignment = NSTextAlignment.right
            

                //=========== Lab_Input IN29 ===========//
                scrollView.addSubview(Lab_IN29)
                Lab_IN29.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN29 = NSLayoutConstraint(item: Lab_IN29,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: scrollView,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: screensize.width/2-207)
                
                let top_Lab_IN29 = NSLayoutConstraint(item: Lab_IN29,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN27,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: CGFloat(Lab_top))
                
                let width_Lab_IN29 = NSLayoutConstraint(item: Lab_IN29,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 80.0)
                
                let hight_Lab_IN29 = NSLayoutConstraint(item: Lab_IN29,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN29 , leading_Lab_IN29 , width_Lab_IN29 , hight_Lab_IN29])
                
                Lab_IN29.text = "IN29"
                Lab_IN29.textColor = uicolor
                Lab_IN29.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN30 ===========//
                scrollView.addSubview(Lab_IN30)
                Lab_IN30.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN30 = NSLayoutConstraint(item: Lab_IN30,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN30 = NSLayoutConstraint(item: Lab_IN30,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN28,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN30 = NSLayoutConstraint(item: Lab_IN30,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN30 = NSLayoutConstraint(item: Lab_IN30,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN30,leading_Lab_IN30,width_Lab_IN30,hight_Lab_IN30])
                
                Lab_IN30.text = "IN30"
                Lab_IN30.textColor = uicolor
                Lab_IN30.textAlignment = NSTextAlignment.right
                
                
                
                //=========== Lab_Input IN31 ===========//
                scrollView.addSubview(Lab_IN31)
                Lab_IN31.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN31 = NSLayoutConstraint(item: Lab_IN31,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_IN31 = NSLayoutConstraint(item: Lab_IN31,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN29,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN31 = NSLayoutConstraint(item: Lab_IN31,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN31 = NSLayoutConstraint(item: Lab_IN31,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN31 , leading_Lab_IN31 , width_Lab_IN31 , hight_Lab_IN31])
                
                Lab_IN31.text = "IN31"
                Lab_IN31.textColor = uicolor
                Lab_IN31.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Input IN32 ===========//
                scrollView.addSubview(Lab_IN32)
                Lab_IN32.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_IN32 = NSLayoutConstraint(item: Lab_IN32,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-47)
                
                let top_Lab_IN32 = NSLayoutConstraint(item: Lab_IN32,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_IN30,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_IN32 = NSLayoutConstraint(item: Lab_IN32,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_IN32 = NSLayoutConstraint(item: Lab_IN32,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_IN32 , leading_Lab_IN32 , width_Lab_IN32 , hight_Lab_IN32])
                
                Lab_IN32.text = "IN32"
                Lab_IN32.textColor = uicolor
                Lab_IN32.textAlignment = NSTextAlignment.right
            
            
        }
        
        
        
        //=========== IN1 TextField ===========//
        scrollView.addSubview(Txt_IN1)
        Txt_IN1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN1 = NSLayoutConstraint(item: Txt_IN1,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN1,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN1 = NSLayoutConstraint(item: Txt_IN1,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: Lab_Input,
                                            attribute: .top,
                                            multiplier: 1.0,
                                            constant: 38.0)
        
        let width_Txt_IN1 = NSLayoutConstraint(item: Txt_IN1,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 90.0)
        
        let hight_Txt_IN1 = NSLayoutConstraint(item: Txt_IN1,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN1 , leading_Txt_IN1 , width_Txt_IN1 , hight_Txt_IN1])
        
        Txt_IN1.layer.cornerRadius = 5.0
        Txt_IN1.placeholder = get_IN_Name(value: 1)//app.IN1//"IN1"
        Txt_IN1.borderStyle = .roundedRect
        Txt_IN1.returnKeyType = .done
        Txt_IN1.textColor = UIColor.black
        Txt_IN1.layer.borderWidth = 1.0
        Txt_IN1.layer.borderColor = CGColor.cgColor
        
        
        //=========== IN2 TextField ===========//
        scrollView.addSubview(Txt_IN2)
        Txt_IN2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN2 = NSLayoutConstraint(item: Txt_IN2,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN2,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN2 = NSLayoutConstraint(item: Txt_IN2,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Input,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 38.0)
        
        let width_Txt_IN2 = NSLayoutConstraint(item: Txt_IN2,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN2 = NSLayoutConstraint(item: Txt_IN2,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN2 , leading_Txt_IN2 , width_Txt_IN2 , hight_Txt_IN2])
        
        Txt_IN2.layer.cornerRadius = 5.0
        Txt_IN2.placeholder = get_IN_Name(value: 2)//app.IN2//"IN2"
        Txt_IN2.borderStyle = .roundedRect
        Txt_IN2.returnKeyType = .done
        Txt_IN2.textColor = UIColor.black
        Txt_IN2.layer.borderWidth = 1.0
        Txt_IN2.layer.borderColor = CGColor.cgColor
        
        let Txt_top = 42.0
        //=========== IN3 TextField ===========//
        scrollView.addSubview(Txt_IN3)
        Txt_IN3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN3 = NSLayoutConstraint(item: Txt_IN3,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN3,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN3 = NSLayoutConstraint(item: Txt_IN3,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN1,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_IN3 = NSLayoutConstraint(item: Txt_IN3,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN3 = NSLayoutConstraint(item: Txt_IN3,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN3 , leading_Txt_IN3 , width_Txt_IN3 , hight_Txt_IN3])
        
        Txt_IN3.layer.cornerRadius = 5.0
        Txt_IN3.placeholder = get_IN_Name(value: 3)//app.IN3//"IN3"
        Txt_IN3.borderStyle = .roundedRect
        Txt_IN3.returnKeyType = .done
        Txt_IN3.textColor = UIColor.black
        Txt_IN3.layer.borderWidth = 1.0
        Txt_IN3.layer.borderColor = CGColor.cgColor
        
        
        //=========== IN4 TextField ===========//
        scrollView.addSubview(Txt_IN4)
        Txt_IN4.translatesAutoresizingMaskIntoConstraints = false
        

        
        let leading_Txt_IN4 = NSLayoutConstraint(item: Txt_IN4,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN4,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN4 = NSLayoutConstraint(item: Txt_IN4,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN2,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_IN4 = NSLayoutConstraint(item: Txt_IN4,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN4 = NSLayoutConstraint(item: Txt_IN4,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN4 , leading_Txt_IN4 , width_Txt_IN4 , hight_Txt_IN4])
        
        Txt_IN4.layer.cornerRadius = 5.0
        Txt_IN4.placeholder = get_IN_Name(value: 4)//app.IN4//"IN4"
        Txt_IN4.borderStyle = .roundedRect
        Txt_IN4.returnKeyType = .done
        Txt_IN4.textColor = UIColor.black
        Txt_IN4.layer.borderWidth = 1.0
        Txt_IN4.layer.borderColor = CGColor.cgColor
        
        if(Input_num > 5) {
        //=========== IN5 TextField ===========//
        scrollView.addSubview(Txt_IN5)
        Txt_IN5.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN5 = NSLayoutConstraint(item: Txt_IN5,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN5,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN5 = NSLayoutConstraint(item: Txt_IN5,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN3,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_IN5 = NSLayoutConstraint(item: Txt_IN5,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN5 = NSLayoutConstraint(item: Txt_IN5,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN5 , leading_Txt_IN5 , width_Txt_IN5 , hight_Txt_IN5])
        
        Txt_IN5.layer.cornerRadius = 5.0
        Txt_IN5.placeholder = get_IN_Name(value: 5)//app.IN5//"IN5"
        Txt_IN5.borderStyle = .roundedRect
        Txt_IN5.returnKeyType = .done
        Txt_IN5.textColor = UIColor.black
        Txt_IN5.layer.borderWidth = 1.0
        Txt_IN5.layer.borderColor = CGColor.cgColor
        
        
        //=========== IN6 TextField ===========//
        scrollView.addSubview(Txt_IN6)
        Txt_IN6.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN6 = NSLayoutConstraint(item: Txt_IN6,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN6,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN6 = NSLayoutConstraint(item: Txt_IN6,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN4,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_IN6 = NSLayoutConstraint(item: Txt_IN6,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN6 = NSLayoutConstraint(item: Txt_IN6,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN6 , leading_Txt_IN6 , width_Txt_IN6 , hight_Txt_IN6])
        
        Txt_IN6.layer.cornerRadius = 5.0
        Txt_IN6.placeholder = get_IN_Name(value: 6)//app.IN6
        Txt_IN6.borderStyle = .roundedRect
        Txt_IN6.returnKeyType = .done
        Txt_IN6.textColor = UIColor.black
        Txt_IN6.layer.borderWidth = 1.0
        Txt_IN6.layer.borderColor = CGColor.cgColor
        }
        if(Input_num > 7) {
        //=========== IN7 TextField ===========//
        scrollView.addSubview(Txt_IN7)
        Txt_IN7.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_IN7 = NSLayoutConstraint(item: Txt_IN7,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN7,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN7 = NSLayoutConstraint(item: Txt_IN7,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN5,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_IN7 = NSLayoutConstraint(item: Txt_IN7,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN7 = NSLayoutConstraint(item: Txt_IN7,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN7 , leading_Txt_IN7 , width_Txt_IN7 , hight_Txt_IN7])
        
        Txt_IN7.layer.cornerRadius = 5.0
        Txt_IN7.placeholder = get_IN_Name(value: 7)//app.IN7//"IN7"
        Txt_IN7.borderStyle = .roundedRect
        Txt_IN7.returnKeyType = .done
        Txt_IN7.textColor = UIColor.black
        Txt_IN7.layer.borderWidth = 1.0
        Txt_IN7.layer.borderColor = CGColor.cgColor
        
        
        //=========== IN8 TextField ===========//
        scrollView.addSubview(Txt_IN8)
        Txt_IN8.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let leading_Txt_IN8 = NSLayoutConstraint(item: Txt_IN8,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_IN8,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_IN8 = NSLayoutConstraint(item: Txt_IN8,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_IN6,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 42.0)
        
        let width_Txt_IN8 = NSLayoutConstraint(item: Txt_IN8,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_IN8 = NSLayoutConstraint(item: Txt_IN8,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_IN8 , leading_Txt_IN8 , width_Txt_IN8 , hight_Txt_IN8])
        
        Txt_IN8.layer.cornerRadius = 5.0
        Txt_IN8.placeholder = get_IN_Name(value: 8)//app.IN8//"IN8"
        Txt_IN8.borderStyle = .roundedRect
        Txt_IN8.returnKeyType = .done
        Txt_IN8.textColor = UIColor.black
        Txt_IN8.layer.borderWidth = 1.0
        Txt_IN8.layer.borderColor = CGColor.cgColor
        
            
        }
        
        
        if(Input_num>8){
            //=========== IN9 TextField ===========//
            scrollView.addSubview(Txt_IN9)
            Txt_IN9.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN9 = NSLayoutConstraint(item: Txt_IN9,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN9,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN9 = NSLayoutConstraint(item: Txt_IN9,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN7,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN9 = NSLayoutConstraint(item: Txt_IN9,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN9 = NSLayoutConstraint(item: Txt_IN9,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN9 , leading_Txt_IN9 , width_Txt_IN9 , hight_Txt_IN9])
            
            Txt_IN9.layer.cornerRadius = 5.0
            Txt_IN9.placeholder = get_IN_Name(value: 9)//app.IN9//"IN9"
            Txt_IN9.borderStyle = .roundedRect
            Txt_IN9.returnKeyType = .done
            Txt_IN9.textColor = UIColor.black
            Txt_IN9.layer.borderWidth = 1.0
            Txt_IN9.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN10 TextField ===========//
            scrollView.addSubview(Txt_IN10)
            Txt_IN10.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN10 = NSLayoutConstraint(item: Txt_IN10,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN10,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN10 = NSLayoutConstraint(item: Txt_IN10,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN8,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN10 = NSLayoutConstraint(item: Txt_IN10,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN10 = NSLayoutConstraint(item: Txt_IN10,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN10 , leading_Txt_IN10 , width_Txt_IN10 , hight_Txt_IN10])
            
            Txt_IN10.layer.cornerRadius = 5.0
            Txt_IN10.placeholder = get_IN_Name(value: 10)//app.IN10//"IN10"
            Txt_IN10.borderStyle = .roundedRect
            Txt_IN10.returnKeyType = .done
            Txt_IN10.textColor = UIColor.black
            Txt_IN10.layer.borderWidth = 1.0
            Txt_IN10.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN11 TextField ===========//
            scrollView.addSubview(Txt_IN11)
            Txt_IN11.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN11 = NSLayoutConstraint(item: Txt_IN11,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN11,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN11 = NSLayoutConstraint(item: Txt_IN11,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN9,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN11 = NSLayoutConstraint(item: Txt_IN11,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN11 = NSLayoutConstraint(item: Txt_IN11,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN11 , leading_Txt_IN11 , width_Txt_IN11 , hight_Txt_IN11])
            
            Txt_IN11.layer.cornerRadius = 5.0
            Txt_IN11.placeholder = get_IN_Name(value: 11)//app.IN11//"IN11"
            Txt_IN11.borderStyle = .roundedRect
            Txt_IN11.returnKeyType = .done
            Txt_IN11.textColor = UIColor.black
            Txt_IN11.layer.borderWidth = 1.0
            Txt_IN11.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN12 TextField ===========//
            scrollView.addSubview(Txt_IN12)
            Txt_IN12.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            let leading_Txt_IN12 = NSLayoutConstraint(item: Txt_IN12,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN12,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN12 = NSLayoutConstraint(item: Txt_IN12,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN10,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN12 = NSLayoutConstraint(item: Txt_IN12,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN12 = NSLayoutConstraint(item: Txt_IN12,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN12 , leading_Txt_IN12 , width_Txt_IN12 , hight_Txt_IN12])
            
            Txt_IN12.layer.cornerRadius = 5.0
            Txt_IN12.placeholder = get_IN_Name(value: 12)//app.IN12//"IN12"
            Txt_IN12.borderStyle = .roundedRect
            Txt_IN12.returnKeyType = .done
            Txt_IN12.textColor = UIColor.black
            Txt_IN12.layer.borderWidth = 1.0
            Txt_IN12.layer.borderColor = CGColor.cgColor
            
            //=========== IN13 TextField ===========//
            scrollView.addSubview(Txt_IN13)
            Txt_IN13.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN13 = NSLayoutConstraint(item: Txt_IN13,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN13,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN13 = NSLayoutConstraint(item: Txt_IN13,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN11,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN13 = NSLayoutConstraint(item: Txt_IN13,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN13 = NSLayoutConstraint(item: Txt_IN13,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN13 , leading_Txt_IN13 , width_Txt_IN13 , hight_Txt_IN13])
            
            Txt_IN13.layer.cornerRadius = 5.0
            Txt_IN13.placeholder = get_IN_Name(value: 13)//app.IN13//"IN13"
            Txt_IN13.borderStyle = .roundedRect
            Txt_IN13.returnKeyType = .done
            Txt_IN13.textColor = UIColor.black
            Txt_IN13.layer.borderWidth = 1.0
            Txt_IN13.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN14 TextField ===========//
            scrollView.addSubview(Txt_IN14)
            Txt_IN14.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN14 = NSLayoutConstraint(item: Txt_IN14,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN14,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN14 = NSLayoutConstraint(item: Txt_IN14,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN12,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN14 = NSLayoutConstraint(item: Txt_IN14,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN14 = NSLayoutConstraint(item: Txt_IN14,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN14 , leading_Txt_IN14 , width_Txt_IN14 , hight_Txt_IN14])
            
            Txt_IN14.layer.cornerRadius = 5.0
            Txt_IN14.placeholder = get_IN_Name(value: 14)//app.IN14//"IN14"
            Txt_IN14.borderStyle = .roundedRect
            Txt_IN14.returnKeyType = .done
            Txt_IN14.textColor = UIColor.black
            Txt_IN14.layer.borderWidth = 1.0
            Txt_IN14.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN15 TextField ===========//
            scrollView.addSubview(Txt_IN15)
            Txt_IN15.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_IN15 = NSLayoutConstraint(item: Txt_IN15,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN15,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN15 = NSLayoutConstraint(item: Txt_IN15,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN13,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN15 = NSLayoutConstraint(item: Txt_IN15,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN15 = NSLayoutConstraint(item: Txt_IN15,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN15 , leading_Txt_IN15 , width_Txt_IN15 , hight_Txt_IN15])
            
            Txt_IN15.layer.cornerRadius = 5.0
            Txt_IN15.placeholder = get_IN_Name(value: 15)//app.IN15//"IN15"
            Txt_IN15.borderStyle = .roundedRect
            Txt_IN15.returnKeyType = .done
            Txt_IN15.textColor = UIColor.black
            Txt_IN15.layer.borderWidth = 1.0
            Txt_IN15.layer.borderColor = CGColor.cgColor
            
            
            //=========== IN16 TextField ===========//
            scrollView.addSubview(Txt_IN16)
            Txt_IN16.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN16 = NSLayoutConstraint(item: Txt_IN16,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN16,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)
            
            let top_Txt_IN16 = NSLayoutConstraint(item: Txt_IN16,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN14,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))
            
            let width_Txt_IN16 = NSLayoutConstraint(item: Txt_IN16,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
            
            let hight_Txt_IN16 = NSLayoutConstraint(item: Txt_IN16,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_IN16 , leading_Txt_IN16 , width_Txt_IN16 , hight_Txt_IN16])
            
            Txt_IN16.layer.cornerRadius = 5.0
            Txt_IN16.placeholder = get_IN_Name(value: 16)//app.IN16//"IN16"
            Txt_IN16.borderStyle = .roundedRect
            Txt_IN16.returnKeyType = .done
            Txt_IN16.textColor = UIColor.black
            Txt_IN16.layer.borderWidth = 1.0
            Txt_IN16.layer.borderColor = CGColor.cgColor
        }
        
        
        if(Input_num>16){



            //=========== IN17 TextField ===========//
            scrollView.addSubview(Txt_IN17)
            Txt_IN17.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN17 = NSLayoutConstraint(item: Txt_IN17,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN17,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN17 = NSLayoutConstraint(item: Txt_IN17,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN15,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN17 = NSLayoutConstraint(item: Txt_IN17,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN17 = NSLayoutConstraint(item: Txt_IN17,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN17 , leading_Txt_IN17 , width_Txt_IN17 , hight_Txt_IN17])

            Txt_IN17.layer.cornerRadius = 5.0
            Txt_IN17.placeholder = get_IN_Name(value: 17)//app.IN17//"IN17"
            Txt_IN17.borderStyle = .roundedRect
            Txt_IN17.returnKeyType = .done
            Txt_IN17.textColor = UIColor.black
            Txt_IN17.layer.borderWidth = 1.0
            Txt_IN17.layer.borderColor = CGColor.cgColor


            //=========== IN18 TextField ===========//
            scrollView.addSubview(Txt_IN18)
            Txt_IN18.translatesAutoresizingMaskIntoConstraints = false



            let leading_Txt_IN18 = NSLayoutConstraint(item: Txt_IN18,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN18,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN18 = NSLayoutConstraint(item: Txt_IN18,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN16,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: 42.0)

            let width_Txt_IN18 = NSLayoutConstraint(item: Txt_IN18,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN18 = NSLayoutConstraint(item: Txt_IN18,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN18 , leading_Txt_IN18 , width_Txt_IN18 , hight_Txt_IN18])

            Txt_IN18.layer.cornerRadius = 5.0
            Txt_IN18.placeholder = get_IN_Name(value: 18)//app.IN18//"IN18"
            Txt_IN18.borderStyle = .roundedRect
            Txt_IN18.returnKeyType = .done
            Txt_IN18.textColor = UIColor.black
            Txt_IN18.layer.borderWidth = 1.0
            Txt_IN18.layer.borderColor = CGColor.cgColor


                //=========== IN19 TextField ===========//
                scrollView.addSubview(Txt_IN19)
                Txt_IN19.translatesAutoresizingMaskIntoConstraints = false

                let leading_Txt_IN19 = NSLayoutConstraint(item: Txt_IN19,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: Lab_IN19,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: 90.0)

                let top_Txt_IN19 = NSLayoutConstraint(item: Txt_IN19,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: Txt_IN17,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: CGFloat(Txt_top))

                let width_Txt_IN19 = NSLayoutConstraint(item: Txt_IN19,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 90.0)

                let hight_Txt_IN19 = NSLayoutConstraint(item: Txt_IN19,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 35.0)

                NSLayoutConstraint.activate([top_Txt_IN19 , leading_Txt_IN19 , width_Txt_IN19 , hight_Txt_IN19])

                Txt_IN19.layer.cornerRadius = 5.0
                Txt_IN19.placeholder = get_IN_Name(value: 19)//app.IN19//"IN19"
                Txt_IN19.borderStyle = .roundedRect
                Txt_IN19.returnKeyType = .done
                Txt_IN19.textColor = UIColor.black
                Txt_IN19.layer.borderWidth = 1.0
                Txt_IN19.layer.borderColor = CGColor.cgColor


                //=========== IN20 TextField ===========//
                scrollView.addSubview(Txt_IN20)
                Txt_IN20.translatesAutoresizingMaskIntoConstraints = false

                let leading_Txt_IN20 = NSLayoutConstraint(item: Txt_IN20,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: Lab_IN20,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 90.0)

                let top_Txt_IN20 = NSLayoutConstraint(item: Txt_IN20,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Txt_IN18,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Txt_top))

                let width_Txt_IN20 = NSLayoutConstraint(item: Txt_IN20,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 90.0)

                let hight_Txt_IN20 = NSLayoutConstraint(item: Txt_IN20,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 35.0)

                NSLayoutConstraint.activate([top_Txt_IN20 , leading_Txt_IN20 , width_Txt_IN20 , hight_Txt_IN20])

                Txt_IN20.layer.cornerRadius = 5.0
                Txt_IN20.placeholder = get_IN_Name(value: 20)//app.IN20
                Txt_IN20.borderStyle = .roundedRect
                Txt_IN20.returnKeyType = .done
                Txt_IN20.textColor = UIColor.black
                Txt_IN20.layer.borderWidth = 1.0
                Txt_IN20.layer.borderColor = CGColor.cgColor






            //=========== IN21 TextField ===========//
            scrollView.addSubview(Txt_IN21)
            Txt_IN21.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN21 = NSLayoutConstraint(item: Txt_IN21,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN21,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN21 = NSLayoutConstraint(item: Txt_IN21,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN19,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN21 = NSLayoutConstraint(item: Txt_IN21,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN21 = NSLayoutConstraint(item: Txt_IN21,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN21 , leading_Txt_IN21 , width_Txt_IN21 , hight_Txt_IN21])

            Txt_IN21.layer.cornerRadius = 5.0
            Txt_IN21.placeholder = get_IN_Name(value: 21)//app.IN21//"IN21"
            Txt_IN21.borderStyle = .roundedRect
            Txt_IN21.returnKeyType = .done
            Txt_IN21.textColor = UIColor.black
            Txt_IN21.layer.borderWidth = 1.0
            Txt_IN21.layer.borderColor = CGColor.cgColor


            //=========== IN22 TextField ===========//
            scrollView.addSubview(Txt_IN22)
            Txt_IN22.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN22 = NSLayoutConstraint(item: Txt_IN22,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN22,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN22 = NSLayoutConstraint(item: Txt_IN22,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN20,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN22 = NSLayoutConstraint(item: Txt_IN22,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN22 = NSLayoutConstraint(item: Txt_IN22,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN22 , leading_Txt_IN22 , width_Txt_IN22 , hight_Txt_IN22])

            Txt_IN22.layer.cornerRadius = 5.0
            Txt_IN22.placeholder = get_IN_Name(value: 22)//app.IN22//"IN22"
            Txt_IN22.borderStyle = .roundedRect
            Txt_IN22.returnKeyType = .done
            Txt_IN22.textColor = UIColor.black
            Txt_IN22.layer.borderWidth = 1.0
            Txt_IN22.layer.borderColor = CGColor.cgColor

            //=========== IN23 TextField ===========//
            scrollView.addSubview(Txt_IN23)
            Txt_IN23.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN23 = NSLayoutConstraint(item: Txt_IN23,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN23,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN23 = NSLayoutConstraint(item: Txt_IN23,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN21,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN23 = NSLayoutConstraint(item: Txt_IN23,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN23 = NSLayoutConstraint(item: Txt_IN23,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN23 , leading_Txt_IN23 , width_Txt_IN23 , hight_Txt_IN23])

            Txt_IN23.layer.cornerRadius = 5.0
            Txt_IN23.placeholder = get_IN_Name(value: 23)//app.IN23//"IN23"
            Txt_IN23.borderStyle = .roundedRect
            Txt_IN23.returnKeyType = .done
            Txt_IN23.textColor = UIColor.black
            Txt_IN23.layer.borderWidth = 1.0
            Txt_IN23.layer.borderColor = CGColor.cgColor


            //=========== IN4 TextField ===========//
            scrollView.addSubview(Txt_IN24)
            Txt_IN24.translatesAutoresizingMaskIntoConstraints = false



            let leading_Txt_IN24 = NSLayoutConstraint(item: Txt_IN24,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN24,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN24 = NSLayoutConstraint(item: Txt_IN24,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN22,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN24 = NSLayoutConstraint(item: Txt_IN24,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN24 = NSLayoutConstraint(item: Txt_IN24,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN24 , leading_Txt_IN24 , width_Txt_IN24 , hight_Txt_IN24])

            Txt_IN24.layer.cornerRadius = 5.0
            Txt_IN24.placeholder = get_IN_Name(value: 24)//app.IN24//"IN24"
            Txt_IN24.borderStyle = .roundedRect
            Txt_IN24.returnKeyType = .done
            Txt_IN24.textColor = UIColor.black
            Txt_IN24.layer.borderWidth = 1.0
            Txt_IN24.layer.borderColor = CGColor.cgColor

            //=========== IN5 TextField ===========//
            scrollView.addSubview(Txt_IN25)
            Txt_IN25.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN25 = NSLayoutConstraint(item: Txt_IN25,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN25,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN25 = NSLayoutConstraint(item: Txt_IN25,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN23,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN25 = NSLayoutConstraint(item: Txt_IN25,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN25 = NSLayoutConstraint(item: Txt_IN25,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN25 , leading_Txt_IN25 , width_Txt_IN25 , hight_Txt_IN25])

            Txt_IN25.layer.cornerRadius = 5.0
            Txt_IN25.placeholder = get_IN_Name(value: 25)//app.IN25//"IN25"
            Txt_IN25.borderStyle = .roundedRect
            Txt_IN25.returnKeyType = .done
            Txt_IN25.textColor = UIColor.black
            Txt_IN25.layer.borderWidth = 1.0
            Txt_IN25.layer.borderColor = CGColor.cgColor


            //=========== IN26 TextField ===========//
            scrollView.addSubview(Txt_IN26)
            Txt_IN26.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN26 = NSLayoutConstraint(item: Txt_IN26,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN26,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN26 = NSLayoutConstraint(item: Txt_IN26,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN24,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN26 = NSLayoutConstraint(item: Txt_IN26,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN26 = NSLayoutConstraint(item: Txt_IN26,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN26 , leading_Txt_IN26 , width_Txt_IN26 , hight_Txt_IN26])

            Txt_IN26.layer.cornerRadius = 5.0
            Txt_IN26.placeholder = get_IN_Name(value: 26)//app.IN26//"IN26"
            Txt_IN26.borderStyle = .roundedRect
            Txt_IN26.returnKeyType = .done
            Txt_IN26.textColor = UIColor.black
            Txt_IN26.layer.borderWidth = 1.0
            Txt_IN26.layer.borderColor = CGColor.cgColor


            //=========== IN27 TextField ===========//
            scrollView.addSubview(Txt_IN27)
            Txt_IN27.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN27 = NSLayoutConstraint(item: Txt_IN27,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN27,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN27 = NSLayoutConstraint(item: Txt_IN27,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN25,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN27 = NSLayoutConstraint(item: Txt_IN27,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN27 = NSLayoutConstraint(item: Txt_IN27,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN27 , leading_Txt_IN27 , width_Txt_IN27 , hight_Txt_IN27])

            Txt_IN27.layer.cornerRadius = 5.0
            Txt_IN27.placeholder = get_IN_Name(value: 27)//app.IN27//"IN27"
            Txt_IN27.borderStyle = .roundedRect
            Txt_IN27.returnKeyType = .done
            Txt_IN27.textColor = UIColor.black
            Txt_IN27.layer.borderWidth = 1.0
            Txt_IN27.layer.borderColor = CGColor.cgColor


            //=========== IN28 TextField ===========//
            scrollView.addSubview(Txt_IN28)
            Txt_IN28.translatesAutoresizingMaskIntoConstraints = false



            let leading_Txt_IN28 = NSLayoutConstraint(item: Txt_IN28,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN28,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN28 = NSLayoutConstraint(item: Txt_IN28,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN26,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: 42.0)

            let width_Txt_IN28 = NSLayoutConstraint(item: Txt_IN28,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN28 = NSLayoutConstraint(item: Txt_IN28,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN28 , leading_Txt_IN28 , width_Txt_IN28 , hight_Txt_IN28])

            Txt_IN28.layer.cornerRadius = 5.0
            Txt_IN28.placeholder = get_IN_Name(value: 28)//app.IN28//"IN28"
            Txt_IN28.borderStyle = .roundedRect
            Txt_IN28.returnKeyType = .done
            Txt_IN28.textColor = UIColor.black
            Txt_IN28.layer.borderWidth = 1.0
            Txt_IN28.layer.borderColor = CGColor.cgColor

                //=========== IN29 TextField ===========//
                scrollView.addSubview(Txt_IN29)
                Txt_IN29.translatesAutoresizingMaskIntoConstraints = false

                let leading_Txt_IN29 = NSLayoutConstraint(item: Txt_IN29,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: Lab_IN29,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: 90.0)

                let top_Txt_IN29 = NSLayoutConstraint(item: Txt_IN29,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: Txt_IN27,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: CGFloat(Txt_top))

                let width_Txt_IN29 = NSLayoutConstraint(item: Txt_IN29,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 90.0)

                let hight_Txt_IN29 = NSLayoutConstraint(item: Txt_IN29,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 35.0)

                NSLayoutConstraint.activate([top_Txt_IN29 , leading_Txt_IN29 , width_Txt_IN29 , hight_Txt_IN29])

                Txt_IN29.layer.cornerRadius = 5.0
                Txt_IN29.placeholder = get_IN_Name(value: 29)//app.IN29//"IN29"
                Txt_IN29.borderStyle = .roundedRect
                Txt_IN29.returnKeyType = .done
                Txt_IN29.textColor = UIColor.black
                Txt_IN29.layer.borderWidth = 1.0
                Txt_IN29.layer.borderColor = CGColor.cgColor


                //=========== IN30 TextField ===========//
                scrollView.addSubview(Txt_IN30)
                Txt_IN30.translatesAutoresizingMaskIntoConstraints = false

                let leading_Txt_IN30 = NSLayoutConstraint(item: Txt_IN30,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: Lab_IN30,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 90.0)

                let top_Txt_IN30 = NSLayoutConstraint(item: Txt_IN30,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Txt_IN28,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Txt_top))

                let width_Txt_IN30 = NSLayoutConstraint(item: Txt_IN30,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 90.0)

                let hight_Txt_IN30 = NSLayoutConstraint(item: Txt_IN30,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 35.0)

                NSLayoutConstraint.activate([top_Txt_IN30 , leading_Txt_IN30 , width_Txt_IN30 , hight_Txt_IN30])

                Txt_IN30.layer.cornerRadius = 5.0
                Txt_IN30.placeholder = get_IN_Name(value: 30)//app.IN30//"IN30"
                Txt_IN30.borderStyle = .roundedRect
                Txt_IN30.returnKeyType = .done
                Txt_IN30.textColor = UIColor.black
                Txt_IN30.layer.borderWidth = 1.0
                Txt_IN30.layer.borderColor = CGColor.cgColor



            //=========== IN31 TextField ===========//
            scrollView.addSubview(Txt_IN31)
            Txt_IN31.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN31 = NSLayoutConstraint(item: Txt_IN31,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN31,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN31 = NSLayoutConstraint(item: Txt_IN31,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN29,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN31 = NSLayoutConstraint(item: Txt_IN31,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN31 = NSLayoutConstraint(item: Txt_IN31,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN31 , leading_Txt_IN31 , width_Txt_IN31 , hight_Txt_IN31])

            Txt_IN31.layer.cornerRadius = 5.0
            Txt_IN31.placeholder = get_IN_Name(value: 31)//app.IN31//"IN31"
            Txt_IN31.borderStyle = .roundedRect
            Txt_IN31.returnKeyType = .done
            Txt_IN31.textColor = UIColor.black
            Txt_IN31.layer.borderWidth = 1.0
            Txt_IN31.layer.borderColor = CGColor.cgColor


            //=========== IN32 TextField ===========//
            scrollView.addSubview(Txt_IN32)
            Txt_IN32.translatesAutoresizingMaskIntoConstraints = false

            let leading_Txt_IN32 = NSLayoutConstraint(item: Txt_IN32,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Lab_IN32,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 90.0)

            let top_Txt_IN32 = NSLayoutConstraint(item: Txt_IN32,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Txt_IN30,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: CGFloat(Txt_top))

            let width_Txt_IN32 = NSLayoutConstraint(item: Txt_IN32,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 90.0)

            let hight_Txt_IN32 = NSLayoutConstraint(item: Txt_IN32,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 35.0)

            NSLayoutConstraint.activate([top_Txt_IN32 , leading_Txt_IN32 , width_Txt_IN32 , hight_Txt_IN32])

            Txt_IN32.layer.cornerRadius = 5.0
            Txt_IN32.placeholder = get_IN_Name(value: 32)//app.IN32//"IN32"
            Txt_IN32.borderStyle = .roundedRect
            Txt_IN32.returnKeyType = .done
            Txt_IN32.textColor = UIColor.black
            Txt_IN32.layer.borderWidth = 1.0
            Txt_IN32.layer.borderColor = CGColor.cgColor

        }
        
        
        
        //=========== Lab_Output ===========//
        scrollView.addSubview(Lab_Output)
        Lab_Output.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: scrollView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: screensize.width/2-207)
        
        let top_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Lab_Input,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: (CGFloat(45.0 + (Double(Input_num) / 2 * 42.0))))
       
        let width_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 80.0)
        
        let hight_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_Output,leading_Lab_Output,width_Lab_Output,hight_Lab_Output])
        
        Lab_Output.text = "Output"
        Lab_Output.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Output.textColor = uicolor
        Lab_Output.textAlignment = NSTextAlignment.right
        
        
        
        
        //=========== Lab_Input IN1 ===========//
        scrollView.addSubview(Lab_OUT1)
        Lab_OUT1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT1 = NSLayoutConstraint(item: Lab_OUT1,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-207)
        
        let top_Lab_OUT1 = NSLayoutConstraint(item: Lab_OUT1,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Output,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 35.0)
        
        let width_Lab_OUT1 = NSLayoutConstraint(item: Lab_OUT1,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_OUT1 = NSLayoutConstraint(item: Lab_OUT1,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT1 , leading_Lab_OUT1 , width_Lab_OUT1 , hight_Lab_OUT1])
        
        Lab_OUT1.text = "OUT1"
        Lab_OUT1.textColor = uicolor
        Lab_OUT1.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Input IN2 ===========//
        scrollView.addSubview(Lab_OUT2)
        Lab_OUT2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT2 = NSLayoutConstraint(item: Lab_OUT2,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-47)
        
        let top_Lab_OUT2 = NSLayoutConstraint(item: Lab_OUT2,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Output,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 35.0)
        
        let width_Lab_OUT2 = NSLayoutConstraint(item: Lab_OUT2,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_OUT2 = NSLayoutConstraint(item: Lab_OUT2,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT2 , leading_Lab_OUT2 , width_Lab_OUT2 , hight_Lab_OUT2])
        
        Lab_OUT2.text = "OUT2"
        Lab_OUT2.textColor = uicolor
        Lab_OUT2.textAlignment = NSTextAlignment.right
        
        
        if(Output_num > 3) {
        //=========== Lab_Output OUT3 ===========//
        scrollView.addSubview(Lab_OUT3)
        Lab_OUT3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT3 = NSLayoutConstraint(item: Lab_OUT3,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-207)
        
        let top_Lab_OUT3 = NSLayoutConstraint(item: Lab_OUT3,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_OUT1,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_OUT3 = NSLayoutConstraint(item: Lab_OUT3,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_OUT3 = NSLayoutConstraint(item: Lab_OUT3,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT3 , leading_Lab_OUT3 , width_Lab_OUT3 , hight_Lab_OUT3])
        
        Lab_OUT3.text = "OUT3"
        Lab_OUT3.textColor = uicolor
        Lab_OUT3.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT4 ===========//
        scrollView.addSubview(Lab_OUT4)
        Lab_OUT4.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT4 = NSLayoutConstraint(item: Lab_OUT4,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-47)
        
        let top_Lab_OUT4 = NSLayoutConstraint(item: Lab_OUT4,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_OUT2,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Lab_top))
        
        let width_Lab_OUT4 = NSLayoutConstraint(item: Lab_OUT4,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 80.0)
        
        let hight_Lab_OUT4 = NSLayoutConstraint(item: Lab_OUT4,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT4 , leading_Lab_OUT4 , width_Lab_OUT4 , hight_Lab_OUT4])
        
        Lab_OUT4.text = "OUT4"
        Lab_OUT4.textColor = uicolor
        Lab_OUT4.textAlignment = NSTextAlignment.right
        }
        if(Output_num > 4) {
        //=========== Lab_Output OUT5 ===========//
        scrollView.addSubview(Lab_OUT5)
        Lab_OUT5.translatesAutoresizingMaskIntoConstraints = false

        let leading_Lab_OUT5 = NSLayoutConstraint(item: Lab_OUT5,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)

        let top_Lab_OUT5 = NSLayoutConstraint(item: Lab_OUT5,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT3,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))

        let width_Lab_OUT5 = NSLayoutConstraint(item: Lab_OUT5,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)

        let hight_Lab_OUT5 = NSLayoutConstraint(item: Lab_OUT5,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)

        NSLayoutConstraint.activate([top_Lab_OUT5 , leading_Lab_OUT5 , width_Lab_OUT5 , hight_Lab_OUT5])

        Lab_OUT5.text = "OUT5"
        Lab_OUT5.textColor = uicolor
        Lab_OUT5.textAlignment = NSTextAlignment.right


        //=========== Lab_Output OUT6 ===========//
        scrollView.addSubview(Lab_OUT6)
        Lab_OUT6.translatesAutoresizingMaskIntoConstraints = false

        let leading_Lab_OUT6 = NSLayoutConstraint(item: Lab_OUT6,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-47)

        let top_Lab_OUT6 = NSLayoutConstraint(item: Lab_OUT6,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT4,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))

        let width_Lab_OUT6 = NSLayoutConstraint(item: Lab_OUT6,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)

        let hight_Lab_OUT6 = NSLayoutConstraint(item: Lab_OUT6,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)

        NSLayoutConstraint.activate([top_Lab_OUT6 , leading_Lab_OUT6 , width_Lab_OUT6 , hight_Lab_OUT6])

        Lab_OUT6.text = "OUT6"
        Lab_OUT6.textColor = uicolor
        Lab_OUT6.textAlignment = NSTextAlignment.right



        //=========== Lab_Output OUT7 ===========//
        scrollView.addSubview(Lab_OUT7)
        Lab_OUT7.translatesAutoresizingMaskIntoConstraints = false

        let leading_Lab_OUT7 = NSLayoutConstraint(item: Lab_OUT7,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)

        let top_Lab_OUT7 = NSLayoutConstraint(item: Lab_OUT7,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT5,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))

        let width_Lab_OUT7 = NSLayoutConstraint(item: Lab_OUT7,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)

        let hight_Lab_OUT7 = NSLayoutConstraint(item: Lab_OUT7,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)

        NSLayoutConstraint.activate([top_Lab_OUT7 , leading_Lab_OUT7 , width_Lab_OUT7 , hight_Lab_OUT7])

        Lab_OUT7.text = "OUT7"
        Lab_OUT7.textColor = uicolor
        Lab_OUT7.textAlignment = NSTextAlignment.right


        //=========== Lab_Output OUT8 ===========//
        scrollView.addSubview(Lab_OUT8)
        Lab_OUT8.translatesAutoresizingMaskIntoConstraints = false

        let leading_Lab_OUT8 = NSLayoutConstraint(item: Lab_OUT8,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-47)

        let top_Lab_OUT8 = NSLayoutConstraint(item: Lab_OUT8,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT6,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))

        let width_Lab_OUT8 = NSLayoutConstraint(item: Lab_OUT8,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)

        let hight_Lab_OUT8 = NSLayoutConstraint(item: Lab_OUT8,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)

        NSLayoutConstraint.activate([top_Lab_OUT8 , leading_Lab_OUT8 , width_Lab_OUT8 , hight_Lab_OUT8])

        Lab_OUT8.text = "OUT8"
        Lab_OUT8.textColor = uicolor
        Lab_OUT8.textAlignment = NSTextAlignment.right
        }
        if(Output_num>8) {
        //=========== Lab_Output OUT9 ===========//
        scrollView.addSubview(Lab_OUT9)
        Lab_OUT9.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT9 = NSLayoutConstraint(item: Lab_OUT9,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)
        
        let top_Lab_OUT9 = NSLayoutConstraint(item: Lab_OUT9,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT7,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT9 = NSLayoutConstraint(item: Lab_OUT9,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT9 = NSLayoutConstraint(item: Lab_OUT9,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT9 , leading_Lab_OUT9 , width_Lab_OUT9 , hight_Lab_OUT9])
        
        Lab_OUT9.text = "OUT9"
        Lab_OUT9.textColor = uicolor
        Lab_OUT9.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT10 ===========//
        scrollView.addSubview(Lab_OUT10)
        Lab_OUT10.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT10 = NSLayoutConstraint(item: Lab_OUT10,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: scrollView,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: screensize.width/2-47)
        
        let top_Lab_OUT10 = NSLayoutConstraint(item: Lab_OUT10,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT8,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT10 = NSLayoutConstraint(item: Lab_OUT10,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT10 = NSLayoutConstraint(item: Lab_OUT10,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT10 , leading_Lab_OUT10 , width_Lab_OUT10 , hight_Lab_OUT10])
        
        Lab_OUT10.text = "OUT10"
        Lab_OUT10.textColor = uicolor
        Lab_OUT10.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT11 ===========//
        scrollView.addSubview(Lab_OUT11)
        Lab_OUT11.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT11 = NSLayoutConstraint(item: Lab_OUT11,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)
        
        let top_Lab_OUT11 = NSLayoutConstraint(item: Lab_OUT11,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT9,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT11 = NSLayoutConstraint(item: Lab_OUT11,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT11 = NSLayoutConstraint(item: Lab_OUT11,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT11 , leading_Lab_OUT11 , width_Lab_OUT11 , hight_Lab_OUT11])
        
        Lab_OUT11.text = "OUT11"
        Lab_OUT11.textColor = uicolor
        Lab_OUT11.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT12 ===========//
        scrollView.addSubview(Lab_OUT12)
        Lab_OUT12.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT12 = NSLayoutConstraint(item: Lab_OUT12,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-47)
        
        let top_Lab_OUT12 = NSLayoutConstraint(item: Lab_OUT12,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT10,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT12 = NSLayoutConstraint(item: Lab_OUT12,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT12 = NSLayoutConstraint(item: Lab_OUT12,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT12 , leading_Lab_OUT12 , width_Lab_OUT12 , hight_Lab_OUT12])
        
        Lab_OUT12.text = "OUT12"
        Lab_OUT12.textColor = uicolor
        Lab_OUT12.textAlignment = NSTextAlignment.right
        
        
        
        //=========== Lab_Output OUT13 ===========//
        scrollView.addSubview(Lab_OUT13)
        Lab_OUT13.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT13 = NSLayoutConstraint(item: Lab_OUT13,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)
        
        let top_Lab_OUT13 = NSLayoutConstraint(item: Lab_OUT13,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT11,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT13 = NSLayoutConstraint(item: Lab_OUT13,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT13 = NSLayoutConstraint(item: Lab_OUT13,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT13 , leading_Lab_OUT13 , width_Lab_OUT13 , hight_Lab_OUT13])
        
        Lab_OUT13.text = "OUT13"
        Lab_OUT13.textColor = uicolor
        Lab_OUT13.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT14 ===========//
        scrollView.addSubview(Lab_OUT14)
        Lab_OUT14.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT14 = NSLayoutConstraint(item: Lab_OUT14,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-47)
        
        let top_Lab_OUT14 = NSLayoutConstraint(item: Lab_OUT14,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT12,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT14 = NSLayoutConstraint(item: Lab_OUT14,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT14 = NSLayoutConstraint(item: Lab_OUT14,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT14 , leading_Lab_OUT14 , width_Lab_OUT14 , hight_Lab_OUT14])
        
        Lab_OUT14.text = "OUT14"
        Lab_OUT14.textColor = uicolor
        Lab_OUT14.textAlignment = NSTextAlignment.right
        
        //=========== Lab_Output OUT15 ===========//
        scrollView.addSubview(Lab_OUT15)
        Lab_OUT15.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT15 = NSLayoutConstraint(item: Lab_OUT15,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-207)
        
        let top_Lab_OUT15 = NSLayoutConstraint(item: Lab_OUT15,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_OUT13,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Lab_top))
        
        let width_Lab_OUT15 = NSLayoutConstraint(item: Lab_OUT15,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 80.0)
        
        let hight_Lab_OUT15 = NSLayoutConstraint(item: Lab_OUT15,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT15,leading_Lab_OUT15,width_Lab_OUT15,hight_Lab_OUT15])
        
        Lab_OUT15.text = "OUT15"
        Lab_OUT15.textColor = uicolor
        Lab_OUT15.textAlignment = NSTextAlignment.right
        
        
        //=========== Lab_Output OUT16 ===========//
        scrollView.addSubview(Lab_OUT16)
        Lab_OUT16.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_OUT16 = NSLayoutConstraint(item: Lab_OUT16,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: scrollView,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: screensize.width/2-47)
        
        let top_Lab_OUT16 = NSLayoutConstraint(item: Lab_OUT16,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Lab_OUT14,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: CGFloat(Lab_top))
        
        let width_Lab_OUT16 = NSLayoutConstraint(item: Lab_OUT16,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 80.0)
        
        let hight_Lab_OUT16 = NSLayoutConstraint(item: Lab_OUT16,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 40.0)
        
        NSLayoutConstraint.activate([top_Lab_OUT16 , leading_Lab_OUT16 , width_Lab_OUT16 , hight_Lab_OUT16])
        
        Lab_OUT16.text = "OUT16"
        Lab_OUT16.textColor = uicolor
        Lab_OUT16.textAlignment = NSTextAlignment.right
            
            
        }
            
            
            if(Output_num>16){
            //=========== Lab_Output OUT17 ===========//
            scrollView.addSubview(Lab_OUT17)
            Lab_OUT17.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT17 = NSLayoutConstraint(item: Lab_OUT17,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-207)
            
            let top_Lab_OUT17 = NSLayoutConstraint(item: Lab_OUT17,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT15,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT17 = NSLayoutConstraint(item: Lab_OUT17,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT17 = NSLayoutConstraint(item: Lab_OUT17,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT17,leading_Lab_OUT17,width_Lab_OUT17,hight_Lab_OUT17])
            
            Lab_OUT17.text = "OUT17"
            Lab_OUT17.textColor = uicolor
            Lab_OUT17.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Output OUT18 ===========//
            scrollView.addSubview(Lab_OUT18)
            Lab_OUT18.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT18 = NSLayoutConstraint(item: Lab_OUT18,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-47)
            
            let top_Lab_OUT18 = NSLayoutConstraint(item: Lab_OUT18,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT16,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT18 = NSLayoutConstraint(item: Lab_OUT18,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT18 = NSLayoutConstraint(item: Lab_OUT18,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT18 , leading_Lab_OUT18 , width_Lab_OUT18 , hight_Lab_OUT18])
            
            Lab_OUT18.text = "OUT18"
            Lab_OUT18.textColor = uicolor
            Lab_OUT18.textAlignment = NSTextAlignment.right
            

                //=========== Lab_Output OUT19 ===========//
                scrollView.addSubview(Lab_OUT19)
                Lab_OUT19.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_OUT19 = NSLayoutConstraint(item: Lab_OUT19,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_OUT19 = NSLayoutConstraint(item: Lab_OUT19,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT17,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_OUT19 = NSLayoutConstraint(item: Lab_OUT19,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_OUT19 = NSLayoutConstraint(item: Lab_OUT19,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_OUT19,leading_Lab_OUT19,width_Lab_OUT19,hight_Lab_OUT19])
                
                Lab_OUT19.text = "OUT19"
                Lab_OUT19.textColor = uicolor
                Lab_OUT19.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Output OUT20 ===========//
                scrollView.addSubview(Lab_OUT20)
                Lab_OUT20.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_OUT20 = NSLayoutConstraint(item: Lab_OUT20,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: scrollView,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: screensize.width/2-47)
                
                let top_Lab_OUT20 = NSLayoutConstraint(item: Lab_OUT20,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Lab_OUT18,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Lab_top))
                
                let width_Lab_OUT20 = NSLayoutConstraint(item: Lab_OUT20,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 80.0)
                
                let hight_Lab_OUT20 = NSLayoutConstraint(item: Lab_OUT20,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_OUT20 , leading_Lab_OUT20 , width_Lab_OUT20 , hight_Lab_OUT20])
                
                Lab_OUT20.text = "OUT20"
                Lab_OUT20.textColor = uicolor
                Lab_OUT20.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Input IN21 ===========//
            scrollView.addSubview(Lab_OUT21)
            Lab_OUT21.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT21 = NSLayoutConstraint(item: Lab_OUT21,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-207)
            
            let top_Lab_OUT21 = NSLayoutConstraint(item: Lab_OUT21,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT19,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT21 = NSLayoutConstraint(item: Lab_OUT21,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT21 = NSLayoutConstraint(item: Lab_OUT21,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT21 , leading_Lab_OUT21 , width_Lab_OUT21 , hight_Lab_OUT21])
            
            Lab_OUT21.text = "OUT21"
            Lab_OUT21.textColor = uicolor
            Lab_OUT21.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN2 ===========//
            scrollView.addSubview(Lab_OUT22)
            Lab_OUT22.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT22 = NSLayoutConstraint(item: Lab_OUT22,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-47)
            
            let top_Lab_OUT22 = NSLayoutConstraint(item: Lab_OUT22,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT20,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT22 = NSLayoutConstraint(item: Lab_OUT22,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT22 = NSLayoutConstraint(item: Lab_OUT22,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT22 , leading_Lab_OUT22 , width_Lab_OUT22 , hight_Lab_OUT22])
            
            Lab_OUT22.text = "OUT22"
            Lab_OUT22.textColor = uicolor
            Lab_OUT22.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Output OUT23 ===========//
            scrollView.addSubview(Lab_OUT23)
            Lab_OUT23.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT23 = NSLayoutConstraint(item: Lab_OUT23,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-207)
            
            let top_Lab_OUT23 = NSLayoutConstraint(item: Lab_OUT23,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT21,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT23 = NSLayoutConstraint(item: Lab_OUT23,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT23 = NSLayoutConstraint(item: Lab_OUT23,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT23 , leading_Lab_OUT23 , width_Lab_OUT23 , hight_Lab_OUT23])
            
            Lab_OUT23.text = "OUT23"
            Lab_OUT23.textColor = uicolor
            Lab_OUT23.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Output OUT24 ===========//
            scrollView.addSubview(Lab_OUT24)
            Lab_OUT24.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT24 = NSLayoutConstraint(item: Lab_OUT24,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-47)
            
            let top_Lab_OUT24 = NSLayoutConstraint(item: Lab_OUT24,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT22,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT24 = NSLayoutConstraint(item: Lab_OUT24,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT24 = NSLayoutConstraint(item: Lab_OUT24,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT24 , leading_Lab_OUT24 , width_Lab_OUT24 , hight_Lab_OUT24])
            
            Lab_OUT24.text = "OUT24"
            Lab_OUT24.textColor = uicolor
            Lab_OUT24.textAlignment = NSTextAlignment.right
            
            //=========== Lab_Output OUT25 ===========//
            scrollView.addSubview(Lab_OUT25)
            Lab_OUT25.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT25 = NSLayoutConstraint(item: Lab_OUT25,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-207)
            
            let top_Lab_OUT25 = NSLayoutConstraint(item: Lab_OUT25,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT23,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT25 = NSLayoutConstraint(item: Lab_OUT25,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT25 = NSLayoutConstraint(item: Lab_OUT25,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT25 , leading_Lab_OUT25 , width_Lab_OUT25 , hight_Lab_OUT25])
            
            Lab_OUT25.text = "OUT25"
            Lab_OUT25.textColor = uicolor
            Lab_OUT25.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Output OUT26 ===========//
            scrollView.addSubview(Lab_OUT26)
            Lab_OUT26.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT26 = NSLayoutConstraint(item: Lab_OUT26,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-47)
            
            let top_Lab_OUT26 = NSLayoutConstraint(item: Lab_OUT26,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT24,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT26 = NSLayoutConstraint(item: Lab_OUT26,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT26 = NSLayoutConstraint(item: Lab_OUT26,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT26 , leading_Lab_OUT26 , width_Lab_OUT26 , hight_Lab_OUT26])
            
            Lab_OUT26.text = "OUT26"
            Lab_OUT26.textColor = uicolor
            Lab_OUT26.textAlignment = NSTextAlignment.right
            
            
            
            //=========== Lab_Output OUT27 ===========//
            scrollView.addSubview(Lab_OUT27)
            Lab_OUT27.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT27 = NSLayoutConstraint(item: Lab_OUT27,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-207)
            
            let top_Lab_OUT27 = NSLayoutConstraint(item: Lab_OUT27,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT25,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT27 = NSLayoutConstraint(item: Lab_OUT27,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT27 = NSLayoutConstraint(item: Lab_OUT27,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT27 , leading_Lab_OUT27 , width_Lab_OUT27 , hight_Lab_OUT27])
            
            Lab_OUT27.text = "OUT27"
            Lab_OUT27.textColor = uicolor
            Lab_OUT27.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Output OUT8 ===========//
            scrollView.addSubview(Lab_OUT28)
            Lab_OUT28.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT28 = NSLayoutConstraint(item: Lab_OUT28,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: scrollView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: screensize.width/2-47)
            
            let top_Lab_OUT28 = NSLayoutConstraint(item: Lab_OUT28,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT26,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Lab_top))
            
            let width_Lab_OUT28 = NSLayoutConstraint(item: Lab_OUT28,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 80.0)
            
            let hight_Lab_OUT28 = NSLayoutConstraint(item: Lab_OUT28,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT28 , leading_Lab_OUT28 , width_Lab_OUT28 , hight_Lab_OUT28])
            
            Lab_OUT28.text = "OUT28"
            Lab_OUT28.textColor = uicolor
            Lab_OUT28.textAlignment = NSTextAlignment.right
            
                //=========== Lab_Output OUT29 ===========//
                scrollView.addSubview(Lab_OUT29)
                Lab_OUT29.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_OUT29 = NSLayoutConstraint(item: Lab_OUT29,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: screensize.width/2-207)
                
                let top_Lab_OUT29 = NSLayoutConstraint(item: Lab_OUT29,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT27,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Lab_top))
                
                let width_Lab_OUT29 = NSLayoutConstraint(item: Lab_OUT29,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 80.0)
                
                let hight_Lab_OUT29 = NSLayoutConstraint(item: Lab_OUT29,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_OUT29 , leading_Lab_OUT29 , width_Lab_OUT29 , hight_Lab_OUT29])
                
                Lab_OUT29.text = "OUT29"
                Lab_OUT29.textColor = uicolor
                Lab_OUT29.textAlignment = NSTextAlignment.right
                
                
                //=========== Lab_Output OUT10 ===========//
                scrollView.addSubview(Lab_OUT30)
                Lab_OUT30.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Lab_OUT30 = NSLayoutConstraint(item: Lab_OUT30,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: scrollView,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: screensize.width/2-47)
                
                let top_Lab_OUT30 = NSLayoutConstraint(item: Lab_OUT30,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Lab_OUT28,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Lab_top))
                
                let width_Lab_OUT30 = NSLayoutConstraint(item: Lab_OUT30,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 80.0)
                
                let hight_Lab_OUT30 = NSLayoutConstraint(item: Lab_OUT30,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 40.0)
                
                NSLayoutConstraint.activate([top_Lab_OUT30 , leading_Lab_OUT30 , width_Lab_OUT30 , hight_Lab_OUT30])
                
                Lab_OUT30.text = "OUT30"
                Lab_OUT30.textColor = uicolor
                Lab_OUT30.textAlignment = NSTextAlignment.right
            
            //=========== Lab_Input IN31 ===========//
            scrollView.addSubview(Lab_OUT31)
            Lab_OUT31.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT31 = NSLayoutConstraint(item: Lab_OUT31,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: scrollView,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: screensize.width/2-207)
            
            let top_Lab_OUT31 = NSLayoutConstraint(item: Lab_OUT31,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: Lab_OUT29,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: CGFloat(Lab_top))
            
            let width_Lab_OUT31 = NSLayoutConstraint(item: Lab_OUT31,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 80.0)
            
            let hight_Lab_OUT31 = NSLayoutConstraint(item: Lab_OUT31,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT31 , leading_Lab_OUT31 , width_Lab_OUT31 , hight_Lab_OUT31])
            
            Lab_OUT31.text = "OUT31"
            Lab_OUT31.textColor = uicolor
            Lab_OUT31.textAlignment = NSTextAlignment.right
            
            
            //=========== Lab_Input IN2 ===========//
            scrollView.addSubview(Lab_OUT32)
            Lab_OUT32.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Lab_OUT32 = NSLayoutConstraint(item: Lab_OUT32,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: scrollView,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: screensize.width/2-47)
            
            let top_Lab_OUT32 = NSLayoutConstraint(item: Lab_OUT32,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: Lab_OUT30,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: CGFloat(Lab_top))
            
            let width_Lab_OUT32 = NSLayoutConstraint(item: Lab_OUT32,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 80.0)
            
            let hight_Lab_OUT32 = NSLayoutConstraint(item: Lab_OUT32,
                                                     attribute: .height,
                                                     relatedBy: .equal,
                                                     toItem: nil,
                                                     attribute: .notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: 40.0)
            
            NSLayoutConstraint.activate([top_Lab_OUT32 , leading_Lab_OUT32 , width_Lab_OUT32 , hight_Lab_OUT32])
            
            Lab_OUT32.text = "OUT32"
            Lab_OUT32.textColor = uicolor
            Lab_OUT32.textAlignment = NSTextAlignment.right
        }
        
        //=========== OUT1 TextField ===========//
        scrollView.addSubview(Txt_OUT1)
        Txt_OUT1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT1 = NSLayoutConstraint(item: Txt_OUT1,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_OUT1,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_OUT1 = NSLayoutConstraint(item: Txt_OUT1,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Output,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 35.0)
        
        let width_Txt_OUT1 = NSLayoutConstraint(item: Txt_OUT1,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_OUT1 = NSLayoutConstraint(item: Txt_OUT1,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT1 , leading_Txt_OUT1 , width_Txt_OUT1 , hight_Txt_OUT1])
        
        Txt_OUT1.layer.cornerRadius = 5.0
        Txt_OUT1.placeholder = get_OUT_Name(value: 1)//app.OUT1//"OUT1"
        Txt_OUT1.borderStyle = .roundedRect
        Txt_OUT1.returnKeyType = .done
        Txt_OUT1.textColor = UIColor.black
        Txt_OUT1.layer.borderWidth = 1.0
        Txt_OUT1.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT2 TextField ===========//
        scrollView.addSubview(Txt_OUT2)
        Txt_OUT2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT2 = NSLayoutConstraint(item: Txt_OUT2,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_OUT2,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_OUT2 = NSLayoutConstraint(item: Txt_OUT2,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Lab_Output,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: 35.0)
        
        let width_Txt_OUT2 = NSLayoutConstraint(item: Txt_OUT2,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_OUT2 = NSLayoutConstraint(item: Txt_OUT2,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT2 , leading_Txt_OUT2 , width_Txt_OUT2 , hight_Txt_OUT2])
        
        Txt_OUT2.layer.cornerRadius = 5.0
        Txt_OUT2.placeholder = get_OUT_Name(value: 2)//app.OUT2//"OUT2"
        Txt_OUT2.borderStyle = .roundedRect
        Txt_OUT2.returnKeyType = .done
        Txt_OUT2.textColor = UIColor.black
        Txt_OUT2.layer.borderWidth = 1.0
        Txt_OUT2.layer.borderColor = CGColor.cgColor
        
        if(Output_num > 3) {
        //=========== OUT3 TextField ===========//
        scrollView.addSubview(Txt_OUT3)
        Txt_OUT3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT3 = NSLayoutConstraint(item: Txt_OUT3,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_OUT3,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_OUT3 = NSLayoutConstraint(item: Txt_OUT3,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_OUT1,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_OUT3 = NSLayoutConstraint(item: Txt_OUT3,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_OUT3 = NSLayoutConstraint(item: Txt_OUT3,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT3 , leading_Txt_OUT3 , width_Txt_OUT3 , hight_Txt_OUT3])
        
        Txt_OUT3.layer.cornerRadius = 5.0
        Txt_OUT3.placeholder = get_OUT_Name(value: 3)//app.OUT3//"OUT3"
        Txt_OUT3.borderStyle = .roundedRect
        Txt_OUT3.returnKeyType = .done
        Txt_OUT3.textColor = UIColor.black
        Txt_OUT3.layer.borderWidth = 1.0
        Txt_OUT3.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT4 TextField ===========//
        scrollView.addSubview(Txt_OUT4)
        Txt_OUT4.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT4 = NSLayoutConstraint(item: Txt_OUT4,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Lab_OUT4,
                                                 attribute: .leading,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let top_Txt_OUT4 = NSLayoutConstraint(item: Txt_OUT4,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: Txt_OUT2,
                                             attribute: .top,
                                             multiplier: 1.0,
                                             constant: CGFloat(Txt_top))
        
        let width_Txt_OUT4 = NSLayoutConstraint(item: Txt_OUT4,
                                               attribute: .width,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 90.0)
        
        let hight_Txt_OUT4 = NSLayoutConstraint(item: Txt_OUT4,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT4 , leading_Txt_OUT4 , width_Txt_OUT4 , hight_Txt_OUT4])
        
        Txt_OUT4.layer.cornerRadius = 5.0
        Txt_OUT4.placeholder = get_OUT_Name(value: 4)//app.OUT4//"OUT4"
        Txt_OUT4.borderStyle = .roundedRect
        Txt_OUT4.returnKeyType = .done
        Txt_OUT4.textColor = UIColor.black
        Txt_OUT4.layer.borderWidth = 1.0
        Txt_OUT4.layer.borderColor = CGColor.cgColor
        }

        if(Output_num > 4) {
        //=========== OUT5 TextField ===========//
        scrollView.addSubview(Txt_OUT5)
        Txt_OUT5.translatesAutoresizingMaskIntoConstraints = false

        let leading_Txt_OUT5 = NSLayoutConstraint(item: Txt_OUT5,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT5,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)

        let top_Txt_OUT5 = NSLayoutConstraint(item: Txt_OUT5,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT3,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))

        let width_Txt_OUT5 = NSLayoutConstraint(item: Txt_OUT5,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)

        let hight_Txt_OUT5 = NSLayoutConstraint(item: Txt_OUT5,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)

        NSLayoutConstraint.activate([top_Txt_OUT5 , leading_Txt_OUT5 , width_Txt_OUT5 , hight_Txt_OUT5])

        Txt_OUT5.layer.cornerRadius = 5.0
        Txt_OUT5.placeholder = get_OUT_Name(value: 5)//app.OUT5//"OUT5"
        Txt_OUT5.borderStyle = .roundedRect
        Txt_OUT5.returnKeyType = .done
        Txt_OUT5.textColor = UIColor.black
        Txt_OUT5.layer.borderWidth = 1.0
        Txt_OUT5.layer.borderColor = CGColor.cgColor


        //=========== OUT6 TextField ===========//
        scrollView.addSubview(Txt_OUT6)
        Txt_OUT6.translatesAutoresizingMaskIntoConstraints = false

        let leading_Txt_OUT6 = NSLayoutConstraint(item: Txt_OUT6,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT6,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)

        let top_Txt_OUT6 = NSLayoutConstraint(item: Txt_OUT6,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT4,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))

        let width_Txt_OUT6 = NSLayoutConstraint(item: Txt_OUT6,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)

        let hight_Txt_OUT6 = NSLayoutConstraint(item: Txt_OUT6,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)

        NSLayoutConstraint.activate([top_Txt_OUT6 , leading_Txt_OUT6 , width_Txt_OUT6 , hight_Txt_OUT6])

        Txt_OUT6.layer.cornerRadius = 5.0
        Txt_OUT6.placeholder = get_OUT_Name(value: 6)//app.OUT6//"OUT6"
        Txt_OUT6.borderStyle = .roundedRect
        Txt_OUT6.returnKeyType = .done
        Txt_OUT6.textColor = UIColor.black
        Txt_OUT6.layer.borderWidth = 1.0
        Txt_OUT6.layer.borderColor = CGColor.cgColor


        //=========== OUT7 TextField ===========//
        scrollView.addSubview(Txt_OUT7)
        Txt_OUT7.translatesAutoresizingMaskIntoConstraints = false

        let leading_Txt_OUT7 = NSLayoutConstraint(item: Txt_OUT7,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT7,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)

        let top_Txt_OUT7 = NSLayoutConstraint(item: Txt_OUT7,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT5,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))

        let width_Txt_OUT7 = NSLayoutConstraint(item: Txt_OUT7,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)

        let hight_Txt_OUT7 = NSLayoutConstraint(item: Txt_OUT7,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)

        NSLayoutConstraint.activate([top_Txt_OUT7 , leading_Txt_OUT7 , width_Txt_OUT7 , hight_Txt_OUT7])

        Txt_OUT7.layer.cornerRadius = 5.0
        Txt_OUT7.placeholder = get_OUT_Name(value: 7)//app.OUT7//"OUT7"
        Txt_OUT7.borderStyle = .roundedRect
        Txt_OUT7.returnKeyType = .done
        Txt_OUT7.textColor = UIColor.black
        Txt_OUT7.layer.borderWidth = 1.0
        Txt_OUT7.layer.borderColor = CGColor.cgColor


        //=========== OUT8 TextField ===========//
        scrollView.addSubview(Txt_OUT8)
        Txt_OUT8.translatesAutoresizingMaskIntoConstraints = false

        let leading_Txt_OUT8 = NSLayoutConstraint(item: Txt_OUT8,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT8,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)

        let top_Txt_OUT8 = NSLayoutConstraint(item: Txt_OUT8,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT6,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))

        let width_Txt_OUT8 = NSLayoutConstraint(item: Txt_OUT8,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)

        let hight_Txt_OUT8 = NSLayoutConstraint(item: Txt_OUT8,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)

        NSLayoutConstraint.activate([top_Txt_OUT8 , leading_Txt_OUT8 , width_Txt_OUT8 , hight_Txt_OUT8])

        Txt_OUT8.layer.cornerRadius = 5.0
        Txt_OUT8.placeholder = get_OUT_Name(value: 8)//app.OUT8//"OUT8"
        Txt_OUT8.borderStyle = .roundedRect
        Txt_OUT8.returnKeyType = .done
        Txt_OUT8.textColor = UIColor.black
        Txt_OUT8.layer.borderWidth = 1.0
        Txt_OUT8.layer.borderColor = CGColor.cgColor

        }
        if(Output_num>8) {
        //=========== OUT9 TextField ===========//
        scrollView.addSubview(Txt_OUT9)
        Txt_OUT9.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT9 = NSLayoutConstraint(item: Txt_OUT9,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT9,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT9 = NSLayoutConstraint(item: Txt_OUT9,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT7,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT9 = NSLayoutConstraint(item: Txt_OUT9,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT9 = NSLayoutConstraint(item: Txt_OUT9,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT9 , leading_Txt_OUT9 , width_Txt_OUT9 , hight_Txt_OUT9])
        
        Txt_OUT9.layer.cornerRadius = 5.0
        Txt_OUT9.placeholder = get_OUT_Name(value: 9)//app.OUT9//"OUT9"
        Txt_OUT9.borderStyle = .roundedRect
        Txt_OUT9.returnKeyType = .done
        Txt_OUT9.textColor = UIColor.black
        Txt_OUT9.layer.borderWidth = 1.0
        Txt_OUT9.layer.borderColor = CGColor.cgColor
        
        //=========== OUT10 TextField ===========//
        scrollView.addSubview(Txt_OUT10)
        Txt_OUT10.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT10 = NSLayoutConstraint(item: Txt_OUT10,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: Lab_OUT10,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
        
        let top_Txt_OUT10 = NSLayoutConstraint(item: Txt_OUT10,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Txt_OUT8,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: CGFloat(Txt_top))
        
        let width_Txt_OUT10 = NSLayoutConstraint(item: Txt_OUT10,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let hight_Txt_OUT10 = NSLayoutConstraint(item: Txt_OUT10,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT10 , leading_Txt_OUT10 , width_Txt_OUT10 , hight_Txt_OUT10])
        
        Txt_OUT10.layer.cornerRadius = 5.0
        Txt_OUT10.placeholder = get_OUT_Name(value: 10)//app.OUT10//"OUT10"
        Txt_OUT10.borderStyle = .roundedRect
        Txt_OUT10.returnKeyType = .done
        Txt_OUT10.textColor = UIColor.black
        Txt_OUT10.layer.borderWidth = 1.0
        Txt_OUT10.layer.borderColor = CGColor.cgColor
        
        //=========== OUT11 TextField ===========//
        scrollView.addSubview(Txt_OUT11)
        Txt_OUT11.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT11 = NSLayoutConstraint(item: Txt_OUT11,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: Lab_OUT11,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 90.0)
        
        let top_Txt_OUT11 = NSLayoutConstraint(item: Txt_OUT11,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Txt_OUT9,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: CGFloat(Txt_top))
        
        let width_Txt_OUT11 = NSLayoutConstraint(item: Txt_OUT11,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 90.0)
        
        let hight_Txt_OUT11 = NSLayoutConstraint(item: Txt_OUT11,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT11 , leading_Txt_OUT11 , width_Txt_OUT11 , hight_Txt_OUT11])
        
        Txt_OUT11.layer.cornerRadius = 5.0
        Txt_OUT11.placeholder = get_OUT_Name(value: 11)//app.OUT11//"OUT11"
        Txt_OUT11.borderStyle = .roundedRect
        Txt_OUT11.returnKeyType = .done
        Txt_OUT11.textColor = UIColor.black
        Txt_OUT11.layer.borderWidth = 1.0
        Txt_OUT11.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT12 TextField ===========//
        scrollView.addSubview(Txt_OUT12)
        Txt_OUT12.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT12 = NSLayoutConstraint(item: Txt_OUT12,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT12,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT12 = NSLayoutConstraint(item: Txt_OUT12,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT10,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT12 = NSLayoutConstraint(item: Txt_OUT12,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT12 = NSLayoutConstraint(item: Txt_OUT12,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT12 , leading_Txt_OUT12 , width_Txt_OUT12 , hight_Txt_OUT12])
        
        Txt_OUT12.layer.cornerRadius = 5.0
        Txt_OUT12.placeholder = get_OUT_Name(value: 12)//app.OUT12//"OUT12"
        Txt_OUT12.borderStyle = .roundedRect
        Txt_OUT12.returnKeyType = .done
        Txt_OUT12.textColor = UIColor.black
        Txt_OUT12.layer.borderWidth = 1.0
        Txt_OUT12.layer.borderColor = CGColor.cgColor
        
        
        
        //=========== OUT13 TextField ===========//
        scrollView.addSubview(Txt_OUT13)
        Txt_OUT13.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT13 = NSLayoutConstraint(item: Txt_OUT13,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT13,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT13 = NSLayoutConstraint(item: Txt_OUT13,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT11,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT13 = NSLayoutConstraint(item: Txt_OUT13,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT13 = NSLayoutConstraint(item: Txt_OUT13,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT13 , leading_Txt_OUT13 , width_Txt_OUT13 , hight_Txt_OUT13])
        
        Txt_OUT13.layer.cornerRadius = 5.0
        Txt_OUT13.placeholder = get_OUT_Name(value: 13)//app.OUT13//"OUT13"
        Txt_OUT13.borderStyle = .roundedRect
        Txt_OUT13.returnKeyType = .done
        Txt_OUT13.textColor = UIColor.black
        Txt_OUT13.layer.borderWidth = 1.0
        Txt_OUT13.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT6 TextField ===========//
        scrollView.addSubview(Txt_OUT14)
        Txt_OUT14.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT14 = NSLayoutConstraint(item: Txt_OUT14,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT14,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT14 = NSLayoutConstraint(item: Txt_OUT14,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT12,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT14 = NSLayoutConstraint(item: Txt_OUT14,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT14 = NSLayoutConstraint(item: Txt_OUT14,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT14 , leading_Txt_OUT14 , width_Txt_OUT14 , hight_Txt_OUT14])
        
        Txt_OUT14.layer.cornerRadius = 5.0
        Txt_OUT14.placeholder = get_OUT_Name(value: 14)//app.OUT14//"OUT14"
        Txt_OUT14.borderStyle = .roundedRect
        Txt_OUT14.returnKeyType = .done
        Txt_OUT14.textColor = UIColor.black
        Txt_OUT14.layer.borderWidth = 1.0
        Txt_OUT14.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT15 TextField ===========//
        scrollView.addSubview(Txt_OUT15)
        Txt_OUT15.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT15 = NSLayoutConstraint(item: Txt_OUT15,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT15,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT15 = NSLayoutConstraint(item: Txt_OUT15,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT13,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT15 = NSLayoutConstraint(item: Txt_OUT15,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT15 = NSLayoutConstraint(item: Txt_OUT15,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT15 , leading_Txt_OUT15 , width_Txt_OUT15 , hight_Txt_OUT15])
        
        Txt_OUT15.layer.cornerRadius = 5.0
        Txt_OUT15.placeholder = get_OUT_Name(value: 15)//app.OUT15//"OUT15"
        Txt_OUT15.borderStyle = .roundedRect
        Txt_OUT15.returnKeyType = .done
        Txt_OUT15.textColor = UIColor.black
        Txt_OUT15.layer.borderWidth = 1.0
        Txt_OUT15.layer.borderColor = CGColor.cgColor
        
        
        //=========== OUT16 TextField ===========//
        scrollView.addSubview(Txt_OUT16)
        Txt_OUT16.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Txt_OUT16 = NSLayoutConstraint(item: Txt_OUT16,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: Lab_OUT16,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let top_Txt_OUT16 = NSLayoutConstraint(item: Txt_OUT16,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Txt_OUT14,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: CGFloat(Txt_top))
        
        let width_Txt_OUT16 = NSLayoutConstraint(item: Txt_OUT16,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 90.0)
        
        let hight_Txt_OUT16 = NSLayoutConstraint(item: Txt_OUT16,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 35.0)
        
        NSLayoutConstraint.activate([top_Txt_OUT16 , leading_Txt_OUT16 , width_Txt_OUT16 , hight_Txt_OUT16])
        
        Txt_OUT16.layer.cornerRadius = 5.0
        Txt_OUT16.placeholder = get_OUT_Name(value: 16)//app.OUT16//"OUT16"
        Txt_OUT16.borderStyle = .roundedRect
        Txt_OUT16.returnKeyType = .done
        Txt_OUT16.textColor = UIColor.black
        Txt_OUT16.layer.borderWidth = 1.0
        Txt_OUT16.layer.borderColor = CGColor.cgColor
        }
        
        if(Output_num>16){
            //=========== OUT7 TextField ===========//
            scrollView.addSubview(Txt_OUT17)
            Txt_OUT17.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT17 = NSLayoutConstraint(item: Txt_OUT17,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT17,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT17 = NSLayoutConstraint(item: Txt_OUT17,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT15,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT17 = NSLayoutConstraint(item: Txt_OUT17,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT17 = NSLayoutConstraint(item: Txt_OUT17,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT17 , leading_Txt_OUT17 , width_Txt_OUT17 , hight_Txt_OUT17])
            
            Txt_OUT17.layer.cornerRadius = 5.0
            Txt_OUT17.placeholder = get_OUT_Name(value: 17)//app.OUT17//"OUT17"
            Txt_OUT17.borderStyle = .roundedRect
            Txt_OUT17.returnKeyType = .done
            Txt_OUT17.textColor = UIColor.black
            Txt_OUT17.layer.borderWidth = 1.0
            Txt_OUT17.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT8 TextField ===========//
            scrollView.addSubview(Txt_OUT18)
            Txt_OUT18.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT18 = NSLayoutConstraint(item: Txt_OUT18,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT18,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT18 = NSLayoutConstraint(item: Txt_OUT18,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT16,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT18 = NSLayoutConstraint(item: Txt_OUT18,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT18 = NSLayoutConstraint(item: Txt_OUT18,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT18 , leading_Txt_OUT18 , width_Txt_OUT18 , hight_Txt_OUT18])
            
            Txt_OUT18.layer.cornerRadius = 5.0
            Txt_OUT18.placeholder = get_OUT_Name(value: 18)//app.OUT18//"OUT18"
            Txt_OUT18.borderStyle = .roundedRect
            Txt_OUT18.returnKeyType = .done
            Txt_OUT18.textColor = UIColor.black
            Txt_OUT18.layer.borderWidth = 1.0
            Txt_OUT18.layer.borderColor = CGColor.cgColor
            

                //=========== OUT19 TextField ===========//
                scrollView.addSubview(Txt_OUT19)
                Txt_OUT19.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT19 = NSLayoutConstraint(item: Txt_OUT19,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: Lab_OUT19,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 90.0)
                
                let top_Txt_OUT19 = NSLayoutConstraint(item: Txt_OUT19,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Txt_OUT17,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Txt_top))
                
                let width_Txt_OUT19 = NSLayoutConstraint(item: Txt_OUT19,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 90.0)
                
                let hight_Txt_OUT19 = NSLayoutConstraint(item: Txt_OUT19,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT19 , leading_Txt_OUT19 , width_Txt_OUT19 , hight_Txt_OUT19])
                
                Txt_OUT19.layer.cornerRadius = 5.0
                Txt_OUT19.placeholder = get_OUT_Name(value: 19)//app.OUT19//"OUT19"
                Txt_OUT19.borderStyle = .roundedRect
                Txt_OUT19.returnKeyType = .done
                Txt_OUT19.textColor = UIColor.black
                Txt_OUT19.layer.borderWidth = 1.0
                Txt_OUT19.layer.borderColor = CGColor.cgColor
                
                //=========== OUT20 TextField ===========//
                scrollView.addSubview(Txt_OUT20)
                Txt_OUT20.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT20 = NSLayoutConstraint(item: Txt_OUT20,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: Lab_OUT20,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 90.0)
                
                let top_Txt_OUT20 = NSLayoutConstraint(item: Txt_OUT20,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Txt_OUT18,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Txt_top))
                
                let width_Txt_OUT20 = NSLayoutConstraint(item: Txt_OUT20,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 90.0)
                
                let hight_Txt_OUT20 = NSLayoutConstraint(item: Txt_OUT20,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT20 , leading_Txt_OUT20 , width_Txt_OUT20 , hight_Txt_OUT20])
                
                Txt_OUT20.layer.cornerRadius = 5.0
                Txt_OUT20.placeholder = get_OUT_Name(value: 20)//app.OUT20//"OUT20"
                Txt_OUT20.borderStyle = .roundedRect
                Txt_OUT20.returnKeyType = .done
                Txt_OUT20.textColor = UIColor.black
                Txt_OUT20.layer.borderWidth = 1.0
                Txt_OUT20.layer.borderColor = CGColor.cgColor
            
            
            
            
            //=========== OUT21 TextField ===========//
            scrollView.addSubview(Txt_OUT21)
            Txt_OUT21.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT21 = NSLayoutConstraint(item: Txt_OUT21,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT21,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT21 = NSLayoutConstraint(item: Txt_OUT21,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT19,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT21 = NSLayoutConstraint(item: Txt_OUT21,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT21 = NSLayoutConstraint(item: Txt_OUT21,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT21 , leading_Txt_OUT21 , width_Txt_OUT21 , hight_Txt_OUT21])
            
            Txt_OUT21.layer.cornerRadius = 5.0
            Txt_OUT21.placeholder = get_OUT_Name(value: 21)//app.OUT21//"OUT21"
            Txt_OUT21.borderStyle = .roundedRect
            Txt_OUT21.returnKeyType = .done
            Txt_OUT21.textColor = UIColor.black
            Txt_OUT21.layer.borderWidth = 1.0
            Txt_OUT21.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT22 TextField ===========//
            scrollView.addSubview(Txt_OUT22)
            Txt_OUT22.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT22 = NSLayoutConstraint(item: Txt_OUT22,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT22,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT22 = NSLayoutConstraint(item: Txt_OUT22,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT20,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT22 = NSLayoutConstraint(item: Txt_OUT22,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT22 = NSLayoutConstraint(item: Txt_OUT22,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT22 , leading_Txt_OUT22 , width_Txt_OUT22 , hight_Txt_OUT22])
            
            Txt_OUT22.layer.cornerRadius = 5.0
            Txt_OUT22.placeholder = get_OUT_Name(value: 22)//app.OUT22//"OUT22"
            Txt_OUT22.borderStyle = .roundedRect
            Txt_OUT22.returnKeyType = .done
            Txt_OUT22.textColor = UIColor.black
            Txt_OUT22.layer.borderWidth = 1.0
            Txt_OUT22.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT23 TextField ===========//
            scrollView.addSubview(Txt_OUT23)
            Txt_OUT23.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT23 = NSLayoutConstraint(item: Txt_OUT23,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT23,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT23 = NSLayoutConstraint(item: Txt_OUT23,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT21,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT23 = NSLayoutConstraint(item: Txt_OUT23,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT23 = NSLayoutConstraint(item: Txt_OUT23,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT23 , leading_Txt_OUT23 , width_Txt_OUT23 , hight_Txt_OUT23])
            
            Txt_OUT23.layer.cornerRadius = 5.0
            Txt_OUT23.placeholder = get_OUT_Name(value: 23)//app.OUT23//"OUT23"
            Txt_OUT23.borderStyle = .roundedRect
            Txt_OUT23.returnKeyType = .done
            Txt_OUT23.textColor = UIColor.black
            Txt_OUT23.layer.borderWidth = 1.0
            Txt_OUT23.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT24 TextField ===========//
            scrollView.addSubview(Txt_OUT24)
            Txt_OUT24.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT24 = NSLayoutConstraint(item: Txt_OUT24,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT24,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT24 = NSLayoutConstraint(item: Txt_OUT24,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT22,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT24 = NSLayoutConstraint(item: Txt_OUT24,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT24 = NSLayoutConstraint(item: Txt_OUT24,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT24 , leading_Txt_OUT24 , width_Txt_OUT24 , hight_Txt_OUT24])
            
            Txt_OUT24.layer.cornerRadius = 5.0
            Txt_OUT24.placeholder = get_OUT_Name(value: 24)//app.OUT24//"OUT24"
            Txt_OUT24.borderStyle = .roundedRect
            Txt_OUT24.returnKeyType = .done
            Txt_OUT24.textColor = UIColor.black
            Txt_OUT24.layer.borderWidth = 1.0
            Txt_OUT24.layer.borderColor = CGColor.cgColor
            
            
            
            //=========== OUT5 TextField ===========//
            scrollView.addSubview(Txt_OUT25)
            Txt_OUT25.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT25 = NSLayoutConstraint(item: Txt_OUT25,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT25,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT25 = NSLayoutConstraint(item: Txt_OUT25,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT23,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT25 = NSLayoutConstraint(item: Txt_OUT25,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT25 = NSLayoutConstraint(item: Txt_OUT25,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT25 , leading_Txt_OUT25 , width_Txt_OUT25 , hight_Txt_OUT25])
            
            Txt_OUT25.layer.cornerRadius = 5.0
            Txt_OUT25.placeholder = get_OUT_Name(value: 25)//app.OUT25//"OUT25"
            Txt_OUT25.borderStyle = .roundedRect
            Txt_OUT25.returnKeyType = .done
            Txt_OUT25.textColor = UIColor.black
            Txt_OUT25.layer.borderWidth = 1.0
            Txt_OUT25.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT26 TextField ===========//
            scrollView.addSubview(Txt_OUT26)
            Txt_OUT26.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT26 = NSLayoutConstraint(item: Txt_OUT26,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT26,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT26 = NSLayoutConstraint(item: Txt_OUT26,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT24,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT26 = NSLayoutConstraint(item: Txt_OUT26,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT26 = NSLayoutConstraint(item: Txt_OUT26,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT26 , leading_Txt_OUT26 , width_Txt_OUT26 , hight_Txt_OUT26])
            
            Txt_OUT26.layer.cornerRadius = 5.0
            Txt_OUT26.placeholder = get_OUT_Name(value: 26)//app.OUT26//"OUT26"
            Txt_OUT26.borderStyle = .roundedRect
            Txt_OUT26.returnKeyType = .done
            Txt_OUT26.textColor = UIColor.black
            Txt_OUT26.layer.borderWidth = 1.0
            Txt_OUT26.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT27 TextField ===========//
            scrollView.addSubview(Txt_OUT27)
            Txt_OUT27.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT27 = NSLayoutConstraint(item: Txt_OUT27,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT27,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT27 = NSLayoutConstraint(item: Txt_OUT27,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT25,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT27 = NSLayoutConstraint(item: Txt_OUT27,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT27 = NSLayoutConstraint(item: Txt_OUT27,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT27 , leading_Txt_OUT27 , width_Txt_OUT27 , hight_Txt_OUT27])
            
            Txt_OUT27.layer.cornerRadius = 5.0
            Txt_OUT27.placeholder = get_OUT_Name(value: 27)//app.OUT27//"OUT27"
            Txt_OUT27.borderStyle = .roundedRect
            Txt_OUT27.returnKeyType = .done
            Txt_OUT27.textColor = UIColor.black
            Txt_OUT27.layer.borderWidth = 1.0
            Txt_OUT27.layer.borderColor = CGColor.cgColor
            
            
            //=========== OUT8 TextField ===========//
            scrollView.addSubview(Txt_OUT28)
            Txt_OUT28.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Txt_OUT28 = NSLayoutConstraint(item: Txt_OUT28,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: Lab_OUT28,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 90.0)
            
            let top_Txt_OUT28 = NSLayoutConstraint(item: Txt_OUT28,
                                                  attribute: .top,
                                                  relatedBy: .equal,
                                                  toItem: Txt_OUT26,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(Txt_top))
            
            let width_Txt_OUT28 = NSLayoutConstraint(item: Txt_OUT28,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 90.0)
            
            let hight_Txt_OUT28 = NSLayoutConstraint(item: Txt_OUT28,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: 35.0)
            
            NSLayoutConstraint.activate([top_Txt_OUT28 , leading_Txt_OUT28 , width_Txt_OUT28 , hight_Txt_OUT28])
            
            Txt_OUT28.layer.cornerRadius = 5.0
            Txt_OUT28.placeholder = get_OUT_Name(value: 28)//app.OUT28//"OUT28"
            Txt_OUT28.borderStyle = .roundedRect
            Txt_OUT28.returnKeyType = .done
            Txt_OUT28.textColor = UIColor.black
            Txt_OUT28.layer.borderWidth = 1.0
            Txt_OUT28.layer.borderColor = CGColor.cgColor
            
            

                //=========== OUT29 TextField ===========//
                scrollView.addSubview(Txt_OUT29)
                Txt_OUT29.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT29 = NSLayoutConstraint(item: Txt_OUT29,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: Lab_OUT29,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 90.0)
                
                let top_Txt_OUT29 = NSLayoutConstraint(item: Txt_OUT29,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Txt_OUT27,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(Txt_top))
                
                let width_Txt_OUT29 = NSLayoutConstraint(item: Txt_OUT29,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 90.0)
                
                let hight_Txt_OUT29 = NSLayoutConstraint(item: Txt_OUT29,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT29 , leading_Txt_OUT29 , width_Txt_OUT29 , hight_Txt_OUT29])
                
                Txt_OUT29.layer.cornerRadius = 5.0
                Txt_OUT29.placeholder = get_OUT_Name(value: 29)//app.OUT29//"OUT29"
                Txt_OUT29.borderStyle = .roundedRect
                Txt_OUT29.returnKeyType = .done
                Txt_OUT29.textColor = UIColor.black
                Txt_OUT29.layer.borderWidth = 1.0
                Txt_OUT29.layer.borderColor = CGColor.cgColor
                
                //=========== OUT10 TextField ===========//
                scrollView.addSubview(Txt_OUT30)
                Txt_OUT30.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT30 = NSLayoutConstraint(item: Txt_OUT30,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: Lab_OUT30,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 90.0)
                
                let top_Txt_OUT30 = NSLayoutConstraint(item: Txt_OUT30,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Txt_OUT28,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Txt_top))
                
                let width_Txt_OUT30 = NSLayoutConstraint(item: Txt_OUT30,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 90.0)
                
                let hight_Txt_OUT30 = NSLayoutConstraint(item: Txt_OUT30,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT30 , leading_Txt_OUT30 , width_Txt_OUT30 , hight_Txt_OUT30])
                
                Txt_OUT30.layer.cornerRadius = 5.0
                Txt_OUT30.placeholder = get_OUT_Name(value: 30)//app.OUT30//"OUT30"
                Txt_OUT30.borderStyle = .roundedRect
                Txt_OUT30.returnKeyType = .done
                Txt_OUT30.textColor = UIColor.black
                Txt_OUT30.layer.borderWidth = 1.0
                Txt_OUT30.layer.borderColor = CGColor.cgColor
                
                //=========== OUT11 TextField ===========//
                scrollView.addSubview(Txt_OUT31)
                Txt_OUT31.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT31 = NSLayoutConstraint(item: Txt_OUT31,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: Lab_OUT31,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 90.0)
                
                let top_Txt_OUT31 = NSLayoutConstraint(item: Txt_OUT31,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Txt_OUT29,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Txt_top))
                
                let width_Txt_OUT31 = NSLayoutConstraint(item: Txt_OUT31,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 90.0)
                
                let hight_Txt_OUT31 = NSLayoutConstraint(item: Txt_OUT31,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT31 , leading_Txt_OUT31 , width_Txt_OUT31 , hight_Txt_OUT31])
                
                Txt_OUT31.layer.cornerRadius = 5.0
                Txt_OUT31.placeholder = get_OUT_Name(value: 31)//app.OUT31//"OUT31"
                Txt_OUT31.borderStyle = .roundedRect
                Txt_OUT31.returnKeyType = .done
                Txt_OUT31.textColor = UIColor.black
                Txt_OUT31.layer.borderWidth = 1.0
                Txt_OUT31.layer.borderColor = CGColor.cgColor
                
                
                //=========== OUT12 TextField ===========//
                scrollView.addSubview(Txt_OUT32)
                Txt_OUT32.translatesAutoresizingMaskIntoConstraints = false
                
                let leading_Txt_OUT32 = NSLayoutConstraint(item: Txt_OUT32,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: Lab_OUT32,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 90.0)
                
                let top_Txt_OUT32 = NSLayoutConstraint(item: Txt_OUT32,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Txt_OUT30,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: CGFloat(Txt_top))
                
                let width_Txt_OUT32 = NSLayoutConstraint(item: Txt_OUT32,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 90.0)
                
                let hight_Txt_OUT32 = NSLayoutConstraint(item: Txt_OUT32,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 35.0)
                
                NSLayoutConstraint.activate([top_Txt_OUT32 , leading_Txt_OUT32 , width_Txt_OUT32 , hight_Txt_OUT32])
                
                Txt_OUT32.layer.cornerRadius = 5.0
                Txt_OUT32.placeholder = get_OUT_Name(value: 32)//app.OUT32//"OUT32"
                Txt_OUT32.borderStyle = .roundedRect
                Txt_OUT32.returnKeyType = .done
                Txt_OUT32.textColor = UIColor.black
                Txt_OUT32.layer.borderWidth = 1.0
                Txt_OUT32.layer.borderColor = CGColor.cgColor
                
                
        }
        //=========== Save  Button ===========//
        scrollView.addSubview(Btn_Modify)
        Btn_Modify.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Btn_Modify = NSLayoutConstraint(item: Btn_Modify,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: scrollView,
                                                  attribute: .leading,
                                                  multiplier: 1.0,
                                                  constant: screensize.width/2-180)
        
        let top_Btn_Modify = NSLayoutConstraint(item: Btn_Modify,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: Lab_Output,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: (CGFloat(45.0 + (Double(Output_num) / 2 * 42.0))))//130.0)
        
        let width_Btn_Modify = NSLayoutConstraint(item: Btn_Modify,
                                                attribute: .width,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 130.0)
        
        let hight_Btn_Modify = NSLayoutConstraint(item: Btn_Modify,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: 40.0)
        
        NSLayoutConstraint.activate([top_Btn_Modify , leading_Btn_Modify , width_Btn_Modify , hight_Btn_Modify])
        Btn_Modify.addTarget(self, action: #selector(Btn_Modify_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_Modify.layer.cornerRadius = 5.0
        Btn_Modify.backgroundColor = uicolor
        Btn_Modify.setTitle("Modify", for: UIControlState.normal)
        
        //=========== Btn_Cancel1 Button ===========//
        scrollView.addSubview(Btn_Cancel2)
        Btn_Cancel2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Btn_Cancel2 = NSLayoutConstraint(item: Btn_Cancel2,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: Btn_Modify,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 130.0+100.0)
        
        let top_Btn_Cancel2 = NSLayoutConstraint(item: Btn_Cancel2,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: Lab_Output,
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: (CGFloat(45.0 + (Double(Output_num) / 2 * 42.0))))//130.0)
        
        let width_Btn_Cancel2 = NSLayoutConstraint(item: Btn_Cancel2,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 130.0)
        
        let hight_Btn_Cancel2 = NSLayoutConstraint(item: Btn_Cancel2,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 1.0,
                                                   constant: 40.0)
        
        NSLayoutConstraint.activate([top_Btn_Cancel2 , leading_Btn_Cancel2 , width_Btn_Cancel2 , hight_Btn_Cancel2])
        
        Btn_Cancel2.layer.cornerRadius = 5.0
        Btn_Cancel2.backgroundColor = UIColor.darkGray//uicolor
        Btn_Cancel2.setTitle("Cancel", for: UIControlState.normal)
        
        
    }
    func get_IN_Name(value IN: Int) -> String{
        var IN_Name = ""
        if(app.DN=="HX-2544"){IN_Name = app.HX_2544_IN[IN-1]}
        if(app.DN=="HX-2562"){IN_Name = app.HX_2562_IN[IN-1]}
        if(app.DN=="MX-3UB"){IN_Name = app.MX_3UB_IN[IN-1]}
        if(app.DN=="MX-4UB"){IN_Name = app.MX_4UB_IN[IN-1]}
        if(app.DN=="MX-7UB"){IN_Name = app.MX_7UB_IN[IN-1]}
        print("IN_Name==>" + IN_Name)
        return IN_Name
    }
    
    func get_OUT_Name(value OUT: Int) -> String{
        var OUT_Name = ""
        if(app.DN=="HX-2544"){OUT_Name = app.HX_2544_OUT[OUT-1]}
        if(app.DN=="HX-2562"){OUT_Name = app.HX_2562_OUT[OUT-1]}
        if(app.DN=="MX-3UB"){OUT_Name = app.MX_3UB_OUT[OUT-1]}
        if(app.DN=="MX-4UB"){OUT_Name = app.MX_4UB_OUT[OUT-1]}
        if(app.DN=="MX-7UB"){OUT_Name = app.MX_7UB_OUT[OUT-1]}
        print("OUT_NameOUT_Name==>" + OUT_Name)
        return OUT_Name
    }
    
    @objc func Btn_Modify_Clicked(sender: UIButton) {

        LoadingModify()
//        if(Txt_IN1.text != nil && Txt_IN1.text != ""){
//            UserDefaults.standard.setValue(Txt_IN1.text, forKey: standard_Key(Key: "IN1"))
//            //UserDefaults.standard.setValue(Txt_IN1.text, forKey: "IN1")
//            print("IN1==>" + Txt_IN1.text!)
//            //app.SetDeviceInfo(Field: standard_Key(Key: "IN1"), Value: Txt_IN1.text!)
//            app.SetDeviceInfo(Field: "IN1", Value: Txt_IN1.text!)
//            print(app.HX_2544_IN[0])
//        }
//        if(Txt_IN2.text != nil && Txt_IN2.text != ""){
//            UserDefaults.standard.setValue(Txt_IN2.text, forKey: standard_Key(Key: "IN2"))
//            app.SetDeviceInfo(Field: "IN2", Value: Txt_IN2.text!)
//            print(app.HX_2544_IN[1])
//        }
//        if(Txt_IN3.text != nil && Txt_IN3.text != ""){
//            UserDefaults.standard.setValue(Txt_IN3.text, forKey: standard_Key(Key: "IN3"))
//            app.SetDeviceInfo(Field: "IN3", Value: Txt_IN3.text!)
//        //app.SetDeviceInfo(Field: standard_Key(Key: "IN3"), Value: Txt_IN3.text!)
//        }
//        if(Txt_IN4.text != nil && Txt_IN4.text != ""){
//            UserDefaults.standard.setValue(Txt_IN4.text, forKey: standard_Key(Key: "IN4"))
//            app.SetDeviceInfo(Field: "IN4", Value: Txt_IN4.text!)
////app.SetDeviceInfo(Field: standard_Key(Key: "IN4"), Value: Txt_IN4.text!)
//        }
//        if(Txt_IN5.text != nil && Txt_IN5.text != ""){
//            UserDefaults.standard.setValue(Txt_IN5.text, forKey: standard_Key(Key: "IN5"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN5"), Value: Txt_IN5.text!)
//        }
//        if(Txt_IN6.text != nil && Txt_IN6.text != ""){
//            UserDefaults.standard.setValue(Txt_IN6.text, forKey: standard_Key(Key: "IN6"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN6"), Value: Txt_IN6.text!)
//        }
//        if(Txt_IN7.text != nil && Txt_IN7.text != ""){
//            UserDefaults.standard.setValue(Txt_IN7.text, forKey: standard_Key(Key: "IN7"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN7"), Value: Txt_IN7.text!)
//        }
//        if(Txt_IN8.text != nil && Txt_IN8.text != ""){
//            UserDefaults.standard.setValue(Txt_IN8.text, forKey: standard_Key(Key: "IN8"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN8"), Value: Txt_IN8.text!)
//        }
//        if(Txt_IN9.text != nil && Txt_IN9.text != ""){
//            UserDefaults.standard.setValue(Txt_IN9.text, forKey: standard_Key(Key: "IN9"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN9"), Value: Txt_IN9.text!)
//        }
//        if(Txt_IN10.text != nil && Txt_IN10.text != ""){
//            UserDefaults.standard.setValue(Txt_IN10.text, forKey: standard_Key(Key: "IN10"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN10"), Value: Txt_IN10.text!)
//        }
//        if(Txt_IN11.text != nil && Txt_IN11.text != ""){
//            UserDefaults.standard.setValue(Txt_IN11.text, forKey: standard_Key(Key: "IN11"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN11"), Value: Txt_IN11.text!)
//        }
//        if(Txt_IN12.text != nil && Txt_IN12.text != ""){
//            UserDefaults.standard.setValue(Txt_IN12.text, forKey: standard_Key(Key: "IN12"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN12"), Value: Txt_IN12.text!)
//        }
//        if(Txt_IN13.text != nil && Txt_IN13.text != ""){
//            UserDefaults.standard.setValue(Txt_IN13.text, forKey: standard_Key(Key: "IN13"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN13"), Value: Txt_IN13.text!)
//        }
//        if(Txt_IN14.text != nil && Txt_IN14.text != ""){
//            UserDefaults.standard.setValue(Txt_IN14.text, forKey: standard_Key(Key: "IN14"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN14"), Value: Txt_IN14.text!)
//        }
//        if(Txt_IN15.text != nil && Txt_IN15.text != ""){
//            UserDefaults.standard.setValue(Txt_IN15.text, forKey: standard_Key(Key: "IN15"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN15"), Value: Txt_IN15.text!)
//        }
//        if(Txt_IN16.text != nil && Txt_IN16.text != ""){
//            UserDefaults.standard.setValue(Txt_IN16.text, forKey: standard_Key(Key: "IN16"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN16"), Value: Txt_IN16.text!)
//        }
//        if(Txt_IN17.text != nil && Txt_IN17.text != ""){
//            UserDefaults.standard.setValue(Txt_IN17.text, forKey: standard_Key(Key: "IN17"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN17"), Value: Txt_IN17.text!)
//        }
//        if(Txt_IN18.text != nil && Txt_IN18.text != ""){
//            UserDefaults.standard.setValue(Txt_IN18.text, forKey: standard_Key(Key: "IN18"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN18"), Value: Txt_IN18.text!)
//        }
//        if(Txt_IN19.text != nil && Txt_IN19.text != ""){
//            UserDefaults.standard.setValue(Txt_IN19.text, forKey: standard_Key(Key: "IN19"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN19"), Value: Txt_IN19.text!)
//        }
//        if(Txt_IN20.text != nil && Txt_IN20.text != ""){
//            UserDefaults.standard.setValue(Txt_IN20.text, forKey: standard_Key(Key: "IN20"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN20"), Value: Txt_IN20.text!)
//        }
//        if(Txt_IN21.text != nil && Txt_IN21.text != ""){
//            UserDefaults.standard.setValue(Txt_IN21.text, forKey: standard_Key(Key: "IN21"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN21"), Value: Txt_IN21.text!)
//        }
//        if(Txt_IN22.text != nil && Txt_IN22.text != ""){
//            UserDefaults.standard.setValue(Txt_IN22.text, forKey: standard_Key(Key: "IN22"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN22"), Value: Txt_IN22.text!)
//        }
//        if(Txt_IN23.text != nil && Txt_IN23.text != ""){
//            UserDefaults.standard.setValue(Txt_IN23.text, forKey: standard_Key(Key: "IN23"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN23"), Value: Txt_IN23.text!)
//        }
//        if(Txt_IN24.text != nil && Txt_IN24.text != ""){
//            UserDefaults.standard.setValue(Txt_IN24.text, forKey: standard_Key(Key: "IN24"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN24"), Value: Txt_IN24.text!)
//        }
//        if(Txt_IN25.text != nil && Txt_IN25.text != ""){
//            UserDefaults.standard.setValue(Txt_IN25.text, forKey: standard_Key(Key: "IN25"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN25"), Value: Txt_IN25.text!)
//        }
//        if(Txt_IN26.text != nil && Txt_IN26.text != ""){
//            UserDefaults.standard.setValue(Txt_IN26.text, forKey: standard_Key(Key: "IN26"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN26"), Value: Txt_IN26.text!)
//        }
//        if(Txt_IN27.text != nil && Txt_IN27.text != ""){
//            UserDefaults.standard.setValue(Txt_IN27.text, forKey: standard_Key(Key: "IN27"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN27"), Value: Txt_IN27.text!)
//        }
//        if(Txt_IN28.text != nil && Txt_IN28.text != ""){
//            UserDefaults.standard.setValue(Txt_IN28.text, forKey: standard_Key(Key: "IN28"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN28"), Value: Txt_IN28.text!)
//        }
//        if(Txt_IN29.text != nil && Txt_IN29.text != ""){
//            UserDefaults.standard.setValue(Txt_IN29.text, forKey: standard_Key(Key: "IN29"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN29"), Value: Txt_IN29.text!)
//        }
//        if(Txt_IN30.text != nil && Txt_IN30.text != ""){
//            UserDefaults.standard.setValue(Txt_IN30.text, forKey: standard_Key(Key: "IN30"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN30"), Value: Txt_IN30.text!)
//        }
//        if(Txt_IN31.text != nil && Txt_IN31.text != ""){
//            UserDefaults.standard.setValue(Txt_IN31.text, forKey: standard_Key(Key: "IN31"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN31"), Value: Txt_IN31.text!)
//        }
//        if(Txt_IN32.text != nil && Txt_IN32.text != ""){
//            UserDefaults.standard.setValue(Txt_IN32.text, forKey: standard_Key(Key: "IN32"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "IN32"), Value: Txt_IN32.text!)
//        }
//
//
//
//
//        if(Txt_OUT1.text != nil && Txt_OUT1.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT1.text, forKey: standard_Key(Key: "OUT1"))
//            //app.SetDeviceInfo(Field: standard_Key(Key: "OUT1"), Value: Txt_OUT1.text!)
//            app.SetDeviceInfo(Field: "OUT1", Value: Txt_OUT1.text!)
//            print("app.HX_2544_OUT[0]")
//            print(app.HX_2544_OUT[0])
//        }
//        if(Txt_OUT2.text != nil && Txt_OUT2.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT2.text, forKey: standard_Key(Key: "OUT2"))
//            app.SetDeviceInfo(Field: "OUT2", Value: Txt_OUT2.text!)
//        }
//        if(Txt_OUT3.text != nil && Txt_OUT3.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT3.text, forKey: standard_Key(Key: "OUT3"))
//            app.SetDeviceInfo(Field:  "OUT3", Value: Txt_OUT3.text!)
//        }
//        if(Txt_OUT4.text != nil && Txt_OUT4.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT4.text, forKey: standard_Key(Key: "OUT4"))
//            app.SetDeviceInfo(Field: "OUT4", Value: Txt_OUT4.text!)
//        }
//        if(Txt_OUT5.text != nil && Txt_OUT5.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT5.text, forKey: standard_Key(Key: "OUT5"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT5"), Value: Txt_OUT5.text!)
//        }
//        if(Txt_OUT6.text != nil && Txt_OUT6.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT6.text, forKey: standard_Key(Key: "OUT6"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT6"), Value: Txt_OUT6.text!)
//        }
//        if(Txt_OUT7.text != nil && Txt_OUT7.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT7.text, forKey: standard_Key(Key: "OUT7"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT7"), Value: Txt_OUT7.text!)
//        }
//        if(Txt_OUT8.text != nil && Txt_OUT8.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT8.text, forKey: standard_Key(Key: "OUT8"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT8"), Value: Txt_OUT8.text!)
//        }
//        if(Txt_OUT9.text != nil && Txt_OUT9.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT9.text, forKey: standard_Key(Key: "OUT9"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT9"), Value: Txt_OUT9.text!)
//        }
//        if(Txt_OUT10.text != nil && Txt_OUT10.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT10.text, forKey: standard_Key(Key: "OUT10"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT10"), Value: Txt_OUT10.text!)
//        }
//        if(Txt_OUT11.text != nil && Txt_OUT11.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT11.text, forKey: standard_Key(Key: "OUT11"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT11"), Value: Txt_OUT11.text!)
//        }
//        if(Txt_OUT12.text != nil && Txt_OUT12.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT12.text, forKey: standard_Key(Key: "OUT12"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT12"), Value: Txt_OUT12.text!)
//        }
//        if(Txt_OUT13.text != nil && Txt_OUT13.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT13.text, forKey: standard_Key(Key: "OUT13"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT13"), Value: Txt_OUT13.text!)
//        }
//        if(Txt_OUT14.text != nil && Txt_OUT14.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT14.text, forKey: standard_Key(Key: "OUT14"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT14"), Value: Txt_OUT14.text!)
//        }
//        if(Txt_OUT15.text != nil && Txt_OUT15.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT15.text, forKey: standard_Key(Key: "OUT15"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT15"), Value: Txt_OUT15.text!)
//        }
//        if(Txt_OUT16.text != nil && Txt_OUT16.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT16.text, forKey: standard_Key(Key: "OUT16"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT16"), Value: Txt_OUT16.text!)
//        }
//        if(Txt_OUT17.text != nil && Txt_OUT17.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT17.text, forKey: standard_Key(Key: "OUT17"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT17"), Value: Txt_OUT17.text!)
//        }
//        if(Txt_OUT18.text != nil && Txt_OUT18.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT18.text, forKey: standard_Key(Key: "OUT18"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT18"), Value: Txt_OUT18.text!)
//        }
//        if(Txt_OUT19.text != nil && Txt_OUT19.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT19.text, forKey: standard_Key(Key: "OUT19"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT19"), Value: Txt_OUT19.text!)
//        }
//        if(Txt_OUT20.text != nil && Txt_OUT20.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT20.text, forKey: standard_Key(Key: "OUT20"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT20"), Value: Txt_OUT20.text!)
//        }
//        if(Txt_OUT21.text != nil && Txt_OUT21.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT21.text, forKey: standard_Key(Key: "OUT21"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT21"), Value: Txt_OUT21.text!)
//        }
//        if(Txt_OUT22.text != nil && Txt_OUT22.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT22.text, forKey: standard_Key(Key: "OUT22"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT22"), Value: Txt_OUT22.text!)
//        }
//        if(Txt_OUT23.text != nil && Txt_OUT23.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT23.text, forKey: standard_Key(Key: "OUT23"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT23"), Value: Txt_OUT23.text!)
//        }
//        if(Txt_OUT24.text != nil && Txt_OUT24.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT24.text, forKey: standard_Key(Key: "OUT24"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT24"), Value: Txt_OUT24.text!)
//        }
//        if(Txt_OUT25.text != nil && Txt_OUT25.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT25.text, forKey: standard_Key(Key: "OUT25"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT25"), Value: Txt_OUT25.text!)
//        }
//        if(Txt_OUT26.text != nil && Txt_OUT26.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT26.text, forKey: standard_Key(Key: "OUT26"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT26"), Value: Txt_OUT26.text!)
//        }
//        if(Txt_OUT27.text != nil && Txt_OUT27.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT27.text, forKey: standard_Key(Key: "OUT27"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT27"), Value: Txt_OUT27.text!)
//        }
//        if(Txt_OUT28.text != nil && Txt_OUT28.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT28.text, forKey: standard_Key(Key: "OUT28"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT28"), Value: Txt_OUT28.text!)
//        }
//        if(Txt_OUT29.text != nil && Txt_OUT29.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT29.text, forKey: standard_Key(Key: "OUT29"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT29"), Value: Txt_OUT29.text!)
//        }
//        if(Txt_OUT30.text != nil && Txt_OUT30.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT30.text, forKey: standard_Key(Key: "OUT30"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT30"), Value: Txt_OUT30.text!)
//        }
//        if(Txt_OUT31.text != nil && Txt_OUT31.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT31.text, forKey: standard_Key(Key: "OUT31"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT31"), Value: Txt_OUT31.text!)
//        }
//        if(Txt_OUT32.text != nil && Txt_OUT32.text != ""){
//            UserDefaults.standard.setValue(Txt_OUT32.text, forKey: standard_Key(Key: "OUT32"))
//            app.SetDeviceInfo(Field: standard_Key(Key: "OUT32"), Value: Txt_OUT32.text!)
//        }
//        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
    }
    
    
    func standard_Key(Key: String?) ->String
    {
        
        return app.DN + "_"+Key!
        
    }
    @objc func Btn_Save_Clicked(sender: UIButton) {
        
        LoadingSave()
        
//        app.SetDeviceInfo(Field: "comeFromPage", Value: "Configuration")
//        var IP: String
//
//        IP = Txt_IP.text!
//
//        if (isValidIP(ipAddr: IP) ){
//            let octets = IP.characters.split{$0 == "."}.map{String($0)}
////            print("octets==>")
//
////            print(String(describing: octets[0]))
////            print(octets[1])
////            print(octets[2])
////            print(octets[3])
//
//
//            var bytes: [UInt8] = [0x40, 0x07, 0x01]
//            bytes.append(UInt8(octets[0])!)
//            bytes.append(UInt8(octets[1])!)
//            bytes.append(UInt8(octets[2])!)
//            bytes.append(UInt8(octets[3])!)
//            print(bytes)
//
//            //先解析要傳出去的指令("DeviceID" "ACKType" "Instruction" "Index" "Value" "CRC")。並取得ＣＲＣ值
//            //var HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
//
//            //bytes + ＣＲＣ值
//            var senddata: [UInt8] = crc16table.CRC(data: bytes)
//
//            //print(senddata)
//            switch app.client.send(data: senddata){
//            case .success:
//                guard let data = app.client.read(1024*10) else { return}//data==>設備回傳的資料
//                //print(data)
//                //解析設備回傳的資料
//                //print(data[0])
//                if(data[0] == 96) {//60//if設定成功
//
//                    bytes = [0x40, 0x04, 0x00, 0x01, 0x20]
//                    senddata = crc16table.CRC(data: bytes)//儲存設定並重新開機
//                    //print(bytes)
//
//
//                    switch app.client.send(data: senddata){
//
//                    case .success:
//                        //print("success")
//
//                        //print("Get==>" + String(describing: app.Connect_state))
//                        if app.Connect_state
//                        {
//                            //print("Prepare Disconnect!!")
//                            app.client.close()
//                        }
//                        //print(Txt_IP.text)
//                        sleep(10)
//                        app.Connect_Device(address: Txt_IP.text!, Port: Int32(5000))
//
//                        if app.Connect_state == true
//                        {
//                            app.SetDeviceInfo(Field: "IP", Value: Txt_IP.text!)
//                            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
//                        }
//
//                    case .failure(_):
//                        print("default")
//                    }
//
//
//                }
//
//
//            case .failure(_):
//                print("default")
//            }
//
//
//        }else{
//            //IP格式有誤
//        }
        
    }
    
    func isValidIP(ipAddr: String?) ->Bool
    {
        guard let ipAddr = ipAddr else {
            return false
        }
        
        let octets = ipAddr.characters.split{$0 == "."}.map{String($0)}
        
        guard octets.count == 4 else {
            return false
        }
        
        func validOctet(octet: String) -> Bool {
            guard let num = Int(String(octet)),
                num >= 0 && num < 256 else {
                    return false
            }
            return true
        }
        
        
        for octet in octets{
            guard validOctet(octet: octet) else {
                return false
            }
        }
        return true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LoadingSave()
    {
        configurIndicatorView.startAnimating()
        
        let additionalTime: DispatchTimeInterval = .milliseconds(200)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
            
            self.app.SetDeviceInfo(Field: "comeFromPage", Value: "Configuration")
            var IP: String
            
            IP = self.Txt_IP.text!
            
            if (self.isValidIP(ipAddr: IP) ){
                let octets = IP.characters.split{$0 == "."}.map{String($0)}
                //            print("octets==>")
                
                //            print(String(describing: octets[0]))
                //            print(octets[1])
                //            print(octets[2])
                //            print(octets[3])
                
                
                var bytes: [UInt8] = [0x40, 0x07, 0x01]
                bytes.append(UInt8(octets[0])!)
                bytes.append(UInt8(octets[1])!)
                bytes.append(UInt8(octets[2])!)
                bytes.append(UInt8(octets[3])!)
                print(bytes)
                
                //先解析要傳出去的指令("DeviceID" "ACKType" "Instruction" "Index" "Value" "CRC")。並取得ＣＲＣ值
                //var HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
                
                //bytes + ＣＲＣ值
                var senddata: [UInt8] = self.crc16table.CRC(data: bytes)
                
                //print(senddata)
                switch self.app.client.send(data: senddata){
                case .success:
                    guard let data = self.app.client.read(1024*10) else { return}//data==>設備回傳的資料
                    //print(data)
                    //解析設備回傳的資料
                    //print(data[0])
                    if(data[0] == 96) {//60//if設定成功
                        
                        bytes = [0x40, 0x04, 0x00, 0x01, 0x20]
                        senddata = self.crc16table.CRC(data: bytes)//儲存設定並重新開機
                        //print(bytes)
                        
                        
                        switch self.app.client.send(data: senddata){
                            
                        case .success:
                            //print("success")
                            
                            //print("Get==>" + String(describing: app.Connect_state))
                            if self.app.Connect_state
                            {
                                //print("Prepare Disconnect!!")
                                self.app.client.close()
                            }
                            //print(Txt_IP.text)
                            sleep(10)
                            self.app.Connect_Device(address: self.Txt_IP.text!, Port: Int32(5000))
                            
                            if self.app.Connect_state == true
                            {
                                self.app.SetDeviceInfo(Field: "IP", Value: self.Txt_IP.text!)
                                self.configurIndicatorView.stopAnimating()
                                self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
                            }
                            
                        case .failure(_):
                            print("default")
                        }
                        
                        
                    }
                    
                    
                case .failure(_):
                    print("default")
                }
                
                
            }else{
                //IP格式有誤
                self.configurIndicatorView.stopAnimating()
            }
            
        }
    }

    func LoadingModify()
    {
        configurIndicatorView.startAnimating()
        
        let additionalTime: DispatchTimeInterval = .milliseconds(200)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + additionalTime) {
            
            if(self.Txt_IN1.text != nil && self.Txt_IN1.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN1.text, forKey: self.standard_Key(Key: "IN1"))
                //UserDefaults.standard.setValue(Txt_IN1.text, forKey: "IN1")
                print("IN1==>" + self.Txt_IN1.text!)
                //app.SetDeviceInfo(Field: standard_Key(Key: "IN1"), Value: Txt_IN1.text!)
                self.app.SetDeviceInfo(Field: "IN1", Value: self.Txt_IN1.text!)
                print(self.app.HX_2544_IN[0])
            }
            if(self.Txt_IN2.text != nil && self.Txt_IN2.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN2.text, forKey: self.standard_Key(Key: "IN2"))
                self.app.SetDeviceInfo(Field: "IN2", Value: self.Txt_IN2.text!)
                print(self.app.HX_2544_IN[1])
            }
            if(self.Txt_IN3.text != nil && self.Txt_IN3.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN3.text, forKey: self.standard_Key(Key: "IN3"))
                self.app.SetDeviceInfo(Field: "IN3", Value: self.Txt_IN3.text!)
                //app.SetDeviceInfo(Field: standard_Key(Key: "IN3"), Value: Txt_IN3.text!)
            }
            if(self.Txt_IN4.text != nil && self.Txt_IN4.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN4.text, forKey: self.standard_Key(Key: "IN4"))
                self.app.SetDeviceInfo(Field: "IN4", Value: self.Txt_IN4.text!)
                //app.SetDeviceInfo(Field: standard_Key(Key: "IN4"), Value: Txt_IN4.text!)
            }
            if(self.Txt_IN5.text != nil && self.Txt_IN5.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN5.text, forKey: self.standard_Key(Key: "IN5"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN5"), Value: self.Txt_IN5.text!)
            }
            if(self.Txt_IN6.text != nil && self.Txt_IN6.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN6.text, forKey: self.standard_Key(Key: "IN6"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN6"), Value: self.Txt_IN6.text!)
            }
            if(self.self.Txt_IN7.text != nil && self.Txt_IN7.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN7.text, forKey: self.standard_Key(Key: "IN7"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN7"), Value: self.Txt_IN7.text!)
            }
            if(self.self.Txt_IN8.text != nil && self.Txt_IN8.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN8.text, forKey: self.standard_Key(Key: "IN8"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN8"), Value: self.Txt_IN8.text!)
            }
            if(self.Txt_IN9.text != nil && self.Txt_IN9.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN9.text, forKey: self.standard_Key(Key: "IN9"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN9"), Value: self.Txt_IN9.text!)
            }
            if(self.Txt_IN10.text != nil && self.Txt_IN10.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN10.text, forKey: self.standard_Key(Key: "IN10"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN10"), Value: self.Txt_IN10.text!)
            }
            if(self.Txt_IN11.text != nil && self.Txt_IN11.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN11.text, forKey: self.standard_Key(Key: "IN11"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN11"), Value: self.Txt_IN11.text!)
            }
            if(self.Txt_IN12.text != nil && self.Txt_IN12.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN12.text, forKey: self.standard_Key(Key: "IN12"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN12"), Value: self.Txt_IN12.text!)
            }
            if(self.Txt_IN13.text != nil && self.Txt_IN13.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN13.text, forKey: self.standard_Key(Key: "IN13"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN13"), Value: self.Txt_IN13.text!)
            }
            if(self.Txt_IN14.text != nil && self.Txt_IN14.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN14.text, forKey: self.standard_Key(Key: "IN14"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN14"), Value: self.Txt_IN14.text!)
            }
            if(self.Txt_IN15.text != nil && self.Txt_IN15.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN15.text, forKey: self.standard_Key(Key: "IN15"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN15"), Value: self.Txt_IN15.text!)
            }
            if(self.Txt_IN16.text != nil && self.Txt_IN16.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN16.text, forKey: self.standard_Key(Key: "IN16"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN16"), Value: self.Txt_IN16.text!)
            }
            if(self.Txt_IN17.text != nil && self.Txt_IN17.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN17.text, forKey: self.standard_Key(Key: "IN17"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN17"), Value: self.Txt_IN17.text!)
            }
            if(self.Txt_IN18.text != nil && self.Txt_IN18.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN18.text, forKey: self.standard_Key(Key: "IN18"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN18"), Value: self.Txt_IN18.text!)
            }
            if(self.Txt_IN19.text != nil && self.Txt_IN19.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN19.text, forKey: self.standard_Key(Key: "IN19"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN19"), Value: self.Txt_IN19.text!)
            }
            if(self.Txt_IN20.text != nil && self.Txt_IN20.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN20.text, forKey: self.standard_Key(Key: "IN20"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN20"), Value: self.Txt_IN20.text!)
            }
            if(self.Txt_IN21.text != nil && self.Txt_IN21.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN21.text, forKey: self.standard_Key(Key: "IN21"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN21"), Value: self.Txt_IN21.text!)
            }
            if(self.Txt_IN22.text != nil && self.Txt_IN22.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN22.text, forKey: self.standard_Key(Key: "IN22"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN22"), Value: self.Txt_IN22.text!)
            }
            if(self.Txt_IN23.text != nil && self.Txt_IN23.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN23.text, forKey: self.standard_Key(Key: "IN23"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN23"), Value: self.Txt_IN23.text!)
            }
            if(self.Txt_IN24.text != nil && self.Txt_IN24.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN24.text, forKey: self.standard_Key(Key: "IN24"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN24"), Value: self.Txt_IN24.text!)
            }
            if(self.Txt_IN25.text != nil && self.Txt_IN25.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN25.text, forKey: self.standard_Key(Key: "IN25"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN25"), Value: self.Txt_IN25.text!)
            }
            if(self.Txt_IN26.text != nil && self.Txt_IN26.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN26.text, forKey: self.standard_Key(Key: "IN26"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN26"), Value: self.Txt_IN26.text!)
            }
            if(self.Txt_IN27.text != nil && self.Txt_IN27.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN27.text, forKey: self.standard_Key(Key: "IN27"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN27"), Value: self.Txt_IN27.text!)
            }
            if(self.Txt_IN28.text != nil && self.Txt_IN28.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN28.text, forKey: self.standard_Key(Key: "IN28"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN28"), Value: self.Txt_IN28.text!)
            }
            if(self.Txt_IN29.text != nil && self.Txt_IN29.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN29.text, forKey: self.standard_Key(Key: "IN29"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN29"), Value: self.Txt_IN29.text!)
            }
            if(self.Txt_IN30.text != nil && self.Txt_IN30.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN30.text, forKey: self.standard_Key(Key: "IN30"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN30"), Value: self.Txt_IN30.text!)
            }
            if(self.Txt_IN31.text != nil && self.Txt_IN31.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN31.text, forKey: self.standard_Key(Key: "IN31"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN31"), Value: self.Txt_IN31.text!)
            }
            if(self.Txt_IN32.text != nil && self.Txt_IN32.text != ""){
                UserDefaults.standard.setValue(self.Txt_IN32.text, forKey: self.standard_Key(Key: "IN32"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "IN32"), Value: self.Txt_IN32.text!)
            }
            
            
            
            
            if(self.Txt_OUT1.text != nil && self.Txt_OUT1.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT1.text, forKey: self.standard_Key(Key: "OUT1"))
                //app.SetDeviceInfo(Field: standard_Key(Key: "OUT1"), Value: Txt_OUT1.text!)
                self.app.SetDeviceInfo(Field: "OUT1", Value: self.Txt_OUT1.text!)
                print("app.HX_2544_OUT[0]")
                print(self.app.HX_2544_OUT[0])
            }
            if(self.Txt_OUT2.text != nil && self.Txt_OUT2.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT2.text, forKey: self.standard_Key(Key: "OUT2"))
                self.app.SetDeviceInfo(Field: "OUT2", Value: self.Txt_OUT2.text!)
            }
            if(self.Txt_OUT3.text != nil && self.Txt_OUT3.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT3.text, forKey: self.standard_Key(Key: "OUT3"))
                self.app.SetDeviceInfo(Field:  "OUT3", Value: self.Txt_OUT3.text!)
            }
            if(self.Txt_OUT4.text != nil && self.Txt_OUT4.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT4.text, forKey: self.standard_Key(Key: "OUT4"))
                self.app.SetDeviceInfo(Field: "OUT4", Value: self.Txt_OUT4.text!)
            }
            if(self.Txt_OUT5.text != nil && self.Txt_OUT5.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT5.text, forKey: self.standard_Key(Key: "OUT5"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT5"), Value: self.Txt_OUT5.text!)
            }
            if(self.Txt_OUT6.text != nil && self.Txt_OUT6.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT6.text, forKey: self.standard_Key(Key: "OUT6"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT6"), Value: self.Txt_OUT6.text!)
            }
            if(self.Txt_OUT7.text != nil && self.Txt_OUT7.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT7.text, forKey: self.standard_Key(Key: "OUT7"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT7"), Value: self.Txt_OUT7.text!)
            }
            if(self.Txt_OUT8.text != nil && self.Txt_OUT8.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT8.text, forKey: self.standard_Key(Key: "OUT8"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT8"), Value: self.Txt_OUT8.text!)
            }
            if(self.Txt_OUT9.text != nil && self.Txt_OUT9.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT9.text, forKey: self.standard_Key(Key: "OUT9"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT9"), Value: self.Txt_OUT9.text!)
            }
            if(self.Txt_OUT10.text != nil && self.Txt_OUT10.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT10.text, forKey: self.standard_Key(Key: "OUT10"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT10"), Value: self.Txt_OUT10.text!)
            }
            if(self.Txt_OUT11.text != nil && self.Txt_OUT11.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT11.text, forKey: self.standard_Key(Key: "OUT11"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT11"), Value: self.Txt_OUT11.text!)
            }
            if(self.Txt_OUT12.text != nil && self.Txt_OUT12.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT12.text, forKey: self.standard_Key(Key: "OUT12"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT12"), Value: self.Txt_OUT12.text!)
            }
            if(self.Txt_OUT13.text != nil && self.Txt_OUT13.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT13.text, forKey: self.standard_Key(Key: "OUT13"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT13"), Value: self.Txt_OUT13.text!)
            }
            if(self.Txt_OUT14.text != nil && self.Txt_OUT14.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT14.text, forKey: self.standard_Key(Key: "OUT14"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT14"), Value: self.Txt_OUT14.text!)
            }
            if(self.Txt_OUT15.text != nil && self.Txt_OUT15.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT15.text, forKey: self.standard_Key(Key: "OUT15"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT15"), Value: self.Txt_OUT15.text!)
            }
            if(self.Txt_OUT16.text != nil && self.Txt_OUT16.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT16.text, forKey: self.standard_Key(Key: "OUT16"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT16"), Value: self.Txt_OUT16.text!)
            }
            if(self.Txt_OUT17.text != nil && self.Txt_OUT17.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT17.text, forKey: self.standard_Key(Key: "OUT17"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT17"), Value: self.Txt_OUT17.text!)
            }
            if(self.Txt_OUT18.text != nil && self.Txt_OUT18.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT18.text, forKey: self.standard_Key(Key: "OUT18"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT18"), Value: self.Txt_OUT18.text!)
            }
            if(self.Txt_OUT19.text != nil && self.Txt_OUT19.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT19.text, forKey: self.standard_Key(Key: "OUT19"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT19"), Value: self.Txt_OUT19.text!)
            }
            if(self.Txt_OUT20.text != nil && self.Txt_OUT20.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT20.text, forKey: self.standard_Key(Key: "OUT20"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT20"), Value: self.Txt_OUT20.text!)
            }
            if(self.Txt_OUT21.text != nil && self.Txt_OUT21.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT21.text, forKey: self.standard_Key(Key: "OUT21"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT21"), Value: self.Txt_OUT21.text!)
            }
            if(self.Txt_OUT22.text != nil && self.Txt_OUT22.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT22.text, forKey: self.standard_Key(Key: "OUT22"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT22"), Value: self.Txt_OUT22.text!)
            }
            if(self.Txt_OUT23.text != nil && self.Txt_OUT23.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT23.text, forKey: self.standard_Key(Key: "OUT23"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT23"), Value: self.Txt_OUT23.text!)
            }
            if(self.Txt_OUT24.text != nil && self.Txt_OUT24.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT24.text, forKey: self.standard_Key(Key: "OUT24"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT24"), Value: self.Txt_OUT24.text!)
            }
            if(self.Txt_OUT25.text != nil && self.Txt_OUT25.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT25.text, forKey: self.standard_Key(Key: "OUT25"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT25"), Value: self.Txt_OUT25.text!)
            }
            if(self.Txt_OUT26.text != nil && self.Txt_OUT26.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT26.text, forKey: self.standard_Key(Key: "OUT26"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT26"), Value: self.Txt_OUT26.text!)
            }
            if(self.Txt_OUT27.text != nil && self.Txt_OUT27.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT27.text, forKey: self.standard_Key(Key: "OUT27"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT27"), Value: self.Txt_OUT27.text!)
            }
            if(self.Txt_OUT28.text != nil && self.Txt_OUT28.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT28.text, forKey: self.standard_Key(Key: "OUT28"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT28"), Value: self.Txt_OUT28.text!)
            }
            if(self.Txt_OUT29.text != nil && self.Txt_OUT29.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT29.text, forKey: self.standard_Key(Key: "OUT29"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT29"), Value: self.Txt_OUT29.text!)
            }
            if(self.Txt_OUT30.text != nil && self.Txt_OUT30.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT30.text, forKey: self.standard_Key(Key: "OUT30"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT30"), Value: self.Txt_OUT30.text!)
            }
            if(self.Txt_OUT31.text != nil && self.Txt_OUT31.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT31.text, forKey: self.standard_Key(Key: "OUT31"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT31"), Value: self.Txt_OUT31.text!)
            }
            if(self.Txt_OUT32.text != nil && self.Txt_OUT32.text != ""){
                UserDefaults.standard.setValue(self.Txt_OUT32.text, forKey: self.standard_Key(Key: "OUT32"))
                self.app.SetDeviceInfo(Field: self.standard_Key(Key: "OUT32"), Value: self.Txt_OUT32.text!)
            }
            self.configurIndicatorView.stopAnimating()
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as UIViewController, animated: true)
        }
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
