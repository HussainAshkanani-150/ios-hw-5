//
//  PlayerDetailsVC.swift
//  MarioParty
//
//  Created by Hussain Ashkanani on 7/2/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerDetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starsimageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var playerSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer.name
        imageView.loadGif(name: selectedPlayer.name)
        backgroundImageView.image = UIImage(named: selectedPlayer.bgName())

        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomizeStars(_ sender: Any) {
        let stars = ["Star1", "Star2", "Star3", "Star4", "Star5"]
        let randomStar = stars.randomElement()!
        starsimageView.image = UIImage(named: randomStar)
    }
    @IBAction func playCharacterSound(_ sender: Any) {
        playMusic(musicName: selectedPlayer.musicName())
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
