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
    func deleteArrayOfSalary()
}

final class AllSalaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dalateButton: UIButton!
    
    var arrayOfSalary = [SalaryModel]()
    var delegate: SavingService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = SavingService()
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        guard let arrayOfSalary = self.delegate?.returnSallaryArray() else {
            return
        }
        self.arrayOfSalary = arrayOfSalary
        tableView.reloadData()
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
    
    
    @IBAction func delateButtonTap(_ sender: Any) {
        let alert = UIAlertController(title: "Все данные о зарплатах будут удалены!", message: "Вы уверены?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { (action) in
            self.delegate?.deleteArrayOfSalary()
            self.updateView()
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .default))

        self.present(alert, animated: true, completion: nil)
    }
}



