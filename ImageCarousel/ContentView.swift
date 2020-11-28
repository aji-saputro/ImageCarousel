//
//  ContentView.swift
//  ImageCarousel
//
//  Created by Aji_sahputra on 28/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ScrollView {
        
        GeometryReader { geometry in
          ImageCarousel(numberOfImages: 3) {
            Image("xcode1")
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .clipped()
            Image("xcode1")
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .clipped()
            Image("swift")
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width, height: geometry.size.height)
              .clipped()
          }
        }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
        
        VStack(alignment: .leading, spacing: 10) {
          HStack {
            
            Image("swift")
              .resizable()
              .scaledToFill()
              .frame(width: 55, height: 55)
              .clipShape(Circle())
              .shadow(radius: 4)
            
            VStack(alignment: .leading) {
              Text("Article Written By")
                .font(.avenirNext(size: 17))
                .foregroundColor(.gray)
                .bold()
              Text("Swift For Xcode")
                .font(.avenirNext(size: 17))
                .bold()
            }
          }
          
          Text("28 November 2020 ~ min read")
            .font(.avenirNext(size: 12))
            .foregroundColor(.gray)
            
          Text("How To Build an Image Carousel")
            .font(.avenirNext(size: 12))
            .bold()
          
          Text(text)
            .lineLimit(nil)
            .font(.avenirNext(size: 17))
        }
        .padding(.horizontal)
        .padding(.top, 16)
      }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Font {
  static func avenirNext(size: Int) -> Font {
    return Font.custom("Avenir Next", size: CGFloat(size))
  }
  
  static func avenirNextReguler(size: Int) -> Font {
    return Font.custom("AvenirNext-Reguler", size: CGFloat(size))
  }
}

let text = "laksdaidhadalsma sldaldmsalsjdpasd lsdlasjdasjdal asdjaksdasdajsd ksdakshdaksda sjdjas sdhashdaisd ksddkasda uea aisihda sdna cao asnasdpasdasdkdnad  oasdasdn d askdnas daksd daksdna"
