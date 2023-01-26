package com.coeps.capacitor.plugin.ioscookiemover;

import android.util.Log;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CookieMover")
public class CookieMoverPlugin extends Plugin {

    @PluginMethod
    public void syncNsCookiesToWkCookieStore(PluginCall call) {
        JSObject options = call.getData();

        Log.d(
            "CookieMoverPlugin",
            String.format("syncNsCookiesToWkCookieStore(options: %s) is not implemented in ANDROID plugin!", options)
        );

        JSObject result = new JSObject();
        JSArray preActionCookies = new JSArray();
        JSArray postActionCookies = new JSArray();
        result.put("preActionCookies", preActionCookies);
        result.put("postActionCookies", postActionCookies);
        call.resolve(result);
    }

    @PluginMethod
    public void syncWkCookiesToNsCookieStore(PluginCall call) {
        JSObject options = call.getData();

        Log.d(
            "CookieMoverPlugin",
            String.format("syncWkCookiesToNsCookieStore(options: %s) is not implemented in ANDROID plugin!", options)
        );

        JSObject result = new JSObject();
        JSArray preActionCookies = new JSArray();
        JSArray postActionCookies = new JSArray();
        result.put("preActionCookies", preActionCookies);
        result.put("postActionCookies", postActionCookies);
        call.resolve(result);
    }
}
