import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CookieMoverPlugin)
public class CookieMoverPlugin: CAPPlugin {
    private let implementation = CookieMover()

    @objc func syncNsCookiesToWkCookieStore(_ call: CAPPluginCall) {
        let overwrite = call.getBool("overwrite") ?? false

        print("CookieMoverPlugin - syncNsCookiesToWkCookieStore({ overwrite: \(overwrite) })")

        let callResult = implementation.syncNsCookiesToWkCookieStore(overwrite)

        var result = JSObject()

        var preActionCookies = JSArray()
        var postActionCookies = JSArray()

        for cookie in callResult.preActionCookies {
            preActionCookies.append(JSObject(_immutableCocoaDictionary: cookie))
        }
        for cookie in callResult.postActionCookies {
            postActionCookies.append(JSObject(_immutableCocoaDictionary: cookie))
        }

        result["preActionCookies"] = preActionCookies
        result["postActionCookies"] = postActionCookies

        call.resolve(result)
    }

    @objc func syncWkCookiesToNsCookieStore(_ call: CAPPluginCall) {
        let overwrite = call.getBool("overwrite") ?? false

        print("CookieMoverPlugin - syncWkCookiesToNsCookieStore({ overwrite: \(overwrite) })")

        let callResult = implementation.syncWkCookiesToNsCookieStore(overwrite)

        var result = JSObject()

        var preActionCookies = JSArray()
        var postActionCookies = JSArray()

        for cookie in callResult.preActionCookies {
            preActionCookies.append(JSObject(_immutableCocoaDictionary: cookie))
        }
        for cookie in callResult.postActionCookies {
            postActionCookies.append(JSObject(_immutableCocoaDictionary: cookie))
        }

        result["preActionCookies"] = preActionCookies
        result["postActionCookies"] = postActionCookies

        call.resolve(result)
    }
}
