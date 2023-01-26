import Foundation
import UIKit
import WebKit

@objc public class CookieMover: NSObject {
    @objc public func syncNsCookiesToWkCookieStore(_ overwrite: Bool) -> Result {
        let result = Result()

        debugPrint("CookieMover - syncWkCookiesToNsCookieStore({ overwrite: \(overwrite) }) -> \(result)")

        return result
    }

    @objc public func syncWkCookiesToNsCookieStore(_ overwrite: Bool) -> Result {
        let result = Result()

        let wkCookieStore = WKWebsiteDataStore.default().httpCookieStore
        let nsCookieStore = HTTPCookieStorage.shared

        wkCookieStore.getAllCookies({ (cookies) in

            for cookie in cookies {
                let cookieProperties = NSMutableDictionary(dictionary: cookie.properties!)
                cookieProperties.removeObject(forKey: HTTPCookiePropertyKey.discard) // Remove the discard flag.
                let newCookie = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey: Any])!

                if overwrite || !nsCookieStore.cookies!.contains(cookie) {
                    nsCookieStore.setCookie(newCookie)
                }
            }

            result.preActionCookies = cookies
            result.postActionCookies = nsCookieStore.cookies!

        })

        debugPrint("CookieMover - syncWkCookiesToNsCookieStore({ overwrite: \(overwrite) }) -> \(result)")

        return result
    }
}
