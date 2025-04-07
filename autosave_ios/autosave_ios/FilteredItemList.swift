//
//  FilteredItemList.swift
//  autosave_ios
//
//  Created by Asia Serrano on 4/4/25.
//

import SwiftUI
import SwiftData

struct FilteredItemList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var models: [Item]
    
    init(_ search: String) {
        if search.isEmpty {
            self._models = Query()
        } else {
            self._models = Query(filter: #Predicate<Item> {
                return $0.obj.value == search
            })
        }
    }
    
    var body: some View {
        Form {
            ForEach(models) { item in
                NavigationLink {
                    VStack(alignment: .leading) {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                        Text(item.obj.key)
                        Text(item.obj.value)
                        Text(item.str.description)
                    }
                } label: {
                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    private func removeItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.remove(models[index])
            }
        }
    }
    
}
