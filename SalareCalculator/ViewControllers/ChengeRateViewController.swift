//
//  ChengeRateViewController.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 22.01.2024.
//

import Foundation
import UIKit

protocol ChengeRateViewControllerDelegate {
    func saveRate(rate: String)
}

protocol ChengeRateViewControllerDelegate2 {
    func accept()
}

class ChengeRateViewController: UIViewController {
    
    @IBOutlet weak var rateTextField: UITextField!
    
    var delegate: ChengeRateViewControllerDelegate?
    var delegate2: ChengeRateViewControllerDelegate2?
    let savingService = SavingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        self.delegate = savingService
    }
    

    
    @IBAction func saveRateButtonTap(_ sender: Any) {
        
        delegate?.saveRate(rate: rateTextField.text ?? "0")
        
        delegate2?.accept()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnChengeRateTap(_ sender: Any) {
        
        delegate2?.accept()
        self.dismiss(animated: true, completion: nil)

    }
    
}
