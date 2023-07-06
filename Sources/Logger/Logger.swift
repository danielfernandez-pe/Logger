import Foundation

public struct Logger {
    private let label: String
    private let showLabel: Bool
    private let dateFormatter = DateFormatter()
    
    public init(label: String, showLabel: Bool = false) {
        self.label = label
        self.showLabel = showLabel
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    }

    public func debug(_ message: String) {
        let date = dateFormatter.string(from: Date.now)
        var context = date
        
        if showLabel {
            context += " \(label)"
        }
        
        #if DEBUG
        print("\(context) 🍕 [DEBUG] \(message)")
        #endif
    }
    
    public func info(_ message: String) {
        
    }
    
    public func warning(_ message: String) {
        
    }
    
    public func error(_ message: String) {
        
    }
}
