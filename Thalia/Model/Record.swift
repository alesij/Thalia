//
//  Record.swift
//  Thalia
//
//  Created by Paolo Merlino on 21/02/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
import AVFoundation

class AudioRecorder: ObservableObject{
    
    @Published var recording = false
    var audioRecorder: AVAudioRecorder!
    
    /// returns audio file name
    func startRecording() -> String {
        
        let recordingSession = AVAudioSession.sharedInstance()
        
        do{
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch{
            print("Failed to set up recording session")
            
        }
        
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = "\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a"
        let audioFileName = documentPath.appendingPathComponent(fileName)
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            audioRecorder.record()
            recording = true
        } catch {
            print("Could not start recording")
        }
        
        return fileName
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        recording = false
    }
    
}
