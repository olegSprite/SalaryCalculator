//
//  CounterViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation
import UIKit

protocol CounterViewControllerDelegate {
    
    func savingSalary(salaryModel: SalaryModel)
    func returnSaveRate() -> String
}

protocol CounterViewControllerDelegate2 {
    
    func accept()
}

class CounterViewController: UIViewController {
    
    @IBOutlet weak private var mounthPicker: UIPickerView!
    
    @IBOutlet weak private var allSalaryLable: UILabel!
    @IBOutlet weak private var firstHalfSalaryLable: UILabel!
    @IBOutlet weak private var secondHalfSalaryLable: UILabel!
 
    @IBOutlet weak private var hoursMounthTextField: UITextField!
    @IBOutlet weak private var hoursHalfTextField: UITextField!
    @IBOutlet weak private var nightHourseMounthTextField: UITextField!
    @IBOutlet weak private var nightHourseHalfTextField: UITextField!
    
    @IBOutlet weak private var selebrationHourseTextField: UITextField!
    @IBOutlet weak private var selebrationTitleLable: UILabel!
    @IBOutlet weak private var selebrationSubTittleLable: UILabel!
    @IBOutlet weak private var selebrationNightSubTitileLable: UILabel!
    @IBOutlet weak private var selebrationNightTextField: UITextField!
    
    @IBOutlet weak private var yourReateIsCountingLable: UILabel!
    
    @IBOutlet weak private var saveButton: UIButton!
    @IBOutlet weak private var backButton: UIButton!
    
    private var rate: Int = 0
    
    var curentMounth: Mounth = .none
    let mounth: [Mounth] = [
        .none,
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
    
    var delegate: CounterViewControllerDelegate?
    var delegate2: CounterViewControllerDelegate2?
    let savingService = SavingService()
    let tableView = AllSalaryViewController()
    
    //MARK: - Life Sircle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.delegate = savingService
        
        if let rate = delegate?.returnSaveRate() {
            self.rate = Int(rate)!
        }
        
        yourReateIsCountingLable.text = "Твоя зарплата считается по ставке \(rate) ₽/час"
        
        allSalaryLable.text = "Пусто"
        allSalaryLable.textColor = .gray
        firstHalfSalaryLable.text = "Пусто"
        firstHalfSalaryLable.textColor = .gray
        secondHalfSalaryLable.text = "Пусто"
        secondHalfSalaryLable.textColor = .gray

        }
    
    //MARK: - Functions
    
    func hideCelebration(){
        self.selebrationHourseTextField.isHidden = true
        self.selebrationTitleLable.isHidden = true
        self.selebrationSubTittleLable.isHidden = true
        self.selebrationNightSubTitileLable.isHidden = true
        self.selebrationNightTextField.isHidden = true
    }
    
    func enabledCelebration() {
        self.selebrationHourseTextField.isHidden = false
        self.selebrationTitleLable.isHidden = false
        self.selebrationSubTittleLable.isHidden = false
        self.selebrationNightSubTitileLable.isHidden = false
        self.selebrationNightTextField.isHidden = false
    }
    
    private func calculateAllSalary(hoursMounth: Double, nightHourseMounth: Double, selebrationHourse: Double, selebrationNight: Double) -> Int {
        var result: Double = 0
        result += Double(rate) * hoursMounth
        result += Double(rate) * 0.4 * nightHourseMounth
        switch curentMounth {
        case .none:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .january:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .february:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .march:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .may:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .june:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .november:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        default:
            result += 0
        }
        return Int(result)
    }
    
    private func calculateFirstHalfSalary(hoursHalf: Double, nightHourseHalf: Double, selebrationHourse: Double, selebrationNight: Double) -> Int {
        var result: Double = 0
        result += Double(rate) * hoursHalf
        result += Double(rate) * 0.4 * nightHourseHalf
        switch curentMounth {
        case .none:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .january:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .march:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .may:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .june:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        case .november:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        default:
            result += 0
        }
            return Int(result)
    }
    
