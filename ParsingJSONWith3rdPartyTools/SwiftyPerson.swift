//
//  SwiftyPerson.swift
//  ParsingJSONWith3rdPartyTools
//
//  Created by Ahmet Berkay CALISTI on 29/06/2018.
//  Copyright © 2018 Ahmet Berkay CALISTI. All rights reserved.
//

import Foundation
import SwiftyJSON

// So as you can see with SwiftyJSON it's pretty clean. You select the index if you are working with an Array and then we're selecting something specific obviously you can iterate through and you know crate objects like though like with a map feature or whatever you want to do.

// OverView:-

// SwiftyJson I thinks it;s probably the most popular of the three of these three different frameworks that help you parse json only thing that I dont really like about is that i dont really like this whole syntax. I dont like the way that this looks personally it's really like a personal thing like there's nothing worng with it and if any of these dont work then the entire thing just wouldn't work

struct SwiftyPerson {
    let name: String
    let location: String
    let company: String
    
    public init?(data: Data) {
        
        let json = try! JSON(data: data)
        
        print("SwityPerson is printing***************************")
        print(json)
        
        // What I would normally do this is. This is my coding styles like I would put a guard statement and then if I wouldn't be if I wasn't able to instantiate with all the proper values I would just say like there's an error. So what I'm going to do is access all the values that I need and if I'm not able to access any one of those values then I'll just do a return which means that I won't instantiate this object and it'll return nil
        
        guard let name = json[0]["name"].string,
            let lat = json[0]["address"]["geo"]["lat"].string,
            let long = json[0]["address"]["geo"]["lng"].string,
        let company = json[0]["company"]["name"].string
            else {return nil}
        
        self.name = name
        self.location = "Lat:\(lat) Long: \(long)"
        self.company = company
    }
}
