//
//  ViewController.swift
//  ParsingJSONWith3rdPartyTools
//
//  Created by Ahmet Berkay CALISTI on 28/06/2018.
//  Copyright © 2018 Ahmet Berkay CALISTI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    func updateUI(name: String, location: String, company: String) {
        self.nameLabel.text = name
        self.locationLabel.text = location
        self.companyLabel.text = company
    }
    
    
    @IBAction func getSwiftyPerson(_ sender: Any) {
        print("SWIFTY")
        DataService.shared.getUsers { data in
            
            // Well remember we have a saleable initializer so we have to you know check for it, so use guard 
            guard let swifty = SwiftyPerson(data: data) else { return }
            self.updateUI(name: swifty.name, location: swifty.location, company: swifty.company)
        }
    }
    
    @IBAction func getFredyPerson(_ sender: Any) {
        print("FREDDY")
        DataService.shared.getUsers { data in
            guard let freddy = FreddyPerson(data: data) else {return }
            self.updateUI(name: freddy.name, location: freddy.location, company: freddy.company)
        }
    }
    
    @IBAction func getGlossPerson(_ sender: Any) {
        print("GLOSS")
        DataService.shared.getUsers { data in
            
            guard let gloss = GlossPerson(data: data) else { return }
            self.updateUI(name: gloss.name, location: gloss.location, company: gloss.company)
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        print("CLEAR")
        updateUI(name: "", location: "", company: "")
        
        DataService.shared.getUsers() { data in
            
            // we have to serialize this data right because it's only going to print out the bytes 
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }

    }
    
    
    
    
    
    
    
    
}

