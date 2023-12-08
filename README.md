# rescript-relay-starter

A starter for RescriptRelay. Features:

- [`rescript-relay-router`](https://github.com/zth/rescript-relay-router) for routing built to work best with Relay
- Vite for a fast workflow
- TailwindCSS
- Client side rendering (SSR coming soon)

## Get started

This uses [`graphql-client-example-server`](https://github.com/zth/graphql-client-example-server) by default. So, install and start that first if you want to have a look at the demo code included in the repo:

```bash
npm install -g graphql-client-example-server

# Then run it
graphql-client-example-server
```

```bash
npm i

# Run this to start developing
npm run dev

# Run this to build for production
npm run build
```

## Dev environment

If you're a VSCode user, make sure you install [`vscode-rescript-relay`](https://marketplace.visualstudio.com/items?itemName=GabrielNordeborn.vscode-rescript-relay), the official RescriptRelay extension. It provides a large number of tooling and conveniences both for working with RescriptRelay as well as with the RescriptRelayRouter itself.

## Future

More advanced starters and samples will be coming later, including with SSR (both regular and streaming) set up.

## Caveats

- `@defer` is not enabled yet. Will happen soon.
