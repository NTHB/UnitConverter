//
//  UnitConvertor.swift
//  Unit_Convertor
//
//  Created by Noppawit Hansompob on 2019-01-21.
//  Copyright © 2019 Noppawit Hansompob. All rights reserved.
//

import Foundation

class UnitConvertor {
    func degreeFarenheit(degreeCelcius: Int) -> Int {
        return Int(1.8 * Float(degreeCelcius) + 32.0)
    }
    func degreeCelcius(degreeFarenheit: Int) -> Int {
        return Int((5/9) * (Float(degreeFarenheit) - 32.0))
    }
}
