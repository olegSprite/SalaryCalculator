//
//  CounterViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation
import UIKit

class CounterViewController: UIViewController {
    
    @IBOutlet weak var mounthPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CounterViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
}

extension CounterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let mounth: [Mounth] = [
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
        
        for result in mounth {
            return result.rawValue
        }
        return nil
    }
}
