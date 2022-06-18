//
//  Storage.swift
//  target-day
//
//  Created by Alex Balabanov on 17.06.22.
//

import Foundation

final class Storage {
    static let shared = Storage()
    
    func add(_ data: TargetDay) {
        var arr = fetch()
        arr.append(data)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(arr)
        UserDefaults.standard.set(data, forKey: "com.days")
    }
    
    func fetch() -> [TargetDay] {
        guard let data = UserDefaults.standard.data(forKey: "com.days") else { return [] }
        let decoder = JSONDecoder()
        let array = try! decoder.decode([TargetDay].self, from: data)
        return array
    }
    
    func delete(_ targetDay: TargetDay) {
        var arr = self.fetch()
        arr.removeAll { $0.id == targetDay.id }
        let encoder = JSONEncoder()
        let data = try! encoder.encode(arr)
        UserDefaults.standard.set(data, forKey: "com.days")
    }
    
}
