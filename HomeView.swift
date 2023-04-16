//
//  SwiftUIView.swift
//  WWDC2023
//
//  Created by Yara Vitoria on 10/04/23.
//

import SwiftUI

struct HomeView: View {
    
//    @State private var saciLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.30 , y: UIScreen.main.bounds.height * 0.98)
//    @State private var iaraLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.50 , y: UIScreen.main.bounds.height * 1.00)
//    @State private var cucaLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.050 , y: UIScreen.main.bounds.height * 0.62)
//    @State private var curupiraLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * -0.40 , y: UIScreen.main.bounds.height * 0.70)
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("fundo")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaledToFill()
                HStack{
                    VStack{
                        NavigationLink(destination: ContentView()) {
                            Image("saci1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 320, height: 320)
                                .position(x: geo.size.width * 0.60, y: geo.size.height * 0.64)

                        }
                        NavigationLink(destination: IaraView()) {
                            Image("iara1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 405, height: 405)
                                .position(x: geo.size.width * 0.80, y: geo.size.height * 0.60)

                        }
                        NavigationLink(destination: CurupiraView()) {
                            Image("curupira1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 340, height: 340)
                                .position(x: geo.size.width * 0.35, y: geo.size.height * -0.1 + 70)

                        }
                        NavigationLink(destination: CucaView()) {
                            Image("cuca1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 280, height: 280)
                                .position(x: geo.size.width * 0.35, y: geo.size.height * 0.05)

                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
