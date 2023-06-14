//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by Даниил Чупин on 15.06.2023.
//

import Foundation

struct Animation {
    let title: String
    let curve: String
    let force: CGFloat
    let duration: CGFloat
    let delay: CGFloat
    
    var forceText: String {
        String(format: "Force: %.2f", force)}
    var durationText: String {
        String(format: "Duration: %.2f", duration)}
    var delayText: String {
        String(format: "Delay: %.2f", delay)}
    
    static var animations: [Animation] = []
}

extension Animation {
    static func getAnimations() -> [Animation] {
        let titles = DataStorage.shared.presets.shuffled()
        let curves = DataStorage.shared.curves.shuffled()
        let upperBound = min(titles.count, curves.count)
        
        for _ in 0..<upperBound {
            let animation = Animation(
                title: titles[Int.random(in: 0..<upperBound)],
                curve: curves[Int.random(in: 0..<upperBound)],
                force: CGFloat.random(in: 1...5),
                duration: CGFloat.random(in: 1...3),
                delay: CGFloat.random(in: 0.5...2)
            )
            animations.append(animation)
        }
        
        return animations
    }
}
