//
//  ViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import UIKit

protocol CurentMounthViewContriollerDelegate {
    func returnSaveSalary() -> SalaryModel
}

class CurentMounthViewController: UIViewController, CounterViewControllerDelegate2 {
    
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
        
        self.delegate = savingService
        
        accept()
    }
    
    func accept() {
        if let savedSalary = delegate?.returnSaveSalary() {
            self.savedSalary = savedSalary
        }
        
        hoursMounthLable?.text = (savedSalary?.hoursMounth ?? "Ошибка") + " ч."
        hoursHalfLable?.text = (savedSalary?.hoursHalf ?? "Ошибка") + " ч."
        nightHourseMounthLable?.text = (savedSalary?.nightHourseMounth ?? "Ошибка") + " ч."
        nightHourseHalfLable?.text = (savedSalary?.nightHourseHalf ?? "Ошибка") + " ч."
        selebrationHourseLable?.text = (savedSalary?.selebrationHourse ?? "Ошибка") + " ч."
        allSalaryLable.text = "+ " + devideNumber(savedSalary?.allSalary) + "₽"
        firstHalfSalaryLable.text = "+ " + devideNumber(savedSalary?.firstHalfSalary) + "₽"
        secondHalfSalaryLable.text = "+ " + devideNumber(savedSalary?.secondHalfSalary) + "₽"
        mounthLable?.text = savedSalary?.mounth
        
        switch savedSalary?.mounth {
        case "Январь":
            whenSalSelebrationComeLable?.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в аванс"
        case "Февраль":
            whenSalSelebrationComeLable.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в расчёт"
        case "Март":
            whenSalSelebrationComeLable?.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в аванс"
        case "Апрель":
            whenSalSelebrationComeLable?.isEnabled = false
        case "Май":
            whenSalSelebrationComeLable?.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в аванс"
        case "Июнь":
            whenSalSelebrationComeLable?.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в аванс"
        case "Июль":
            whenSalSelebrationComeLable?.isHidden = true
        case "Август":
            whenSalSelebrationComeLable?.isHidden = true
        case "Сентябрь":
            whenSalSelebrationComeLable?.isHidden = true
        case "Октябрь":
            whenSalSelebrationComeLable?.isHidden = true
        case "Ноябрь":
            whenSalSelebrationComeLable?.isHidden = false
            whenSalSelebrationComeLable?.text = "Придёт в аванс"
        case "Декабрь":
            whenSalSelebrationComeLable?.isHidden = true
        default:
            whenSalSelebrationComeLable?.isHidden = true
        }
    }
    
    func devideNumber(_ number: String?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "

        let amount = Int(number ?? "0")
        let formattedString = formatter.string(for: amount) ?? "0"
        return formattedString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSagay" {
            let destinationVC = segue.destination as! CounterViewController
            destinationVC.delegate2 = self
        }
    }
    
    
    @IBAction func profileTap(_ sender: Any) {
    }
}
