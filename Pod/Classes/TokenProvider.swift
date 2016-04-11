//
//  TokenProvider.swift
//  Pods
//
//  Created by Matthew Nespor on 4/10/16.
//
//

import Foundation

class TokenProvider {
    internal var defaultTimeToExpireInMinutes = 20

    private let endpoint: NSURL
    private let sharedAccessKey: String?
    private let sharedAccessKeyName: String?
    private let sharedSecret: String?
    private let sharedSecretIssurer: String?
    private let stsHostName: NSURL

    init?(connectionDictionary: [String: String]) {
        guard let endpoint = TokenProfider.∫tryUrl(connectionDictionary["endpoint"]) else {
            return nil
        }

        self.endpoint = endpoint
        guard let stsHostName = TokenProvider.tryUrl(connectionDictionary["stsendpoint"]) else {
            return nil
        }

        self.stsHostName = stsHostName

    }

    private static func tryUrl(string: String?) -> NSURL? {
        // swiftlint:disable opening_brace
        guard let
            string = string,
            url = NSURL(string: string) else
        {
            return nil
        }
        // swiftlint:enable opening_brace

        return url
    }
}
