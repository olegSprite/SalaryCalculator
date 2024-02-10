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
    
    func initCell(with salary: SalaryModel) {
        mounthCellLable.text = salary.mounth
        allSalaryLable.text = salary.allSalary
    }
}
