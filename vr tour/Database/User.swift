//
//  User.swift
//  vr tour
//
//  Created by student on 3/9/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var score: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
