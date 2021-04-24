//
//  CourseDetail.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/04/17.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course = courses[0]
    var nameSpace: Namespace.ID
    #if os(iOS)
    var cornerRadius: CGFloat = 10
    #else
    var corRadius: CGFloat = 0
    #endif
    @State var showModal = false
    
    var body: some View {
        #if os(iOS)
        content
        .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadius: 0)
                    .matchedGeometryEffect(id: course.id, in: nameSpace)
                    .frame(height: 300)
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .sheet(isPresented: $showModal) {
                                CourseList()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: nameSpace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        CourseDetail(nameSpace: nameSpace)
    }
}
