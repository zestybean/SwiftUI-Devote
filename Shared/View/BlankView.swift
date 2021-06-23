//
//  BlankView.swift
//  Devote
//
//  Created by Brando Lugo on 6/23/21.
//

import SwiftUI



struct BlankView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(BlurView())
        .opacity(0.5)
        .ignoresSafeArea(.all)
        
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
