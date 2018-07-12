//
//  FreddyPerson.swift
//  ParsingJSONWith3rdPartyTools
//
//  Created by Ahmet Berkay CALISTI on 29/06/2018.
//  Copyright © 2018 Ahmet Berkay CALISTI. All rights reserved.
//

// Freddy i thinks is my favourite one out of these three, I like that it forces you to use the do try-catch block and awesome part is for example there is a problem with name, it stop working and it goes to the catch and it prints out the error and  it makes it really easy for debugging 

import Foundation
import Freddy


// So with Freddy it's a little bit different so for what Freddy does it actually forces you to their values are all throw, so we have to wrap everything in a do try or do catch block and so easy to read all stuff

struct FreddyPerson {
    
    let name: String
    let location: String
    let company: String
    
     public init?(data: Data) {
        
        // So the snytax for Freddy is little bit weird remember that I said that for Fredi we're going to get the object at the first index, we're going to get the index 1
        
        do {
            let json = try JSON(data: data)
            let name = try json.getString(at: 1, "name")
            let lat = try json.getString(at: 1, "address","geo","lat")
            let long = try json.getString(at: 1, "address", "geo", "lng")
            let company = try json.getString(at: 1, "company", "name")
        
        
            self.name = name
            self.location = "Lat: \(lat) Long: \(long)"
            self.company = company
            
        
        } catch  {
            print(error)
            return nil
        }
    }
}
