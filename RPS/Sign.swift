//
//  Sign.swift
//  RPS
//
//  Created by Noor Mehai on 3/22/22.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0{
        return .rock
    }
    else if sign == 1{
        return .paper
    }
    else {return .scissors}
}


enum Sign{
    case rock, paper, scissors
    
    func emoji() -> String{
        switch self{
        case .rock:
            return "👊"
            
        case .paper:
            return "✋"
            
        case .scissors:
            return "✌️"
        }
    }
    
    func compareTo(opponent: Sign) -> GameState{
        switch self{
        case .rock:
            switch opponent{
            case .rock:
                return .Draw
            case .paper:
                return .Lose
            case .scissors:
                return .Win
            }
            
        case .paper:
            switch opponent {
            case .rock:
                return .Win
            case .paper:
                return .Draw
            case .scissors:
                return .Lose
            }
            
        case .scissors:
            switch opponent {
            case .rock:
                return .Lose
            case .paper:
                return .Win
            case .scissors:
                return .Draw
            }
        }
    }
}

enum GameState{
    case Start, Win, Lose, Draw
}
