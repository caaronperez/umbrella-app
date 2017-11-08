//
//  SettingsController.swift
//  Umbrella
//
//  Created by MCS Devices on 11/7/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    var units: String!
    var zip: String!
    var unitsP = ["Fahrenheit", "Celsius"]
    @IBOutlet weak var zipField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initElements()
    }
    
    func initElements(){
        units = "Fahrenheit"
        self.title = "Settings"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let zipF = zipField.text, units != nil {
            self.zip = zipF
        }
    }
}

extension SettingsController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       units = unitsP[pickerView.selectedRow(inComponent: 0)]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unitsP.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unitsP[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
