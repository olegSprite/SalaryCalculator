//
//  SalaryCellView.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 30.01.2024.
//

import Foundation
import UIKit

final class SalaryCellView: UITableViewCell {
    
    @IBOutlet weak var mounthCellLable: UILabel!
    @IBOutlet weak var allSalaryLable: UILabel!
    @IBOutlet weak var firstHalfSallaryLable: UILabel!
    @IBOutlet weak var swcondHalfSallaryLable: UILabel!
    
    func initCell(with salary: SalaryModel) {
        mounthCellLable.text = salary.mounth
        allSalaryLable.text = salary.allSalary
        firstHalfSallaryLable.text = salary.firstHalfSalary
        swcondHalfSallaryLable.text = salary.secondHalfSalary
    }
}
