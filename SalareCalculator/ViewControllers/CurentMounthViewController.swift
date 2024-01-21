//
//  ViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import UIKit

protocol CurentMounthViewContriollerDelegate {
    func acceptSave() -> SalaryModel
}

class CurentMounthViewController: UIViewController {
    
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
    
    var delegate: CurentMounthViewContriollerDelegate?
    let savingService = SavingService()
    
    var savedSalary: SalaryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedSalary = delegate?.acceptSave() {
            self.savedSalary = savedSalary
        }
        
        hoursMounthLable.text = savedSalary?.hoursMounth
        hoursHalfLable.text = savedSalary?.hoursHalf
        nightHourseMounthLable.text = savedSalary?.nightHourseMounth
        nightHourseHalfLable.text = savedSalary?.nightHourseHalf
        selebrationHourseLable.text = savedSalary?.selebrationHourse
        allSalaryLable.text = savedSalary?.allSalary
        firstHalfSalaryLable.text = savedSalary?.firstHalfSalary
        secondHalfSalaryLable.text = savedSalary?.secondHalfSalary
        mounthLable.text = savedSalary?.mounth
        
        switch savedSalary?.mounth {
        case "Январь":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в аванс"
        case "Февраль":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в расчёт"
        case "Март":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в аванс"
        case "Апрель":
            whenSalSelebrationComeLable.isEnabled = false
        case "Май":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в аванс"
        case "Июнь":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в аванс"
        case "Июль":
            whenSalSelebrationComeLable.isHidden = true
        case "Август":
            whenSalSelebrationComeLable.isHidden = true
        case "Сентябрь":
            whenSalSelebrationComeLable.isHidden = true
        case "Октябрь":
            whenSalSelebrationComeLable.isHidden = true
        case "Ноябрь":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable.text = "Придёт в аванс"
        case "Декабрь":
            whenSalSelebrationComeLable.isHidden = true
        default:
            whenSalSelebrationComeLable.isHidden = true
        }
    }
}
