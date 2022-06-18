//
//  TargetDaysListView.swift
//  target-day
//
//  Created by Alex Balabanov on 17.06.22.
//

import SwiftUI
import DateUtilities

struct TargetDaysListView: View {
    
    @State var presentingModal = false
    @State var days: [TargetDay] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(days, id: \.self) { day in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(day.eventName)
                        Text("\(Date.daysBetween(start: Date(), end: day.date)) days")
                    }
                }
            }
            .navigationTitle("Target days")
            .toolbar {
                Button("Add") {
                    self.presentingModal = true
                }
                .sheet(isPresented: $presentingModal) {
                    TargetDayView() { day in
                        self.days.append(day)
                        self.presentingModal = false
                    }
                }
            }
        }
    }
}

struct TargetDaysListView_Previews: PreviewProvider {
    static var previews: some View {
        TargetDaysListView()
    }
}
