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
        if let category {
            self.debug("[\(category)] - \(message)")
        } else {
            self.debug("\(message)")
        }
    }
    
    public func info(_ message: String, category: String?) {
        if let category {
            self.info("[\(category)] - \(message)")
        } else {
            self.info("\(message)")
        }
    }
    
    public func warning(_ message: String, category: String?) {
        if let category {
            self.warning("[\(category)] - \(message)")
        } else {
            self.warning("\(message)")
        }
    }
    
    public func error(_ message: String, category: String?) {
        if let category {
            self.error("[\(category)] - \(message)")
        } else {
            self.error("\(message)")
        }
    }
    
    public func critical(_ message: String, category: String?) {
        if let category {
            self.critical("[\(category)] - \(message)")
        } else {
            self.critical("\(message)")
        }
    }
}
