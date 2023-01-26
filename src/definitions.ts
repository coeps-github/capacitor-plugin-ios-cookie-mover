export interface CookieMoverPluginOptions {
  readonly overwrite: boolean;
}

export interface Cookie {
  readonly name: string;
}

export interface CookieMoverPluginSyncResult {
  readonly preActionCookies: Cookie[];
  readonly postActionCookies: Cookie[];
}

export interface CookieMoverPlugin {
  syncWkCookiesToNsCookieStore(options: CookieMoverPluginOptions): Promise<CookieMoverPluginSyncResult>;
  syncNsCookiesToWkCookieStore(options: CookieMoverPluginOptions): Promise<CookieMoverPluginSyncResult>;
}
