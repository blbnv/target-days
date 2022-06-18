//
//  TargetDaysListView.swift
//  target-day
//
//  Created by Alex Balabanov on 17.06.22.
//

import SwiftUI

struct TargetDaysListView: View {
    
    @State var presentingModal = false
    @State var days = Storage.shared.fetch()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(days, id: \.self) { day in
                    Text(day.eventName)
                }
                .onDelete { indexSet in
                    let index: Int = indexSet[indexSet.startIndex]
                    Storage.shared.delete(self.days[index])
                    days = Storage.shared.fetch()
                }
            }
            .navigationTitle("Target days")
            .toolbar {
                Button("Add") {
                    self.presentingModal = true
                }
                .sheet(isPresented: $presentingModal) {
                    TargetDayView() {
                        self.presentingModal = false
                        days = Storage.shared.fetch()
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
