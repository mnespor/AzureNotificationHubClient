//
//  NotificationHub.swift
//  Pods
//
//  Created by Matthew Nespor on 4/9/16.
//
//

import Foundation

public class NotificationHub {
    let endpoint: NSURL
    let path: String
    let tokenProvider: TokenProvider
    let storageManager: LocalStorage

    let apiVersion = "2013-04";
    let userAgentTemplate = "NOTIFICATIONHUBS/%@(api-origin=IosSdk; os=%@; os_version=%@;)";

    public static var version: String {
        return "v0.1"
    }

    public init?(connectionString: String, notificationHubPath: String) {
        let connectionInfo = HubHelper.parseConnectionString(connectionString)
        guard let
            endpointPath = connectionInfo["endpoint"],
            endpoint = NSURL(string: endpointPath) where endpoint.host != nil else
        {
            print("Endpoint is missing or is not in URL format in connectionString.")
            return nil
        }

        self.path = notificationHubPath
        self.endpoint = endpoint
        self.tokenProvider = TokenProvider(connectionDictionary: connectionInfo)
        self.storageManager = LocalStorage(notificationHubPath: notificationHubPath)
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
