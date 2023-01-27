// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface CookieMoverPluginOptions {}

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
