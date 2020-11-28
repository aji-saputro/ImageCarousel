//
//  ImageCarousel.swift
//  ImageCarousel
//
//  Created by Aji_sahputra on 28/11/20.
//

import SwiftUI
import Combine

struct ImageCarousel<Content: View>: View {
  
  private var numberOfImages : Int
  private var content : Content
  @State private var currentIndex: Int = 0
  private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  
  init(numberOfImages : Int, @ViewBuilder conten : () -> Content) {
    self.numberOfImages = numberOfImages
    self.content = content()
  }
  
  var body: some View {
    GeometryReader { goe in
      ZStack(alignment: .bottom) {
        HStack(spacing: 0) {
          self.content
        }
        .frame(width: geo.size.width, height: geo.size.height, alignment: .leading)
        .offset(x: CGFloat(self.currentIndex) * geo.size.width, y: 0)
        .animation(.spring())
        .onReceive(self.timer) { _ in
          self.currentIndex = (self.currentIndex + 1) % (self.numberOfImages == 0 ? 1 : self.numberOfImages)
        }
        HStack(spacing: 3){
          ForEach(0..<self.numberOfImages, id: \.self) { index in
            Circle()
              .frame(width: index == self.currentIndex ? 10:8, height: index == self.currentIndex ? 10:8)
              .foregroundColor(index == self.currentIndex ? .blue : .white)
              .overlay(Circle().stroke(Color.gray, lineWidth: 1))
              .padding(.bottom, 8)
              .animation(.spring())
          }
        }
      }
    }
  }
}
