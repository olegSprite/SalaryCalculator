//
//  AllSalaryViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 30.01.2024.
//

import Foundation
import UIKit

protocol AllSalaryViewControllerDelegate {
    func returnSallaryArray() -> [SalaryModel]
}

final class AllSalaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfSalary = [SalaryModel]()
    var delegate: SavingService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = SavingService()
        
        guard let arrayOfSalary = self.delegate?.returnSallaryArray() else {
            return
        }
        self.arrayOfSalary = arrayOfSalary
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrayOfSalary.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SalaryCellView
            
            let salary = arrayOfSalary[indexPath.row]
            cell.initCell(with: salary)
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO Выбор ячейки
    }
}


