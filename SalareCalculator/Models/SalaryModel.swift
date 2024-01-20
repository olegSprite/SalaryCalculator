//
//  SalaryModel.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation

struct SalaryModel: Encodable, Decodable {
    var hoursMounth: String
    var hoursHalf: String
    var nightHourseMounth: String
    var nightHourseHalf: String
    var selebrationHourse: String
    var nightSelebrationHourse: String
    var allSalary: String
    var firstHalfSalary: String
    var secondHalfSalary: String
    var mounth: String
}

enum Mounth: String {
    case january = "Январь"
    case february = "Февраль"
    case march = "Март"
    case april = "Апрель"
    case may = "Май"
    case june = "Июнь"
    case july = "Июль"
    case august = "Август"
    case september = "Сентябрь"
    case october = "Октябрь"
    case november = "Ноябрь"
    case december = "Декабрь"
}
