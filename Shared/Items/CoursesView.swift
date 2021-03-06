//
//  CoursesView.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/03/03.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250)
            if show {
                CourseItem()
                    .transition(.move(edge: .top))
                    .zIndex(1)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
        //.animation(.spring())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
