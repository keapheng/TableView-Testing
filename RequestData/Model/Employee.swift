//
//  Employee.swift
//  RequestData
//
//  Created by Keapheng on 2/28/20.
//  Copyright © 2020 Keapheng. All rights reserved.
//

import Foundation

struct Employee: Decodable {
    let data: [EmployeeInfo]
}
struct EmployeeInfo: Decodable {
    var id: String
    var employee_name: String
    var employee_salary: String
    var employee_age: String
    var profile_image: String
}
