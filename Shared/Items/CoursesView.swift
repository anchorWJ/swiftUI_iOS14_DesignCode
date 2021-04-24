//
//  CoursesView.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/03/03.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    @Namespace var namespace2
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    var body: some View {
        ZStack {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                tabBar
            } else {
                sidebar
            }
            fullContent
                .background(VisualEffectBlur(blurStyle: .dark).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
    }
    
    var content: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {

                    LazyVGrid(
                        columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2),
                        spacing: 16
                    ) {
                        ForEach(courses) { item in
                            VStack {
                                CourseItem(course: item)
                                    .matchedGeometryEffect(
                                        id: item.id, in: namespace, isSource: !show
                                    )
                                    .frame(height: 200)
                                    .onTapGesture {
                                        withAnimation(
                                            .spring(
                                                response: 0.5,
                                                dampingFraction: 0.7,
                                                blendDuration: 0
                                            )
                                        ) {
                                            show.toggle()
                                            selectedItem = item
                                            isDisabled = true
                                        }
                                    }
                                    .disabled(isDisabled)
                            }
                            .matchedGeometryEffect(
                                id: "container\(item.id)", in: namespace, isSource: !show
                            )
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                
                Text("Latest Sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(destination: CourseDetail(nameSpace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow(item: item)
                        #endif
                    }
                }
            .padding()
            }
        }
        .zIndex(1)
        .navigationTitle("Courses")
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, nameSpace: namespace)

                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(
                            .spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 500)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar: some View {
        TabView {
            NavigationView {
                content
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            NavigationView {
                CourseList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Serach")
            }

        }
    }
    
    @ViewBuilder
    var sidebar: some View {
        #if os(iOS)
        NavigationView {
            List {
                NavigationLink(destination: content) {
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person.crop.circle")
                }
            }
            
            content
        }
        #endif
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
