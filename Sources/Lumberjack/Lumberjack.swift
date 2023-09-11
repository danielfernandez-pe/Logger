import Foundation
import OSLog

public protocol Logging {
    func debug(_ message: OSLogMessage)
    func info(_ message: OSLogMessage)
    func warning(_ message: OSLogMessage)
    func error(_ message: OSLogMessage)
}

public struct LumberjackCoordinator: Logging {
    var loggers: [any Logging]

    public init(loggers: [any Logging]) {
        self.loggers = loggers
    }

    public func debug(_ message: OSLogMessage) {
        loggers.forEach { $0.debug(message) }
    }

    public func info(_ message: OSLogMessage) {
        loggers.forEach { $0.info(message) }
    }
    
    public func warning(_ message: OSLogMessage) {
        loggers.forEach { $0.warning(message) }
    }

    public func error(_ message: OSLogMessage) {
        loggers.forEach { $0.error(message) }
    }
}

extension Logger: Logging {
    private static var subsystem = Bundle.main.bundleIdentifier!
    public static let main = Logger(subsystem: subsystem, category: "main")
}
