//
//  Person.swift
//  HWS-Project12
//
//  Created by Donny on 3/12/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
