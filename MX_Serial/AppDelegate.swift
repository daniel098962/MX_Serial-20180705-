//
//  AppDelegate.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/10/30.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

import SwiftSocket;

@UIApplicationMain
class AppDelegate: UIResponder , UIApplicationDelegate {

    var window: UIWindow?

    var OO: String?
    
    var Connect_state = false//: Bool?
    
    var client: TCPClient!
    
    var Memory_LoadSave = ""
    
    var IP = ""
    
    var Setting_AV = 0
    
    var Audio = "",Video = "", Memory = "8", Output = "16", Input = "16", DN = ""
    
    var EDID = "", Protocal_Version = "", Firmware_Version = ""
    
    var HX_2544_IN = [ "1" , "2" , "3" , "4" ]
    var HX_2544_OUT = [ "1" , "2" , "3" , "4" ]
    
    var HX_2562_IN = [ "1" , "2" , "3" , "4" , "5" , "6"]
    var HX_2562_OUT = [ "1" , "2"  ]
    
    var MX_3UB_IN = [ "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" ]
    var MX_3UB_OUT = [ "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" ]
    
    var MX_4UB_IN = [ "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" ]
    var MX_4UB_OUT = [  "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" ]
    
    var MX_7UB_IN = [  "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" , "17" , "18" , "19" , "20" , "21" , "22" , "23" , "24" , "25" , "26" , "27" , "28" , "29" , "30" , "31" , "32"]
    var MX_7UB_OUT = [ "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" , "17" , "18" , "19" , "20" , "21" , "22" , "23" , "24" , "25" , "26" , "27" , "28" , "29" , "30" , "31" , "32" ]
    
    var IN1 = "1", IN2 = "2", IN3 = "3", IN4 = "4", IN5 = "5", IN6 = "6", IN7 = "7", IN8 = "8"
    var IN9 = "9", IN10 = "10", IN11 = "11", IN12 = "12", IN13 = "13", IN14 = "14", IN15 = "15", IN16 = "16"
    var IN17 = "17", IN18 = "18", IN19 = "19", IN20 = "20", IN21 = "21", IN22 = "22", IN23 = "23", IN24 = "24"
    var IN25 = "25", IN26 = "26", IN27 = "27", IN28 = "28", IN29 = "29", IN30 = "30", IN31 = "31", IN32 = "32"
    
    var OUT1 = "1", OUT2 = "2", OUT3 = "3", OUT4 = "4", OUT5 = "5", OUT6 = "6", OUT7 = "7", OUT8 = "8"
    var OUT9 = "9", OUT10 = "10", OUT11 = "11", OUT12 = "12", OUT13 = "13", OUT14 = "14", OUT15 = "15", OUT16 = "16"
    var OUT17 = "17", OUT18 = "18", OUT19 = "19", OUT20 = "20", OUT21 = "21", OUT22 = "22", OUT23 = "23", OUT24 = "24"
    var OUT25 = "25", OUT26 = "26", OUT27 = "27", OUT28 = "28", OUT29 = "29", OUT30 = "30", OUT31 = "31", OUT32 = "32"
    
    var comeFromPage = ""
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func echo(_ string1: String) ->String{
        //var dd = ""
        if string1 == "Main" {
            OO = "not OK"
        }
        
        if string1 == "Connect" {
            OO = "Connect"
        }
        //if string == "Page2" {
        
        //    return dd
        
        //}
        
        return OO!
    }
    
    func echo1() ->String{
        
        return OO!
    }
    
    func Connect_Write(_ connect: Bool) {
        Connect_state = connect
    }
    
    //func Connect_Read() ->Bool{
    //    return Connect_state!
    //}
    
    func Connect_Device(address:String, Port: Int32){
        //client = TCPClient(address: Txt_IP.text!, port: Int32(Txt_Port.text!)!)
        //client = TCPClient(address: "10.1.1.50", port: 5000)
        client = TCPClient(address: address, port: Port)
        Connect_Write(false)
        
        switch client.connect(timeout: 1)
        {
            
        case .success:
            
            Connect_Write(true)
            
        case .failure( _):
            //case .failure(let error):
            Connect_Write(false)
        }
        
        
    }
    
