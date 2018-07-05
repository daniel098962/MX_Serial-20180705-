//
//  ViewController.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/10/30.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

import SwiftSocket

let uicolor = UIColor.init(red: 172.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)


class ViewController: UIViewController {
    

    override var shouldAutorotate: Bool {
        return false
    }
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    let common = Common()
    
    let crc16table = CRC16Util()

    
    var fullSize :CGSize!
    //let myView = UIView()
    let Lab_DeviceInfo = UILabel()
    let Btn_Info_Position = UIButton()
    let Btn_Conn_Position = UIButton()
    let Btn_Config_Position = UIButton()
    
    let Lab_AV = UILabel()
    let Lab_Input = UILabel()
    let Lab_Output = UILabel()
    let Lab_Memory = UILabel()
    
    var Segmented_AV = UISegmentedControl()
    var Segmented_Input1 = UISegmentedControl()
    var Segmented_Input2 = UISegmentedControl()
    var Segmented_Input3 = UISegmentedControl()
    var Segmented_Input4 = UISegmentedControl()
    var Segmented_Input5 = UISegmentedControl()
    var Segmented_Input6 = UISegmentedControl()
    var Segmented_Input7 = UISegmentedControl()
    var Segmented_Input8 = UISegmentedControl()
    //let II = (app.Input as NSString).integerValue
    var Input_num = 6//(app.Input as NSString).integerValue
    var Segmented_Output1 = UISegmentedControl()
    var Segmented_Output2 = UISegmentedControl()
    var Segmented_Output3 = UISegmentedControl()
    var Segmented_Output4 = UISegmentedControl()
    var Segmented_Output5 = UISegmentedControl()
    var Segmented_Output6 = UISegmentedControl()
    var Segmented_Output7 = UISegmentedControl()
    var Segmented_Output8 = UISegmentedControl()
    var Output_num = 2
    var Input_Clicked = 1
    var Input_Clicked_Name = "1"
    var Segmented_Memory = UISegmentedControl()
    var Segmented_AF = UISegmentedControl()
    
    var IN_Port1: String = "1"
    var IN_Port2: String = "2"
    var IN_Port3: String = "3"
    var IN_Port4: String = "4"
    var IN_Port5: String = "5"
    var IN_Port6: String = "6"
    var IN_Port7: String = "7"
    var IN_Port8: String = "8"
    var IN_Port9: String = "9"
    var IN_Port10: String = "10"
    var IN_Port11: String = "11"
    var IN_Port12: String = "12"
    var IN_Port13: String = "13"
    var IN_Port14: String = "14"
    var IN_Port15: String = "15"
    var IN_Port16: String = "16"
    var IN_Port17: String = "17"
    var IN_Port18: String = "18"
    var IN_Port19: String = "19"
    var IN_Port20: String = "20"
    var IN_Port21: String = "21"
    var IN_Port22: String = "22"
    var IN_Port23: String = "23"
    var IN_Port24: String = "24"
    var IN_Port25: String = "25"
    var IN_Port26: String = "26"
    var IN_Port27: String = "27"
    var IN_Port28: String = "28"
    var IN_Port29: String = "29"
    var IN_Port30: String = "30"
    var IN_Port31: String = "31"
    var IN_Port32: String = "32"
    
    var OUT_Port1: String = "1"
    var OUT_Port2: String = "2"
    var OUT_Port3: String = "3"
    var OUT_Port4: String = "4"
    var OUT_Port5: String = "5"
    var OUT_Port6: String = "6"
    var OUT_Port7: String = "7"
    var OUT_Port8: String = "8"
    var OUT_Port9: String = "9"
    var OUT_Port10: String = "10"
    var OUT_Port11: String = "11"
    var OUT_Port12: String = "12"
    var OUT_Port13: String = "13"
    var OUT_Port14: String = "14"
    var OUT_Port15: String = "15"
    var OUT_Port16: String = "16"
    var OUT_Port17: String = "17"
    var OUT_Port18: String = "18"
    var OUT_Port19: String = "19"
    var OUT_Port20: String = "20"
    var OUT_Port21: String = "21"
    var OUT_Port22: String = "22"
    var OUT_Port23: String = "23"
    var OUT_Port24: String = "24"
    var OUT_Port25: String = "25"
    var OUT_Port26: String = "26"
    var OUT_Port27: String = "27"
    var OUT_Port28: String = "28"
    var OUT_Port29: String = "29"
    var OUT_Port30: String = "30"
    var OUT_Port31: String = "31"
    var OUT_Port32: String = "32"
    
    let All: String = "ALL"
    let Off: String = "OFF"
    
    var Audio = "",Video = "", Memory = "", Output = "", Input = "", DN = ""
    var EDID = "", Protocal_Version = "", Firmware_Version = ""
    var myActivityIndicator:UIActivityIndicatorView!
    
    @IBOutlet weak var Content_View: UIView!
    
    //let Btn_Conn_Position = UIButton(type: .custom)//rb = RightBottom
    //let Btn_Conn_Position = UIButton(type: .custom) as! UIButton//rb = RightBottom
    
//    let scrollView: UIScrollView = {
//        let v = UIScrollView()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        return v
//    }
    
    let screensize: CGRect = UIScreen.main.bounds
    
    var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ViewController")

        
        let screenWidth = screensize.width
        let screenHeight = screensize.height

        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        scrollView.contentSize = CGSize(width: screenWidth, height: 1000)
        
        navigationItem.hidesBackButton = true
        view.addSubview(scrollView)
        app.SetDeviceInfo(Field: "comeFromPage", Value: "MainPage")
        if app.Connect_state == true
        {
            Input_num = (app.Input as NSString).integerValue
            Output_num = (app.Output as NSString).integerValue
            GetDeviceInfo()

            print ("GetDevice==>")
            
            Lab_DeviceInfo.text = "   Name：" + app.DN + "\n" + "          IP：" + app.IP
            Lab_DeviceInfo.font = UIFont.boldSystemFont(ofSize: 18.0)
            print(app.HX_2544_IN[0])
            print(app.HX_2544_IN[1])
            print(app.HX_2562_IN[0])
            print(app.HX_2562_IN[1])
        }
        Layout()
        if app.Connect_state == true
        {
            //print("IN1==>")
            //print(UserDefaults.standard.string(forKey: standard_Key(Key: "IN1"))!)
            //GetDeviceInfo()
            ShowUIInfo()

        }
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//        Btn_AV.selectedSegmentIndex = 0
//
//        Btn_Input.selectedSegmentIndex = 0
//
//        Btn_Memory.selectedSegmentIndex = -1

        Segmented_AV.selectedSegmentIndex = 0
        Segmented_Input1.selectedSegmentIndex = 0
        Segmented_Input2.selectedSegmentIndex = -1
        Segmented_Input3.selectedSegmentIndex = -1
        Segmented_Input4.selectedSegmentIndex = -1
        Segmented_Input5.selectedSegmentIndex = -1
        Segmented_Input6.selectedSegmentIndex = -1
        Segmented_Input7.selectedSegmentIndex = -1
        Segmented_Input8.selectedSegmentIndex = -1

        Segmented_Output1.selectedSegmentIndex = -1
        Segmented_Output2.selectedSegmentIndex = -1
        Segmented_Output3.selectedSegmentIndex = -1
        Segmented_Output4.selectedSegmentIndex = -1
        Segmented_Output5.selectedSegmentIndex = -1
        Segmented_Output6.selectedSegmentIndex = -1
        Segmented_Output7.selectedSegmentIndex = -1
        Segmented_Output8.selectedSegmentIndex = -1
        Input_Clicked_Name = IN_Port1
        Input_Clicked = 1;

        Segmented_Memory.selectedSegmentIndex = -1
        
        Segmented_AF.selectedSegmentIndex = -1
        
        print("Refreash Go!!")
        //get_IN_OUT_Config()
        
        // 建立一個 UIActivityIndicatorView
        myActivityIndicator = UIActivityIndicatorView(
            activityIndicatorStyle:.whiteLarge)
        
        // 環狀進度條的顏色
        myActivityIndicator.color = UIColor.red
        
        // 底色
        myActivityIndicator.backgroundColor = UIColor.gray
        
        myActivityIndicator.center = CGPoint(
            x: UIScreen.main.bounds.size.width * 0.5,
            y: UIScreen.main.bounds.size.height * 0.4)
        self.view.addSubview(myActivityIndicator);
        
        
        let app = UIApplication.shared.delegate as! AppDelegate
        if (app.Connect_state == nil){
            app.Connect_Write(false)
            print ("write false")
            //Layout()
        }
        
        
//        if app.Connect_state == true
//        {
//
//            if (app.comeFromPage=="Re_Connect"){
//                GetDeviceInfo()
//                print("")
//
//            }
//            if (app.comeFromPage=="Memory_Load" || app.comeFromPage=="Configuration" ){
//                ShowUIInfo()
//            }
//        }
        
        if app.Connect_state == true
        {
            myActivityIndicator.startAnimating()
            get_IN_OUT_Config()
            Input_num = (app.Input as NSString).integerValue
            Output_num = (app.Output as NSString).integerValue
            //GetDeviceInfo()
//            Layout()
//            ShowUIInfo()
            print ("GetDevice==>")
            
            Lab_DeviceInfo.text = "   Name：" + app.DN + "\n" + "          IP：" + app.IP
            Lab_DeviceInfo.font = UIFont.boldSystemFont(ofSize: 18.0)
//            //Lab_DeviceInfo.text = "   Name：" + app.DN + "\n" + "          IP：" + app.IP
//            //Lab_DeviceInfo.font = UIFont.boldSystemFont(ofSize: 18.0)
//            Btn_Input.setTitle(app.IN1, forSegmentAt: 0)
//            Btn_Input.setTitle(app.IN2, forSegmentAt: 1)
//            Btn_Input.setTitle(app.IN3, forSegmentAt: 2)
//            Btn_Input.setTitle(app.IN4, forSegmentAt: 3)
        }
        else
        {

            Btn_Info_Position.isEnabled = false
            //Btn_Conn_Position
            Btn_Config_Position.isEnabled = false
            
            print ("Not GetDevice==>")
            
            Lab_DeviceInfo.text = ""
            Segmented_AV.isEnabled = false
            Segmented_AF.isEnabled = false  // 預設為不可點選
            
            Segmented_Input1.isEnabled = false
            Segmented_Input1.setTitle("1", forSegmentAt: 0)
            Segmented_Input1.setTitle("2", forSegmentAt: 1)
            Segmented_Input1.setTitle("3", forSegmentAt: 2)
            Segmented_Input1.setTitle("4", forSegmentAt: 3)
            
            Segmented_Input2.isEnabled = false
            if(Input_num>4){
                Segmented_Input2.setTitle("5", forSegmentAt: 0)
                Segmented_Input2.setTitle("6", forSegmentAt: 1)
            }
            if(Input_num>6){
                Segmented_Input2.setTitle("7", forSegmentAt: 2)
                Segmented_Input2.setTitle("8", forSegmentAt: 3)
            }
            
            Segmented_Input3.isEnabled = false
            Segmented_Input4.isEnabled = false
            if(Input_num>8){
            Segmented_Input3.setTitle("9", forSegmentAt: 0)
            Segmented_Input3.setTitle("10", forSegmentAt: 1)
            Segmented_Input3.setTitle("11", forSegmentAt: 2)
            Segmented_Input3.setTitle("12", forSegmentAt: 3)
            Segmented_Input4.setTitle("13", forSegmentAt: 0)
            Segmented_Input4.setTitle("14", forSegmentAt: 1)
            Segmented_Input4.setTitle("15", forSegmentAt: 2)
            Segmented_Input4.setTitle("16", forSegmentAt: 3)
            }
            
            Segmented_Input5.isEnabled = false
            Segmented_Input6.isEnabled = false
            Segmented_Input7.isEnabled = false
            Segmented_Input8.isEnabled = false
            if(Input_num>16){
            Segmented_Input5.setTitle("17", forSegmentAt: 0)
            Segmented_Input5.setTitle("18", forSegmentAt: 1)
            Segmented_Input5.setTitle("19", forSegmentAt: 2)
            Segmented_Input5.setTitle("20", forSegmentAt: 3)
            Segmented_Input6.setTitle("21", forSegmentAt: 0)
            Segmented_Input6.setTitle("22", forSegmentAt: 1)
            Segmented_Input6.setTitle("23", forSegmentAt: 2)
            Segmented_Input6.setTitle("24", forSegmentAt: 3)
            Segmented_Input7.setTitle("25", forSegmentAt: 0)
            Segmented_Input7.setTitle("26", forSegmentAt: 1)
            Segmented_Input7.setTitle("27", forSegmentAt: 2)
            Segmented_Input7.setTitle("28", forSegmentAt: 3)
            Segmented_Input8.setTitle("29", forSegmentAt: 0)
            Segmented_Input8.setTitle("30", forSegmentAt: 1)
            Segmented_Input8.setTitle("31", forSegmentAt: 2)
            Segmented_Input8.setTitle("32", forSegmentAt: 3)
            }
            
            Segmented_Output1.isEnabled = false
            Segmented_Output1.setTitle("1", forSegmentAt: 0)
            Segmented_Output1.setTitle("2", forSegmentAt: 1)
            if(Output_num>2){
            Segmented_Output1.setTitle("3", forSegmentAt: 2)
            Segmented_Output1.setTitle("4", forSegmentAt: 3)
            }
            
            Segmented_Output2.isEnabled = false
            if(Output_num>4){
            Segmented_Output2.setTitle("5", forSegmentAt: 0)
            Segmented_Output2.setTitle("6", forSegmentAt: 1)
            Segmented_Output2.setTitle("7", forSegmentAt: 2)
            Segmented_Output2.setTitle("8", forSegmentAt: 3)
            }
            Segmented_Output3.isEnabled = false
            Segmented_Output4.isEnabled = false

            if(Output_num>8){
            
            Segmented_Output3.setTitle("9", forSegmentAt: 0)
            Segmented_Output3.setTitle("10", forSegmentAt: 1)
            Segmented_Output3.setTitle("11", forSegmentAt: 2)
            Segmented_Output3.setTitle("12", forSegmentAt: 3)
            Segmented_Output4.setTitle("13", forSegmentAt: 0)
            Segmented_Output4.setTitle("14", forSegmentAt: 1)
            Segmented_Output4.setTitle("15", forSegmentAt: 2)
            Segmented_Output4.setTitle("16", forSegmentAt: 3)
            }
            Segmented_Output5.isEnabled = false
            Segmented_Output6.isEnabled = false
            Segmented_Output7.isEnabled = false
            Segmented_Output8.isEnabled = false
            
            if(Output_num>16){
            Segmented_Output5.setTitle("17", forSegmentAt: 0)
            Segmented_Output5.setTitle("18", forSegmentAt: 1)
            Segmented_Output5.setTitle("19", forSegmentAt: 2)
            Segmented_Output5.setTitle("20", forSegmentAt: 3)
            Segmented_Output6.setTitle("21", forSegmentAt: 0)
            Segmented_Output6.setTitle("22", forSegmentAt: 1)
            Segmented_Output6.setTitle("23", forSegmentAt: 2)
            Segmented_Output6.setTitle("24", forSegmentAt: 3)
            Segmented_Output7.setTitle("25", forSegmentAt: 0)
            Segmented_Output7.setTitle("26", forSegmentAt: 1)
            Segmented_Output7.setTitle("27", forSegmentAt: 2)
            Segmented_Output7.setTitle("28", forSegmentAt: 3)
            Segmented_Output8.setTitle("29", forSegmentAt: 0)
            Segmented_Output8.setTitle("30", forSegmentAt: 1)
            Segmented_Output8.setTitle("31", forSegmentAt: 2)
            Segmented_Output8.setTitle("32", forSegmentAt: 3)
            }
            
            
            Segmented_Memory.isEnabled = false
            
            
//            Lab_DeviceInfo.text = ""

//            Btn_AV.isEnabled = false
//            Btn_Input.setTitle("1", forSegmentAt: 0)
//            Btn_Input.setTitle("2", forSegmentAt: 1)
//            Btn_Input.setTitle("3", forSegmentAt: 2)
//            Btn_Input.setTitle("4", forSegmentAt: 3)
//            Btn_Input.isEnabled = false
//            Btn_Memory.isEnabled = false
//            BtnOut1.isEnabled = false
//            BtnOut2.isEnabled = false
//            BtnOut3.isEnabled = false
//            BtnOut4.isEnabled = false
//            BtnOut1.setTitle("1(V:0)", for: .normal)
//            BtnOut2.setTitle("2(V:0)", for: .normal)
//            BtnOut3.setTitle("3(V:0)", for: .normal)
//            BtnOut4.setTitle("4(V:0)", for: .normal)
        }
        
