import { registerPlugin } from '@capacitor/core';

import type { CookieMoverPlugin } from './definitions';

const CookieMover = registerPlugin<CookieMoverPlugin>('CookieMover', {
  web: () => import('./web').then((m) => new m.CookieMoverWeb()),
});

export * from './definitions';
export { CookieMover };
