//
//  ViewController.swift
//  MusicProperty
//
//  Created by Aryzae on 2018/05/17.
//  Copyright © 2018年 aryzae. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

enum FileType: String {
    case mp3 = "fire.mp3"
    case aac = "fire_aac.m4a"
    case alac = "fire.m4a"
    case flac = "fire.flac"
    case wave = "fire.wav"
}

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    var selectedType = ""
    @IBOutlet weak var playAndStopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mp3Button(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "fire", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            print(player?.settings ?? [:])
            selectedType = "mp3"
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func aacButton(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "fire_aac", withExtension: "m4a") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            print(player?.settings ?? [:])
            selectedType = "aac"
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func alacButton(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "fire", withExtension: "m4a") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            print(player?.settings ?? [:])
            selectedType = "alac"
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func flacButton(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "fire", withExtension: "flac") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            print(player?.settings ?? [:])
            selectedType = "flac"
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func waveButton(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "fire", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            print(player?.settings ?? [:])
             selectedType = "wave"
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func albums(_ sender: UIButton) {
        let album = MPMediaQuery.albums()
        guard let albums = album.collections else { return }
        albums.forEach { print("\($0.representativeItem?.albumTitle ?? "") by \($0.representativeItem?.albumArtist ?? "")") }

//        let item = MPMediaItem()
//        item.rating
    }

    @IBAction func kari2(_ sender: UIButton) {
    }

    @IBAction func kari3(_ sender: UIButton) {
    }

    @IBAction func playAndStopButton(_ sender: UIButton) {
        guard let player = player else { return }
        if player.isPlaying {
            playAndStopButton.setTitle("stop", for: .normal)
            player.stop()
        } else {
            playAndStopButton.setTitle("\(selectedType) playing...", for: .normal)
            player.play()
        }
    }







}

