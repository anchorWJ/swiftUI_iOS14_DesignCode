//
//  Slidebar.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI

struct Slidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CoursesView()) {
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            
            CoursesView()
        }
    }
}

struct Slidebar_Previews: PreviewProvider {
    static var previews: some View {
        Slidebar()
    }
}
