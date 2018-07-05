
//  File.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/9.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import Foundation

final class CRC16Util {
    
    let FCS_START:UInt16 = 255//65535
    let FCS_FINAL:UInt16 = 61624
    let FCSTAB:[UInt16] = [
        0x00, 0x5e, 0xbc, 0xe2, 0x61, 0x3f, 0xdd, 0x83,
        0xc2, 0x9c, 0x7e, 0x20, 0xa3, 0xfd, 0x1f, 0x41,
        0x9d, 0xc3, 0x21, 0x7f, 0xfc, 0xa2, 0x40, 0x1e,
        0x5f, 0x01, 0xe3, 0xbd, 0x3e, 0x60, 0x82, 0xdc,
        0x23, 0x7d, 0x9f, 0xc1, 0x42, 0x1c, 0xfe, 0xa0,
        0xe1, 0xbf, 0x5d, 0x03, 0x80, 0xde, 0x3c, 0x62,
        0xbe, 0xe0, 0x02, 0x5c, 0xdf, 0x81, 0x63, 0x3d,
        0x7c, 0x22, 0xc0, 0x9e, 0x1d, 0x43, 0xa1, 0xff,
        0x46, 0x18, 0xfa, 0xa4, 0x27, 0x79, 0x9b, 0xc5,
        0x84, 0xda, 0x38, 0x66, 0xe5, 0xbb, 0x59, 0x07,
        0xdb, 0x85, 0x67, 0x39, 0xba, 0xe4, 0x06, 0x58,
        0x19, 0x47, 0xa5, 0xfb, 0x78, 0x26, 0xc4, 0x9a,
        0x65, 0x3b, 0xd9, 0x87, 0x04, 0x5a, 0xb8, 0xe6,
        0xa7, 0xf9, 0x1b, 0x45, 0xc6, 0x98, 0x7a, 0x24,
        0xf8, 0xa6, 0x44, 0x1a, 0x99, 0xc7, 0x25, 0x7b,
        0x3a, 0x64, 0x86, 0xd8, 0x5b, 0x05, 0xe7, 0xb9,
        0x8c, 0xd2, 0x30, 0x6e, 0xed, 0xb3, 0x51, 0x0f,
        0x4e, 0x10, 0xf2, 0xac, 0x2f, 0x71, 0x93, 0xcd,
        0x11, 0x4f, 0xad, 0xf3, 0x70, 0x2e, 0xcc, 0x92,
        0xd3, 0x8d, 0x6f, 0x31, 0xb2, 0xec, 0x0e, 0x50,
        0xaf, 0xf1, 0x13, 0x4d, 0xce, 0x90, 0x72, 0x2c,
        0x6d, 0x33, 0xd1, 0x8f, 0x0c, 0x52, 0xb0, 0xee,
        0x32, 0x6c, 0x8e, 0xd0, 0x53, 0x0d, 0xef, 0xb1,
        0xf0, 0xae, 0x4c, 0x12, 0x91, 0xcf, 0x2d, 0x73,
        0xca, 0x94, 0x76, 0x28, 0xab, 0xf5, 0x17, 0x49,
        0x08, 0x56, 0xb4, 0xea, 0x69, 0x37, 0xd5, 0x8b,
        0x57, 0x09, 0xeb, 0xb5, 0x36, 0x68, 0x8a, 0xd4,
        0x95, 0xcb, 0x29, 0x77, 0xf4, 0xaa, 0x48, 0x16,
        0xe9, 0xb7, 0x55, 0x0b, 0x88, 0xd6, 0x34, 0x6a,
        0x2b, 0x75, 0x97, 0xc9, 0x4a, 0x14, 0xf6, 0xa8,
        0x74, 0x2a, 0xc8, 0x96, 0x15, 0x4b, 0xa9, 0xf7,
        0xb6, 0xe8, 0x0a, 0x54, 0xd7, 0x89, 0x6b, 0x35]
    
    let Index_table:[String] = [
        "-"     , "Output"  , "Output"  , "0"       , "0"       , "0"       , "0"       , "Output"  ,
        "Output", "Input"   , "Input"   , "Output"  , "Output"  , "-"       , "-"       , "-"       ,
        "Output", "Output"  , "Output"  , "Output"  , "Output"  , "Output"  , "Output"  , "Output"  ,
        "Output", "Output"  , "-"       , "-"       , "Output"  , "Output"  , "Output"  , "Output"  ,
        "0"     , "1"       , "Output"  , "Output"  , "Output"  , "Output"  , "Output"  , "Output"  ,
        "Output", "Output"  , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "0"     , "0"       , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "-"     , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       , "0;1"      ]
    
    let Value_table:[String] = [
        "-"     , "Input"   , "Input"  , "Memory"   , "Memory"  , "Memory"  , "Memory"  , "Memory"  ,
        "Memory", "0"       , "0"       , "0"       , "0"       , "-"       , "-"       , "-"       ,
        "Level" , "0"       , "Level"   , "0"       , "Level"   , "0"        , "Level"  , "0"       ,
        "Level" , "0"       , "-"       , "-"       , "Delay1"  , "0"       , "Delay2"  , "0"       ,
        "EDID"  , "0"       , "Formate" , "0"       , "Res"     , "0"       , "Aspect"  , "0"       ,
        "PIP"   , "0"       , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "0"     , "0"       , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "-"     , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       , "0"        ]
    
