//
//  LogLevel.swift
//  Lumberjack
//
//  Created by Daniel Fernandez Yopla on 12.09.2025.
//

public enum LogLevel: Int, Comparable, Sendable {
    case debug = 0
    case info = 1
    case warning = 2
    case error = 3
    case critical = 4

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
        case .critical:
            return "🚨🚨🚨"
        }
    }
    
    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
