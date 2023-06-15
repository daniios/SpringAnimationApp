//
//  DataStorage.swift
//  SpringAnimationApp
//
//  Created by Даниил Чупин on 15.06.2023.
//

import Foundation
import SpringAnimation

final class DataStorage {
    
    static let shared = DataStorage()
    
    let presets = AnimationPreset.allCases
    
    let curves = AnimationCurve.allCases
    
    private init() {}
}
