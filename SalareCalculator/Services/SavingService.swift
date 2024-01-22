//
//  UserDefaults.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 21.01.2024.
//

import Foundation
import UIKit

class SavingService: CounterViewControllerDelegate, CurentMounthViewContriollerDelegate, ProfileViewControllerDelegate, ChengeNameViewControllerDelegate, ChengeRateViewControllerDelegate {
    
    
    
    let defaults = UserDefaults.standard
    
    // MARK: - Functions
    
    func savingSalary(salaryModel: SalaryModel) {
        
        let encoder = JSONEncoder()
        if let encodedSalaryModel = try? encoder.encode(salaryModel) {
            defaults.set(encodedSalaryModel, forKey: "SaveSalary")
        }
    }
    
    func saveName(user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "SaveName")
        }
    }
    
    func saveRate(rate: String) {
        defaults.set(rate, forKey: "SaveRate")
    }
    
    func returnSaveSalary() -> SalaryModel {
        if let savingSalary = UserDefaults.standard.object(forKey: "SaveSalary") as? Data {
            let decoder = JSONDecoder()
            if let savedSalary = try? decoder.decode(SalaryModel.self, from: savingSalary) {
                return savedSalary
            }
        }
        let savingSalary = SalaryModel()
        return savingSalary
    }
    
    func returnSaveName() -> User {
        if let savingName = UserDefaults.standard.object(forKey: "SaveName") as? Data {
            let decoder = JSONDecoder()
            if let savedName = try? decoder.decode(User.self, from: savingName) {
                return savedName
            }
        }
        let savingName = User()
        return savingName
    }
    
    func returnSaveRate() -> String {
        if let savingRate = defaults.string(forKey: "SaveRate") {
            return savingRate
        } else { return "0" }
    }
    
}
