//
//  DetailView.swift
//  Thalia
//
//  Created by Samuel Kebis on 05/03/2020.
//  Copyright © 2020 Samuel Kebis. All rights reserved.
//

import SwiftUI

struct DetailView: View, CanRespondToFinishedAudio {
    @State var selectedLine: Int? = nil
    @State var script: Script = Script(title: "R and J")
    
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var player = Player()
    
    var playing: Bool { player.inPlayingMode }
    var lastLineIsSelected: Bool {
        if let line = selectedLine, line + 1 >= script.sentence.count {
            return true
        }
        return false
    }
    
    var noAudioFileForSelectedLine : Bool {
        guard let selectedLine = self.selectedLine else {
            return false
        }
        
        return script.sentence[selectedLine].audioFile == nil
    }
    
    func customInit() {
        if let s = Storage.getScript() { self.script = s }
        self.player.finishDelegate = self
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorColor = .none
    }
    
    var body: some View {
        VStack(spacing: 0) {
            List (0..<script.sentence.count) { index in
                Button(action: {
                    // selecting line
                    let tappedSelectedLine = self.selectedLine == index
                    self.selectedLine = tappedSelectedLine ? nil : index
                    
                    // re-set player / recorder
                    self.resetPlayerOrRecorder()
                }, label: {
                    ScriptRowView(sentence: self.script.sentence[index], isSelected: index == self.selectedLine, audioExist: self.script.sentence[index].audioFile != nil)
                })
            }
            HStack(spacing: 60) {
                Spacer()
                
                DownButton(color: .red, sysImageName: audioRecorder.recording ?  "stop.circle" : "mic.circle") {
                    self.startStopRecording()
                }.disabled(playing || selectedLine == nil)
                
                DownButton(color: Color("lable"), sysImageName: playing ? "stop.circle" : "play.circle") {
                    self.player.playPause(&self.selectedLine, self.script)
                }.disabled(audioRecorder.recording ||  noAudioFileForSelectedLine )
                
                DownButton(color: Color("lable"), sysImageName: "forward.fill") {
                    self.next()
                }.disabled(lastLineIsSelected)
                
                Spacer()
            }
            .frame(height: 70)
            .padding(.vertical)
            .background(BlurView(style: .systemMaterial))
                .shadow(radius: 20)
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear() {
            self.customInit()
        }
    }
    
    // MARK: - Functionality
    
    func startStopRecording() {
        if audioRecorder.recording {
            audioRecorder.stopRecording()
        } else {
            startRecording()
        }
    }
    
    func startRecording() {
        let audioFileName = audioRecorder.startRecording()
        if let line = selectedLine, line < script.sentence.count {
            script.sentence[line].audioFile = audioFileName
            Storage.save(script)
        }
    }
    
    func next() {
        // selecting line
        if selectedLine == nil {
            selectedLine = 0
        } else if lastLineIsSelected {
            player.inPlayingMode = false
        } else {
            selectedLine! += 1
        }
        
        // re-set player / recorder
        resetPlayerOrRecorder()
    }

    func audioFinished() {
        next()
    }
    
    func resetPlayerOrRecorder() {
        let wasRecording = audioRecorder.recording
        audioRecorder.stopRecording()
        if wasRecording { startRecording() }
        player.setPlayer(selectedLine, script)
    }
}

struct DownButton: View {
    var color: Color
    var sysImageName: String
    var action: () -> ()
    
    var body: some View {
        Button(action: { self.action() }) {
            Image(systemName: sysImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .accentColor(color)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView().previewDevice("iPad Air 2")
    }
}
