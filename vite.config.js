import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { visualizer } from "rollup-plugin-visualizer";
import { rescriptRelayVitePlugin } from "rescript-relay-router";

export default defineConfig({
  plugins: [
    react(),
    rescriptRelayVitePlugin({
      autoScaffoldRenderers: true,
    }),
  ],
  server: {
    port: 9000,
  },
  build: {
    sourcemap: true,
    polyfillDynamicImport: false,
    target: "esnext",
    rollupOptions: {
      plugins: [visualizer()],
      output: {
        format: "esm",
        manualChunks: {
          react: ["react", "react-dom"],
          relay: ["react-relay", "relay-runtime"],
        },
      },
    },
  },
  // Prevent ReScript messages from being lost when we run all things at the same time.
  clearScreen: false,
});
