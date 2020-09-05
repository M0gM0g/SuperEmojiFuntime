//
//  EmojiLabel.swift
//  EmojiFuntime
//
//  Created by Mark O'Leary on 9/3/20.
//  Copyright © 2020 Mark O'Leary. All rights reserved.
//

import SwiftUI

struct EmojiLabel: View {
    
    @Binding var labelText:String
    
    var body: some View {
        VStack {
                   
                       Text(labelText)
                       .padding(.all, 20)
                       .foregroundColor(Color.black)
                       
                   }
    
    }
}

struct EmojiLabel_Previews: PreviewProvider {
    static var previews: some View {
        EmojiLabel(labelText: Binding.constant("test"))
    }
}
