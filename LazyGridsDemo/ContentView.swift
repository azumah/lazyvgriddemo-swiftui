//
//  ContentView.swift
//  LazyGridsDemo
//
//  Created by Azu on 17/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ScrollableLazyHGrid()
    }
}


struct ScrollableLazyHGrid: View {
    private var gridItems = [GridItem(.fixed(150)),
                             GridItem(.adaptive(minimum: 50)),
                             GridItem(.fixed(150))]
    private var colors: [Color] = [.blue, .yellow, .green]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true){
            LazyHGrid(rows: gridItems, spacing: 5)  {
                ForEach((0...99), id: \.self){
                    CellContent(index: $0, color: colors[$0 % colors.count])
                }
            }.padding(5)
           
        }
    }
}

struct ScrollableLazyVGrid: View {
    private var gridItems = [GridItem(.adaptive(minimum: 50))]
    private var colors: [Color] = [.blue, .yellow, .green]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            LazyVGrid(columns: gridItems, spacing: 5)  {
                ForEach((0...99), id: \.self){
                    CellContent(index: $0, color: colors[$0 % colors.count])
                }
            }.padding(5)
           
        }
    }
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
