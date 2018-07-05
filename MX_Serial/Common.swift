//
//  File.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/11/9.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import Foundation

extension String{
    func positionof(sub: String)->Int {
        var pos = -1
        if let range = range(of: sub){
            if !range.isEmpty{
                pos = characters.distance(from: startIndex, to: range.lowerBound)
            }
        }
        return pos
    }
    
    func index(from: Int)-> Index{
        return self.index(startIndex,offsetBy: from)
    }
    
    func substring(from: Int)-> String{
        let fromIndex = index(from: from)
        return substring(to: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r:Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

final class Common {
    
    
    
    let crc16table = CRC16Util()
    
    func HostCommandProtocalParse(HostCommand: [UInt8])-> [String] {
        var ParseResult: [String] = ["","","","","",""]
        
        var ResultFromCRC: [String] = crc16table.getCRCInfo(crcstring: HostCommand)
        //print ("ResultFromCRC==>")
        //print (ResultFromCRC)
        //print ("1======")
        ParseResult[0] = GetHostCommandValue(HostCommand: ResultFromCRC[0], para: "DeviceID")
        //print ("2======")
        ParseResult[1] = GetHostCommandValue(HostCommand: ResultFromCRC[1], para: "ACKType")
        //print ("3======")
        ParseResult[2] = GetHostCommandValue(HostCommand: ResultFromCRC[1], para: "Instruction")
        //print ("4======")
        ParseResult[3] = GetHostCommandValue(HostCommand: ResultFromCRC[2], para: "Index")
        //print ("5======")
        ParseResult[4] = GetHostCommandValue(HostCommand: ResultFromCRC[3], para: "Value")
        //print ("6======")
        ParseResult[5] = GetHostCommandValue(HostCommand: ResultFromCRC[4], para: "CRC")
        //print ("7======")
        //print ("ParseResult==>")
        //print (ParseResult)
        
        return ParseResult
    }
    
    func GetHostCommandValue(HostCommand: String, para: String)->String {
        //print ("KK HostCommand==>")
        //print (HostCommand)
        
        var str = ""
        var pars_list = ParseHostCommand(HostCommand: HostCommand)
        
        //print ("pars_List==>")
        //print (pars_list)
        for i in 0 ... pars_list.count-1 {
            
            if(pars_list[i].positionof(sub: para) > -1) {
                //print ("String(pars_list[i])==>")
                //print (String(pars_list[i])!)
                //str = ((pars_list[i]).replacingOccurrences(of: para + " = ", with: ""))
                str = pars_list[i].replacingOccurrences(of: para + " = ", with: "")
            }
        }
        
        return str
    }
    
    func ParseHostCommand(HostCommand: String)-> [String] {
        
        var HostCommandStr = HostCommand
        
        var pars = [String]()
        var position = HostCommandStr.positionof(sub: ";")
        let RemoveFirst = HostCommandStr.positionof(sub: ":")
        if ( RemoveFirst > -1){
            HostCommandStr.characters.removeFirst(RemoveFirst+1)
        }else
        {
            //print (HostCommandStr)
            HostCommandStr.characters.removeFirst(3)
        }
        //print ("Main HostCommandStr==>")
        //print (HostCommandStr)
        
        
        while    HostCommandStr.characters.count>0 {
            position = HostCommandStr.positionof(sub: " and ")
            
            if(position == -1)
            {
                //print ("1=========>")
                //print ("HostCommandStr==>")
                //print (HostCommandStr)
                
                position = HostCommandStr.positionof(sub: ";")
                //print ("position==>")
                //print (HostCommandStr)
                //print (position)
                pars.append(HostCommandStr.substring(with: 0..<position))
                //print (pars)
                //print ("HostCommandStr==>")
                //print (HostCommandStr)
                
                HostCommandStr.characters.removeAll()
                //print (HostCommandStr.characters.count)
                
            }
            else
            {
                //print ("position==>")
                //print (position)
                pars.append(HostCommandStr.substring(with: 0..<position))
                //print ("2=========>")
                //print ("HostCommandStr==>")
                //print (HostCommandStr)
                HostCommandStr.characters.removeFirst(position + 5)
                
            }
            
        }
        
        //print (pars)
        return pars
        
    }
    
    
    
}
