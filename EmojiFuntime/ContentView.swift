//
//  ContentView.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/1/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    func playSpeech(word: String) {
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.2
        utterance.pitchMultiplier = 0.8
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
                
        func speechSynth(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
            
        }
        
    }
  
    @State var isPlayingGame = false
    
    @State var show = false
    @State var cardBackground = Color.white
    
    @State var targetEmojiKey = "?"
    @State var targetEmojiValue = "?"

    @State var randomEmojiValue1 = "?"
    @State var randomEmojiValue2 = "?"
    @State var randomEmojiKey1 = ""
    @State var randomEmojiKey2 = ""
    
    @State var lettersSpaced = ""
    @State var wordToBeSaid = ""
    
    @State var progressValue: Float = 0.0
    
    let sourceEmojiDict =  ["Dog": "🐶", "Cat": "😺", "Car": "🚗", "Guitar": "🎸", "Bowling" : "🎳", "Truck" : "🚚", "House" : "🏠", "Hammer" : "🔨", "Bed" : "🛏"]
    
    @State var emojiDict = ["Dog": "🐶", "Cat": "😺", "Car": "🚗", "Guitar": "🎸", "Bowling" : "🎳", "Truck" : "🚚", "House" : "🏠", "Hammer" : "🔨", "Bed" : "🛏"]
    
    func wordsToLetters(word: String) {
        lettersSpaced = word.map { "\($0)" }.joined(separator: "...")
        wordToBeSaid = word + "\n" + "\n" + lettersSpaced + "\n" + "\n" + word
    }
    
    func resetProgressBar() {
        if progressValue > 0.98 {
            progressValue = 0.0
        }
    }
    
    func setGameCards() {
        self.cardBackground = Color.white

        let randomEmoji1 = emojiDict.randomElement()
        let removalKey1 = randomEmoji1!.key
        emojiDict[removalKey1] = nil
            
        let randomEmoji2 = self.emojiDict.randomElement()
        let removalKey2 = randomEmoji2!.key
        emojiDict[removalKey2] = nil
            
        let targetEmoji = self.emojiDict.randomElement()
        let removalKey = targetEmoji!.key
        emojiDict[removalKey] = nil

        self.randomEmojiValue1 = randomEmoji1!.value
        
        self.randomEmojiValue2 = randomEmoji2!.value

        self.targetEmojiValue = targetEmoji!.value

        self.targetEmojiKey = targetEmoji!.key
        
        self.randomEmojiKey1 = randomEmoji1!.key
        
        self.randomEmojiKey2 = randomEmoji2!.key
    }
    func resetGameState() {
        resetProgressBar()
        
        if emojiDict.count < 6 {
            emojiDict = sourceEmojiDict
            setGameCards()
        } else {
            setGameCards()
    }
    }
    
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(ColorManager.yellow)
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            
            HStack {
                Image(decorative: "emoji")
                Image(decorative: "emojiBanner")
            }
    
            
            if isPlayingGame {
            HStack {
                Spacer()
                
                CardView(targetEmoji: $targetEmojiKey, emojiKey: $targetEmojiKey, emojiValue: $targetEmojiValue, background: $cardBackground, progressAmount: $progressValue)

                CardView(targetEmoji: $targetEmojiKey, emojiKey: $randomEmojiKey1, emojiValue: $randomEmojiValue1, background: $cardBackground, progressAmount: $progressValue)

                CardView(targetEmoji: $targetEmojiKey, emojiKey: $randomEmojiKey2, emojiValue: $randomEmojiValue2, background: $cardBackground, progressAmount: $progressValue)

                Spacer()
            }
            }
            Spacer()
            Spacer()
        
            if isPlayingGame {
                ProgressBar(progress: self.$progressValue, progressBarText: self.$targetEmojiKey)
                .padding()
            }
            
            Spacer()

            
            if isPlayingGame {
                
            Button(action: {
                self.resetGameState()
                self.wordsToLetters(word: self.targetEmojiKey)
                self.playSpeech(word: self.wordToBeSaid)
                print("wordtobesaid is " + self.wordToBeSaid)
            }) {
                Text("Play!")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(ColorManager.blue)
                    .cornerRadius(40)
                    .foregroundColor(ColorManager.yellow)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(ColorManager.blue, lineWidth: 8)
                    )
            }
            }
            
            
            Button(action: {
                self.isPlayingGame.toggle()
            }) {
                Text("Start/Pause")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(ColorManager.blue)
                    .cornerRadius(40)
                    .foregroundColor(ColorManager.yellow)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(ColorManager.blue, lineWidth: 8)
                    )
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding()
        }.animation(.easeInOut(duration: 0.5))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
