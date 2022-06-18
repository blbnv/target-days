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
    @State var days: [TargetDay] = [.init(eventName: "Name", date: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(days, id: \.self) { day in
                    DayListItemView(title: day.eventName,
                                  subtitle: "TBD",
                                  date: "5 AM")
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

struct DayListItemView: View {
    var title: String
    var subtitle: String
    var date: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "trash.circle.fill")
                .font(.system(size: 30))
                .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 5) {
                Text(self.title)
                    .font(.headline)
                Text(self.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(self.date)
            NavigationLink("") {}
                .frame(width: 10, alignment: .leading)
        }
    }
}
