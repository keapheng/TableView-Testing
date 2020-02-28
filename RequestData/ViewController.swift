//
//  ViewController.swift
//  RequestData
//
//  Created by Keapheng on 2/24/20.
//  Copyright © 2020 Keapheng. All rights reserved.
//

import UIKit
import Alamofire

struct Visitor: Decodable {
    let data: ForSale
}
struct ForSale: Decodable {
    let forSale: [SaleInfo]
}
struct SaleInfo: Decodable {
    var title: String
    var price: String
    var photos: [String]
}



class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    var items : [SaleInfo] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveData()
        
    }
    
    
    func retrieveData() {
        let apiUrl = "https://dev.backend.pointerasia.com/m/api/visitor/home-screen"
        AF.request(apiUrl).response { response in
            switch response.result {
                
            case .success:
                do {
                  let jsonData = response.data
                  let result = try JSONDecoder().decode(Visitor.self, from: jsonData!)
                    
                    self.items = result.data.forSale
                    
                    
                } catch {
                    print(error)
                }
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        
        
        
    }

    
    
    
    
    

}