    private func calculateSecondHalfSalary(hoursMounth: Double, nightHourseMounth: Double, hoursHalf: Double, nightHourseHalf: Double, selebrationHourse: Double, selebrationNight: Double) -> Int {
        var result: Double = 0
        result += Double(rate) * (hoursMounth - hoursHalf)
        result += Double(rate) * 0.4 * (nightHourseMounth - nightHourseHalf)
        switch curentMounth {
        case .february:
            result += Double(rate) * selebrationHourse
            result += Double(rate) * 0.4 * selebrationNight
        default:
            result += 0
        }
        return Int(result)
    }
    
    
    
    func returnSalaryToScreen() {
        allSalaryLable.text = String(calculateAllSalary(hoursMounth: Double(self.hoursMounthTextField.text!) ?? 0, nightHourseMounth: Double(self.nightHourseMounthTextField.text!) ?? 0, selebrationHourse: Double(self.selebrationHourseTextField.text!) ?? 0, selebrationNight: Double(self.selebrationNightTextField.text!) ?? 0))
        
        allSalaryLable.textColor = .systemGreen
        
        firstHalfSalaryLable.text = String(calculateFirstHalfSalary(hoursHalf: Double(self.hoursHalfTextField.text!) ?? 0, nightHourseHalf: Double(self.nightHourseHalfTextField.text!) ?? 0, selebrationHourse: Double(self.selebrationHourseTextField.text!) ?? 0, selebrationNight: Double(self.selebrationNightTextField.text!) ?? 0))
        
        firstHalfSalaryLable.textColor = .systemGreen
        
        secondHalfSalaryLable.text = String(calculateSecondHalfSalary(hoursMounth: Double(self.hoursMounthTextField.text!) ?? 0, nightHourseMounth: Double(self.nightHourseMounthTextField.text!) ?? 0, hoursHalf: Double(self.hoursHalfTextField.text!) ?? 0, nightHourseHalf: Double(self.nightHourseHalfTextField.text!) ?? 0, selebrationHourse: Double(self.selebrationHourseTextField.text!) ?? 0, selebrationNight: Double(self.selebrationNightTextField.text!) ?? 0))
        
        secondHalfSalaryLable.textColor = .systemGreen
        
        allSalaryLable.text = "+ " + devideNumber(allSalaryLable.text) + "₽"
        firstHalfSalaryLable.text = "+ " + devideNumber(firstHalfSalaryLable.text) + "₽"
        secondHalfSalaryLable.text = "+ " + devideNumber(secondHalfSalaryLable.text) + "₽"
    }
    
    func devideNumber(_ number: String?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "

        let amount = Int(number ?? "0")
        let formattedString = formatter.string(for: amount) ?? "0"
        return formattedString
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTap(_ sender: Any) {
        
        let salaryModel = SalaryModel(hoursMounth: hoursMounthTextField.text ?? "Ошибка", hoursHalf: hoursHalfTextField.text ?? "Ошибка", nightHourseMounth: nightHourseMounthTextField.text ?? "Ошибка", nightHourseHalf: nightHourseHalfTextField.text ?? "Ошибка", selebrationHourse: selebrationHourseTextField.text ?? "Ошибка", nightSelebrationHourse: selebrationNightTextField.text ?? "Ошибка", allSalary: allSalaryLable.text ?? "Ошибка", firstHalfSalary: firstHalfSalaryLable.text ?? "Ошибка", secondHalfSalary: secondHalfSalaryLable.text ?? "Ошибка", mounth: curentMounth.rawValue)
        
        delegate?.savingSalary(salaryModel: salaryModel)
    
        self.dismiss(animated: true, completion: nil)
        
        delegate2?.accept()
        navigationController?.popViewController(animated: true)
    }
}


extension CounterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn rate: NSRange, replacementString string: String) -> Bool {
        returnSalaryToScreen()
        return true
    }
    
    internal func textFieldDidEndEditing(_: UITextField) {
        if hoursMounthTextField.text != "" {
            hoursMounthTextField.isEnabled = true
            if hoursMounthTextField.text != "" {
                nightHourseHalfTextField.isEnabled = true
            }
        }
    }
}
