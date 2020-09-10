//
//  ProgressBar.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/10/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    @Binding var progressBarText: String
    
    var body: some View {
        ZStack {
            
            Text(self.progressBarText)
                .font(.largeTitle)
                .bold()
            
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.blue)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            
        }
    }
}

//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBar()
//    }
//}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
