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

        DispatchQueue.main.sync {

            debugPrint("CookieMoverPlugin - syncNsCookiesToWkCookieStore()")

            implementation.syncNsCookiesToWkCookieStore({ (callResult) in

                let result = self.createJSResult(callResult)

                let printResult = String(data: try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted), encoding: .utf8)!

                debugPrint("CookieMoverPlugin - syncNsCookiesToWkCookieStore()\n\(printResult)")

                call.resolve(result)

            })

        }

    }

    @objc func syncWkCookiesToNsCookieStore(_ call: CAPPluginCall) {

        DispatchQueue.main.sync {

            debugPrint("CookieMoverPlugin - syncWkCookiesToNsCookieStore()")

            implementation.syncWkCookiesToNsCookieStore({ (callResult: Result) in

                let result = self.createJSResult(callResult)

                let printResult = String(data: try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted), encoding: .utf8)!

                debugPrint("CookieMoverPlugin - syncWkCookiesToNsCookieStore()\n\(printResult)")

                call.resolve(result)

            })

        }

    }

    private func createJSResult(_ result: Result) -> JSObject {
        var jsResult = JSObject()

        var preActionCookies = JSArray()
        var postActionCookies = JSArray()

        for cookie in result.preActionCookies {
            let cookieProperties = NSDictionary(dictionary: cookie.properties!)
            var cookieObj = JSObject()

            for (key, value) in cookieProperties {
                cookieObj[key as! String] = String(describing: value)
            }

            preActionCookies.append(cookieObj)
        }

        for cookie in result.postActionCookies {
            let cookieProperties = NSDictionary(dictionary: cookie.properties!)
            var cookieObj = JSObject()

            for (key, value) in cookieProperties {
                cookieObj[key as! String] = String(describing: value)
            }

            postActionCookies.append(cookieObj)
        }

        jsResult["preActionCookies"] = preActionCookies
        jsResult["postActionCookies"] = postActionCookies

        return jsResult
    }
}
