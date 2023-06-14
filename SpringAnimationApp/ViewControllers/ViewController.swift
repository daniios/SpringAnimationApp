//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Даниил Чупин on 14.06.2023.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLAbel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var springAnimationView: SpringView!
    @IBOutlet weak var springButton: UIButton!
    
    // MARK: - Private properties
    private let springAnimations = Animation.getAnimations()
    private var animationIndexToPlay = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnimationInfo(springAnimations, for: animationIndexToPlay)
        springButton.setTitle(springAnimations[animationIndexToPlay].title,
                              for: .normal)
        
    }

    @IBAction func startSpringAnimation() {
        setAnimationInfo(springAnimations, for: animationIndexToPlay)
        playAnimation(springAnimations, for: animationIndexToPlay)
        springButton
            .setTitle("NEXT: \(springAnimations[animationIndexToPlay].title)",
                        for: .normal)
    }
    
    // MARK: - Helper methods
    private func playAnimation(_ animations: [Animation],
                               for index: Int) {
        springAnimationView.animation = animations[index].title
        springAnimationView.curve = animations[index].curve
        springAnimationView.force = animations[index].force
        springAnimationView.duration = animations[index].duration
        springAnimationView.delay = animations[index].delay
        springAnimationView.animate()
        
        animationIndexToPlay = Int.random(in: 0..<animations.count)
    }
    
    private func setAnimationInfo(_ animations: [Animation],
                                  for index: Int) {
        presetLabel.text = "Preset: \(animations[index].title)"
        curveLAbel.text = "Curve: \(animations[index].curve)"
        forceLabel.text = animations[index].forceText
        durationLabel.text = animations[index].durationText
        delayLabel.text = animations[index].delayText
    }
    
}

