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
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.adaptive(minimum: 125), spacing: 70)],
                    spacing: 16
                ) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(
                                    id: item.id, in: namespace, isSource: !show
                                )
                                .frame(width: 200, height: 200)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                       
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
          
          
            if selectedItem != nil {
                ScrollView {
                    CourseItem(course: selectedItem!)
                        .matchedGeometryEffect(id: selectedItem!.id, in: namespace)
                        .frame(height: 300)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                selectedItem = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isDisabled = false
                                }
                            }
                        }
                    VStack {
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition.opacity.animation(
                            Animation.spring().delay(0.3)
                        ),
                        removal: AnyTransition.opacity.animation(
                            .spring()
                        )
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
