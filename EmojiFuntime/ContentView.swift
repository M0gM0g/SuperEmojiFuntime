//
//  ContentView.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/1/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State private var background = Color.white
    
    @State var targetEmojiKey = ""
    @State var targetEmojiValue = ""

    @State var randomEmojiValue1 = ""
    @State var randomEmojiValue2 = ""
    @State var randomEmojiKey1 = ""
    @State var randomEmojiKey2 = ""

    let emojiDict =  ["Dog": "🐶", "Cat": "😺", "Car": "🚗", "Guitar": "🎸"]

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            
            HStack {
                Image(decorative: "emoji")
                
                Text("Super Emoji Funtime!")
                .bold()
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
            
            }
    
            HStack {
                Spacer()
                
                CardView(targetEmoji: $targetEmojiKey, emojiKey: $targetEmojiKey, emojiValue: $targetEmojiValue, background: $background)

                CardView(targetEmoji: $targetEmojiKey, emojiKey: $randomEmojiKey1, emojiValue: $randomEmojiValue1, background: $background)

                CardView(targetEmoji: $targetEmojiKey, emojiKey: $randomEmojiKey2, emojiValue: $randomEmojiValue2, background: $background)

                Spacer()
            }
            
            Spacer()
            Spacer()
        
            Text(self.targetEmojiKey)
                .background(Circle()
                .trim(from: show ? 0.1 : 0.99, to: 1)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: 100, height: 100)
                .animation(.easeOut)
                .onTapGesture {
                    self.show.toggle()
                    }
            
            )
            Spacer()
            
            Button(action: {
                // change images
                let randomEmoji1 = self.emojiDict.randomElement()
                
                let randomEmoji2 = self.emojiDict.randomElement()

                let targetEmoji = self.emojiDict.randomElement()

                self.randomEmojiValue1 = randomEmoji1!.value
                
                self.randomEmojiValue2 = randomEmoji2!.value

                self.targetEmojiValue = targetEmoji!.value

                self.targetEmojiKey = targetEmoji!.key
                
                self.randomEmojiKey1 = randomEmoji1!.key
                
                self.randomEmojiKey2 = randomEmoji2!.key


                
                
                
            }) {
                Text("Start/Pause")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 5)
                    )
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
