import Foundation
import OSLog

public enum LogLevel: Int, Comparable {
    case debug = 0
    case info = 1
    case warning = 2
    case error = 3

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
    
    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
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

public protocol Logging: Sendable {
    var minLevel: LogLevel { get }
    
    func log(logInfo: LogInfo)
}

public struct LumberjackCoordinator: Sendable {
    var loggers: [any Logging]

    public init(loggers: [any Logging]) {
        self.loggers = loggers
    }

    public func debug(_ message: String) {
        log(level: .debug, message: message)
    }

    public func info(_ message: String) {
        log(level: .info, message: message)
    }

    public func warning(_ message: String) {
        log(level: .warning, message: message)
    }

    public func error(_ message: String) {
        log(level: .error, message: message)
    }
    
    private func log(level: LogLevel, message: String) {
        let logInfo = LogInfo(logLevel: level, message: message)
        loggers.forEach { logger in
            if level >= logger.minLevel {
                logger.log(logInfo: logInfo)
            }
        }
    }
}

extension Logger: Logging {
    public var minLevel: LogLevel { .debug }
    
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
}
