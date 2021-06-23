//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Brando Lugo on 6/23/21.
//

import SwiftUI

struct BackgroundImageView: View {
    //MARK: - PROPS
    
    //MARK: - BODY
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

//MARK: - PREV
struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
