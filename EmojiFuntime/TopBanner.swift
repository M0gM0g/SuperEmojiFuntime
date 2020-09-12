//
//  TopBanner.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/12/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI

struct TopBanner: View {
    var body: some View {

            ZStack {
                Image(decorative: "logoBackground")
                    .resizable()
                    .frame(width: 375, height: 300)
                    .scaledToFit()
                HStack {
                    Image(decorative: "emoji")
                        .resizable()
                        .frame(width: 80.0, height: 75.0)
                        .offset(x: 20, y: 15)
                        .scaledToFit()
            
                    Image(decorative: "emojiBanner")
                        .resizable()
                        .frame(width: 250, height: 200)
                        .offset(x: -30, y: -15)
                        .scaledToFit()
                }
                }.frame(width: 175, height: 175).padding()
            
    }
}

struct TopBanner_Previews: PreviewProvider {
    static var previews: some View {
        TopBanner()
    }
}
