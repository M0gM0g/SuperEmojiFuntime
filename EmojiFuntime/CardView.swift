//
//  CardView.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/2/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var targetEmoji: String
    @Binding var emojiKey: String
    @Binding var emojiValue: String
    @Binding var background:Color
    
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(background)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius:16)
                            .strokeBorder(Color.white, lineWidth: 2)
                )

                Button(action: {
                    if self.emojiKey == self.targetEmoji {
                        print("you got it!")
                    } else {
                        print("wrong emoji!")
                    }
                }) {
                    Text(emojiValue)
                        .font(.system(size: 80))
                }

            }
        }
    }

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(symbol: Binding.constant("cat"), background: Binding.constant(Color.green))
//    }
//}

