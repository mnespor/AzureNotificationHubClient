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
    private let sharedSecretIssuer: String?
    private let stsHostName: NSURL

    init?(connectionDictionary: [String: String]) {
        guard let endpoint = TokenProvider.tryUrl(connectionDictionary["endpoint"])
            where endpoint.host != nil else {
            return nil
        }

        self.endpoint = endpoint
        guard let stsHostName = TokenProvider.tryUrl(connectionDictionary["stsendpoint"]) else {
            return nil
        }

        self.stsHostName = stsHostName
        self.sharedAccessKey = connectionDictionary["sharedaccesskey"]
        self.sharedAccessKeyName = connectionDictionary["sharedaccesskeyname"]
        self.sharedSecret = connectionDictionary["sharedsecretvalue"]
        self.sharedSecretIssuer = connectionDictionary["sharedsecretissuer"]

        if (sharedAccessKey == nil || sharedAccessKeyName == nil) && sharedSecret == nil {
            print("Security information is missing in connectionString.")
            return nil
        }


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
