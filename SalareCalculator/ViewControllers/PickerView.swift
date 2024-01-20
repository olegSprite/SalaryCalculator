//
//  PickerView.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 21.01.2024.
//

import Foundation
import UIKit

// MARK: - PickerViewDataSource

extension CounterViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mounth.count
    }
}

// MARK: - PickerViewDelegate

extension CounterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mounth[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            curentMounth = .january
            enabledCelebration()
        case 1:
            curentMounth = .february
            enabledCelebration()
        case 2:
            curentMounth = .march
            enabledCelebration()
        case 3:
            curentMounth = .april
            hideCelebration()
        case 4:
            curentMounth = .may
            enabledCelebration()
        case 5:
            curentMounth = .june
            enabledCelebration()
        case 6:
            curentMounth = .july
            hideCelebration()
        case 7:
            curentMounth = .august
            hideCelebration()
        case 8:
            curentMounth = .september
            hideCelebration()
        case 9:
            curentMounth = .october
            hideCelebration()
        case 10:
            curentMounth = .november
            enabledCelebration()
        case 11:
            curentMounth = .december
            hideCelebration()
        default:
            return
        }
    }
}
