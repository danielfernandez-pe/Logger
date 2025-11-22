//
//  LoggerManager.swift
//  Lumberjack
//
//  Created by Daniel Fernandez Yopla on 12.09.2025.
//

public struct LoggerManager: Logging, Sendable {
    public var minLevel: LogLevel { .debug }
    
    private var loggers: [any Logging]

    public init(loggers: [any Logging]) {
        self.loggers = loggers
    }

    public func debug(_ message: String, category: String?) {
        log(level: .debug, message: message, category: category)
    }

    public func info(_ message: String, category: String?) {
        log(level: .info, message: message, category: category)
    }

    public func warning(_ message: String, category: String?) {
        log(level: .warning, message: message, category: category)
    }

    public func error(_ message: String, category: String?) {
        log(level: .error, message: message, category: category)
    }
    
    public func critical(_ message: String, category: String?) {
        log(level: .critical, message: message, category: category)
    }
    
    private func log(level: LogLevel, message: String, category: String?) {
        let logInfo = LogInfo(logLevel: level, message: message)
        loggers.forEach { logger in
            if level >= logger.minLevel {
                switch level {
                case .debug:
                    logger.debug(logInfo.formattedMessage, category: category)
                case .info:
                    logger.info(logInfo.formattedMessage, category: category)
                case .warning:
                    logger.warning(logInfo.formattedMessage, category: category)
                case .error:
                    logger.error(logInfo.formattedMessage, category: category)
                case .critical:
                    logger.critical(logInfo.formattedMessage, category: category)
                }
            }
        }
    }
}
