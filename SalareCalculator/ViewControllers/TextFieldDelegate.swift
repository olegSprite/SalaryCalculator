//
//  TextFieldDelegate.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 24.01.2024.
//

import Foundation
import UIKit

extension CounterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn rate: NSRange, replacementString string: String) -> Bool {
        returnSalaryToScreen()
        return true
    }
}
