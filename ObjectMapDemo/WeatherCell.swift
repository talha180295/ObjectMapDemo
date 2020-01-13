//
//  WeatherCell.swift
//  ObjectMapDemo
//
//  Created by Apple on 08/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var temp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
    func setData(day:String, condition:String,temp:Int){
        
        self.day.text = day
        self.condition.text = condition
        self.temp.text = String(UnicodeScalar(UInt8(temp)))
        
    }
    
}
