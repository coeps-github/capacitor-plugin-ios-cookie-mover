export interface CookieMoverPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
