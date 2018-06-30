//
//  MyPickerView.swift
//  DropDown-Demo
//
//  Created by sushant jagtap on 16/06/18.
//  Copyright © 2018 Creative Corner. All rights reserved.
//

import Foundation
import UIKit

class MyPickerView: UIPickerView {
    
    var pickerData: [String]!
    var pickerTextfield: UITextField!
    
    init(pickerData: [String], dropDownField: UITextField) {
        super.init(frame: .zero)
        
        self.pickerData = pickerData
        self.pickerTextfield = dropDownField
        
        self.delegate = self
        self.dataSource = self
        
        DispatchQueue.main.async {
            if pickerData.count != 0 {
                self.pickerTextfield.text = self.pickerData[0]
                self.pickerTextfield.isEnabled = true
            } else {
                self.pickerTextfield.text = nil
                self.pickerTextfield.isEnabled = false
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

extension MyPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextfield.text = pickerData[row]
        pickerTextfield.resignFirstResponder()
    }
}





