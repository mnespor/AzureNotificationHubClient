//
//  ConnectionString.swift
//  Pods
//
//  Created by Matthew Nespor on 4/9/16.
//
//

import Foundation

// swiftlint:disable line_length
public class ConnectionString {
    static let defaultListenSasRuleName = "DefaultListenSharedAccessSignature"
    static let defaultFullSasRuleName = "DefaultFullSharedAccessSignature"

    public static func string(endpoint: NSURL,
                              issuer: String,
                              issuerSecret: String) -> String {
        let endpointUri = HubHelper.url(endpoint, withScheme: "sb")?.absoluteString ?? ""
        if endpointUri.lowercaseString.hasPrefix("endpoint=") {
            return "\(endpointUri);SharedSecretIssuer=\(issuer);SharedSecretValue=\(issuerSecret)"
        }

        return "Endpoint=\(endpointUri);SharedSecretIssuer=\(issuer);SharedSecretValue=\(issuerSecret)"
    }

    public static func string(endpoint: NSURL,
                              fullAccessSecret: String) -> String {
        return string(endpoint,
                      sharedAccessKeyName: defaultFullSasRuleName,
                      accessSecret: fullAccessSecret)
    }

    public static func string(endpoint: NSURL,
                              listenAccessSecret: String) -> String {
        return string(endpoint,
                      sharedAccessKeyName: defaultListenSasRuleName,
                      accessSecret: listenAccessSecret)
    }

    public static func string(endpoint: NSURL,
                              sharedAccessKeyName: String,
                              accessSecret: String) -> String {
        let endpointUri = HubHelper.url(endpoint, withScheme: "sb")?.absoluteString ?? ""
        if endpointUri.lowercaseString.hasPrefix("endpoint=") {
            return "\(endpointUri);SharedAccessKeyName=\(sharedAccessKeyName);SharedAccessKey=\(accessSecret)"
        }

        return "Endpoint=\(endpointUri);SharedAccessKeyName=\(sharedAccessKeyName);SharedAccessKey=\(accessSecret)"
    }
}