        if app.Connect_state == true
        {

            if (app.comeFromPage=="Re_Connect"){
                GetDeviceInfo()
                print("")

            }
            if (app.comeFromPage=="Memory_Load" || app.comeFromPage=="Configuration" ){
                ShowUIInfo()
            }
            myActivityIndicator.stopAnimating()
        }




    }
    
    func get_IN_OUT_Config() {
        //=========== Get Input Label Name ===========//
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN1")) != nil
        {
            //IN_Port1 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN1"))!
            //app.SetDeviceInfo(Field: standard_Key(Key: "IN1"), Value: IN_Port1)
            //IN_Port1 = UserDefaults.standard.string(forKey: "IN1")!
            IN_Port1 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN1"))!
            print(app.DN)
            print("IN_Port1==>")
            print(IN_Port1)
            app.SetDeviceInfo(Field: "IN1", Value: IN_Port1)
            Input_Clicked_Name = IN_Port1//預設值
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN2")) != nil
        {
            //IN_Port2 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN2"))!
            //app.SetDeviceInfo(Field: standard_Key(Key: "IN2"), Value: IN_Port2)
            IN_Port2 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN2"))!
            print("IN_Port2==>")
            print(IN_Port2)
            app.SetDeviceInfo(Field: "IN2", Value: IN_Port2)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN3")) != nil
        {
            IN_Port3 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN3"))!
            app.SetDeviceInfo(Field: "IN3", Value: IN_Port3)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN4")) != nil
        {
            IN_Port4 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN4"))!
            app.SetDeviceInfo(Field: "IN4", Value: IN_Port4)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN5")) != nil
        {
            IN_Port5 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN5"))!
            app.SetDeviceInfo(Field: "IN5", Value: IN_Port5)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN6")) != nil
        {
            IN_Port6 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN6"))!
            app.SetDeviceInfo(Field: "IN6", Value: IN_Port6)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN7")) != nil
        {
            IN_Port7 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN7"))!
            app.SetDeviceInfo(Field: "IN7", Value: IN_Port7)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN8")) != nil
        {
            IN_Port8 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN8"))!
            app.SetDeviceInfo(Field: "IN8", Value: IN_Port8)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN9")) != nil
        {
            IN_Port9 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN9"))!
            app.SetDeviceInfo(Field: "IN9", Value: IN_Port9)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN10")) != nil
        {
            IN_Port10 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN10"))!
            app.SetDeviceInfo(Field: "IN10", Value: IN_Port10)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN11")) != nil
        {
            IN_Port11 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN11"))!
            app.SetDeviceInfo(Field: "IN11", Value: IN_Port11)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN12")) != nil
        {
            IN_Port12 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN12"))!
            app.SetDeviceInfo(Field: "IN12", Value: IN_Port12)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN13")) != nil
        {
            IN_Port13 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN13"))!
            app.SetDeviceInfo(Field: "IN13", Value: IN_Port13)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN14")) != nil
        {
            IN_Port14 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN14"))!
            app.SetDeviceInfo(Field: "IN14", Value: IN_Port14)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN15")) != nil
        {
            IN_Port15 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN15"))!
            app.SetDeviceInfo(Field: "IN15", Value: IN_Port15)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN16")) != nil
        {
            IN_Port16 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN16"))!
            app.SetDeviceInfo(Field: "IN16", Value: IN_Port16)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN17")) != nil
        {
            IN_Port17 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN17"))!
            app.SetDeviceInfo(Field: "IN17", Value: IN_Port17)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN18")) != nil
        {
            IN_Port18 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN18"))!
            app.SetDeviceInfo(Field: "IN18", Value: IN_Port18)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN19")) != nil
        {
            IN_Port19 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN19"))!
            app.SetDeviceInfo(Field: "IN19", Value: IN_Port19)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN20")) != nil
        {
            IN_Port20 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN20"))!
            app.SetDeviceInfo(Field: "IN20", Value: IN_Port20)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN21")) != nil
        {
            IN_Port21 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN21"))!
            app.SetDeviceInfo(Field: "IN21", Value: IN_Port21)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN22")) != nil
        {
            IN_Port22 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN22"))!
            app.SetDeviceInfo(Field: "IN22", Value: IN_Port22)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN23")) != nil
        {
            IN_Port23 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN23"))!
            app.SetDeviceInfo(Field: "IN23", Value: IN_Port23)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN24")) != nil
        {
            IN_Port24 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN24"))!
            app.SetDeviceInfo(Field: "IN24", Value: IN_Port24)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN25")) != nil
        {
            IN_Port25 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN25"))!
            app.SetDeviceInfo(Field: "IN25", Value: IN_Port25)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN26")) != nil
        {
            IN_Port26 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN26"))!
            app.SetDeviceInfo(Field: "IN26", Value: IN_Port26)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN27")) != nil
        {
            IN_Port27 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN27"))!
            app.SetDeviceInfo(Field: "IN27", Value: IN_Port27)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN28")) != nil
        {
            IN_Port28 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN28"))!
            app.SetDeviceInfo(Field: "IN28", Value: IN_Port28)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN29")) != nil
        {
            IN_Port29 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN29"))!
            app.SetDeviceInfo(Field: "IN29", Value: IN_Port29)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN30")) != nil
        {
            IN_Port30 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN30"))!
            app.SetDeviceInfo(Field: "IN30", Value: IN_Port30)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN31")) != nil
        {
            IN_Port31 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN31"))!
            app.SetDeviceInfo(Field: "IN31", Value: IN_Port31)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "IN32")) != nil
        {
            IN_Port32 = UserDefaults.standard.string(forKey: standard_Key(Key: "IN32"))!
            app.SetDeviceInfo(Field: "IN32", Value: IN_Port32)
        }
        
        //=========== Get Output Label Name ===========//
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT1")) != nil
        {
            OUT_Port1 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT1"))!
            app.SetDeviceInfo(Field:  "OUT1", Value: OUT_Port1)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT2")) != nil
        {
            OUT_Port2 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT2"))!
            app.SetDeviceInfo(Field: "OUT2", Value: OUT_Port2)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT3")) != nil
        {
            OUT_Port3 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT3"))!
            app.SetDeviceInfo(Field:"OUT3", Value: OUT_Port3)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT4")) != nil
        {
            OUT_Port4 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT4"))!
            app.SetDeviceInfo(Field: "OUT4", Value: OUT_Port4)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT5")) != nil
        {
            OUT_Port5 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT5"))!
            app.SetDeviceInfo(Field: "OUT5", Value: OUT_Port5)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT6")) != nil
        {
            OUT_Port6 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT6"))!
            app.SetDeviceInfo(Field: "OUT6", Value: OUT_Port6)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT7")) != nil
        {
            OUT_Port7 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT7"))!
            app.SetDeviceInfo(Field: "OUT7", Value: OUT_Port7)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT8")) != nil
        {
            OUT_Port8 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT8"))!
            app.SetDeviceInfo(Field: "OUT8", Value: OUT_Port8)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT9")) != nil
        {
            OUT_Port9 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT9"))!
            app.SetDeviceInfo(Field: "OUT9", Value: OUT_Port9)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT10")) != nil
        {
            OUT_Port10 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT10"))!
            app.SetDeviceInfo(Field: "OUT10", Value: OUT_Port10)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT11")) != nil
        {
            OUT_Port11 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT11"))!
            app.SetDeviceInfo(Field: "OUT11", Value: OUT_Port11)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT12")) != nil
        {
            OUT_Port12 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT12"))!
            app.SetDeviceInfo(Field: "OUT12", Value: OUT_Port12)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT13")) != nil
        {
            OUT_Port13 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT13"))!
            app.SetDeviceInfo(Field:  "OUT13", Value: OUT_Port13)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT14")) != nil
        {
            OUT_Port14 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT14"))!
            app.SetDeviceInfo(Field: "OUT14", Value: OUT_Port14)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT15")) != nil
        {
            OUT_Port15 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT15"))!
            app.SetDeviceInfo(Field: "OUT15", Value: OUT_Port15)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT16")) != nil
        {
            OUT_Port16 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT16"))!
            app.SetDeviceInfo(Field: "OUT16", Value: OUT_Port16)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT17")) != nil
        {
            OUT_Port17 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT17"))!
            app.SetDeviceInfo(Field: "OUT17", Value: OUT_Port17)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT18")) != nil
        {
            OUT_Port18 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT18"))!
            app.SetDeviceInfo(Field: "OUT18", Value: OUT_Port18)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT19")) != nil
        {
            OUT_Port19 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT19"))!
            app.SetDeviceInfo(Field:  "OUT19", Value: OUT_Port19)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT20")) != nil
        {
            OUT_Port20 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT20"))!
            app.SetDeviceInfo(Field: "OUT20", Value: OUT_Port20)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT21")) != nil
        {
            OUT_Port21 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT21"))!
            app.SetDeviceInfo(Field: "OUT21", Value: OUT_Port21)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT22")) != nil
        {
            OUT_Port22 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT22"))!
            app.SetDeviceInfo(Field: "OUT22", Value: OUT_Port22)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT23")) != nil
        {
            OUT_Port23 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT23"))!
            app.SetDeviceInfo(Field: "OUT23", Value: OUT_Port23)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT24")) != nil
        {
            OUT_Port24 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT24"))!
            app.SetDeviceInfo(Field: "OUT24", Value: OUT_Port24)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT25")) != nil
        {
            OUT_Port25 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT25"))!
            app.SetDeviceInfo(Field: "OUT25", Value: OUT_Port25)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT26")) != nil
        {
            OUT_Port26 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT26"))!
            app.SetDeviceInfo(Field: "OUT26", Value: OUT_Port26)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT27")) != nil
        {
            OUT_Port27 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT27"))!
            app.SetDeviceInfo(Field: "OUT27", Value: OUT_Port27)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT28")) != nil
        {
            OUT_Port28 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT28"))!
            app.SetDeviceInfo(Field: "OUT28", Value: OUT_Port28)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT29")) != nil
        {
            OUT_Port29 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT29"))!
            app.SetDeviceInfo(Field: "OUT29", Value: OUT_Port29)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT30")) != nil
        {
            OUT_Port30 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT30"))!
            app.SetDeviceInfo(Field: "OUT30", Value: OUT_Port30)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT31")) != nil
        {
            OUT_Port31 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT31"))!
            app.SetDeviceInfo(Field: "OUT31", Value: OUT_Port31)
        }
        if UserDefaults.standard.string(forKey: standard_Key(Key: "OUT32")) != nil
        {
            OUT_Port32 = UserDefaults.standard.string(forKey: standard_Key(Key: "OUT32"))!
            app.SetDeviceInfo(Field: "OUT32", Value: OUT_Port3)
        }
        
    }
    
    func standard_Key(Key: String?) ->String
    {
        return app.DN + "_"+Key!
    }
    
    @objc func Btn_Conn_Clicked(sender: UIButton) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Connnect") as UIViewController, animated: true)
    }
    
    @objc func Btn_Information_Clicked(sender: UIButton) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Information") as UIViewController, animated: true)
    }
    
    @objc func Btn_Config_Clicked(sender: UIButton) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Configuration") as UIViewController, animated: true)
    }
    
    
    func Layout(){
        
        fullSize = UIScreen.main.bounds.size
        
        //=========== center button ===========//
        Btn_Info_Position.addTarget(self, action: #selector(Btn_Information_Clicked(sender:)), for: .touchDown)//.touchDragInside
        Btn_Info_Position.setImage(#imageLiteral(resourceName: "Btn_Info"), for: UIControlState.normal)
        Btn_Info_Position.contentMode = .center

        scrollView.addSubview(Btn_Info_Position)
        Btn_Info_Position.translatesAutoresizingMaskIntoConstraints = false
        
        let top_Info = NSLayoutConstraint(item: Btn_Info_Position,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: scrollView,//self.Content_View,//Btn_Info_Position,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 10.0)

        let centerHorizontally_Info = NSLayoutConstraint(item: Btn_Info_Position,
                                                    attribute: .centerX,
                                                    relatedBy: .equal,
                                                    toItem: scrollView,//self.Content_View,
                                                    attribute: .centerX,
                                                    multiplier: 1.0,
                                                    constant: 0.0)

        NSLayoutConstraint.activate([top_Info,centerHorizontally_Info])
        
        NSLayoutConstraint(item: Btn_Info_Position,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 120.0).isActive = true
        
        NSLayoutConstraint(item: Btn_Info_Position,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 70.0).isActive = true

        //=========== left button ===========//
        Btn_Conn_Position.addTarget(self, action: #selector(Btn_Conn_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_Conn_Position.setImage(#imageLiteral(resourceName: "Btn_Conn"), for: UIControlState.normal)
        Btn_Conn_Position.contentMode = .center

        scrollView.addSubview(Btn_Conn_Position)
        Btn_Conn_Position.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Conn = NSLayoutConstraint(item: Btn_Conn_Position,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: Btn_Info_Position,
                                              attribute: .leading,
                                              multiplier: 1.0,
                                              constant: 20.0)//CGFloat(Double(fullSize.width) / 5)
        
        let top_Conn = NSLayoutConstraint(item: Btn_Conn_Position,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: scrollView,//self.Content_View,
                                          attribute: .top,
                                          multiplier: 1.0,
                                          constant: 10.0)
        
        NSLayoutConstraint.activate([leading_Conn , top_Conn])
        
        NSLayoutConstraint(item: Btn_Conn_Position,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 120.0).isActive = true
        
        NSLayoutConstraint(item: Btn_Conn_Position,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 70.0).isActive = true
        
        //=========== right button ===========//
        Btn_Config_Position.addTarget(self, action: #selector(Btn_Config_Clicked(sender:)), for: .touchDown)//.touchDragInside)
        Btn_Config_Position.setImage(#imageLiteral(resourceName: "Btn_Set"), for: UIControlState.normal)
        Btn_Config_Position.contentMode = .center
        
        scrollView.addSubview(Btn_Config_Position)
        
        Btn_Config_Position.translatesAutoresizingMaskIntoConstraints = false
        
        let trailing_Config = NSLayoutConstraint(item: Btn_Config_Position,
                                                 attribute: .leading,
                                                 relatedBy: .equal,
                                                 toItem: Btn_Info_Position,
                                                 attribute: .trailing,
                                                 multiplier: 1.0,
                                                 constant: -20.0)
        
        let top_Config = NSLayoutConstraint(item: Btn_Config_Position,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: scrollView,//self.Content_View,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 10.0)
        
        NSLayoutConstraint.activate([top_Config,trailing_Config])
        
        NSLayoutConstraint(item: Btn_Config_Position,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 120.0).isActive = true
        
        NSLayoutConstraint(item: Btn_Config_Position,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 70.0).isActive = true
        
        //=========== Device Info ===========//
        Lab_DeviceInfo.backgroundColor = uicolor

        scrollView.addSubview(Lab_DeviceInfo)
        
        Lab_DeviceInfo.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_DeviceInfo = NSLayoutConstraint(item: Lab_DeviceInfo,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self.view,//self.Content_View,      scrollView
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 0)
        
        
        let width_Lab_DeviceInfo = NSLayoutConstraint(item: Lab_DeviceInfo,
                                                    attribute: .width,
                                                    relatedBy: .equal,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1.0,
                                                    constant: screensize.width)
    
        let top_Lab_DeviceInfo = NSLayoutConstraint(item: Lab_DeviceInfo,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: scrollView,//Btn_Info_Position,//self.Content_View,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 100.0)
        
        let hight_Lab_DeviceInfo = NSLayoutConstraint(item: Lab_DeviceInfo,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: 70.0)
        
        let trailing_Lab_DeviceInfo = NSLayoutConstraint(item: Lab_DeviceInfo,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self.view,//Btn_Info_Position,//self.Content_View,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: -0.0)
    
        
        NSLayoutConstraint.activate([leading_Lab_DeviceInfo , top_Lab_DeviceInfo , hight_Lab_DeviceInfo , trailing_Lab_DeviceInfo])
        
        
        Lab_DeviceInfo.text = "   Name：" +  "\n" + "          IP："
        Lab_DeviceInfo.numberOfLines = 2
        Lab_DeviceInfo.font = UIFont.boldSystemFont(ofSize: 17)
        Lab_DeviceInfo.textColor = UIColor.white
        
        let width_segment_AV_Memory = (screensize.width - 40.0)/4*2
        let width_segment_Input_Output = (screensize.width - 40.0)/4*4
        //=========== AV Label ===========//
        //self.Content_View.addSubview(Lab_AV)
        Lab_AV.removeFromSuperview()
        scrollView.addSubview(Lab_AV)
        
        
        Lab_AV.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_AV = NSLayoutConstraint(item: Lab_AV,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: scrollView,//self.Content_View,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 5.0)
        
        let top_Lab_AV = NSLayoutConstraint(item: Lab_AV,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: Lab_DeviceInfo,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 60.0)
        
        let width_Lab_AV = NSLayoutConstraint(item: Lab_AV,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: 45.0)  ////////////////////////////45
        
        let hight_Lab_AV = NSLayoutConstraint(item: Lab_AV,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: 70.0)  ///////////////////////////70
        
        NSLayoutConstraint.activate([top_Lab_AV , leading_Lab_AV , width_Lab_AV , hight_Lab_AV])

        Lab_AV.text = "A/V"
        Lab_AV.font = UIFont.boldSystemFont(ofSize: 20) ////////////////////////////20
        Lab_AV.textColor = uicolor
        
        //=========== AV Segment ===========//
        let item = ["Video" , "Setting"]
        Segmented_AV = UISegmentedControl(items: item)
        Segmented_AV.selectedSegmentIndex = 0

        Segmented_AV.tintColor = uicolor
        Segmented_AV.addTarget(self, action: #selector(SettingEDID(sender:)), for: .valueChanged)
        Segmented_AV.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_AV)
        
        Segmented_AV.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_AV = NSLayoutConstraint(item: Segmented_AV,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: scrollView,//self.Content_View,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 30.0)
        
        let top_Segmented_AV = NSLayoutConstraint(item: Segmented_AV,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: Lab_AV,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 60.0)   //////////////////////////////60
        
        let width_Segmented_AV = NSLayoutConstraint(item: Segmented_AV,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: width_segment_AV_Memory)//180.0)
        
        let hight_Segmented_AV = NSLayoutConstraint(item: Segmented_AV,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: 45.0)   //////////////////////////////45
        
        NSLayoutConstraint.activate([top_Segmented_AV , leading_Segmented_AV , width_Segmented_AV , hight_Segmented_AV])
        
        //=========== Input Label ===========//
        scrollView.addSubview(Lab_Input)
        Lab_Input.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: scrollView,//self.Content_View,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 5.0)
        
        let top_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: Lab_AV,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 100.0)   //////////////////////////////100
        
        let width_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 90.0)  /////////////////////////90
        
        let hight_Lab_Input = NSLayoutConstraint(item: Lab_Input,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 70.0)   //////////////////////////70
        
        NSLayoutConstraint.activate([top_Lab_Input,leading_Lab_Input,width_Lab_Input,hight_Lab_Input])
        
        Lab_Input.text = "Input"
        Lab_Input.font = UIFont.boldSystemFont(ofSize: 20)  ///////////////////////////20
        Lab_Input.textColor = uicolor
        
        //=========== Input Segment ===========//
        //=========== Input 1 ===========//

        let item_Segmented_Input1 = ["1" , "2", "3" , "4"]

        Segmented_Input1 = UISegmentedControl(items: item_Segmented_Input1)
        Segmented_Input1.selectedSegmentIndex = 0
        Segmented_Input1.tag = 1
        
        Segmented_Input1.tintColor = uicolor
        Segmented_Input1.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
        Segmented_Input1.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Input1)
        Segmented_Input1.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Input1 = NSLayoutConstraint(item: Segmented_Input1,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: scrollView,//self.Content_View,
                                                         attribute: .leading,
                                                         multiplier: 1.0,
                                                         constant: 30.0)
        
        let top_Segmented_Input1 = NSLayoutConstraint(item: Segmented_Input1,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: Lab_Input,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: 60.0)   //////////////////////////////60
        
        let width_Segmented_Input1 = NSLayoutConstraint(item: Segmented_Input1,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: width_segment_Input_Output)
        
        let hight_Segmented_Input1 = NSLayoutConstraint(item: Segmented_Input1,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .notAnAttribute,
                                                       multiplier: 1.0,
                                                       constant: 45.0)   //////////////////////////////45
        
        NSLayoutConstraint.activate([top_Segmented_Input1 , leading_Segmented_Input1 , width_Segmented_Input1 , hight_Segmented_Input1])
        
        if(Input_num > 4) {
            
        //=========== Input 2 ===========//
        var item_Segmented_Input2 = ["5" , "6", "7" , "8"]

        if(Input_num == 6)
        {
            item_Segmented_Input2 = ["5" , "6"]
        }
            
        Segmented_Input2 = UISegmentedControl(items: item_Segmented_Input2)
        Segmented_Input2.selectedSegmentIndex = -1
        Segmented_Input2.tag = 2
            
        Segmented_Input2.tintColor = uicolor
        Segmented_Input2.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
        Segmented_Input2.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Input2)
        Segmented_Input2.translatesAutoresizingMaskIntoConstraints = false
            
        var width_Segmented_Input2 = NSLayoutConstraint(item: Segmented_Input2,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output)
        if(Input_num == 6)
        {
            width_Segmented_Input2 = NSLayoutConstraint(item: Segmented_Input2,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output/2)
        }
            
        let leading_Segmented_Input2 = NSLayoutConstraint(item: Segmented_Input2,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: scrollView,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 30.0)
            
        let top_Segmented_Input2 = NSLayoutConstraint(item: Segmented_Input2,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: Segmented_Input1,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 45.0)   //////////////////////////////45
            
        let hight_Segmented_Input2 = NSLayoutConstraint(item: Segmented_Input2,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 45.0)   //////////////////////////////45
            
            NSLayoutConstraint.activate([top_Segmented_Input2 , leading_Segmented_Input2 , width_Segmented_Input2 , hight_Segmented_Input2])
        }
        
        if(Input_num > 8) {
        //=========== Input 3 ===========//
        let item_Segmented_Input3 = ["9" , "10", "11" , "12"]
        Segmented_Input3 = UISegmentedControl(items: item_Segmented_Input3)
        Segmented_Input3.selectedSegmentIndex = -1
        Segmented_Input3.tag = 3
        
        Segmented_Input3.tintColor = uicolor
        Segmented_Input3.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
        Segmented_Input3.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Input3)
        Segmented_Input3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Input3 = NSLayoutConstraint(item: Segmented_Input3,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,//self.Content_View,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 30.0)
        
        let top_Segmented_Input3 = NSLayoutConstraint(item: Segmented_Input3,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Segmented_Input2,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 45.0)   //////////////////////////////
        
        let width_Segmented_Input3 = NSLayoutConstraint(item: Segmented_Input3,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: width_segment_Input_Output)//360.0)
        
        let hight_Segmented_Input3 = NSLayoutConstraint(item: Segmented_Input3,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 45.0)   //////////////////////////////
            
//        let trailing_Segmented_Input3 = NSLayoutConstraint(item: Segmented_Input3,
//                                                               attribute: .trailing,
//                                                               relatedBy: .greaterThanOrEqual,
//                                                               toItem: scrollView,
//                                                               attribute: .trailing,
//                                                               multiplier: 1.0,
//                                                               constant: -0.0)
        
        NSLayoutConstraint.activate([top_Segmented_Input3 , leading_Segmented_Input3 , width_Segmented_Input3 , hight_Segmented_Input3])
        
        //=========== Input 4 ===========//
        let item_Segmented_Input4 = ["13" , "14", "15" , "16"]
        Segmented_Input4 = UISegmentedControl(items: item_Segmented_Input4)
        Segmented_Input4.selectedSegmentIndex = -1
        Segmented_Input4.tag = 4
        
        Segmented_Input4.tintColor = uicolor
        Segmented_Input4.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
        Segmented_Input4.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Input4)
        Segmented_Input4.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Input4 = NSLayoutConstraint(item: Segmented_Input4,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,//self.Content_View,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 30.0)
        
        let top_Segmented_Input4 = NSLayoutConstraint(item: Segmented_Input4,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Segmented_Input3,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 45.0)   //////////////////////////////
        
        let width_Segmented_Input4 = NSLayoutConstraint(item: Segmented_Input4,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: width_segment_Input_Output)//360.0)
        
        let hight_Segmented_Input4 = NSLayoutConstraint(item: Segmented_Input4,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 45.0)   //////////////////////////////
        
        NSLayoutConstraint.activate([top_Segmented_Input4 , leading_Segmented_Input4 , width_Segmented_Input4 , hight_Segmented_Input4])
        }
        
        if(Input_num > 16) {
            
            //=========== Input 5 ===========//
            let item_Segmented_Input5 = ["17" , "18", "19" , "20"]
            Segmented_Input5 = UISegmentedControl(items: item_Segmented_Input5)
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input5.tag = 5
            
            Segmented_Input5.tintColor = uicolor
            Segmented_Input5.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
            Segmented_Input5.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Input5)
            Segmented_Input5.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Input5 = NSLayoutConstraint(item: Segmented_Input5,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: scrollView,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 30.0)
            
            let top_Segmented_Input5 = NSLayoutConstraint(item: Segmented_Input5,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: Segmented_Input4,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 45.0)   //////////////////////////////
            
            let width_Segmented_Input5 = NSLayoutConstraint(item: Segmented_Input5,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output)
            
            let hight_Segmented_Input5 = NSLayoutConstraint(item: Segmented_Input5,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 45.0)   //////////////////////////////
            
            NSLayoutConstraint.activate([top_Segmented_Input5 , leading_Segmented_Input5 , width_Segmented_Input5 , hight_Segmented_Input5])
            
            //=========== Input 6 ===========//
            let item_Segmented_Input6 = ["21" , "22", "23" , "24"]
            Segmented_Input6 = UISegmentedControl(items: item_Segmented_Input6)
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input6.tag = 6
            
            Segmented_Input6.tintColor = uicolor
            Segmented_Input6.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
            Segmented_Input6.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Input6)
            Segmented_Input6.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Input6 = NSLayoutConstraint(item: Segmented_Input6,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: scrollView,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 30.0)
            
            let top_Segmented_Input6 = NSLayoutConstraint(item: Segmented_Input6,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: Segmented_Input5,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 45.0)   //////////////////////////////
            
            let width_Segmented_Input6 = NSLayoutConstraint(item: Segmented_Input6,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output)
            
            let hight_Segmented_Input6 = NSLayoutConstraint(item: Segmented_Input6,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 45.0)   //////////////////////////////
            
            NSLayoutConstraint.activate([top_Segmented_Input6 , leading_Segmented_Input6 , width_Segmented_Input6 , hight_Segmented_Input6])
            
            //=========== Input 7 ===========//
            let item_Segmented_Input7 = ["25" , "26", "27" , "28"]
            Segmented_Input7 = UISegmentedControl(items: item_Segmented_Input7)
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input7.tag = 7
            
            Segmented_Input7.tintColor = uicolor
            Segmented_Input7.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
            Segmented_Input7.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Input7)
            Segmented_Input7.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Input7 = NSLayoutConstraint(item: Segmented_Input7,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: scrollView,//self.Content_View,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 30.0)
            
            let top_Segmented_Input7 = NSLayoutConstraint(item: Segmented_Input7,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: Segmented_Input6,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 45.0)   //////////////////////////////
            
            let width_Segmented_Input7 = NSLayoutConstraint(item: Segmented_Input7,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Input7 = NSLayoutConstraint(item: Segmented_Input7,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 45.0)   //////////////////////////////
            
            NSLayoutConstraint.activate([top_Segmented_Input7 , leading_Segmented_Input7 , width_Segmented_Input7 , hight_Segmented_Input7])
            
            //=========== Input 8 ===========//
            let item_Segmented_Input8 = ["29" , "30", "31" , "32"]
            Segmented_Input8 = UISegmentedControl(items: item_Segmented_Input8)
            Segmented_Input8.selectedSegmentIndex = -1
            Segmented_Input8.tag = 8
            
            Segmented_Input8.tintColor = uicolor
            Segmented_Input8.addTarget(self, action: #selector(changeInput(sender:)), for: .valueChanged)
            Segmented_Input8.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Input8)
            Segmented_Input8.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Input8 = NSLayoutConstraint(item: Segmented_Input8,
                                                              attribute: .leading,
                                                              relatedBy: .equal,
                                                              toItem: scrollView,//self.Content_View,
                                                              attribute: .leading,
                                                              multiplier: 1.0,
                                                              constant: 30.0)
            
            let top_Segmented_Input8 = NSLayoutConstraint(item: Segmented_Input8,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: Segmented_Input7,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 45.0)   //////////////////////////////
            
            let width_Segmented_Input8 = NSLayoutConstraint(item: Segmented_Input8,
                                                            attribute: .width,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Input8 = NSLayoutConstraint(item: Segmented_Input8,
                                                            attribute: .height,
                                                            relatedBy: .equal,
                                                            toItem: nil,
                                                            attribute: .notAnAttribute,
                                                            multiplier: 1.0,
                                                            constant: 45.0)   //////////////////////////////

            NSLayoutConstraint.activate([top_Segmented_Input8 , leading_Segmented_Input8 , width_Segmented_Input8 , hight_Segmented_Input8])
        }
        
        
        //=========== Output Label ===========//
        scrollView.addSubview(Lab_Output)
        Lab_Output.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: scrollView,
                                                    attribute: .leading,
                                                    multiplier: 1.0,
                                                    constant: 5.0)
        
        var top_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Lab_Input,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: (CGFloat(55 + (Double(Input_num) / 4 * 45.0))))   //////////////////////////////55,45
        if(Input_num == 6){
            top_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Lab_Input,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: (CGFloat(55 + (Double(Input_num+2) / 4 * 45.0))))   //////////////////////////////55,45
        }
        
        let width_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let hight_Lab_Output = NSLayoutConstraint(item: Lab_Output,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 70.0)
        
      NSLayoutConstraint.activate([top_Lab_Output,leading_Lab_Output,width_Lab_Output,hight_Lab_Output])
        
        Lab_Output.text = "Output"
        Lab_Output.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Output.textColor = uicolor
        
        //=========== Output AllOff ===========//
        
         let item_AF = ["ALL","OFF"]
         Segmented_AF = UISegmentedControl(items: item_AF)
         Segmented_AF.selectedSegmentIndex = -1
         Segmented_AF.tintColor = uicolor
         //Segmented_AF.isEnabled=false
        
        
         Segmented_AF.addTarget(self, action: #selector(changeAllOff(sender:)), for: .valueChanged)
         Segmented_AF.layer.cornerRadius = 10.0
         scrollView.addSubview(Segmented_AF)
         Segmented_AF.translatesAutoresizingMaskIntoConstraints = false
        
         let leading_Segmented_AF = NSLayoutConstraint(item: Segmented_AF,
         attribute: .leading,
         relatedBy: .equal,
         toItem: scrollView,
         attribute: .leading,
         multiplier: 1.0,
         constant: 30.0)
        
         let top_Segmented_AF = NSLayoutConstraint(item: Segmented_AF,
         attribute: .top,
         relatedBy: .equal,
         toItem: Lab_Output,
         attribute: .top,
         multiplier: 1.0,
         constant: 60.0)
        
         let width_segmented_AF = NSLayoutConstraint(item: Segmented_AF,
         attribute: .width,
         relatedBy: .equal,
         toItem: nil,
         attribute: .notAnAttribute,
         multiplier: 1.0,
         constant: width_segment_AV_Memory)
        
         let height_Segmented_AF = NSLayoutConstraint(item: Segmented_AF,
         attribute: .height,
         relatedBy: .equal,
         toItem: nil,
         attribute: .notAnAttribute,
         multiplier: 1.0,
         constant: 45.0)
        
         NSLayoutConstraint.activate([top_Segmented_AF , leading_Segmented_AF , width_segmented_AF, height_Segmented_AF])
 
        
        //=========== Output Segment ===========//
        //=========== Output 1 ===========//
        var item_Segmented_Output1 = ["1(V:0)" , "2(V:0)", "3(V:0)" , "4(V:0)"]
        if(Output_num == 2){
            item_Segmented_Output1 = ["1(V:0)" , "2(V:0)"]
            
        }
        Segmented_Output1 = UISegmentedControl(items: item_Segmented_Output1)
        Segmented_Output1.selectedSegmentIndex = -1
        Segmented_Output1.tag = 1
        
        Segmented_Output1.tintColor = uicolor
        Segmented_Output1.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
        Segmented_Output1.layer.cornerRadius = 10.0
        Segmented_Output1.removeFromSuperview()
        scrollView.addSubview(Segmented_Output1)
        Segmented_Output1.translatesAutoresizingMaskIntoConstraints = false
        var width_Segmented_Output1 = NSLayoutConstraint(item: Segmented_Output1,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: width_segment_Input_Output)
        if(Output_num == 2){
            width_Segmented_Output1 = NSLayoutConstraint(item: Segmented_Output1,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: width_segment_Input_Output/2)
        }

        
        
        
        
        let leading_Segmented_Output1 = NSLayoutConstraint(item: Segmented_Output1,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: scrollView,//self.Content_View,
            attribute: .leading,
            multiplier: 1.0,
            constant: 30.0)
        
        let top_Segmented_Output1 = NSLayoutConstraint(item: Segmented_Output1,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Segmented_AF,    // 原為Lab_Output
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 60.0)          // 原為 60.0
        
        
        
        let hight_Segmented_Output1 = NSLayoutConstraint(item: Segmented_Output1,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 45.0)
        
        NSLayoutConstraint.activate([top_Segmented_Output1 , leading_Segmented_Output1 , width_Segmented_Output1 , hight_Segmented_Output1])
        
        if(Output_num>4){
        //=========== Output 2 ===========//
        let item_Segmented_Output2 = ["5(V:0)" , "6(V:0)", "7(V:0)" , "8(V:0)"]
        Segmented_Output2 = UISegmentedControl(items: item_Segmented_Output2)
        Segmented_Output2.selectedSegmentIndex = -1
        Segmented_Output2.tag = 2
        
        Segmented_Output2.tintColor = uicolor
        Segmented_Output2.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
        Segmented_Output2.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Output2)
        Segmented_Output2.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Output2 = NSLayoutConstraint(item: Segmented_Output2,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,//self.Content_View,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 30.0)
        
        let top_Segmented_Output2 = NSLayoutConstraint(item: Segmented_Output2,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Segmented_Output1,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 45.0)
        
        let width_Segmented_Output2 = NSLayoutConstraint(item: Segmented_Output2,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: width_segment_Input_Output)//360.0)
        
        let hight_Segmented_Output2 = NSLayoutConstraint(item: Segmented_Output2,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 45.0)
        
        NSLayoutConstraint.activate([top_Segmented_Output2 , leading_Segmented_Output2 , width_Segmented_Output2 , hight_Segmented_Output2])
        }
        if(Output_num>8){
        //=========== Output 3 ===========//
        let item_Segmented_Output3 = ["9(V:0)" , "10(V:0)", "11(V:0)" , "12(V:0)"]
        Segmented_Output3 = UISegmentedControl(items: item_Segmented_Output3)
        Segmented_Output3.selectedSegmentIndex = -1
        Segmented_Output3.tag = 3
        
        Segmented_Output3.tintColor = uicolor
        Segmented_Output3.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
        Segmented_Output3.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Output3)
        Segmented_Output3.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Output3 = NSLayoutConstraint(item: Segmented_Output3,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: scrollView,//self.Content_View,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 30.0)
        
        let top_Segmented_Output3 = NSLayoutConstraint(item: Segmented_Output3,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Segmented_Output2,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 45.0)
        
        let width_Segmented_Output3 = NSLayoutConstraint(item: Segmented_Output3,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: width_segment_Input_Output)//360.0)
        
        let hight_Segmented_Output3 = NSLayoutConstraint(item: Segmented_Output3,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 45.0)
        
        NSLayoutConstraint.activate([top_Segmented_Output3 , leading_Segmented_Output3 , width_Segmented_Output3 , hight_Segmented_Output3])
        
        //=========== Output 4 ===========//
        let item_Segmented_Output4 = ["13(V:0)" , "14(V:0)", "15(V:0)" , "16(V:0)"]
        Segmented_Output4 = UISegmentedControl(items: item_Segmented_Output4)
        Segmented_Output4.selectedSegmentIndex = -1
        Segmented_Output4.tag = 4
        
        Segmented_Output4.tintColor = uicolor
        Segmented_Output4.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
        Segmented_Output4.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Output4)
        Segmented_Output4.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Output4 = NSLayoutConstraint(item: Segmented_Output4,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: scrollView,//self.Content_View,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 30.0)
        
        let top_Segmented_Output4 = NSLayoutConstraint(item: Segmented_Output4,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: Segmented_Output3,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 45.0)
        
        let width_Segmented_Output4 = NSLayoutConstraint(item: Segmented_Output4,
                                                         attribute: .width,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: width_segment_Input_Output)//360.0)
        
        let hight_Segmented_Output4 = NSLayoutConstraint(item: Segmented_Output4,
                                                         attribute: .height,
                                                         relatedBy: .equal,
                                                         toItem: nil,
                                                         attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: 45.0)

        NSLayoutConstraint.activate([top_Segmented_Output4 , leading_Segmented_Output4 , width_Segmented_Output4 , hight_Segmented_Output4])
        }
        
        if(Output_num>16){
            //=========== Output 5 ===========//
            let item_Segmented_Output5 = ["17(V:0)" , "18(V:0)", "19(V:0)" , "20(V:0)"]
            Segmented_Output5 = UISegmentedControl(items: item_Segmented_Output5)
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output5.tag = 5
            
            Segmented_Output5.tintColor = uicolor
            Segmented_Output5.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
            Segmented_Output5.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Output5)
            Segmented_Output5.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Output5 = NSLayoutConstraint(item: Segmented_Output5,
                                                               attribute: .leading,
                                                               relatedBy: .equal,
                                                               toItem: scrollView,//self.Content_View,
                                                               attribute: .leading,
                                                               multiplier: 1.0,
                                                               constant: 30.0)
            
            let top_Segmented_Output5 = NSLayoutConstraint(item: Segmented_Output5,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: Segmented_Output4,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 45.0)
            
            let width_Segmented_Output5 = NSLayoutConstraint(item: Segmented_Output5,
                                                             attribute: .width,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Output5 = NSLayoutConstraint(item: Segmented_Output5,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 45.0)
            
            NSLayoutConstraint.activate([top_Segmented_Output5 , leading_Segmented_Output5 , width_Segmented_Output5 , hight_Segmented_Output5])
            
            //=========== Output 6 ===========//
            let item_Segmented_Output6 = ["21(V:0)" , "22(V:0)", "23(V:0)" , "24(V:0)"]
            Segmented_Output6 = UISegmentedControl(items: item_Segmented_Output6)
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output6.tag = 6
            
            Segmented_Output6.tintColor = uicolor
            Segmented_Output6.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
            Segmented_Output6.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Output6)
            Segmented_Output6.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Output6 = NSLayoutConstraint(item: Segmented_Output6,
                                                               attribute: .leading,
                                                               relatedBy: .equal,
                                                               toItem: scrollView,//self.Content_View,
                                                               attribute: .leading,
                                                               multiplier: 1.0,
                                                               constant: 30.0)
            
            let top_Segmented_Output6 = NSLayoutConstraint(item: Segmented_Output6,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: Segmented_Output5,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 45.0)
            
            let width_Segmented_Output6 = NSLayoutConstraint(item: Segmented_Output6,
                                                             attribute: .width,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Output6 = NSLayoutConstraint(item: Segmented_Output6,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 45.0)
            
            NSLayoutConstraint.activate([top_Segmented_Output6 , leading_Segmented_Output6 , width_Segmented_Output6 , hight_Segmented_Output6])
            
            //=========== Output 7 ===========//
            let item_Segmented_Output7 = ["25(V:0)" , "26(V:0)", "27(V:0)" , "28(V:0)"]
            Segmented_Output7 = UISegmentedControl(items: item_Segmented_Output7)
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output7.tag = 7
            
            Segmented_Output7.tintColor = uicolor
            Segmented_Output7.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
            Segmented_Output7.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Output7)
            Segmented_Output7.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Output7 = NSLayoutConstraint(item: Segmented_Output7,
                                                               attribute: .leading,
                                                               relatedBy: .equal,
                                                               toItem: scrollView,
                                                               attribute: .leading,
                                                               multiplier: 1.0,
                                                               constant: 30.0)
            
            let top_Segmented_Output7 = NSLayoutConstraint(item: Segmented_Output7,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: Segmented_Output6,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 45.0)
            
            let width_Segmented_Output7 = NSLayoutConstraint(item: Segmented_Output7,
                                                             attribute: .width,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Output7 = NSLayoutConstraint(item: Segmented_Output7,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 45.0)
            
            NSLayoutConstraint.activate([top_Segmented_Output7 , leading_Segmented_Output7 , width_Segmented_Output7 , hight_Segmented_Output7])
            
            //=========== Output 6 ===========//
            let item_Segmented_Output8 = ["29(V:0)" , "30(V:0)", "31(V:0)" , "32(V:0)"]
            Segmented_Output8 = UISegmentedControl(items: item_Segmented_Output8)
            Segmented_Output8.selectedSegmentIndex = -1
            Segmented_Output8.tag = 8
            
            Segmented_Output8.tintColor = uicolor
            Segmented_Output8.addTarget(self, action: #selector(changeOutput(sender:)), for: .valueChanged)
            Segmented_Output8.layer.cornerRadius = 10.0
            scrollView.addSubview(Segmented_Output8)
            Segmented_Output8.translatesAutoresizingMaskIntoConstraints = false
            
            let leading_Segmented_Output8 = NSLayoutConstraint(item: Segmented_Output8,
                                                               attribute: .leading,
                                                               relatedBy: .equal,
                                                               toItem: scrollView,//self.Content_View,
                                                               attribute: .leading,
                                                               multiplier: 1.0,
                                                               constant: 30.0)
            
            let top_Segmented_Output8 = NSLayoutConstraint(item: Segmented_Output8,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: Segmented_Output7,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 45.0)
            
            let width_Segmented_Output8 = NSLayoutConstraint(item: Segmented_Output8,
                                                             attribute: .width,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: width_segment_Input_Output)//360.0)
            
            let hight_Segmented_Output8 = NSLayoutConstraint(item: Segmented_Output8,
                                                             attribute: .height,
                                                             relatedBy: .equal,
                                                             toItem: nil,
                                                             attribute: .notAnAttribute,
                                                             multiplier: 1.0,
                                                             constant: 45.0)
            
            NSLayoutConstraint.activate([top_Segmented_Output8 , leading_Segmented_Output8 , width_Segmented_Output8 , hight_Segmented_Output8])
        }
        
        //=========== Memory Label ===========//
        scrollView.addSubview(Lab_Memory)
        Lab_Memory.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Lab_Memory = NSLayoutConstraint(item: Lab_Memory,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: scrollView,//self.Content_View,
                                                    attribute: .leading,
                                                    multiplier: 1.0,
                                                    constant: 5.0)
        
        var top_Lab_Memory = NSLayoutConstraint(item: Lab_Memory,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Lab_Output,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: (CGFloat(115.0 + (Double(Output_num) / 4 * 45.0))))
        if(Output_num == 2){
            top_Lab_Memory = NSLayoutConstraint(item: Lab_Memory,
                                                attribute: .top,
                                                relatedBy: .equal,
                                                toItem: Lab_Output,
                                                attribute: .top,
                                                multiplier: 1.0,
                                                constant: (CGFloat(115.0 + (Double(Output_num+2) / 4 * 45.0))))
        }
        
        let width_Lab_Memory = NSLayoutConstraint(item: Lab_Memory,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 90.0)
        
        let hight_Lab_Memory = NSLayoutConstraint(item: Lab_Memory,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 70.0)
        
        NSLayoutConstraint.activate([top_Lab_Memory,leading_Lab_Memory,width_Lab_Memory,hight_Lab_Memory])
        
        
        Lab_Memory.text = "Memory"
        
        Lab_Memory.font = UIFont.boldSystemFont(ofSize: 20)
        Lab_Memory.textColor = uicolor
        
        
        //=========== Memory Segment ===========//
        
        
        let item_Segmented_Memory = ["Save" , "Load"]
        Segmented_Memory = UISegmentedControl(items: item_Segmented_Memory)
        Segmented_Memory.selectedSegmentIndex = -1
        
        Segmented_Memory.tintColor = uicolor
        
        
        Segmented_Memory.addTarget(self, action: #selector(MemoryClicked(sender:)), for: .valueChanged)
        
        Segmented_Memory.layer.cornerRadius = 10.0
        scrollView.addSubview(Segmented_Memory)
        Segmented_Memory.translatesAutoresizingMaskIntoConstraints = false
        
        let leading_Segmented_Memory = NSLayoutConstraint(item: Segmented_Memory,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: scrollView,//self.Content_View,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 30.0)
        
        let trailing_Segmented_Memory = NSLayoutConstraint(item: Segmented_Memory,
                                                          attribute: .trailing,
                                                          relatedBy: .lessThanOrEqual,
                                                          toItem: scrollView,//self.Content_View,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -160.0)
        
        let top_Segmented_Memory = NSLayoutConstraint(item: Segmented_Memory,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: Lab_Memory,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 60.0)
        
        let width_Segmented_Memory = NSLayoutConstraint(item: Segmented_Memory,
                                                        attribute: .width,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: width_segment_AV_Memory)//180.0)
        
        let hight_Segmented_Memory = NSLayoutConstraint(item: Segmented_Memory,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 45.0)
        
        let hight_Segmented_Memory_bottom = NSLayoutConstraint(item: Segmented_Memory,
                                                               attribute: .bottom,
                                                               relatedBy: .lessThanOrEqual,
                                                               toItem: scrollView,//self.Content_View,
                                                               attribute: .bottomMargin,
                                                               multiplier: 1.0,
                                                               constant: -3.0)
        NSLayoutConstraint.activate([hight_Segmented_Memory_bottom,top_Segmented_Memory,trailing_Segmented_Memory,leading_Segmented_Memory,width_Segmented_Memory,hight_Segmented_Memory])
    }
    
    @objc func MemoryClicked(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
                app.SetDeviceInfo(Field: "Memory_LoadSave",Value: "Save")
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Memory") as UIViewController, animated: true)
            break
        //app.SetDeviceInfo(Field: "Memory_LoadSave",Value: "Save")
        case 1:
                app.SetDeviceInfo(Field: "Memory_LoadSave",Value: "Load")
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Memory") as UIViewController, animated: true)
            break
            //app.SetDeviceInfo(Field: "Memory_LoadSave",Value: "Load")
        default:
            break
        }
    }
    @objc func SettingEDID(sender: UISegmentedControl){
       
        if(sender.selectedSegmentIndex == 1){
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "Setting") as UIViewController, animated: true)
        }
    }
    
    @objc func changeInput(sender: UISegmentedControl){

        Input_Clicked = ((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
        Input_Clicked_Name = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        //print(sender.titleForSegment(at: sender.selectedSegmentIndex))
        
        switch sender.selectedSegmentIndex {
        case 1:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)

        case 2:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)

        case 3:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)

        case 4:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)

        default:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)

        }
        
        switch sender.tag {
        case 1:
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 2:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 3:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 4:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
        case 5:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 6:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 7:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        case 8:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            
        default:
            Segmented_Input1.selectedSegmentIndex = -1
            Segmented_Input2.selectedSegmentIndex = -1
            Segmented_Input3.selectedSegmentIndex = -1
            Segmented_Input4.selectedSegmentIndex = -1
            Segmented_Input5.selectedSegmentIndex = -1
            Segmented_Input6.selectedSegmentIndex = -1
            Segmented_Input7.selectedSegmentIndex = -1
            Segmented_Input8.selectedSegmentIndex = -1
            
        }
        
        //print(Input_Clicked)
    }
    
    @objc func changeAllOff(sender: UISegmentedControl){
        
        if (Segmented_AF.selectedSegmentIndex == 0) {
        
           if(Output_num == 2)
           {
            Segmented_Output1.setTitle(app.OUT1 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
            Segmented_Output1.setTitle(app.OUT2 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
           }
           else if(Output_num > 2) {
            Segmented_Output1.setTitle(app.OUT1 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
            Segmented_Output1.setTitle(app.OUT2 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
            Segmented_Output1.setTitle(app.OUT3 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
            Segmented_Output1.setTitle(app.OUT4 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
            
            if(Output_num > 4) {
                Segmented_Output2.setTitle(app.OUT5 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                Segmented_Output2.setTitle(app.OUT6 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                Segmented_Output2.setTitle(app.OUT7 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                Segmented_Output2.setTitle(app.OUT8 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                
                if(Output_num > 8) {
                    Segmented_Output3.setTitle(app.OUT9 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                    Segmented_Output3.setTitle(app.OUT10 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                    Segmented_Output3.setTitle(app.OUT11 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                    Segmented_Output3.setTitle(app.OUT12 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                    
                    if(Output_num > 12) {
                        Segmented_Output4.setTitle(app.OUT13 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                        Segmented_Output4.setTitle(app.OUT14 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                        Segmented_Output4.setTitle(app.OUT15 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                        Segmented_Output4.setTitle(app.OUT16 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                        
                        if(Output_num > 16)
                        {
                            Segmented_Output5.setTitle(app.OUT17 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                            Segmented_Output5.setTitle(app.OUT18 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                            Segmented_Output5.setTitle(app.OUT19 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                            Segmented_Output5.setTitle(app.OUT20 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                            
                            if(Output_num > 20) {
                                Segmented_Output6.setTitle(app.OUT21 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                                Segmented_Output6.setTitle(app.OUT22 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                                Segmented_Output6.setTitle(app.OUT23 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                                Segmented_Output6.setTitle(app.OUT24 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                                
                                if(Output_num > 24) {
                                    Segmented_Output7.setTitle(app.OUT25 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                                    Segmented_Output7.setTitle(app.OUT26 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                                    Segmented_Output7.setTitle(app.OUT27 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                                    Segmented_Output7.setTitle(app.OUT28 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                                    
                                    if(Output_num > 28) {
                                        Segmented_Output8.setTitle(app.OUT29 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 0)
                                        Segmented_Output8.setTitle(app.OUT30 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 1)
                                        Segmented_Output8.setTitle(app.OUT31 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 2)
                                        Segmented_Output8.setTitle(app.OUT32 + "(V:" + Input_Clicked_Name + ")", forSegmentAt: 3)
                                    }
                                }
                            }
                        }
                    }
                }
              }
            }
            let IN = (Int.init(Input_Clicked))
            Switch_command(OUT_Port: 0, AV: "V", IN: Int(IN))
        
        }
        else if (Segmented_AF.selectedSegmentIndex == 1) {
            if(Output_num == 2)
            {
             Segmented_Output1.setTitle(app.OUT1, forSegmentAt: 0)
             Segmented_Output1.setTitle(app.OUT2, forSegmentAt: 1)
            }
            else if (Output_num > 2) {
                Segmented_Output1.setTitle(app.OUT1, forSegmentAt: 0)
                Segmented_Output1.setTitle(app.OUT2, forSegmentAt: 1)
                Segmented_Output1.setTitle(app.OUT3, forSegmentAt: 2)
                Segmented_Output1.setTitle(app.OUT4, forSegmentAt: 3)
                
                if (Output_num > 4) {
                    Segmented_Output2.setTitle(app.OUT5, forSegmentAt: 0)
                    Segmented_Output2.setTitle(app.OUT6, forSegmentAt: 1)
                    Segmented_Output2.setTitle(app.OUT7, forSegmentAt: 2)
                    Segmented_Output2.setTitle(app.OUT8, forSegmentAt: 3)
                    
                    if (Output_num > 8) {
                        Segmented_Output3.setTitle(app.OUT9, forSegmentAt: 0)
                        Segmented_Output3.setTitle(app.OUT10, forSegmentAt: 1)
                        Segmented_Output3.setTitle(app.OUT11, forSegmentAt: 2)
                        Segmented_Output3.setTitle(app.OUT12, forSegmentAt: 3)
                        
                        if (Output_num > 12) {
                            Segmented_Output4.setTitle(app.OUT13, forSegmentAt: 0)
                            Segmented_Output4.setTitle(app.OUT14, forSegmentAt: 1)
                            Segmented_Output4.setTitle(app.OUT15, forSegmentAt: 2)
                            Segmented_Output4.setTitle(app.OUT16, forSegmentAt: 3)
                            
                            if (Output_num > 16) {
                                Segmented_Output5.setTitle(app.OUT17, forSegmentAt: 0)
                                Segmented_Output5.setTitle(app.OUT18, forSegmentAt: 1)
                                Segmented_Output5.setTitle(app.OUT19, forSegmentAt: 2)
                                Segmented_Output5.setTitle(app.OUT20, forSegmentAt: 3)
                                
                                if (Output_num > 20) {
                                    Segmented_Output6.setTitle(app.OUT21, forSegmentAt: 0)
                                    Segmented_Output6.setTitle(app.OUT22, forSegmentAt: 1)
                                    Segmented_Output6.setTitle(app.OUT23, forSegmentAt: 2)
                                    Segmented_Output6.setTitle(app.OUT24, forSegmentAt: 3)
                                    
                                    if (Output_num > 24) {
                                        Segmented_Output7.setTitle(app.OUT25, forSegmentAt: 0)
                                        Segmented_Output7.setTitle(app.OUT26, forSegmentAt: 1)
                                        Segmented_Output7.setTitle(app.OUT27, forSegmentAt: 2)
                                        Segmented_Output7.setTitle(app.OUT28, forSegmentAt: 3)
                                        
                                        if (Output_num > 28) {
                                            Segmented_Output8.setTitle(app.OUT29, forSegmentAt: 0)
                                            Segmented_Output8.setTitle(app.OUT30, forSegmentAt: 1)
                                            Segmented_Output8.setTitle(app.OUT31, forSegmentAt: 2)
                                            Segmented_Output8.setTitle(app.OUT32, forSegmentAt: 3)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            let IN = (Int.init(0))
            Switch_command(OUT_Port: 0, AV: "V", IN: Int(IN))
        }
        
        Segmented_AF.selectedSegmentIndex = -1
    }
    
    
    @objc func changeOutput(sender: UISegmentedControl){

        let Output_No = String((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
        var title_Output = Output_No + "(V:" + Input_Clicked_Name + ")"
        switch Output_No {
        case "1":
            title_Output = app.OUT1 + "(V:" + Input_Clicked_Name + ")"
            
        case "2":
            title_Output = app.OUT2 + "(V:" + Input_Clicked_Name + ")"
            
        case "3":
            title_Output = app.OUT3 + "(V:" + Input_Clicked_Name + ")"
            
        case "4":
            title_Output = app.OUT4 + "(V:" + Input_Clicked_Name + ")"
            
        case "5":
            title_Output = app.OUT5 + "(V:" + Input_Clicked_Name + ")"
            
        case "6":
            title_Output = app.OUT6 + "(V:" + Input_Clicked_Name + ")"
            
        case "7":
            title_Output = app.OUT7 + "(V:" + Input_Clicked_Name + ")"
            
        case "8":
            title_Output = app.OUT8 + "(V:" + Input_Clicked_Name + ")"
            
        case "9":
            title_Output = app.OUT9 + "(V:" + Input_Clicked_Name + ")"
            
        case "10":
            title_Output = app.OUT10 + "(V:" + Input_Clicked_Name + ")"
            
        case "11":
            title_Output = app.OUT11 + "(V:" + Input_Clicked_Name + ")"
            
        case "12":
            title_Output = app.OUT12 + "(V:" + Input_Clicked_Name + ")"
            
        case "13":
            title_Output = app.OUT13 + "(V:" + Input_Clicked_Name + ")"
            
        case "14":
            title_Output = app.OUT14 + "(V:" + Input_Clicked_Name + ")"
            
        case "15":
            title_Output = app.OUT15 + "(V:" + Input_Clicked_Name + ")"
            
        case "16":
            title_Output = app.OUT16 + "(V:" + Input_Clicked_Name + ")"
            
        case "17":
            title_Output = app.OUT17 + "(V:" + Input_Clicked_Name + ")"
            
        case "18":
            title_Output = app.OUT18 + "(V:" + Input_Clicked_Name + ")"
            
        case "19":
            title_Output = app.OUT19 + "(V:" + Input_Clicked_Name + ")"
            
        case "20":
            title_Output = app.OUT20 + "(V:" + Input_Clicked_Name + ")"
            
        case "21":
            title_Output = app.OUT21 + "(V:" + Input_Clicked_Name + ")"
            
        case "22":
            title_Output = app.OUT22 + "(V:" + Input_Clicked_Name + ")"
            
        case "23":
            title_Output = app.OUT23 + "(V:" + Input_Clicked_Name + ")"
            
        case "24":
            title_Output = app.OUT24 + "(V:" + Input_Clicked_Name + ")"
            
        case "25":
            title_Output = app.OUT25 + "(V:" + Input_Clicked_Name + ")"
            
        case "26":
            title_Output = app.OUT26 + "(V:" + Input_Clicked_Name + ")"
            
        case "27":
            title_Output = app.OUT27 + "(V:" + Input_Clicked_Name + ")"
            
        case "28":
            title_Output = app.OUT28 + "(V:" + Input_Clicked_Name + ")"
        case "29":
            title_Output = app.OUT29 + "(V:" + Input_Clicked_Name + ")"
            
        case "30":
            title_Output = app.OUT30 + "(V:" + Input_Clicked_Name + ")"
            
        case "31":
            title_Output = app.OUT31 + "(V:" + Input_Clicked_Name + ")"
            
        case "32":
            title_Output = app.OUT32 + "(V:" + Input_Clicked_Name + ")"
            
        default:
            print("default")
            
        }

        //print("sender.tag==>")
        //print(sender.tag)
        //print("sender.selectedSegmentIndex==>")
        //print(sender.selectedSegmentIndex)
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("Case 1==>")
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        case 1:
            print("Case 2==>")
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        case 2:
            print("Case 3==>")
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        case 3:
            print("Case 4==>")
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        default:
            print("default")
            
        }
        
        let AV = "V："
        let IN = (Int.init(Input_Clicked))
        let IN_title = get_Input_Name(value: IN)
        let title: String = OUT_Port1 + "(" + AV + IN_title + ")"
        var Output_Port = (sender.tag-1)*4 + 1 + sender.selectedSegmentIndex
        
        //傳送指令
        //print("Output_Port==>" + String(Output_Port))
        Switch_command(OUT_Port: Output_Port, AV: "V", IN: Int(IN))
        
        //print(sender.tag)
        if(sender.tag == 1){
            Segmented_Output2.selectedSegmentIndex = -1
        } else if(sender.tag == 2){
            Segmented_Output1.selectedSegmentIndex = -1
        }
        
        var Seg_Position = CGSize(width: 0, height: 0)
        
        Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 1)
        if(Output_num > 2){
        Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 3)
        }
        if(Output_num>4){
        Segmented_Output2.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output2.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output2.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output2.setContentOffset(Seg_Position, forSegmentAt: 3)
        }
        if(Output_num>8){
        Segmented_Output3.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output3.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output3.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output3.setContentOffset(Seg_Position, forSegmentAt: 3)

        Segmented_Output4.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output4.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output4.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output4.setContentOffset(Seg_Position, forSegmentAt: 3)
        }
        if(Output_num>16){
        Segmented_Output5.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output5.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output5.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output5.setContentOffset(Seg_Position, forSegmentAt: 3)

        Segmented_Output6.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output6.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output6.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output6.setContentOffset(Seg_Position, forSegmentAt: 3)

        Segmented_Output7.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output7.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output7.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output7.setContentOffset(Seg_Position, forSegmentAt: 3)

        Segmented_Output8.setContentOffset(Seg_Position, forSegmentAt: 0)
        Segmented_Output8.setContentOffset(Seg_Position, forSegmentAt: 1)
        Segmented_Output8.setContentOffset(Seg_Position, forSegmentAt: 2)
        Segmented_Output8.setContentOffset(Seg_Position, forSegmentAt: 3)
        }

        Seg_Position = CGSize(width: 0, height: -8)
        sender.setContentOffset(Seg_Position, forSegmentAt: sender.selectedSegmentIndex)
        //print("title_Output==>")
        //print(title_Output)
        sender.setTitle(title_Output, forSegmentAt: sender.selectedSegmentIndex)
        
        
        switch sender.tag {
        case 1:

//            Segmented_Output1.setTitle(title, forSegmentAt: Segmented_Output1.selectedSegmentIndex)
//
//            //Segmented_Output1.setWidth(100, forSegmentAt: Segmented_Output1.selectedSegmentIndex)
//
//            Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 0)
//            Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 1)
//            Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 2)
//            Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: 3)
//            Seg_Position = CGSize(width: 0, height: -8)
//            Segmented_Output1.setContentOffset(Seg_Position, forSegmentAt: Segmented_Output1.selectedSegmentIndex)
            
//                        sender.setTitle(title, forSegmentAt: Segmented_Output1.selectedSegmentIndex)
//
//
//
//                        sender.setContentOffset(Seg_Position, forSegmentAt: 0)
//                        sender.setContentOffset(Seg_Position, forSegmentAt: 1)
//                        sender.setContentOffset(Seg_Position, forSegmentAt: 2)
//                        sender.setContentOffset(Seg_Position, forSegmentAt: 3)
//                        Seg_Position = CGSize(width: 0, height: -8)
//                        sender.setContentOffset(Seg_Position, forSegmentAt: sender.selectedSegmentIndex)

            
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
            
        case 2:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        case 3:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
        case 4:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
        case 5:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        case 6:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        case 7:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        case 8:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        default:
            Segmented_Output1.selectedSegmentIndex = -1
            Segmented_Output2.selectedSegmentIndex = -1
            Segmented_Output3.selectedSegmentIndex = -1
            Segmented_Output4.selectedSegmentIndex = -1
            Segmented_Output5.selectedSegmentIndex = -1
            Segmented_Output6.selectedSegmentIndex = -1
            Segmented_Output7.selectedSegmentIndex = -1
            Segmented_Output8.selectedSegmentIndex = -1
            
        }

    }
    
    func Switch_command(OUT_Port: Int, AV: String, IN: Int){
        print("1")
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let witch_OUT = UInt8(OUT_Port)
        //print(OUT_Port)
        //print(witch_OUT)
        
        let witch_IN = UInt8(IN)
        
        var bytes: [UInt8] = [ 0x00 , 0x00 , 0x00 , 0x00]
        let crc16table = CRC16Util()
        
        if app.Connect_state == true
        {
            //print("2")
            bytes = [0x20, 0x01, witch_OUT, witch_IN]
            //print(bytes)
            let senddata: [UInt8] = crc16table.CRC(data: bytes)
            //print("3")
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
    }
    
    func get_Input_Name(value IN: Int) -> String{
        
        var Input_Name: String = ""
        //print(IN)
        //print(IN+1)
        switch IN  {
            
        case 1:
            Input_Name = IN_Port1
            //print("Input_Name==>"+Input_Name)
            Segmented_Input1.setTitle(Input_Name, forSegmentAt: 0)
            //print("Input1==>")
        case 2:
            Input_Name = IN_Port2
            //print("Input_Name==>"+Input_Name)
            Segmented_Input1.setTitle(Input_Name, forSegmentAt: 1)
        case 3:
            Input_Name = IN_Port3
            Segmented_Input1.setTitle(Input_Name, forSegmentAt: 2)
        case 4:
            Input_Name = IN_Port4
            Segmented_Input1.setTitle(Input_Name, forSegmentAt: 3)
        case 5:
            Input_Name = IN_Port5
            Segmented_Input2.setTitle(Input_Name, forSegmentAt: 0)
        case 6:
            Input_Name = IN_Port6
            Segmented_Input2.setTitle(Input_Name, forSegmentAt: 1)
        case 7:
            Input_Name = IN_Port7
            Segmented_Input2.setTitle(Input_Name, forSegmentAt: 2)
        case 8:
            Input_Name = IN_Port8
            Segmented_Input2.setTitle(Input_Name, forSegmentAt: 3)
        case 9:
            Input_Name = IN_Port9
            Segmented_Input3.setTitle(Input_Name, forSegmentAt: 0)
        case 10:
            Input_Name = IN_Port10
            Segmented_Input3.setTitle(Input_Name, forSegmentAt: 1)
        case 11:
            Input_Name = IN_Port11
            Segmented_Input3.setTitle(Input_Name, forSegmentAt: 2)
        case 12:
            Input_Name = IN_Port12
            Segmented_Input3.setTitle(Input_Name, forSegmentAt: 3)
        case 13:
            Input_Name = IN_Port13
            Segmented_Input4.setTitle(Input_Name, forSegmentAt: 0)
        case 14:
            Input_Name = IN_Port14
            Segmented_Input4.setTitle(Input_Name, forSegmentAt: 1)
        case 15:
            Input_Name = IN_Port15
            Segmented_Input4.setTitle(Input_Name, forSegmentAt: 2)
        case 16:
            Input_Name = IN_Port16
            Segmented_Input4.setTitle(Input_Name, forSegmentAt: 3)
        case 17:
            Input_Name = IN_Port17
            Segmented_Input5.setTitle(Input_Name, forSegmentAt: 0)
        case 18:
            Input_Name = IN_Port18
            Segmented_Input5.setTitle(Input_Name, forSegmentAt: 1)
        case 19:
            Input_Name = IN_Port19
            Segmented_Input5.setTitle(Input_Name, forSegmentAt: 2)
        case 20:
            Input_Name = IN_Port20
            Segmented_Input5.setTitle(Input_Name, forSegmentAt: 3)
        case 21:
            Input_Name = IN_Port21
            Segmented_Input6.setTitle(Input_Name, forSegmentAt: 0)
        case 22:
            Input_Name = IN_Port22
            Segmented_Input6.setTitle(Input_Name, forSegmentAt: 1)
        case 23:
            Input_Name = IN_Port23
            Segmented_Input6.setTitle(Input_Name, forSegmentAt: 2)
        case 24:
            Input_Name = IN_Port24
            Segmented_Input6.setTitle(Input_Name, forSegmentAt: 3)
        case 25:
            Input_Name = IN_Port25
            Segmented_Input7.setTitle(Input_Name, forSegmentAt: 0)
        case 26:
            Input_Name = IN_Port26
            Segmented_Input7.setTitle(Input_Name, forSegmentAt: 1)
        case 27:
            Input_Name = IN_Port27
            Segmented_Input7.setTitle(Input_Name, forSegmentAt: 2)
        case 28:
            Input_Name = IN_Port28
            Segmented_Input7.setTitle(Input_Name, forSegmentAt: 3)
        case 29:
            Input_Name = IN_Port29
            Segmented_Input8.setTitle(Input_Name, forSegmentAt: 0)
        case 30:
            Input_Name = IN_Port30
            Segmented_Input8.setTitle(Input_Name, forSegmentAt: 1)
        case 31:
            Input_Name = IN_Port31
            Segmented_Input8.setTitle(Input_Name, forSegmentAt: 2)
        case 32:
            Input_Name = IN_Port32
            Segmented_Input8.setTitle(Input_Name, forSegmentAt: 3)
        default:
            Input_Name = ""
            
        }
        
        //print("Input_Name==>" + Input_Name)
        return Input_Name//IN + 1
    }
    
    
    @objc func MemorySaveLoad(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
        case 1:
            print(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? sender.selectedSegmentIndex)
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        case 2:
            print(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? sender.selectedSegmentIndex)
            //print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        default:
            print((sender.tag-1)*4 + 1 + sender.selectedSegmentIndex)
            
        }

    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        switch UIDevice.current.orientation{
//
//        case .portrait:
//            Layout()
//
//        case .portraitUpsideDown:
//            Layout()
//
//        case .landscapeLeft:
//            Layout()
//
//        case .landscapeRight:
//            Layout()
//
//
//        case .unknown:
//            print("unknow")
//        case .faceUp:
//            print("faceup")
//        case .faceDown:
//            print("facedown")
//        }
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetDeviceInfo(){
        
        if app.Connect_state == true
        {
            //let crc16table = CRC16Util()
            var bytes: [UInt8] = [0x20, 0x3F, 0x00, 0x00]
            print(bytes)
            //先解析要傳出去的指令("DeviceID" "ACKType" "Instruction" "Index" "Value" "CRC")。並取得ＣＲＣ值
            var HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
            
            //bytes + ＣＲＣ值
            var senddata: [UInt8] = crc16table.CRC(data: bytes)
            print(senddata)
            
            //print(senddata)
            switch app.client.send(data: senddata){
            case .success:
                //print("Yes 成功了==>")
                guard let data = app.client.read(1024*10) else { return}//data==>設備回傳的資料
                //解析設備回傳的資料
                print(data)
                var ResultFromACK3F00 = crc16table.getACKCode(ACKType: HostCommand[1], DeviceIDString: HostCommand[0], InstructionString: HostCommand[2], IndexString: HostCommand[3], ValueString: HostCommand[4], CRCString: HostCommand[5], outStream: data)
                print("Yoho data在這邊~~~~~\(data)")
                Audio = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[3], para: "Audio")
                //print ("ResultFromACK3F00==>")
                //print (ResultFromACK3F00)
                //print (ResultFromACK3F00[3])
                //print ("Audio==>")
                //print (Audio)
                app.SetDeviceInfo(Field: "Audio", Value: Audio)
                Video = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[3], para: "Video")
                //print ("Video==>")
                //print (Video)
                app.SetDeviceInfo(Field: "Video", Value: Video)
                Memory = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[3], para: "Memory")
                
                //print ("Memory==>")
                //print (Memory)
                //Memory = "8"
                app.SetDeviceInfo(Field: "Memory", Value: Memory)
                Output = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[4], para: "Output")
                Output_num = Int(Output)!
                //print (ResultFromACK3F00[4])
                //print ("Output==>")
                //print (Output)
                //Output = "32"
                //Output_num = 32
                app.SetDeviceInfo(Field: "Output", Value: Output)
                Input = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[5], para: "Input")
                Input_num = Int(Input)!
                //Input = "32"
                //Input_num = 32
                //print (ResultFromACK3F00[5])
                //print ("Input==>")
                //print (Input)
                app.SetDeviceInfo(Field: "Input", Value: Input)
                DN = common.GetHostCommandValue(HostCommand: ResultFromACK3F00[6], para: "DN")
                //print (ResultFromACK3F00[6])
                //print ("DN==>")
                //print (DN)
                app.SetDeviceInfo(Field: "DN", Value: DN)
            case .failure( _):
                //case .failure(let error):
                print("No==> Error!!")
            }
            
            
            
            bytes = [0x20, 0x3F, 0x01, 0x00]
            senddata = crc16table.CRC(data: bytes)
            HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
            switch app.client.send(data: senddata){
            case .success:
                guard let data = app.client.read(1024*10) else { return}
                //解析設備回傳的資料
                var ResultFromACK3F01 = crc16table.getACKCode(ACKType: HostCommand[1], DeviceIDString: HostCommand[0], InstructionString: HostCommand[2], IndexString: HostCommand[3], ValueString: HostCommand[4], CRCString: HostCommand[5], outStream: data)
                //print(data)
                //print ("ResultFromACK3F01==>")
                //print (ResultFromACK3F01)
                EDID = common.GetHostCommandValue(HostCommand: ResultFromACK3F01[4], para: "EDID")
                
                //print ("EDID==>")
                //print (EDID)
                app.SetDeviceInfo(Field: "EDID", Value: EDID)
                
            case .failure( _):
                //case .failure(let error):
                print("No==> Error!!")
            }
            


            bytes = [0x20, 0x30, 0x00, 0x00]
            senddata = crc16table.CRC(data: bytes)
            HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)

            switch app.client.send(data: senddata){
            case .success:
                guard let data = app.client.read(1024*10) else { return}
                //print("data==>")
                //print(data)

                var ResultFromACK3000 = crc16table.getACKCode(ACKType: HostCommand[1], DeviceIDString: HostCommand[0], InstructionString: HostCommand[2], IndexString: HostCommand[3], ValueString: HostCommand[4], CRCString: HostCommand[5], outStream: data)
                Protocal_Version = common.GetHostCommandValue(HostCommand: ResultFromACK3000[3], para: "Protocol Version")

                //print ("Protocal_Version==>")
                //print (Protocal_Version)
                app.SetDeviceInfo(Field: "Protocal_Version", Value: Protocal_Version)

            case .failure( _):
                //case .failure(let error):
                print("No==> Error!!")
            }




            bytes = [0x20, 0x31, 0x00, 0x00]
            senddata = crc16table.CRC(data: bytes)
            HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)

            switch app.client.send(data: senddata){
            case .success:
                guard let data = app.client.read(1024*10) else { return}
                var ResultFromACK3100 = crc16table.getACKCode(ACKType: HostCommand[1], DeviceIDString: HostCommand[0], InstructionString: HostCommand[2], IndexString: HostCommand[3], ValueString: HostCommand[4], CRCString: HostCommand[5], outStream: data)
                Firmware_Version = common.GetHostCommandValue(HostCommand: ResultFromACK3100[3], para: "Firmware Version")

                //print ("Firmware_Version==>")
                //print (Firmware_Version)
                app.SetDeviceInfo(Field: "Firmware_Version", Value: Firmware_Version)
            case .failure( _):

                //case .failure(let error):
                print("No==> Error!!")
            }

            bytes = [0x20, 0x21, 0x01, 0x00]
            senddata = crc16table.CRC(data: bytes)
            HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)

            switch app.client.send(data: senddata){
            case .success:
                guard let data = app.client.read(1024*10) else { return}
                //var ResultFromACK0100 = crc16table.getACKCode(ACKType: HostCommand[1], DeviceIDString: HostCommand[0], InstructionString: HostCommand[2], IndexString: HostCommand[3], ValueString: HostCommand[4], CRCString: HostCommand[5], outStream: data)
                //Firmware_Version = common.GetHostCommandValue(HostCommand: ResultFromACK3100[3], para: "Firmware Version")

                //print ("Firmware_Version==>")
                //print (Firmware_Version)
                //print("Setting_AV==>")

                //print(data)
                //print(data[3])
                app.SetDeviceInfo(Field: "Setting_AV", Value: String(data[3]))
            case .failure( _):

                //case .failure(let error):
                print("No==> Error!!")
            }
            
            
            
        }
        else
        {
            //SS = "0"
        }
        
    }
    
    func get_IN_Name(value IN: Int) -> String{
        var IN_Name = ""
        if(app.DN=="HX-2544"){IN_Name = app.HX_2544_IN[IN]}
        if(app.DN=="HX-2562"){IN_Name = app.HX_2562_IN[IN]}
        if(app.DN=="MX-3UB"){IN_Name = app.MX_3UB_IN[IN]}
        if(app.DN=="MX-4UB"){IN_Name = app.MX_4UB_IN[IN]}
        if(app.DN=="MX-7UB"){IN_Name = app.MX_7UB_IN[IN]}
        print("IN_Name==>" + IN_Name)
        return IN_Name
    }
    
    func get_OUT_Name(value OUT: Int) -> String{
        var OUT_Name = ""
        if(app.DN=="HX-2544"){OUT_Name = app.HX_2544_OUT[OUT]}
        if(app.DN=="HX-2562"){OUT_Name = app.HX_2562_OUT[OUT]}
        if(app.DN=="MX-3UB"){OUT_Name = app.MX_3UB_OUT[OUT]}
        if(app.DN=="MX-4UB"){OUT_Name = app.MX_4UB_OUT[OUT]}
        if(app.DN=="MX-7UB"){OUT_Name = app.MX_7UB_OUT[OUT]}
        print("DN==>" + app.DN)
        print("OUT_NameOUT_Name==>" + OUT_Name)
        return OUT_Name
    }
    
    func ShowUIInfo()
    {
        
        if app.Connect_state == true
        {
            get_IN_OUT_Config()
            
            //初始化
            var bytes07: [UInt8] = [0x00, 0x00, 0x00, 0x00]
            var bytes09: [UInt8] = [0x00, 0x00, 0x00, 0x00]
            //var bytes0B: [UInt8] = [0x00, 0x00, 0x00, 0x00]
            //八個input, output
            //for i in 1 ... 16 {
            print("app.Input==>")
            print (app.Input)
            let II = (app.Input as NSString).integerValue
            print("Input num==>" + app.Input)
            for i in 1 ... II {
                var input_name = get_Input_Name(value: i)
                bytes07 = [0x20, 0x07, UInt8(i), 0x00]
                bytes09 = [0x20, 0x09, UInt8(i), 0x00]

                //bytes07[2] = UInt8(i)
                
                
                //先解析要傳出去的指令("DeviceID" "ACKType" "Instruction" "Index" "Value" "CRC")。並取得ＣＲＣ值
                //var HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
                
                //bytes + ＣＲＣ值
                var senddata07: [UInt8] = crc16table.CRC(data: bytes07)//Get Vedio switch setting
                var senddata09: [UInt8] = crc16table.CRC(data: bytes09)//Get Vedio Input link status
                //var senddata0B: [UInt8] = crc16table.CRC(data: bytes0B)//Get Vedio Output link status
                
                switch app.client.send(data: senddata07){
                case .success:
                    guard let data = app.client.read(1024*10) else { return}//data==>設備回傳的資料
                    //print("senddata07==>")
                    //print(data)
                    
                    var witch_IN = ""
                    var witch_IN_Title = ""
                    if(data.count>2){
                        //print("Int(data[3]-1)==>")
                        //print(Int(data[3]-1))
                        
                        if(data[3]>0){                                     // 新增if(data[3]>0) else witch_in = "0"  否則若一開始output有 0 會crash
                        
                        witch_IN = get_IN_Name(value: Int(data[3]-1))
                        print(witch_IN)
                        }
                        else {
                            witch_IN = "0"
                        }
//                        let k = data[3]-1
//                    switch (data[3]){
//
//                    case 1:
//                        witch_IN = app.IN1
//                        //print("witch_IN_Title==>")
//                        //print(witch_IN_Title)
//                        break
//                    case 2:
//                        witch_IN = app.IN2
//                        break
//                    case 3:
//                        witch_IN = app.IN3
//                        break
//                    case 4:
//                        witch_IN = app.IN4
//                        break
//                    case 5:
//                        witch_IN = app.IN5
//
//                        break
//                    case 6:
//                        witch_IN = app.IN6
//                        break
//                    case 7:
//                        witch_IN = app.IN7
//                        break
//                    case 8:
//                        witch_IN = app.IN8
//                        break
//                    case 9:
//                        witch_IN = app.IN9
//                        break
//                    case 10:
//                        witch_IN = app.IN10
//                        break
//                    case 11:
//                        witch_IN = app.IN11
//                        break
//                    case 12:
//                        witch_IN = app.IN12
//                        break
//                    case 13:
//                        witch_IN = app.IN13
//                        break
//                    case 14:
//                        witch_IN = app.IN14
//                        break
//                    case 15:
//                        witch_IN = app.IN15
//                        break
//                    case 16:
//                        witch_IN = app.IN16
//                        break
//                    case 17:
//                        witch_IN = app.IN17
//                        break
//                    case 18:
//                        witch_IN = app.IN18
//                        break
//                    case 19:
//                        witch_IN = app.IN19
//                        break
//                    case 20:
//                        witch_IN = app.IN20
//                        break
//                    case 21:
//                        witch_IN = app.IN21
//                        break
//                    case 22:
//                        witch_IN = app.IN22
//                        break
//                    case 23:
//                        witch_IN = app.IN23
//                        break
//                    case 24:
//                        witch_IN = app.IN24
//                        break
//                    case 25:
//                        witch_IN = app.IN25
//                        break
//                    case 26:
//                        witch_IN = app.IN26
//                        break
//                    case 27:
//                        witch_IN = app.IN27
//                        break
//                    case 28:
//                        witch_IN = app.IN28
//                        break
//                    case 29:
//                        witch_IN = app.IN29
//                        break
//                    case 30:
//                        witch_IN = app.IN30
//                        break
//                    case 31:
//                        witch_IN = app.IN31
//                        break
//                    case 32:
//                        witch_IN = app.IN32
//                        break
//                    default:
//                        print("witch_IN = default")
//                        break
//                    }
                    var OUT_Name = get_OUT_Name(value: i-1)
                    
                    switch (i){
                    case 1:
                        //print("app.HX_2544_OUT[0]==>")
                        //print(app.HX_2544_OUT[0])
                        //print("OUT_Name==>")
                        //print(OUT_Name)
                        if(witch_IN == "0")
                        {
                            Segmented_Output1.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = OUT_Name + "(V:" + witch_IN + ")"
                        print("title==>" + title)
                        Segmented_Output1.setTitle(title, forSegmentAt: 0)
                        //Segmented_Output1.setTitle("title", forSegmentAt: 0)
                        }
                        break
                    case 2:
                        if(witch_IN == "0")
                        {
                            Segmented_Output1.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = OUT_Name + "(V:" + witch_IN + ")"
                        print("title==>" + title)
                        Segmented_Output1.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 3:
                        if(witch_IN == "0")
                        {
                            Segmented_Output1.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = OUT_Name + "(V:" + witch_IN + ")"
                        //print("title==>" + title)
                        Segmented_Output1.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 4:
                        if(witch_IN == "0")
                        {
                            Segmented_Output1.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = OUT_Name + "(V:" + witch_IN + ")"
                        Segmented_Output1.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 5:
                        if(witch_IN == "0")
                        {
                            Segmented_Output2.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT5 + "(V:" + witch_IN + ")"
                        Segmented_Output2.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 6:
                        if(witch_IN == "0")
                        {
                            Segmented_Output2.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT6 + "(V:" + witch_IN + ")"
                        Segmented_Output2.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 7:
                        if(witch_IN == "0")
                        {
                            Segmented_Output2.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT7 + "(V:" + witch_IN + ")"
                        Segmented_Output2.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 8:
                        if(witch_IN == "0")
                        {
                            Segmented_Output2.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT8 + "(V:" + witch_IN + ")"
                        Segmented_Output2.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 9:
                        if(witch_IN == "0")
                        {
                            Segmented_Output3.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT9 + "(V:" + witch_IN + ")"
                        Segmented_Output3.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 10:
                        if(witch_IN == "0")
                        {
                            Segmented_Output3.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT10 + "(V:" + witch_IN + ")"
                        Segmented_Output3.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 11:
                        if(witch_IN == "0")
                        {
                            Segmented_Output3.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT11 + "(V:" + witch_IN + ")"
                        Segmented_Output3.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 12:
                        if(witch_IN == "0")
                        {
                            Segmented_Output3.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT12 + "(V:" + witch_IN + ")"
                        Segmented_Output3.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 13:
                        if(witch_IN == "0")
                        {
                            Segmented_Output4.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT13 + "(V:" + witch_IN + ")"
                        Segmented_Output4.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 14:
                        if(witch_IN == "0")
                        {
                            Segmented_Output4.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT14 + "(V:" + witch_IN + ")"
                        Segmented_Output4.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 15:
                        if(witch_IN == "0")
                        {
                            Segmented_Output4.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT15 + "(V:" + witch_IN + ")"
                        Segmented_Output4.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 16:
                        if(witch_IN == "0")
                        {
                            Segmented_Output4.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT16 + "(V:" + witch_IN + ")"
                        Segmented_Output4.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 17:
                        if(witch_IN == "0")
                        {
                            Segmented_Output5.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT17 + "(V:" + witch_IN + ")"
                        Segmented_Output5.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 18:
                        if(witch_IN == "0")
                        {
                            Segmented_Output5.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT18 + "(V:" + witch_IN + ")"
                        Segmented_Output5.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 19:
                        if(witch_IN == "0")
                        {
                            Segmented_Output5.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT19 + "(V:" + witch_IN + ")"
                        Segmented_Output5.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 20:
                        if(witch_IN == "0")
                        {
                            Segmented_Output5.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT20 + "(V:" + witch_IN + ")"
                        Segmented_Output5.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 21:
                        if(witch_IN == "0")
                        {
                            Segmented_Output6.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT21 + "(V:" + witch_IN + ")"
                        Segmented_Output6.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 22:
                        if(witch_IN == "0")
                        {
                            Segmented_Output6.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT22 + "(V:" + witch_IN + ")"
                        Segmented_Output6.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 23:
                        if(witch_IN == "0")
                        {
                            Segmented_Output6.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT23 + "(V:" + witch_IN + ")"
                        Segmented_Output6.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 24:
                        if(witch_IN == "0")
                        {
                            Segmented_Output6.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT24 + "(V:" + witch_IN + ")"
                        Segmented_Output6.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 25:
                        if(witch_IN == "0")
                        {
                            Segmented_Output7.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT25 + "(V:" + witch_IN + ")"
                        Segmented_Output7.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 26:
                        if(witch_IN == "0")
                        {
                            Segmented_Output7.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT26 + "(V:" + witch_IN + ")"
                        Segmented_Output7.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 27:
                        if(witch_IN == "0")
                        {
                            Segmented_Output7.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT27 + "(V:" + witch_IN + ")"
                        Segmented_Output7.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 28:
                        if(witch_IN == "0")
                        {
                            Segmented_Output7.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT28 + "(V:" + witch_IN + ")"
                        Segmented_Output7.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    case 29:
                        if(witch_IN == "0")
                        {
                            Segmented_Output8.setTitle(OUT_Name, forSegmentAt: 0)
                        }
                        else{
                        let title = app.OUT29 + "(V:" + witch_IN + ")"
                        Segmented_Output8.setTitle(title, forSegmentAt: 0)
                        }
                        break
                    case 30:
                        if(witch_IN == "0")
                        {
                            Segmented_Output8.setTitle(OUT_Name, forSegmentAt: 1)
                        }
                        else{
                        let title = app.OUT30 + "(V:" + witch_IN + ")"
                        Segmented_Output8.setTitle(title, forSegmentAt: 1)
                        }
                        break
                    case 31:
                        if(witch_IN == "0")
                        {
                            Segmented_Output8.setTitle(OUT_Name, forSegmentAt: 2)
                        }
                        else{
                        let title = app.OUT31 + "(V:" + witch_IN + ")"
                        Segmented_Output8.setTitle(title, forSegmentAt: 2)
                        }
                        break
                    case 32:
                        if(witch_IN == "0")
                        {
                            Segmented_Output8.setTitle(OUT_Name, forSegmentAt: 3)
                        }
                        else{
                        let title = app.OUT32 + "(V:" + witch_IN + ")"
                        Segmented_Output8.setTitle(title, forSegmentAt: 3)
                        }
                        break
                    default:
                        break
                    }
                    }
                    
                case .failure( _):
                    //case .failure(let error):
                    print("No==> Error!!")
                }
                
                switch app.client.send(data: senddata09){
                case .success:
                    guard let data = app.client.read(1024*10) else { return}//data==>設備回傳的資料
                    print("senddata09==>")
                    print(data)
                    if(data[3] == 0){//Input link status is not connect
                        if (i>0 && i<=4){
                            Segmented_Input1.setEnabled(true, forSegmentAt: (i-1-4*0))
                        } else if((i>4 && i<=8)){
                            Segmented_Input2.setEnabled(true, forSegmentAt: (i-1-4*1))
                        }else if((i>8 && i<=12)){
                            //print(i)
                            Segmented_Input3.setEnabled(true, forSegmentAt: (i-1-4*2))
                            //print(i)
                        }else if((i>12 && i<=16)){
                            Segmented_Input4.setEnabled(true, forSegmentAt: (i-1-4*3))
                        }else if((i>16 && i<=20)){
                            Segmented_Input5.setEnabled(true, forSegmentAt: (i-1-4*4))
                        }else if((i>20 && i<=24)){
                            Segmented_Input6.setEnabled(true, forSegmentAt: (i-1-4*5))
                        }else if((i>24 && i<=28)){
                            Segmented_Input7.setEnabled(true, forSegmentAt: (i-1-4*6))
                        }else if((i>28 && i<=32)){
                            Segmented_Input8.setEnabled(true, forSegmentAt: (i-1-4*7))
                        }

                    } else if(data[3] == 1){//Input link status is connect

                        //Btn_Input.setEnabled(true, forSegmentAt: (i-1))
                        if (i>0 && i<=4){
                            Segmented_Input1.setEnabled(true, forSegmentAt: (i-1-4*0))
                        } else if((i>4 && i<=8)){
                            Segmented_Input2.setEnabled(true, forSegmentAt: (i-1-4*1))
                        }else if((i>8 && i<=12)){
                            Segmented_Input3.setEnabled(true, forSegmentAt: (i-1-4*2))
                        }else if((i>12 && i<=16)){
                            Segmented_Input4.setEnabled(true, forSegmentAt: (i-1-4*3))
                        }else if((i>16 && i<=20)){
                            Segmented_Input5.setEnabled(true, forSegmentAt: (i-1-4*4))
                        }else if((i>20 && i<=24)){
                            Segmented_Input6.setEnabled(true, forSegmentAt: (i-1-4*5))
                        }else if((i>24 && i<=28)){
                            Segmented_Input7.setEnabled(true, forSegmentAt: (i-1-4*6))
                        }else if((i>28 && i<=32)){
                            Segmented_Input8.setEnabled(true, forSegmentAt: (i-1-4*7))
                        }
                    }

                case .failure( _):
                    //case .failure(let error):
                    print("No==> Error!!")
                }
                
                
                
                
            }
            

            let III = (app.Output as NSString).integerValue
            //print("Output num==>" + app.Output)
            for i in 1 ... III {

                var bytes0B = [0x20, 0x0B, UInt8(i), 0x00]
                //bytes0B = [0x20, 0x0B, UInt8(i), 0x00]
                //bytes07[2] = UInt8(i)
                
                
                //先解析要傳出去的指令("DeviceID" "ACKType" "Instruction" "Index" "Value" "CRC")。並取得ＣＲＣ值
                //var HostCommand = common.HostCommandProtocalParse(HostCommand: bytes)
                
                //bytes + ＣＲＣ值
                var senddata0B: [UInt8] = crc16table.CRC(data: bytes0B)//Get Vedio Output link status
                
                switch app.client.send(data: senddata0B){
                case .success:
                    guard let data = app.client.read(1024*10) else { return}//data==>設備回傳的資料
                    //print("senddata0B==>")
                    //print(data)
                    if(data[3] == 0){//Output link status is not connect
                        
                        if (i>0 && i<=4){
                            Segmented_Output1.setEnabled(true, forSegmentAt: (i-1-4*0))
                        } else if((i>4 && i<=8)){
                            Segmented_Output2.setEnabled(true, forSegmentAt: (i-1-4*1))
                        }else if((i>8 && i<=12)){
                            Segmented_Output3.setEnabled(true, forSegmentAt: (i-1-4*2))
                        }else if((i>12 && i<=16)){
                            Segmented_Output4.setEnabled(true, forSegmentAt: (i-1-4*3))
                        }else if((i>16 && i<=20)){
                            Segmented_Output5.setEnabled(true, forSegmentAt: (i-1-4*4))
                        }else if((i>20 && i<=24)){
                            Segmented_Output6.setEnabled(true, forSegmentAt: (i-1-4*5))
                        }else if((i>24 && i<=28)){
                            Segmented_Output7.setEnabled(true, forSegmentAt: (i-1-4*6))
                        }else if((i>28 && i<=32)){
                            Segmented_Output8.setEnabled(true, forSegmentAt: (i-1-4*7))
                        }
                        

                    } else if(data[3] == 1){//Output link status is connect
                        
                        if (i>0 && i<=4){
                            Segmented_Output1.setEnabled(true, forSegmentAt: (i-1-4*0))
                        } else if((i>4 && i<=8)){
                            Segmented_Output2.setEnabled(true, forSegmentAt: (i-1-4*1))
                        }else if((i>8 && i<=12)){
                            Segmented_Output3.setEnabled(true, forSegmentAt: (i-1-4*2))
                        }else if((i>12 && i<=16)){
                            Segmented_Output4.setEnabled(true, forSegmentAt: (i-1-4*3))
                        }else if((i>16 && i<=20)){
                            Segmented_Output5.setEnabled(true, forSegmentAt: (i-1-4*4))
                        }else if((i>20 && i<=24)){
                            Segmented_Output6.setEnabled(true, forSegmentAt: (i-1-4*5))
                        }else if((i>24 && i<=28)){
                            Segmented_Output7.setEnabled(true, forSegmentAt: (i-1-4*6))
                        }else if((i>28 && i<=32)){
                            Segmented_Output8.setEnabled(true, forSegmentAt: (i-1-4*7))
                        }

                    }
                    
                    
                case .failure( _):
                    //case .failure(let error):
                    print("No==> Error!!")
                }
                
                
            }
        }
        
    }


}

