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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    let unitConvertor = UnitConvertor()
    
    let userDefaultsLastRowKey = "defaultCalciusPickerRow"
    
    var firstSegment = true
    
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
        if(firstSegment == true){
            let celciusValue = temperatureRange.values[row]
            temperatureLabel.text = "\(unitConvertor.degreeFarenheit(degreeCelcius: celciusValue))°F"
        }
        else {
            let fahrenheitValue = temperatureRange.values[row]
            temperatureLabel.text = "\(unitConvertor.degreeCelcius(degreeFarenheit: fahrenheitValue))°C"
        }
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            firstSegment = true
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            
        case 1:
            firstSegment = false
            temperaturePicker.reloadComponent(0)
            pickerView(temperaturePicker, didSelectRow: initialPickerRow(), inComponent: 0)
            
        default:
            break
        }
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(firstSegment == true) {
            return "\(temperatureRange.values[row])°C"
        }
        else {
            return "\(temperatureRange.values[row])°F"
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
    }
    
    
}
