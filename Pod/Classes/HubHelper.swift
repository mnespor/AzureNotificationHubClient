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
}
