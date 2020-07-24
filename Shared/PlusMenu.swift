//
//  PlusMenu.swift
//  CustomTabbar
//
//  Created by nhatle on 7/24/20.
//

import SwiftUI

struct PlusMenu: View {
    @ObservedObject var viewRouter: ViewRouter
    @Binding var showPopup: Bool

    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .onTapGesture{
                        viewRouter.currentView = .camera
                        showPopup.toggle()
                    }
            }
            ZStack {
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .onTapGesture{
                        viewRouter.currentView = .photo
                        showPopup.toggle()
                    }
            }
        }.transition(.scale)
    }
}

//struct PlusMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusMenu()
//    }
//}
