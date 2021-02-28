//
//  ContentView.swift
//  Shared
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("hello word")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
