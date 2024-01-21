//
//  UserDefaults.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 21.01.2024.
//

import Foundation
import UIKit

class SavingService: CounterViewControllerDelegate, CurentMounthViewContriollerDelegate {
    
    let defaults = UserDefaults.standard
    
    // MARK: - Functions
    
    func savingSalary(salaryModel: SalaryModel) {
        
        let encoder = JSONEncoder()
        if let encodedSalaryModel = try? encoder.encode(salaryModel) {
            defaults.set(encodedSalaryModel, forKey: "Save")
        }
    }
    
    func acceptSave() -> SalaryModel {
        if let savingSalary = UserDefaults.standard.object(forKey: "Save") as? Data {
            let decoder = JSONDecoder()
            if let savedSalary = try? decoder.decode(SalaryModel.self, from: savingSalary) {
                return savedSalary
            }
        }
        let savingSalary = SalaryModel()
        return savingSalary
    }
}
