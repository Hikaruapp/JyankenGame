//
//  JyankenApi.swift
//  JyankenGame
//
//  Created by Yanase Yuji on 2019/10/22.
//  Copyright © 2019 hikaruApp. All rights reserved.
//

import Foundation
import UIKit

public protocol jyankenApiType{
    var statusMessage: String { get }
    var cpJyankenImage: UIImage { get }
}

enum jyankenAPi {
    case GU(jyankenValue)
    case TYOKI(jyankenValue)
    case PA(jyankenValue)
}

extension jyankenAPi: jyankenApiType {
    var cpJyankenImage: UIImage {  
        switch self {
        case .GU(let cp): return cp.image
        case .TYOKI(let cp): return cp.image
        case .PA(let cp): return cp.image
        }
    }
    
    var statusMessage: String {
        switch Judgment() {
        case .win: return "あなたの勝ち"
        case .lost: return "あなたの負け"
        case .draw: return "あいこ"
        }
    }
    
    func Judgment() -> judge {
        switch self {
        case .GU(let cp):
            switch cp {
            case .GU: return .draw
            case .TYOKI: return .win
            case .PA: return .lost
            }
        case .TYOKI(let cp):
            switch cp {
            case .GU: return .lost
            case .TYOKI: return .draw
            case .PA: return .win
            }
        case .PA(let cp):
            switch cp {
            case .GU: return .win
            case .TYOKI: return .lost
            case .PA: return .draw
            }
        }
    }
    
    enum judge {
        case win
        case lost
        case draw
    }
}

enum jyankenValue {
    case GU
    case TYOKI
    case PA
    
    var image: UIImage {
        switch self {
        case .GU: return UIImage(named: "Gu") ?? UIImage()
        case .TYOKI: return UIImage(named: "Tyoki") ?? UIImage()
        case .PA: return UIImage(named: "Pa") ?? UIImage()
        }
    }
}