    let ACK_table:[String] = [
        "-"     , "A"       , "A"       , "A"       , "A"       , "A"       , "A"       , "B"       ,
        "B"     , "B"       , "B"       , "B"       , "B"       , "-"       , "-"       , "-"       ,
        "A"     , "B"       , "A"       , "B"       , "A"       , "B"       , "A"       , "B"       ,
        "A"     , "B"       , "-"       , "-"       , "A"       , "B"       , "A"       , "B"       ,
        "A"     , "B"       , "A"       , "B"       , "A"       , "B"       , "A"       , "B"       ,
        "A"     , "B"       , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "C"     , "C"       , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       ,
        "-"     , "-"       , "-"       , "-"       , "-"       , "-"       , "-"       , "D"        ]
    
    let Description_table:[String] = [
        "Dummy"     ,
        "Switch Video Output Channel"   ,
        "Switch Audio Output Channel"  ,
        "Save Video Settings to Memory"   ,
        "Save Audio Settings to Memory"  ,
        "Load Video Settings to Memory"  ,
        "Load Audio Settings to Memory"  ,
        "Get Video Switch Settings"  ,
        
        "Get Audio Switch Settings"  ,
        "Get Video Input Link Status"  ,
        "Get Audio Input Link Status"  ,
        "Get Video Output Link Status"  ,
        "Get Audio Output Link Status"  ,
        "-"       ,
        "-"       ,
        "-"       ,
        
        "Set Audio Output Mute" ,
        "Get Audio Output Mute Status" ,
        "Set Audio Output Volume" ,
        "Get Audio Output Volume" ,
        "Set Audio Output Bass" ,
        "Get Audio Output Bass" ,
        "Set Audio Output Treble" ,
        "Get Audio Output Treble" ,
        
        "Set Audio Output Subwoofer" ,
        "Get Audio Output Subwoofer" ,
        "-"       ,
        "-"       ,
        "Set Audio Output Delay Low" ,
        "Get Audio Output Delay Low" ,
        "Set Audio Output Delay High" ,
        "Get Audio Output Delay High" ,
        
        "Set Input EDID Type" ,
        "Get Input EDID Type" ,
        "Set Output Color Format" ,
        "Get Output Color Format" ,
        "Set Output Resolution Mode" ,
        "Get Output Resolution Mode" ,
        "Set Output Aspect Ratio" ,
        "Get Output Aspect Ratio" ,
        
        "Set Output PIP Mode" ,
        "Get Output PIP Mode" ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        
        "Request Protocol Version" ,
        "Request Firmware Version" ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "-"       ,
        "Request Device Infromation;Request Device Infromation(Page 1)"        ]
    
    
    func pad(string: String, toSize:Int) -> String{
        var paded = string
        for _ in 0..<(toSize - string.characters.count){
            paded = "0" + paded
        }
        
        return paded
    }
    
    func makeCrc(buf: [UInt16]) -> UInt16{
        var crc = FCS_START  //crc.reset
        
        for i in 0..<buf.count {
            crc = getFcs(crc, buf[i], i)
        }
        //print("CRC==>")
        //print(crc)
        
        return crc
    }
    
    func checkCrc(buf: [UInt16]) -> Bool{
        var crc = FCS_START
        
        for i in 0..<buf.count {
            crc = getFcs(crc, buf[i], i)
        }
        
        return (FCS_FINAL == crc)
    }
    
    
    func getFcs(_ fcs: UInt16, _ src: UInt16, _ i: Int) -> UInt16{
        var index = Int((fcs ^ src) & UInt16(0xFF))
        if i == 0
        {
            index = Int((src) & UInt16(0xFF))
            //print("index==>" + String(index))
            
        }
        //print("FCSTAB[index]==> " + String(FCSTAB[index]))
        
        let iresult = (fcs >> 8) ^ FCSTAB[index]
        return UInt16(iresult)
    }
    
    
    //範例：data=[0x20, 0x3F, 0x00, 0x00]
    //     回傳：[0x20, 0x3F, 0x00, 0x00, 0xF1]
    //func test() {
    func CRC(data: [UInt8])-> [UInt8] {
        //let packageData:[UInt16] = [36,36,44,0,50,49,50,66,77,49,49,52,52,49,48,49,48,57,57,0,0,0,0,0,32,1,31,0,0,0,105,241,249,87,0,64,1,0,0,0,25,198]
        
        //var data: [UInt8] = [0x20, 0x01, 0x01, 0x01]
        var data1: [UInt8] = data
        let u16: [UInt16] = data.map{UInt16($0)}
        //print("u16==>")
        //print(u16)
        
        
        let crc16 = makeCrc(buf: u16)
        
        let crc8: UInt8 = UInt8(crc16)
        
        
        data1.append(crc8)
        
        //print("data==>")
        //print(data1)
        
        //print("You Get it!!!")
        
        //let num = 32
        //let ss = String(num, radix: 2)
        //print(ss)
        //print(pad(string: ss,toSize: 8))
        //print(String(num, radix: 16))
        //print("DeviceID==>" + GetDeviceID(DeviceByte: String(num, radix: 2)))
        return data1
    }
    
