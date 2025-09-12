//
//  LogInfo.swift
//  Lumberjack
//
//  Created by Daniel Fernandez Yopla on 12.09.2025.
//

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
