import Foundation
import OSLog

public enum LogLevel {
    case debug
    case info
    case warning
    case error

    var icon: String {
        switch self {
        case .debug:
            return "🥋"
        case .info:
            return "🔉"
        case .warning:
            return "⚠️"
        case .error:
            return "🚨"
        }
    }
}

public struct LogInfo {
    let logLevel: LogLevel
    let message: String

    var formattedMessage: String {
        return "\(logLevel.icon) - \(message)"
    }

    public init(logLevel: LogLevel, message: String) {
        self.logLevel = logLevel
        self.message = message
    }
}

public protocol Logging {
    func log(logInfo: LogInfo)
}

public struct LumberjackCoordinator {
    var loggers: [any Logging]

    public init(loggers: [any Logging]) {
        self.loggers = loggers
    }

    public func debug(_ message: String) {
        loggers.forEach { $0.log(logInfo: .init(logLevel: .debug, message: message)) }
    }

    public func info(_ message: String) {
        loggers.forEach { $0.log(logInfo: .init(logLevel: .info, message: message)) }
    }

    public func warning(_ message: String) {
        loggers.forEach { $0.log(logInfo: .init(logLevel: .warning, message: message)) }
    }

    public func error(_ message: String) {
        loggers.forEach { $0.log(logInfo: .init(logLevel: .error, message: message)) }
    }
}

extension Logger: Logging {
    public func log(logInfo: LogInfo) {
        switch logInfo.logLevel {
        case .debug:
            return self.debug("\(logInfo.formattedMessage)")
        case .info:
            return self.info("\(logInfo.formattedMessage)")
        case .warning:
            return self.warning("\(logInfo.formattedMessage)")
        case .error:
            return self.error("\(logInfo.formattedMessage)")
        }
    }

    private static var subsystem = Bundle.main.bundleIdentifier!
    public static let main = Logger(subsystem: subsystem, category: "main")
}