    func getCRCInfo(crcstring: [UInt8])-> [String] {
        
        //crcstring: [UInt8])-> [UInt8] {
        
        //let bytes: [UInt8] = [0x20, 0x3F, 0x00, 0x00]
        //let crc16table = CRC16Util()
        
        //取得完整的要傳送給ＤＥＶＩＣＥ的資料
        
        
        
        
        
        var crcBytes: [UInt8] = crcstring
        let u16: [UInt16] = crcBytes.map{UInt16($0)}
        
        let crc16 = makeCrc(buf: u16)
        let crc8: UInt8 = UInt8(crc16)
        
        crcBytes.append(crc8)
        //print("data==>")
        //print(crcBytes)
        
        
        //print("You Get it!!!")
        var num = Int(crcBytes[0])
        //let ss = String(num, radix: 2)
        //print(ss)
        //print(String(num, radix: 16)
        var HostCommandProtocol = ["","","","",""]
        //print(HostCommandProtocol[0])
        
        HostCommandProtocol[0] = "DB:"
        HostCommandProtocol[0].append("Hex = " + "0x" + pad(string: String(num, radix: 16), toSize: 2) + " and ")
        HostCommandProtocol[0].append("DeviceID = " + GetDeviceID(DeviceByte: String(num, radix: 2)) + ";")
        //print(HostCommandProtocol[0])
        
        
        num = Int(crcBytes[1])
        let InstructionInfo = GetHRL(InstructionByte: num)
        HostCommandProtocol[1] = "RB:"
        HostCommandProtocol[1].append("Hex = " + "0x" + pad(string: String(num, radix: 16), toSize: 2) + " and ")
        HostCommandProtocol[1].append("Instruction = " + pad(string: String(num, radix: 2), toSize: 8) + " and Des = " + InstructionInfo[0] + " and ACKType = " + InstructionInfo[3] + ";")
        //print(HostCommandProtocol[1])
        
        num = Int(crcBytes[2])
        var Des_IndexList = IndexList(IndexInfo: InstructionInfo[1], IndexValue: num)
        HostCommandProtocol[2] = "IB:"
        HostCommandProtocol[2].append("Hex = " + "0x" + pad(string: String(num, radix: 16), toSize: 2) + " and ")
        HostCommandProtocol[2].append("Instruction = " + InstructionInfo[1] + " and Index = " + pad(string: String(num, radix: 2), toSize: 8) + " and Des = " + Des_IndexList[1] + ";")
        //print(HostCommandProtocol[2])
        
        
        num = Int(crcBytes[3])
        var Des_ValueList = ValueList(ValueInfo: InstructionInfo[2], ValueValue: num)
        HostCommandProtocol[3] = "VB:"
        HostCommandProtocol[3].append("Hex = " + "0x" + pad(string: String(num, radix: 16), toSize: 2) + " and ")
        HostCommandProtocol[3].append("Instruction = " + InstructionInfo[2] + " and Value = " + pad(string: String(num, radix: 2), toSize: 8) + " and Des = " + Des_ValueList[1] + ";")
        //print(HostCommandProtocol[3])
        
        
        num = Int(crcBytes[4])
        HostCommandProtocol[4] = "CB:"
        HostCommandProtocol[4].append("Hex = " + "0x" + pad(string: String(num, radix: 16), toSize: 2) + " and ")
        HostCommandProtocol[4].append("CRC = " + pad(string: String(num, radix: 2), toSize: 8) + ";")
        //print(HostCommandProtocol[4])
        
        return HostCommandProtocol
    }
    
    //#region 1.Device
    func GetDeviceID(DeviceByte: String)-> String
    {
        let fromIndex = DeviceByte.index(DeviceByte.endIndex, offsetBy: -4)
        //var DeviceID = DeviceByte.substring(from: fromIndex)
        //print(DeviceID)
        //print("Int==>")
        //print(Int(DeviceByte.substring(from: fromIndex), radix: 2))
        var DeviceID: String
        DeviceID = String(describing: Int(DeviceByte.substring(from: fromIndex), radix: 2)!)
        return DeviceID;
        
    }
    //#endregion
    
    func GetHRL(InstructionByte: Int)->[String]{
        var InstructionInfo = ["","","",""]
        InstructionInfo[0] = (Description_table[InstructionByte]) //InstructionInfo[0]
        InstructionInfo[1] = (Index_table[InstructionByte])       //InstructionInfo[1]
        InstructionInfo[2] = (Value_table[InstructionByte])       //InstructionInfo[2]
        InstructionInfo[3] = (ACK_table[InstructionByte])         //InstructionInfo[3]
        
        return InstructionInfo
    }
    
