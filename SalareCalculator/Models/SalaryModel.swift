//
//  SalaryModel.swift
//  SalareCalculator
//
//  Created by Олег Спиридонов on 19.01.2024.
//

import Foundation

struct SalaryModel: Encodable, Decodable {
    var hoursMounth: String = "Не задан"
    var hoursHalf: String = "Не задан"
    var nightHourseMounth: String = "Не задан"
    var nightHourseHalf: String = "Не задан"
    var selebrationHourse: String = "Не задан"
    var nightSelebrationHourse: String = "Не задан"
    var allSalary: String = "Не задан"
    var firstHalfSalary: String = "Не задан"
    var secondHalfSalary: String = "Не задан"
    var mounth: String = "Не задан"
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
    case none = "Не задан"
}
