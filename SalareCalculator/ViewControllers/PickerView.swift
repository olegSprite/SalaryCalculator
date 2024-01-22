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
            curentMounth = .none
            enabledCelebration()
        case 1:
            curentMounth = .january
            enabledCelebration()
        case 2:
            curentMounth = .february
            enabledCelebration()
        case 3:
            curentMounth = .march
            enabledCelebration()
        case 4:
            curentMounth = .april
            hideCelebration()
        case 5:
            curentMounth = .may
            enabledCelebration()
        case 6:
            curentMounth = .june
            enabledCelebration()
        case 7:
            curentMounth = .july
            hideCelebration()
        case 8:
            curentMounth = .august
            hideCelebration()
        case 9:
            curentMounth = .september
            hideCelebration()
        case 10:
            curentMounth = .october
            hideCelebration()
        case 11:
            curentMounth = .november
            enabledCelebration()
        case 12:
            curentMounth = .december
            hideCelebration()
        default:
            return
        }
    }
}
