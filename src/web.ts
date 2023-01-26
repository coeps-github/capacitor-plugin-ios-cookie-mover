import { WebPlugin } from '@capacitor/core';

import type { CookieMoverPlugin } from './definitions';

export class CookieMoverWeb extends WebPlugin implements CookieMoverPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
