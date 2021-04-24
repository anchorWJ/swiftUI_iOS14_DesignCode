//
//  CourseSectionDetail.swift
//  SwiftUI DesignCode
//
//  Created by w simple on 2021/04/24.
//

import SwiftUI

struct CourseSectionDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        #if os(iOS)
        content
        #else
        content
            .frame(width: 800, height: 600)
        #endif
    }
    
    var content: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                CourseItem(cornerRadius: 0)
                    .frame(height: 300)
                VStack(alignment: .leading, spacing: 30) {
                    Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
                    Text("Multiplatform app").font(.title).bold()
                    Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density.")
                    Text("What you'll build").font(.title).bold()
                    Text("In this course, we'll build an app from scratch focusing on the new techniques in iOS 14. We'll use the Sidebar and Tab bar navigation pattern, which translates well to all platforms and give you the power to adapt for any type of content. Also, we'll use Lazy Grids to make the layout adaptive to all devices and we'll learn the new Matched Geometry Effect to create beautiful transitions between screens without the complexity. This is a real app that will be launched to the App Store in September. All the source files and designs are shared so you can use this as a template to build your own app.")
                    Text("Requirements").font(.title).bold()
                    Text("Developing for iOS 14 requires a Mac with Catalina and Xcode 12. It is recommended that you upgrade to Big Sur in order to build for macOS using SwiftUI. You can still follow the iOS parts, which is the main focus of this course. However, some steps and code specific to the macOS app may not work.")
                }
                .padding()
            }
            CloseButton()
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct CourseSectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionDetail()
    }
}