    func SetDeviceInfo(Field:String, Value: String){
        
        switch Field
        {
            
        case "Audio":
            Audio = Value
            
        case "Video":
            Video = Value
            
        case "Memory":
            Memory = Value
            
        case "Output":
            Output = Value
            
        case "Input":
            Input = Value
            
        case "DN":
            DN = Value
            
        case "EDID":
            EDID = Value
            
        case "Protocal_Version":
            Protocal_Version = Value
            
        case "Firmware_Version":
            Firmware_Version = Value
            
        case "Memory_LoadSave":
            Memory_LoadSave = Value
            
        case "IP":
            IP = Value
            
        case "Setting_AV":
            Setting_AV = Int(Value)!
            
        case "IN1":
            let i = 0
            if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN1 = Value
            //print("DNDNDN==>" + DN)
            //print("Value==>" + Value)
            
        case "IN2":
            let i = 1
            if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN2 = Value
            
        case "IN3":
            let i = 2
            if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN3 = Value
            
        case "IN4":
            let i = 3
            if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN4 = Value
            
        case "IN5":
            let i = 4
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN5 = Value
            
        case "IN6":
            let i = 5
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN6 = Value
            
        case "IN7":
            let i = 6
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN7 = Value
            
        case "IN8":
            let i = 7
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN8 = Value
            
        case "IN9":
            let i = 8
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN9 = Value
            
        case "IN10":
            let i = 9
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN10 = Value
            
        case "IN11":
            let i = 10
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN11 = Value
            
        case "IN12":
            let i = 11
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN12 = Value
            
        case "IN13":
            let i = 12
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN13 = Value
            
        case "IN14":
            let i = 13
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN14 = Value
            
        case "IN15":
            let i = 14
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN15 = Value
            
        case "IN16":
            let i = 15
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN16 = Value
            
        case "IN17":
            let i = 16
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN17 = Value
            
        case "IN18":
            let i = 17
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN18 = Value
            
        case "IN19":
            let i = 18
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN19 = Value
            
        case "IN20":
            let i = 19
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN20 = Value
            
        case "IN21":
            let i = 20
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN21 = Value
            
        case "IN22":
            let i = 21
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN22 = Value
            
        case "IN23":
            let i = 22
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN23 = Value
            
        case "IN24":
            let i = 23
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN24 = Value
            
        case "IN25":
            let i = 24
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN25 = Value
            
        case "IN26":
            let i = 25
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN26 = Value
            
        case "IN27":
            let i = 26
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN27 = Value
            
        case "IN28":
            let i = 27
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN28 = Value
            
        case "IN29":
            let i = 28
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN29 = Value
            
        case "IN30":
            let i = 29
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN30 = Value
            
        case "IN31":
            let i = 30
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN31 = Value
            
        case "IN32":
            let i = 31
            //if(DN=="HX-2544"){HX_2544_IN[i] = Value}
            //if(DN=="HX-2562"){HX_2562_IN[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_IN[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_IN[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_IN[i] = Value}
            IN32 = Value
            
        case "OUT1":
            let i = 0
            if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT1 = Value
            
        case "OUT2":
            let i = 1
            if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT2 = Value
            
        case "OUT3":
            let i = 2
            if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT3 = Value
            
        case "OUT4":
            let i = 3
            if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT4 = Value
            
        case "OUT5":
            let i = 4
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT5 = Value
            
        case "OUT6":
            let i = 5
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT6 = Value
            
        case "OUT7":
            let i = 6
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT7 = Value
            
        case "OUT8":
            let i = 7
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT8 = Value
            
        case "OUT9":
            let i = 8
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT9 = Value
            
        case "OUT10":
            let i = 9
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT10 = Value
            
        case "OUT11":
            let i = 10
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT11 = Value
            
        case "OUT12":
            let i = 11
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT12 = Value
            
        case "OUT13":
            let i = 12
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT13 = Value
            
        case "OUT14":
            let i = 13
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT14 = Value
            
        case "OUT15":
            let i = 14
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT15 = Value
            
        case "OUT16":
            let i = 15
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT16 = Value
        
        case "OUT17":
            let i = 16
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT17 = Value
            
        case "OUT18":
            let i = 17
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT18 = Value
            
        case "OUT19":
            let i = 18
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT19 = Value
            
        case "OUT20":
            let i = 19
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT20 = Value
            
        case "OUT21":
            let i = 20
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT21 = Value
            
        case "OUT22":
            let i = 21
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT22 = Value
            
        case "OUT23":
            let i = 22
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT23 = Value
            
        case "OUT24":
            let i = 23
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT24 = Value
        
        case "OUT25":
            let i = 24
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT25 = Value
            
        case "OUT26":
            let i = 25
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT26 = Value
            
        case "OUT27":
            let i = 26
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT27 = Value
            
        case "OUT28":
            let i = 27
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT28 = Value
            
        case "OUT29":
            let i = 28
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT29 = Value
            
        case "OUT30":
            let i = 29
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT30 = Value
            
        case "OUT31":
            let i = 30
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT31 = Value
            
        case "OUT32":
            let i = 31
            //if(DN=="HX-2544"){HX_2544_OUT[i] = Value}
            //if(DN=="HX-2562"){HX_2562_OUT[i] = Value}
            //if(DN=="MX-3UB"){MX_3UB_OUT[i] = Value}
            //if(DN=="MX-4UB"){MX_4UB_OUT[i] = Value}
            if(DN=="MX-7UB"){MX_7UB_OUT[i] = Value}
            OUT32 = Value
        
        case "comeFromPage":
            comeFromPage = Value
            print("Set Value==>")
            print(Value)
        default:
            break
        }
        
    }


}

