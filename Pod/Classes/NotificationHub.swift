//
//  NotificationHub.swift
//  Pods
//
//  Created by Matthew Nespor on 4/9/16.
//
//

import Foundation

public class NotificationHub {
    public static var version: String {
        return "v0.1"
    }

    public init(connectionString: String, notificationHubPath: String) {

    }

    public func registerNative(deviceToken: NSData,
                               tags: Set<String>,
                               completion: ((ErrorType?) -> Void)?) {
        completion?(nil)
    }

    public func registerTemplate(deviceToken: NSData,
                          name: String,
                          jsonBodyTemplate: String,
                          expiryTemplate: String,
                          tags: Set<String>,
                          completion: ((ErrorType?) -> Void)?) {
        completion?(nil)
    }

    public func unregisterNative(completion: ((ErrorType?) -> Void)?) {
        completion?(nil)
    }

    public func unregisterTemplate(name: String, completion: ((ErrorType?) -> Void)?) {
        completion?(nil)
    }

    public func unregisterAll(deviceToken: NSData, completion: ((ErrorType?) -> Void)?) {
        completion?(nil)
    }
}
