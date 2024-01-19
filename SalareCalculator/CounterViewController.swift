//
//  CounterViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation
import UIKit

class CounterViewController: UIViewController {
    
    @IBOutlet weak private var mounthPicker: UIPickerView!
 
    private var curentMounth: Mounth?
    private let mounth: [Mounth] = [
        .january,
        .february,
        .march,
        .april,
        .may,
        .june,
        .july,
        .august,
        .september,
        .october,
        .november,
        .december
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

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
        case 1:
            curentMounth = .february
        case 2:
            curentMounth = .march
        case 3:
            curentMounth = .april
        case 4:
            curentMounth = .may
        case 5:
            curentMounth = .june
        case 6:
            curentMounth = .july
        case 7:
            curentMounth = .august
        case 8:
            curentMounth = .september
        case 9:
            curentMounth = .october
        case 10:
            curentMounth = .november
        case 11:
            curentMounth = .december
        default:
            return
        }
    }
}
