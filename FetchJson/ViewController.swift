//
//  ViewController.swift
//  FetchJson
//
//  Created by Devi on 17/04/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "person", withExtension: "json") {
            let data = NSData(contentsOf: url)
            do {
                let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
                if let dictionary = object as? [String: AnyObject] {
                    //                    readJSONObject(object: dictionary)
                    if let mappedObject = Mapper<PersonDetails>().map(JSON: dictionary) {
                        if let personName = mappedObject.name, let personAge = mappedObject.age {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd-MM-yyyy"
                            if let dob = mappedObject.dob {
                                print("person details are:", personName, personAge, dob)
                            }
                        }
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        else {
            print("path not found")
        }
    }
    
    // Fetch details without using object mapper
    
    func readJSONObject(object: [String: AnyObject]) {
        if let personName = object["name"], let personWork = object["work"] {
            print("person details:", personName, personWork)
        }
    }
}

