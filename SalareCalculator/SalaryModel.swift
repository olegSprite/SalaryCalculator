//
//  SalaryModel.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation

struct SalaryModel {
    var hoursMounth: Int
    var hoursHalf: Int
    var nightHourseMounth: Int
    var nightHourseHalf: Int
    var selebrationHourse: Int
    var allSalary: Int
    var firstHalfSalary: Int
    var secondHalfSalary: Int
    var mounth: Mounth
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
