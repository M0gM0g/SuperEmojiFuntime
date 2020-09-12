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
                    .scaledToFit()
        }
    }
}

struct TopBanner_Previews: PreviewProvider {
    static var previews: some View {
        TopBanner()
    }
}
