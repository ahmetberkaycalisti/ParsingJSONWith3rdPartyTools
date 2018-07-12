//
//  DataService.swift
//  ParsingJSONWith3rdPartyTools
//
//  Created by Ahmet Berkay CALISTI on 28/06/2018.
//  Copyright © 2018 Ahmet Berkay CALISTI. All rights reserved.
//

import Foundation

class DataService {
    
    static let shared = DataService()
    private init() {}
    
    func getUsers(completion: (Data) -> Void) {
        guard let path = Bundle.main.path(forResource: "someJson", ofType: "json") else { return  }
        let url = URL(fileURLWithPath: path)
        
        // What you would normally get back when you're doing a networking request is this data 
        let data = try! Data(contentsOf: url)
        completion(data)
        print("DataService is printing***************************")
        print(data)

    }
}
