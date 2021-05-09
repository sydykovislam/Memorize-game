//
//  Grid.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/12/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item :Identifiable, ItemView :View {
    private var items :[Item]
    private var viewForItem :(Item) -> ItemView
    
    init(item: [Item], viewForItem : @escaping (Item) -> ItemView) {
        self.items = item
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout ) -> some View {
                
                        ForEach(items) {item in
                            self.body(for: item, in: layout )
                        }
        
    }
    
    private  func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.getFirstIndex(matching: item)!
        return Group {
            if index != nil {
                viewForItem(item)
                        .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                        .position(layout.location(ofItemAt: index))
            }
        }
    }
    
}

