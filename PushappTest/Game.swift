//
//  Game.swift
//  PushappTest
//
//  Created by Георгий Кажуро on 31.08.17.
//  Copyright © 2017 Георгий Кажуро. All rights reserved.
//

import Foundation

// Модель игры, содержащая название, а также путь до index.html

struct Game {
    let indexLocation: String?
    let name: String?
    
    init(name: String, indexLocation: String) {
        self.name = name
        self.indexLocation = indexLocation
    }
}
