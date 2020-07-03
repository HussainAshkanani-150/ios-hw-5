//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation
// بس دذي اخترنا الديفلت بلاير اهو ماريو بحيث اذا ما طقيت احد يطلع لي ماريو
var selectedPlayer = Player(name: "Mario")


class ViewController: UIViewController {
    @IBOutlet weak var playerImageView: UIImageView!
    
    var playerSoundEffect: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    // ليش عرفت ال background music بدالة الviewdidload ؟ لانها اول دالة تشتغل
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
        playerImageView.loadGif(name: selectedPlayer.name)
        
        playBackgroundMusic(musicName:"BG.wav")
    }
    func playBackgroundMusic(musicName: String) {
    let path = Bundle.main.path(forResource: musicName, ofType:nil)!
    let url = URL(fileURLWithPath: path)

    do {
        backgroundMusic = try AVAudioPlayer(contentsOf: url)
        backgroundMusic?.play()
    } catch {
        // couldn't load file :(
    }
    }
    
    
    
    func playMusic(musicName: String) {
    let path = Bundle.main.path(forResource: musicName, ofType:nil)!
    let url = URL(fileURLWithPath: path)

    do {
        playerSoundEffect = try AVAudioPlayer(contentsOf: url)
        playerSoundEffect?.play()
    } catch {
        // couldn't load file :(
    }
    }

    @IBAction func randomPlayer(_ sender: Any) {
        let randomPlayer = Players.randomElement()!
        playerImageView.image = UIImage(named: randomPlayer.name)
        // الميوزك نيم راح تاخذ اسم اللاعب و تضيف عليه WAV و الplayMusic راح يشغل الميوزك ، حطينا راندوم بلاير عشان يختار لاعب عشوائي
        playMusic(musicName: randomPlayer.musicName())
        selectedPlayer = randomPlayer
            playerImageView.loadGif(name: selectedPlayer.name)
    }
    
}

