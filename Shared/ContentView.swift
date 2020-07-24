//
//  ContentView.swift
//  Shared
//
//  Created by nhatle on 7/24/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    @State private var showPopup = false
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                presentedView()
                Spacer()
                if showPopup {
                    PlusMenu(viewRouter: viewRouter, showPopup: $showPopup).offset(y: -geometry.size.height/20)
                }
                HStack {
                    image(with: "house", geometry: geometry)
                        .onTapGesture {
                            viewRouter.currentView = .home
                        }
                    ZStack {
                        Circle().foregroundColor(.white).frame(width: 75, height: 75)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: showPopup ? 45  : 0))
                    }
                    .offset(y: -geometry.size.height/10/2)
                    .onTapGesture {
                        showPopup.toggle()
                    }
                    image(with: "gear", geometry: geometry)
                        .onTapGesture {
                            viewRouter.currentView = .setting
                        }
                }
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color.white.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    @ViewBuilder
    private func presentedView() -> some View {
        switch viewRouter.currentView {
        case .home:
            HomeView()
        case .setting:
            SettingView()
        case .camera:
            CameraView()
        case .photo:
            PhotoView()
        }
    }

    private func image(with name: String, geometry: GeometryProxy) -> some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(20)
            .frame(width: geometry.size.width/3, height: 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
