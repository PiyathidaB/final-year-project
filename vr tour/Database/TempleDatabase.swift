//
//  WatDatabase.swift
//  vr tour
//
//  Created by student on 28/8/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import Foundation

class TempleDatabase{
    
    static func temples() -> [Temple]{
        return[
            Temple(id: 1, name: "Wat Mahathat", long: 99.703700, lat: 17.016935,icon:"point-wat-mahathat", menu_icon: "wat-mahathat"),
            Temple(id: 2, name: "Wat Sa-si", long: 99.701610, lat: 17.019786,icon: "point-wat-sasi", menu_icon: "wat-sasi"),
            Temple (id: 3, name: "Wat Si Sawai", long: 99.702269, lat: 17.013683, icon: "point-wat-sisawhal", menu_icon: "wat-sisawhal"),
            Temple (id: 4, name: "Wat Phraphai Luang", long: 99.699717, lat: 17.029189,icon: "point-wat-phaphailuang", menu_icon: "wat-phaphailuang"),
            Temple (id: 5, name: "Wat Si Chum", long: 99.693136, lat: 17.026838, icon: "point-wat-sichum",menu_icon: "wat-sichum")
        ]
    }
}
