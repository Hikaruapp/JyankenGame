//
//  CpEngine.swift
//  JyankenGame
//
//  Created by Yanase Yuji on 2019/10/22.
//  Copyright © 2019 hikaruApp. All rights reserved.
//

import Foundation

class CpEngine {
    func jyankenValue() -> jyankenValue {
        let jyanken = Int.random(in: 0 ... 2)
        switch jyanken {
        case 0: return .GU
        case 1: return .TYOKI
        case 2: return .PA
        default:
            return .GU
        }
    }
}
