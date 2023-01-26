import { WebPlugin } from '@capacitor/core';

import type { CookieMoverPlugin, CookieMoverPluginOptions, CookieMoverPluginSyncResult } from './definitions';

export class CookieMoverWeb extends WebPlugin implements CookieMoverPlugin {
  private readonly result: CookieMoverPluginSyncResult = {
    preActionCookies: [],
    postActionCookies: [],
  };

  async syncNsCookiesToWkCookieStore(options: CookieMoverPluginOptions): Promise<CookieMoverPluginSyncResult> {
    console.debug(`syncNsCookiesToWkCookieStore(options: ${options}) is not implemented in WEB plugin!`);
    return Promise.resolve(this.result);
  }

  async syncWkCookiesToNsCookieStore(options: CookieMoverPluginOptions): Promise<CookieMoverPluginSyncResult> {
    console.debug(`syncWkCookiesToNsCookieStore(options: ${options}) is not implemented in WEB plugin!`);
    return Promise.resolve(this.result);
  }
}
