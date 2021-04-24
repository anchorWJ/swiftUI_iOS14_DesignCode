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
    
    var body: some View {
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
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
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 54)
            }
            
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
                    NavigationLink(destination: CourseDetail(nameSpace: namespace2)) {
                        CourseRow(item: item)
                    }
                }
            }
            .padding()
        }
        .zIndex(1)
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
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
