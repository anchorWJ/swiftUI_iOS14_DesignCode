//
//  CoursesView.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        List(0 ..< 30) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Courses")
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
