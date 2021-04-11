//
//  ViewController.swift
//  EggTimer
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var timerProgress: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var player: AVAudioPlayer!
    
    let workingMessage = "Let's make perfect eggs"
    let doneMessage = "Done!"
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        secondsPassed = 0
        timerProgress.progress = 0
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        titleLabel.text = workingMessage
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageOfProgress = Float(secondsPassed) / Float(totalTime)
            timerProgress.progress = percentageOfProgress
        } else {
            timer.invalidate()
            titleLabel.text = doneMessage
            playSound()
        }
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
}
