//
//  CourseList.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI

struct CourseList: View {
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth:800, minHeight: 600)
        #endif
    }
    var content: some View {
        List(0 ..< 30) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CoursesList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
