//
//  Logger+Logging.swift
//  Lumberjack
//
//  Created by Daniel Fernandez Yopla on 12.09.2025.
//

import OSLog

extension Logger: Logging {
    public var minLevel: LogLevel { .debug }
    
    public func debug(_ message: String, category: String?) {
        self.debug("[\(category == nil ? "" : category!)] \(message)")
    }
    
    public func info(_ message: String, category: String?) {
        self.info("[\(category == nil ? "" : category!)] \(message)")
    }
    
    public func warning(_ message: String, category: String?) {
        self.warning("[\(category == nil ? "" : category!)] \(message)")
    }
    
    public func error(_ message: String, category: String?) {
        self.error("[\(category == nil ? "" : category!)] \(message)")
    }
    
    public func critical(_ message: String, category: String?) {
        self.critical("[\(category == nil ? "" : category!)] \(message)")
    }
}
