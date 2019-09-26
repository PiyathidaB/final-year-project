//
//  UserDatabase.swift
//  vr tour
//
//  Created by student on 3/9/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import Foundation
import  RealmSwift

class UserDatabase {
    static func user() -> Results<User> {
        let realm = try! Realm()
        
        return realm.objects(User.self)
    }
    static func getUser(id: Int) -> User? {
        let realm = try! Realm()
        
        return realm.object(ofType: User.self, forPrimaryKey: id)
    }
    
    static func addUser(name: String, score: Int) -> Int{
        
        let realm = try! Realm()
        let newId = ( realm.objects(User.self).max(ofProperty: "id") ?? 0 ) + 1
        
        let user = User()
        user.id = newId
        user.name = name
        user.score = score
        
        //save it
        
        try! realm.write {
            realm.add(user)
        }
        return user.id
    }
}
