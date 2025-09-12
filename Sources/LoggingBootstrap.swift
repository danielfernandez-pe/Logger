//
//  LoggingBootstrap.swift
//  Lumberjack
//
//  Created by Daniel Fernandez Yopla on 12.09.2025.
//

public class LoggingBootstrap {
    nonisolated(unsafe) private static var configuredLoggers: [any Logging] = []

    public static func configure(@LoggerBuilder _ builder: () -> [any Logging]) {
        configuredLoggers = builder()
    }

    public static func getConfiguredLoggers() -> [any Logging] {
        return configuredLoggers
    }
}

@resultBuilder
public struct LoggerBuilder {
    public static func buildBlock(_ loggers: (any Logging)...) -> [any Logging] {
        return Array(loggers)
    }
}
