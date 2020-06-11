//
//  Player.swift
//  Thalia
//
//  Created by Samuel Kebis on 04/03/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI
import AVFoundation

typealias Completion = () -> Void

protocol CanRespondToFinishedAudio {
    func audioFinished()
}

class Player: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var player: AVAudioPlayer?
    @Published var inPlayingMode: Bool = false
    var finishDelegate: CanRespondToFinishedAudio?
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        finishDelegate?.audioFinished()
    }
    
    func setPlayer(_ selectedLine: Int?,_ script: Script) {
        guard let line = selectedLine, let fileName = script.sentence[line].audioFile else {
            player?.stop()
            player = nil
            inPlayingMode = false
            return
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentPath.appendingPathComponent(fileName)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            
        } catch {
            inPlayingMode = false
            print("couldn't load file :(")
        }
        
        if inPlayingMode { player?.play() }
    }
    
    func playPause(_ line: inout Int?, _ script: Script) {
        if inPlayingMode {
            stop()
        } else {
            if line == nil { line = 0 }
            setPlayer(line, script)
            player?.play()
            inPlayingMode = true
        }
    }
    
    func stop() {
        player?.stop()
        inPlayingMode = false
    }
}
