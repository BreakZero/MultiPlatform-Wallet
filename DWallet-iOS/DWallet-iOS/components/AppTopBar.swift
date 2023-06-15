//
//  AppTopBar.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct AppTopBar<Destination>: View where Destination: View {
    var destination: Destination
    
    init(@ViewBuilder destination: () -> Destination) {
        self.destination = destination()
    }
    var body: some View {
        HStack {
            Text("TO DO LIST")
                .font(.system(size: 24))
                .bold()
                .foregroundColor(Color("secondary"))
            Spacer()
            NavigationLink(destination: self.destination, label: {
                Image("settings")
                    .renderingMode(.template)
                    .foregroundColor(Color("tertiary"))
            })
        }.padding(.horizontal, 16.0)
    }
}

struct AppTopBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTopBar {
            Text("")
        }
    }
}
