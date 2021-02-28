//
//  CoursesView.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        List(0 ..< 10) { item in
            CourseRow()
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