    func IndexList(IndexInfo: String, IndexValue: Int)->[String] {
        var Description = [ "" , "" ]
        
        switch IndexInfo{
            
        case "Output":
            Description[0] = "The output that will be selected.(Port 1 = 1, Port 2 = 2 ... Port n = n)"
            if (IndexValue == 0){
                Description[1] = "All outputs"
            }
            else{
                Description[1] = "Instruction code"
                break
            }
        case "Input":
            Description[0] = "The input that will be selected.(Port 1 = 1, Port 2 = 2 ... Port n = n)"
            if (IndexValue == 0){
                Description[1] = "All inputs"
            }
            else{
                Description[1] = "Instruction code"
                break
            }
        case "-":
            Description[0] = "Don't care"
            break
        default:
            break
        }
        return Description
    }
    
    func ValueList(ValueInfo: String, ValueValue: Int)->[String]
    {
        var Description = [ "", ""]
        
        switch (ValueInfo)
        {
        case "Input":
            Description[0] = "The input will be connected.(Port 1 = 1, Port 2 = 2 ... Port n = n)"
            if (ValueValue == 0){
                Description[1] = "Disconnect"
            }
            else{
                Description[1] = "Instruction code"
            }
            break
            
        case "Memory":
            Description[0] = "SelectMemory address(The maximum Memory address is 15)"
            if (ValueValue == 0){
                Description[1] = "Current Status"
            }
            else{
                Description[1] = "Instruction code"
            }
            break
            
        case "Enable":
            Description[0] = "1:EnableStatus(example:Mute, Plug); 0:DisableStatus(example:Unmute, Unplug)"
            if (ValueValue == 0){
                Description[1] = "1:EnableStatus(example:Mute, Plug)"
            }
            else{
                Description[1] = "0:DisableStatus(example:Unmute, Unplug)"
            }
            break
            
        case "Level":
            Description[0] = "Level Range(0-100)"
            if (ValueValue == 129) {
                Description[1] = "Increse a step"
            }
            else if ValueValue == 130 {
                Description[1] = "Decrese a step"
            }
            else {
                Description[1] = "Instruction code"
            }
            break
            
        case "Delay1":
            Description[0] = "Audio delay time is 16-bit data. (Unit: 5 ms)"
            let Delay1_Value = IndexInfo_Delay(Delay: ValueInfo, DelayValue: ValueValue)
            Description[1] = String(Delay1_Value)
            break
            
        case "Delay2":
            Description[0] = "Audio delay time is 16-bit data. (Unit: 5 ms)"
            let Delay2_Value = IndexInfo_Delay(Delay: ValueInfo, DelayValue: ValueValue)
            Description[1] = String(Delay2_Value)
            break
            
        case "EDID":
            Description[0] = "EDID Type"
            if (ValueValue == 0) {
                Description[1] = "Fixed(Device defaultEDID)"
            }
            if (ValueValue == 1) {
                Description[1] = "Output 1 (Copy the EDID from output 1)"
            }
            else {
                Description[1] = "Instruction code"
            }
            break
            
        case "Other":
            Description[0] = "Please referto the user manual"
            break
            
        case "-":
            Description[0] = "Don't care"
            break
            
        default:
            break
        }
        return Description
    }
    
    func IndexInfo_Delay(Delay: String, DelayValue: Int)-> UInt8
    {
        var DelayUnit = 0;
        
        DelayUnit = DelayValue * 60 * 1000 / 5;
        var DelayUnit_Hex = pad(string: String(DelayUnit, radix: 2), toSize: 4)
        
        if (Delay == "Delay1"){
            let fromIndex = DelayUnit_Hex.index(DelayUnit_Hex.endIndex, offsetBy: -2)
            DelayUnit_Hex = DelayUnit_Hex.substring(to: fromIndex)
        }
        if (Delay == "Delay2"){
            let toIndex = DelayUnit_Hex.index(DelayUnit_Hex.startIndex, offsetBy: 2)
            DelayUnit_Hex = DelayUnit_Hex.substring(to: toIndex)
        }
        
        DelayUnit_Hex = "0x" + DelayUnit_Hex
        
        return UInt8(DelayUnit_Hex)!
    }
    
    
    
