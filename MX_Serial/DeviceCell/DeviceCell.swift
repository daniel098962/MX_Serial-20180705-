//
//  DeviceCell.swift
//  MX_Serial
//
//  Created by AV Link-RD on 2017/12/6.
//  Copyright © 2017年 AV Link-RD. All rights reserved.
//

import UIKit

class DeviceCell: UITableViewCell {
    
    //@IBOutlet weak var Label_IP: UILabel!
    //@IBOutlet weak var Lab_Title: UILabel!
    //@IBOutlet weak var Lab_Content: UILabel!1233
    @IBOutlet weak var ipLabel: UILabel!
    @IBOutlet weak var macAddressLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var hostnameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
