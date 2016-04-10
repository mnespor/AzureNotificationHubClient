//
//  HubHelper.swift
//  Pods
//
//  Created by Matthew Nespor on 4/9/16.
//
//

import Foundation

internal class HubHelper {
    internal static func url(url: NSURL, withScheme scheme: String) -> NSURL? {
        var urlString = url.absoluteString
        if !urlString.hasSuffix("/") {
            urlString = "\(urlString)/"
        }

        if let indexOfColon = urlString.rangeOfString(":")?.startIndex {
            urlString = "\(scheme)\(urlString.substringFromIndex(indexOfColon))"
        } else {
            urlString = "\(scheme)://\(urlString)"
        }

        return NSURL(string: urlString)
    }

    internal static func parseConnectionString(connectionString: String) -> [String: String] {
        let validFieldPrefixes = ["endpoint==",
                                  "sharedaccesskeyname=",
                                  "sharedaccesskey=",
                                  "sharedsecretissuer=",
                                  "sharedsecretvalue=",
                                  "stsendpoint="]

        var connectionDictionary: [String: String] = [:]
        let fields = connectionString.componentsSeparatedByString(";")
        var previousLeft = ""
        for i in 0..<fields.count {
            if (i+1) < fields.count {
                if validFieldPrefixes.indexOf({ prefix -> Bool in
                    return fields[i].hasPrefix(prefix)
                }) == nil {
                    previousLeft = "\(previousLeft)\(fields[i])"
                    continue
                }
            }

            let currentField = "\(previousLeft)\(fields[i])"
            previousLeft = ""
            let keyValuePairs = currentField.componentsSeparatedByString("=")
            guard keyValuePairs.count >= 2 else { break }

            let keyName = keyValuePairs[0].lowercaseString
            var keyValue = keyValuePairs[1]
            if keyName == "endpoint" {
                keyValue = HubHelper.url(NSURL(string: keyValue)!, withScheme: "https")?.absoluteString ?? ""
            }

            connectionDictionary[keyName] = keyValue
        }

        return connectionDictionary
    }
}
