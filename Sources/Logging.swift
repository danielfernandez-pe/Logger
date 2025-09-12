import Foundation

public protocol Logging: Sendable {
    var minLevel: LogLevel { get }
    
    func debug(_ message: String, category: String?)
    func info(_ message: String, category: String?)
    func warning(_ message: String, category: String?)
    func error(_ message: String, category: String?)
    func critical(_ message: String, category: String?)
}
