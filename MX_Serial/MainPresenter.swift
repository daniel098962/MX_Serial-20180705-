//
//  File.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/12/6.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit
import Foundation

protocol MainPresenterDelegate {
    func mainPresenterIPSearchFinished()
    func mainPresenterIPSearchCancelled()
    func mainPresenterIPSearchFailed()
}

class MainPresenter: NSObject, MMLANScannerDelegate {
    
    @objc dynamic var connectedDevices : [Device]!
    @objc dynamic var progressValue : Float = 0.0
    @objc dynamic var isScanRunning : BooleanLiteralType = false
    
    var lanScanner : MMLANScanner!
    var delegate : MainPresenterDelegate?
    
    //MARK: - Custom init method
    //Initialization with delegate
    init(delegate:MainPresenterDelegate?){
        
        super.init()
        
        self.delegate = delegate!
        
        self.connectedDevices = [Device]()
        
        self.isScanRunning = false
        
        self.lanScanner = MMLANScanner(delegate:self)
        
    }
    
    //MARK: - Button Actions
    //This method is responsible for handling the tap button action on MainVC. In case the scan is running and the button is tapped it will stop the scan
    func scanButtonClicked()-> Void {
        
        if (self.isScanRunning) {
            
            self.stopNetWorkScan()
        }
        else {
            
            self.startNetWorkScan()
        }
    }
    
    func startNetWorkScan() ->Void{
        
        if (self.isScanRunning) {
            
            self.stopNetWorkScan()
        }
        else {
            
            self.isScanRunning = true
            self.lanScanner.start()
        }
    }
    
    func stopNetWorkScan() ->Void{
        
        self.lanScanner.stop()
        self.isScanRunning = false
    }
    
    //MARK: - SSID Info
    //Getting the SSID string using LANProperties
    func ssidName() -> String {
        
        return LANProperties.fetchSSIDInfo()
    }
    
    // MARK: - MMLANScanner Delegates
    //The delegate methods of MMLANScanner
    func lanScanDidFindNewDevice(_ device: Device!) {
        //Adding the found device in the array
        self.connectedDevices?.append(device)
    }
    
    func lanScanDidFailedToScan() {
        
        self.isScanRunning = false
        self.delegate?.mainPresenterIPSearchFailed()
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        
        self.isScanRunning = false
        
        //Checks the status of finished. Then call the appropriate method
        if (status == MMLanScannerStatusFinished) {
            
            self.delegate?.mainPresenterIPSearchFinished()
        }
        else if (status == MMLanScannerStatusCancelled) {
            
            self.delegate?.mainPresenterIPSearchCancelled()
        }
    }
    
    func lanScanProgressPinged(_ pingedHosts: Float, from overallHosts: Int) {
        
        //Updating the progress value. MainVC will be notified by KVO
        self.progressValue = pingedHosts / Float(overallHosts)
    }
    
}
