import Foundation
import UIKit
import WebKit

@objc public class CookieMover: NSObject {
    @objc public func syncNsCookiesToWkCookieStore(_ callback: @escaping ((Result) -> Void)) {
        let wkCookieStore = WKWebsiteDataStore.default().httpCookieStore
        let nsCookieStore = HTTPCookieStorage.shared

        wkCookieStore.getAllCookies({ (wkCookies) in
            let nsCookies = nsCookieStore.cookies!

            let result = Result()

            for nsCookie in nsCookies {
                let nsCookieProperties = NSMutableDictionary(dictionary: nsCookie.properties!)
                nsCookieProperties.removeObject(forKey: HTTPCookiePropertyKey.discard) // Remove the discard flag.
                let wkCookie = HTTPCookie(properties: nsCookieProperties as! [HTTPCookiePropertyKey: Any])!
                wkCookieStore.setCookie(wkCookie)
            }

            result.preActionCookies = wkCookies
            result.postActionCookies = nsCookies

            callback(result)

        })
    }

    @objc public func syncWkCookiesToNsCookieStore(_ callback: @escaping ((Result) -> Void)) {
        let wkCookieStore = WKWebsiteDataStore.default().httpCookieStore
        let nsCookieStore = HTTPCookieStorage.shared

        wkCookieStore.getAllCookies({ (wkCookies) in
            let nsCookies = nsCookieStore.cookies!

            let result = Result()

            for wkCookie in wkCookies {
                let wkCookieProperties = NSMutableDictionary(dictionary: wkCookie.properties!)
                wkCookieProperties.removeObject(forKey: HTTPCookiePropertyKey.discard) // Remove the discard flag.
                let nsCookie = HTTPCookie(properties: wkCookieProperties as! [HTTPCookiePropertyKey: Any])!
                nsCookieStore.setCookie(nsCookie)
            }

            result.preActionCookies = wkCookies
            result.postActionCookies = nsCookies

            callback(result)

        })
    }
}
