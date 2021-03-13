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
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    CourseItem()
                        .matchedGeometryEffect(
                            id: "Card", in: namespace, isSource: !show
                        )
                        .frame(width: 335, height: 250)
                    CourseItem()
                        .frame(width: 335, height: 250)
                }
                .frame(maxWidth: .infinity)
            }
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .frame(height: 300)
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
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
