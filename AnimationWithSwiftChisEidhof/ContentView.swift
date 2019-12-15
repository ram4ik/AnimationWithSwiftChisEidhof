//
//  ContentView.swift
//  AnimationWithSwiftChisEidhof
//
//  Created by Ramill Ibragimov on 15.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct Dump: View {
    var result = ""
    init<A>(_ value: A) {
        dump(value, to: &result)
    }
    var body: Text { Text(result) }
}

struct ContentView: View {
    @State var selected = false
    var body: some View {
        VStack {
            Rectangle()
                .fill(selected ? Color.green : Color.pink)
                .frame(width: selected ? 300 : 200, height: 100)
                .offset(y: selected ? -300 : 0)
                .animation(Animation.default.speed(0.1))
            
            Button(action: {
                self.selected.toggle()
            }, label: { selected ? Text("Deselected") : Text("Select") })
            
            Dump(Rectangle().fill(Color.pink).frame(width: 200, height: 100))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
