//
//  EmployeePresenter.swift
//  RequestData
//
//  Created by Keapheng on 2/28/20.
//  Copyright © 2020 Keapheng. All rights reserved.
//

import Foundation
import Alamofire

class EmployeePresenter {
    
    var employees: [EmployeeInfo] = []
    
    func getData(completion: @escaping (() -> ()) ) {
        let dummyUrl = "http://dummy.restapiexample.com/api/v1/employees"
        
        AF.request(dummyUrl).response { response in
            switch response.result {
                
            case .success:
                do {
                   let dummyData = try JSONDecoder().decode(Employee.self, from: response.data!)
                   
                    self.employees = dummyData.data
                    completion()
                    
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
                
            }
            
        }
    }

}
