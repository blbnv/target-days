//
//  TargetDayView.swift
//  target-day
//
//  Created by Alex Balabanov on 17.06.22.
//

import SwiftUI

struct TargetDayView: View {
    @State private var name: String = "Test"
    @State private var date: Date = Date()
    var isDismissed: ((_ day: TargetDay) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Something", text: $name)
            DatePicker("Date", selection: $date)
            Button("Confirm") {
                isDismissed?(.init(eventName: self.name, date: self.date))
            }
        }
    }
}

struct TargetDayView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDayView()
    }
}
