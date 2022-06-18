import Foundation

public final class Storage: StorageProvider {
    
    public static let shared = Storage()

    private let storage = UserDefaults.standard
    
    public func get<T: Storable>(_ stored: StoredValue) -> T? {
        return self.storage.object(forKey: stored.key) as? T
    }
    
    public func set<T>(_ object: T, for stored: StoredValue) where T : Storable {
        if PropertyListSerialization.propertyList(object, isValidFor: .binary) {
            self.storage.set(object, forKey: stored.key)
        } else {
            assertionFailure("Attempting to write wrong value")
        }
    }
    
    public func remove(_ stored: StoredValue) {
        return self.storage.removeObject(forKey: stored.key)
    }
}
