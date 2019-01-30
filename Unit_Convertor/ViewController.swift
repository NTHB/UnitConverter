//
//  ViewController.swift
//  Unit_Convertor
//
//  Created by Noppawit Hansompob on 2019-01-21.
//  Copyright © 2019 Noppawit Hansompob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    
    let unitConvertor = UnitConvertor()
    
    let userDefaultsLastRowKey = "defaultCalciusPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temperaturePicker.delegate = self;
        let defaultPickerRow = initialPickerRow()
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        
        pickerView(temperaturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
    }

    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int {
            return savedRow
        }
        
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    func saveSelectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
    func displayConvertedTemperatureForRow(row: Int) {
        let celciusValue = temperatureRange.values[row]
        temperatureLabel.text = "\(unitConvertor.degreeFarenheit(degreeCelcius: celciusValue))°F"
    }
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureRange.values[row])°C"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
    }
}
