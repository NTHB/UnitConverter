//
//  TemperatureRange.swift
//  Unit_Convertor
//
//  Created by Noppawit Hansompob on 2019-01-21.
//  Copyright © 2019 Noppawit Hansompob. All rights reserved.
//

import UIKit
import Foundation


class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    var values = (-100...100).map { $0 }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    
}
