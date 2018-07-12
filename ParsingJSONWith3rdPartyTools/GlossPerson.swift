//
//  GlossPerson.swift
//  ParsingJSONWith3rdPartyTools
//
//  Created by Ahmet Berkay CALISTI on 29/06/2018.
//  Copyright © 2018 Ahmet Berkay CALISTI. All rights reserved.
//

import Foundation
import Gloss

// Gloss is a little bit weird because glass is essentially expecting you to parse the JSON before you're trying to instantiate your object somewhat it doesnt have like a JSON serializer or least not that I can find if it does then they didn't document it well
struct GlossPerson {
    
    let name: String
    let location: String
    let company: String
    
   public init?(data: Data) {
    
    // Gloss actually doesn't have a way that I can easily specify it index when you're trying to parse
    // So this specifies that it's a array of String and any object and this is getting like really weird because now you have to make sure that you're passing it ike our actual json typed object. I didn't make a type alias for json because once again all the json parsers jind of have their own little thing that they're doing with the json keyword and it's like overloaded so we're just doing it as an array of dictionaries with string in any 
    
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
    let user = json[2]
    
    
    self.name = "name" <~~ user ?? "NAME ERROR"
    let lat = "address.geo.lat" <~~ user ?? "LAT ERROR"
    let long = "address.geo.lng" <~~ user ?? "LONG ERROR"
    self.location = "Lat: \(lat) Long: \(long)"
    let company = "company.name" <~~ user ?? "COMPANY ERROR"
    self.company = company
    
    }
}