    func getACKCode(ACKType: String, DeviceIDString: String, InstructionString: String, IndexString: String, ValueString: String, CRCString: String, outStream: [UInt8]) ->[String]
    {
        
        //print (ACKType)
        //print (DeviceIDString)
        //print (InstructionString)
        //print (IndexString)
        //print (ValueString)
        //print (CRCString)
        //print ("outStream==>")
        //print (outStream)
        
        //var str = [String]()
        
        var ACKBytes: [UInt8] = outStream
        ACKBytes = outStream
        var ReturnLen = 0
        //print ("1==>")
        switch (ACKType)
        {
        case "A":
            ReturnLen = 2
        case "B":
            ReturnLen = 3
        case "C":
            ReturnLen = 4
            
        case "D":
            if IndexString == "00000000"{
                ReturnLen = 7
            }
            if IndexString == "00000001"{
                ReturnLen = 8//原本11
            }
        default:
            ReturnLen = 0
        }
        //print ("2==>")
        
        var ACKPacket = [String](repeating: "", count: ReturnLen)
        var ACC = ACC_Fun(ABInfo: ACKBytes[0])
        let DeviceID = GetDeviceID(ABInfo: ACKBytes[0])
        ACKPacket[0] = "AB:ACC = " + ACC[0] + " and DeviceID = " + DeviceID + ";"
        
        
        //忘了
        //UInt8 CRCCode = outstream(3)
        //print (Int(outStream[1]))
        
        let CRCCode: UInt8 = outStream[Int(outStream[1])+2]
        //print (Int(outStream[1])+2)
        if (String(CRCCode) == CRCString) {
            ACKPacket[1] = "CB:CRC = " + String(CRCCode)
        }
        else {
            ACKPacket[1] = "CB:CRC = 回傳的ＣＲＣ字串值不符(" + String(CRCCode) + "<>" + CRCString + ")" + ";"
        }
        //print ("ACKType==>")
        //print ( ACKType)
        
        if (!(ACKType == "A")){
            ACKPacket[3] = "DB:"
            ACKPacket[2] = "LB:LB = " + String(ACKBytes[1]) + ";"
            
            switch ACKType {
            case "B":
                var IndexBytes = [String](repeating: "", count: Int(ACKBytes[1])/2)
                var ValueBytes = [String](repeating: "", count: Int(ACKBytes[1])/2)
                
                for i in 0 ... (Int(ACKBytes[1])/2) {
                    if (i % 2 == 0) {
                        IndexBytes[i/2] = String(ACKBytes[2+i])
                        ACKPacket[3+(i/2)] = "DB:IB = " + IndexBytes[i/2]
                    }
                    else
                    {
                        ValueBytes[i/2] = String(ACKBytes[2+i])
                        ACKPacket[3+(i/2)] = "DB:VB = " + ValueBytes[i/2]
                        
                    }
                }
                
                break
            case "C":
                //print ("InstructionString==>" + InstructionString)
                //print(Int(InstructionString))
                
                //print (String(describing: Int(InstructionString, radix: 2)!))
                if(String(describing: Int(InstructionString, radix: 2)!) == "48") {
                    let DB = "v" + String(ACKBytes[2]) + "." + String(ACKBytes[3])
                    //print("48==>")
                    //print(DB)
                    ACKPacket[3] = ACKPacket[3] + "Protocol Version = " + DB + ";"
                }
                if(String(describing: Int(InstructionString, radix: 2)!) == "49") {
                    var DB = "v"
                    //print("49==>")
                    //print(ACKBytes[2])
                    //print(String(ACKBytes[2], radix: 2))
                    //print (pad(string: String(ACKBytes[2], radix: 2), toSize: 8))
                    //print (pad(string: String(ACKBytes[2], radix: 2), toSize: 8).substring(with: 0..<4))
                    //print (Int(pad(string: String(ACKBytes[2], radix: 2), toSize: 8).substring(with: 0..<4)))
                    
                    let v1 = String(describing: Int(pad(string: String(ACKBytes[2], radix: 2), toSize: 8).substring(with: 0..<4), radix: 2)!)
                    //print (v1)
                    
                    let v2 = String(describing: Int(pad(string: String(ACKBytes[2], radix: 2), toSize: 8).substring(with: 4..<5), radix: 2)!)
                    //print (v2)
                    let v3 = String(ACKBytes[3])
                    //print(String(ACKBytes[3]))
                    
                    DB += v1 + "." + v2 + "." + v3
                    
                    ACKPacket[3] = ACKPacket[3] + "Firmware Version = " + DB + ";"
                    //print (ACKPacket[3])
                }
                
                break
            case "D":
                
                
                //if (Int(IndexString) == 1  && ACKBytes.count<7){
                //    //if(ACKBytes.count<7){
                //    ACKBytes.append(0x00)
                //    ACKBytes.append(0x00)
                //    ACKBytes.append(0x00)
                //    print (ACKBytes[7])
                //    print (ACKBytes[8])
                //    print (ACKBytes[9])
                //    //}
                //}
                
                var Des = DataList(Lengthcode: Int(ACKBytes[1]), IndexByte: IndexString, ACKBytes: ACKBytes)
                
                //print ("DES==>")
                //print (Des)
                //print (ACKPacket.count)
                
                for i in 0 ... Des.count-1 {
                    //print (Des[i])
                    ACKPacket[3+i] = Des[i]
                    
                }
                break
            default:
                break
            }
        }
        
        
        
        
        
        return ACKPacket
    }
    
