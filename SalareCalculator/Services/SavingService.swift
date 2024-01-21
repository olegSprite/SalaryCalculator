//
//  UserDefaults.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 21.01.2024.
//

import Foundation
import UIKit

protocol SavingServiceDelegate {
    func loadCurentSalary(savedSalary: SalaryModel)
}

class SavingService: CounterViewControllerDelegate {
    
    let defaults = UserDefaults.standard
    
    var delegate: SavingServiceDelegate?
    
    func savingSalary(salaryModel: SalaryModel) {
        
        let encoder = JSONEncoder()
        if let encodedSalaryModel = try? encoder.encode(salaryModel) {
            defaults.set(encodedSalaryModel, forKey: "Save")
        }
    }
    
    func acceptSave() {
        if let savingSalary = UserDefaults.standard.object(forKey: "Save") as? Data {
            let decoder = JSONDecoder()
            if let savedSalary = try? decoder.decode(SalaryModel.self, from: savingSalary) {
                
                delegate?.loadCurentSalary(savedSalary: savedSalary)
                print("Произошла загрузка")
                }
        }
    }
}
