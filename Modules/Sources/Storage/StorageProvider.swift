import Foundation

public protocol StorageProvider {
    func get<T: Storable>(_ stored: StoredValue) -> T?
    func set<T: Storable>(_ object: T, for stored: StoredValue)
    func remove(_ stored: StoredValue)
}