    func ACC_Fun(ABInfo: UInt8)->[String]
    {
        
        
        let ACC = String(ABInfo).substring(with: 0..<1)
        var Description = ["",""]
        //====The devices acknowledge status. Accept or Reject====//
        switch (ACC)
        {
        case "1":
            Description[0] = "1(ACK)";
            Description[1] = "device accepts this command. (ACK; acknowledge)";
            break;
        case "0":
            Description[0] = "0(NAK)";
            Description[1] = "device rejects this command. (NAK; negativeacknowledge)";
            break;
        default:
            break;
        }
        return Description;
        
    }
    
    func GetDeviceID(ABInfo: UInt8) -> String
    {
        //int StartBit = 0, Length = 8;
        //StartBit = 3;//起始字元
        //先將二進位的轉換成字串，擷取從起始位元至最後一個位元，再補齊8個位元的字串
        //string Device = Convert.ToString(ABInfo, 2).ToUpper().PadLeft(Length, '0').Substring(StartBit, Length - StartBit).PadLeft(Length, '0');
        let DeviceID = pad(string: String(ABInfo, radix: 2), toSize: 8).substring(with: 3..<8)
        //var DeviceID = String(ABInfo)//.substring(with: 3..<4)
        //print (DeviceID)
        //DeviceID = DeviceID.substring(with: 3..<4)
        //pars.append(HostCommandStr.substring(with: 0..<position))
        
        
        //將8個位元的字串轉成二進位制，並取得Device ID
        //Byte DeviceID = Convert.ToByte(Device, 2);
        return DeviceID;
    }
    
    
    func DataList(Lengthcode: Int, IndexByte: String, ACKBytes: [UInt8]) -> [String]
    {
        var num = 7;
        //print ("IndexByte==>")
        //print (IndexByte)
        
        if (Int(IndexByte) == 0){
            num = 4
        }
        else
        {
            num = 5;//原本是8
        }
        
        //print ("IndexByte==>")
        //print (IndexByte)
        
        //String[] Description = new string[num];
        var Description = [String](repeating: "", count: num)    ////Page 0
        //byte INFO, OPM, IPM;
        //byte[] DN = new byte[Lengthcode - 3];
        
        ////Page 1
        //byte DINF, VINF, AINF, LINK, DTMAX, PIP, ASP, RES;
        //print ("ACKBytes==>")
        //print (ACKBytes)
        
        //====   Page 0   ====//
        if (Int(IndexByte) == 0)//Instruction 0x3F and Index 0x00(IndexByte)
        {
            let INFO: UInt8
            var OPM: UInt8
            var IPM: UInt8
            //byte INFO, OPM, IPM: UInt8
            var DN = [String](repeating: "", count: Lengthcode - 3)
            //byte[] DN = new byte[Lengthcode - 3];
            
            INFO = ACKBytes[2]
            OPM = ACKBytes[3]  //Total Output Port
            IPM = ACKBytes[4]  //Total Input port
            
            
            for i in 0 ... DN.count-1 {
                DN[i] = String(ACKBytes[i + 5]);
            }
            
            let INFO_str = pad(string: String(INFO, radix: 2), toSize: 8)
            //Convert.ToString(INFO, 2).PadLeft(8, '0')
            //print ("INFO_str==>")
            //print (INFO_str)
            let INFO_Audio = INFO_str.substring(with: 0..<1)//INFO_str.Substring(0, 1)//Convert.ToString(INFO, 2).Substring(0, 1);
            let INFO_Video = INFO_str.substring(with: 1..<2)//INFO_str.Substring(1, 1)//Convert.ToString(INFO, 2).Substring(1, 1);
            let INFO_PAGE1 = INFO_str.substring(with: 2..<3)//INFO_str.Substring(2, 1)//Convert.ToString(INFO, 2).Substring(2, 1);
            var INFO_TOTALMEMORY = INFO_str.substring(with: 4..<8)//INFO_str.Substring(4, 4)//Convert.ToString(INFO, 2).Substring(4, 4);
            
            //====   INFO   ====//
            Description[0] = "INFO:";
            
            if (INFO_Audio == "1")
            {
                Description[0] += "Audio = Support and "
            }
            else
            {
                Description[0] += "Audio = Not Support and "
            }
            
            if (INFO_Video == "1")
            {
                
                Description[0] += "Video = Support and "
            }
            else
            {
                Description[0] += "Video = Not Support and "
            }
            
            if (INFO_PAGE1 == "1")//(Instruction 0x3F and Index 0x01)
            {
                Description[0] += "PAGE1 = " + INFO_PAGE1 + " and "
            }
            else
            {
                Description[0] += "PAGE1 = " + INFO_PAGE1 + " and "
            }
            INFO_TOTALMEMORY = String(describing: Int(INFO_TOTALMEMORY, radix: 2)!)
            
            Description[0] += "Memory = " + INFO_TOTALMEMORY + ";"//+ Convert.ToByte(INFO_TOTALMEMORY, 2) + ";"
            
            //print (Description[0])
            
            //====   OPM   ====//
            Description[1] += "OPM:Output = " + String(ACKBytes[3]) + ";"
            //print("Description[1]==>")
            //print(Description[1])
            
            
            //====   IPM   ====//
            Description[2] += "IPM:Input = " + String(ACKBytes[4]) + ";"
            
            //====   DN   ====//
            //print("DN==>")
            //print(DN)
            var Name = ""
            for ch in DN {
                //print (String(format: "%c",Int(ch)!))
                Name += String(format: "%c",Int(ch)!)
            }
            
            Description[3] += "DN:DN = " + Name + ";"//+ System.Text.Encoding.ASCII.GetString(DN) + ";"
            //print (Description[3])
            
        }
        
        //====   Page 1   ====//
        if (Int(IndexByte) == 1)//Instruction 0x3F and Index 0x01(IndexByte)
        {
            
            let DINF, VINF, AINF, LINK, DTMAX: UInt8
            //var PIP, ASP, RES: UInt8
            DINF = ACKBytes[2] //Bit 5 : PAGE2; Bit 0 : FWVER
            VINF = ACKBytes[3] //Bit 7 : EDID ; Bit 3 : PIP ; Bit 2 : ASP ; Bit 1 : RES  ; Bit 0 : CF
            AINF = ACKBytes[4] //Bit 6 : DELAY; Bit 3 : SW  ; Bit 2 : TRE ; Bit 1 : BASS ; Bit 0 : VOL
            LINK = ACKBytes[5] //Bit 3 : LKAO ; Bit 2 : LKVO; Bit 1 : LKAI; Bit 0 : LKVI
            DTMAX = ACKBytes[6]//Delay Time Maximum(Unit: 100ms)
            
            //PIP = ACKBytes[7]  //PIP mode Maximum(if 8 means:0~7)
            //ASP = ACKBytes[8]  //Aspect Ratio mode Maximum(if 2 means:0~1)
            //RES = ACKBytes[9] //Resolution mode Maximum(if 8 means:0~7)
            
            //====   DINF   ====//
            let DINF_str = pad(string: String(DINF, radix: 2), toSize: 8)//Convert.ToString(DINF, 2).PadLeft(8, '0')
            let DINF_PAGE2 = DINF_str.substring(with: 2..<3)//DINF_str.Substring(2, 1)
            let DINF_FWVER = DINF_str.substring(with: 7..<8)//DINF_str.Substring(7, 1)
            
            Description[0] = "DINF:";
            if (DINF_PAGE2 == "1")//(Instruction 0x3F and Index 0x02)
            {
                Description[0] += "PAGE2 = " + DINF_PAGE2 + "(Instruction 0x3F and Index 0x02) and "
            }
            else
            {
                Description[0] += "PAGE2 = " + DINF_PAGE2 + " and "
            }
            if (DINF_FWVER == "1")//(Instruction 0x31)
            {
                Description[0] += "FWVER = " + DINF_FWVER + "(Instruction 0x31)" + ";"
            }
            else
            {
                Description[0] += "FWVER = " + DINF_FWVER + ";"
            }
            
            //====   VINF   ====//
            let VINF_str = pad(string: String(VINF, radix: 2), toSize: 8)//Convert.ToString(VINF, 2).PadLeft(8, '0')
            let VINF_EDID = VINF_str.substring(with: 0..<1)//VINF_str.Substring(0, 1)
            let VINF_PIP = VINF_str.substring(with: 4..<5)//VINF_str.Substring(4, 1)
            let VINF_ASP = VINF_str.substring(with: 5..<6)//VINF_str.Substring(5, 1)
            let VINF_RES = VINF_str.substring(with: 6..<7)//VINF_str.Substring(6, 1)
            let VINF_CF = VINF_str.substring(with: 7..<8)//VINF_str.Substring(7, 1)
            
            Description[1] = "VINF:"
            if (VINF_EDID == "1")//Input EDID type  select command flag. (Instruction 0x20 and 0x21)
            {
                Description[1] += "EDID = Support and "
            }
            else
            {
                Description[1] += "EDID = Not Support and "
            }
            if (VINF_PIP == "1")//Output Color Format select command flag. (Instruction 0x22 and 0x23)
            {
                Description[1] += "PIP = " + VINF_PIP + " and "
            }
            else
            {
                Description[1] += "PIP = " + VINF_PIP + " and "
            }
            if (VINF_ASP == "1")//Output Resolution mode select command flag. (Instruction 0x24 and 0x25)
            {
                Description[1] += "ASP = " + VINF_ASP + " and "
            }
            else
            {
                Description[1] += "ASP = " + VINF_ASP + " and "
            }
            if (VINF_RES == "1")//Output Aspect Ratiomode select command flag. (Instruction 0x26 and 0x27)
            {
                Description[1] += "RES = " + VINF_RES + " and "
            }
            else
            {
                Description[1] += "RES = " + VINF_RES + " and "
            }
            if (VINF_CF == "1")//Output Aspect Ratiomode select command flag. (Instruction 0x28 and 0x29)
            {
                Description[1] += "CF = " + VINF_CF + ";"
            }
            else
            {
                Description[1] += "CF = " + VINF_CF + ";"
            }
            
            //====   AINF   ====//
            let AINF_str = pad(string: String(AINF, radix: 2), toSize: 8)//Convert.ToString(AINF, 2).PadLeft(8, '0')
            let AINF_DELAY = AINF_str.substring(with: 1..<2)//AINF_str.Substring(1, 1)
            let AINF_SW = AINF_str.substring(with: 4..<5)//AINF_str.Substring(4, 1)
            let AINF_TRE = AINF_str.substring(with: 5..<6)//AINF_str.Substring(5, 1)
            let AINF_BASS = AINF_str.substring(with: 6..<7)//AINF_str.Substring(6, 1)
            let AINF_VOL = AINF_str.substring(with: 7..<8)//AINF_str.Substring(7, 1)
            
            Description[2] = "AINF:";
            if (AINF_DELAY == "1")//Support audio delay Command flag. (Instruction 0x1C to 0x1F)
            {
                Description[2] += "DELAY = " + AINF_DELAY + "(Instruction 0x1C to 0x1F) and "
            }
            else
            {
                Description[2] += "DELAY = " + AINF_DELAY + " and "
            }
            if (AINF_SW == "1")//Support Subwoofer command flag. (Instruction 0x18 and 0x19)
            {
                Description[2] += "SW = " + AINF_SW + "(Instruction 0x18 and 0x19) and "
            }
            else
            {
                Description[2] += "SW = " + AINF_SW + " and "
            }
            if (AINF_TRE == "1")//Support Treble command flag. (Instruction 0x16 and 0x17)
            {
                Description[2] += "TRE = " + AINF_TRE + "(Instruction 0x16 and 0x17) and "
            }
            else
            {
                Description[2] += "TRE = " + AINF_TRE + " and "
            }
            if (AINF_BASS == "1")//Support BASS command flag. (Instruction 0x14 and 0x15)
            {
                Description[2] += "BASS = " + AINF_BASS + "(Instruction 0x14 and 0x15) and ";
            }
            else
            {
                Description[2] += "BASS = " + AINF_BASS + " and "
            }
            if (AINF_VOL == "1")//Support Volume and Mute command flag. (Instruction 0x10 to 0x13)
            {
                Description[2] += "VOL = " + AINF_VOL + "(Instruction 0x10 to 0x13)" + ";"
            }
            else
            {
                Description[2] += "VOL = " + AINF_VOL + ";"
            }
            
            //====   LINK   ====//
            let LINK_str = pad(string: String(LINK, radix: 2), toSize: 8)//Convert.ToString(LINK, 2).PadLeft(8, '0')
            let LINK_LKAO = LINK_str.substring(with: 4..<5)//LINK_str.Substring(4, 1)
            let LINK_LKVO = LINK_str.substring(with: 5..<6)//LINK_str.Substring(5, 1)
            let LINK_LKAI = LINK_str.substring(with: 6..<7)//LINK_str.Substring(6, 1)
            let LINK_LKVI = LINK_str.substring(with: 7..<8)//LINK_str.Substring(7, 1)
            
            Description[3] = "LINK:";
            if (LINK_LKAO == "1")//Video input link status detection command flag. (Instruction 0x09)
            {
                Description[3] += "LKAO = " + LINK_LKAO + "(Instruction 0x09) and "
            }
            else
            {
                Description[3] += "LKAO = " + LINK_LKAO + " and "
            }
            if (LINK_LKVO == "1")//Audio input link status detection command flag. (Instruction 0x0A)
            {
                Description[3] += "LKVO = " + LINK_LKVO + "(Instruction 0x0A) and "
            }
            else
            {
                Description[3] += "LKVO = " + LINK_LKVO + " and "
            }
            if (LINK_LKAI == "1")//Vedio outnput link status detection command flag. (Instruction 0x0B)
            {
                Description[3] += "LKAI = " + LINK_LKAI + "(Instruction 0x0B) and "
            }
            else
            {
                Description[3] += "LKAI = " + LINK_LKAI + " and "
            }
            if (LINK_LKVI == "1")//Audio outnput link status detection command flag. (Instruction 0x0C)
            {
                Description[3] += "LKVI = " + LINK_LKVI + ";"
            }
            else
            {
                Description[3] += "LKVI = " + LINK_LKVI + ";"
            }
            
            //DTMAX = ACKBytes[6];//Delay Time Maximum(Unit: 100ms)
            //PIP = ACKBytes[7];  //PIP mode Maximum(if 8 means:0~7)
            //ASP = ACKBytes[8];  //Aspect Ratio mode Maximum(if 2 means:0~1)
            //RES = ACKBytes[9]; ;//Resolution mode Maximum(if 8 means:0~7)
            
            Description[4] += "DTMAX:DTMAX = " + String(ACKBytes[6]) + ";"
            //Hx-2544沒有回傳
            //Description[5] += "PIP:PIP = " + String(ACKBytes[7]) + ";"
            //Description[6] += "ASP:ASP = " + String(ACKBytes[8]) + ";"
            //Description[7] += "RES:RES = " + String(ACKBytes[9]) + ";"
        }
        return Description;
    }
    
}
