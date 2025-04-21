//
//  ContentView.swift
//  Example
//
//  Created by Minho Yi on 4/21/25.
//

import SwiftUI
import Hackle

struct ContentView: View {
  @State private var showUserExplorer: Bool = false

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
      Toggle(isOn: $showUserExplorer) {
        Text("Toggle hackle explorer")
      }.onChange(of: showUserExplorer) { oldValue, newValue in
          if showUserExplorer {
            Hackle.app()?.hideUserExplorer()
          } else {
            Hackle.app()?.showUserExplorer()
          }
          showUserExplorer = !showUserExplorer
      }
    }
    .padding()
    .task {
      Hackle.initialize(sdkKey: "")
    }
  }
}

#Preview {
  ContentView()
}
