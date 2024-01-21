//
//  ViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import UIKit

class CurentMounthViewController: UIViewController, SavingServiceDelegate {
    
    @IBOutlet weak private var hoursMounthLable: UILabel!
    @IBOutlet weak private var hoursHalfLable: UILabel!
    @IBOutlet weak private var nightHourseMounthLable: UILabel!
    @IBOutlet weak private var nightHourseHalfLable: UILabel!
    @IBOutlet weak private var selebrationHourseLable: UILabel!
    @IBOutlet weak private var allSalaryLable: UILabel!
    @IBOutlet weak private var firstHalfSalaryLable: UILabel!
    @IBOutlet weak private var secondHalfSalaryLable: UILabel!
    @IBOutlet weak private var mounthLable: UILabel!
    @IBOutlet weak private var whenSalSelebrationComeLable: UILabel!
    
    let savingService = SavingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savingService.delegate = self

    }
    
    func printTo(){
        print("Тест")
    }
    
    func loadCurentSalary(savedSalary: SalaryModel) {
        
        print("Отображение вью") // не срабатывает метод для обновления вью
            
        self.hoursMounthLable.text = savedSalary.hoursMounth
        self.hoursHalfLable.text = savedSalary.hoursHalf
        self.nightHourseMounthLable.text = savedSalary.nightHourseMounth
        self.nightHourseHalfLable.text = savedSalary.nightHourseHalf
        self.selebrationHourseLable.text = savedSalary.selebrationHourse
        self.allSalaryLable.text = savedSalary.allSalary
        self.firstHalfSalaryLable.text = savedSalary.firstHalfSalary
        self.secondHalfSalaryLable.text = savedSalary.secondHalfSalary
        self.mounthLable.text = savedSalary.mounth
            
        switch savedSalary.mounth {
            case "Январь":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в аванс"
            case "Февраль":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в расчёт"
            case "Март":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в аванс"
            case "Апрель":
            self.whenSalSelebrationComeLable.isEnabled = false
            case "Май":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в аванс"
            case "Июнь":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в аванс"
            case "Июль":
            self.whenSalSelebrationComeLable.isHidden = true
            case "Август":
            self.whenSalSelebrationComeLable.isHidden = true
            case "Сентябрь":
            self.whenSalSelebrationComeLable.isHidden = true
            case "Октябрь":
            self.whenSalSelebrationComeLable.isHidden = true
            case "Ноябрь":
            self.whenSalSelebrationComeLable.isHidden = false
            self.whenSalSelebrationComeLable.text = "Придёт в аванс"
            case "Декабрь":
            self.whenSalSelebrationComeLable.isHidden = true
            default:
            self.whenSalSelebrationComeLable.isHidden = true
        }
    }
}
