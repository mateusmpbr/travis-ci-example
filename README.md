# travis-ci-example

A minimal example project that demonstrates how to build and deploy a React application (created with `create-react-app`) to GitHub Pages using Travis CI. This repository contains a simple React app and the typical configuration and scripts used to automate builds and deployments with Travis.

## Contents

- **App source**: `src/` — the React application source code.
- **Build & deploy script**: `deploy.sh` — optional helper script for deployment.
- **CI integration**: Travis CI configuration (see `.travis.yml` if present) and instructions to set secure environment variables.

## Features

- Example `create-react-app` project structure
- Automatic build and deployment flow for GitHub Pages via Travis CI
- Minimal configuration suitable for adaptation to your own project

## Prerequisites

- Node.js (12 or newer recommended)
- npm or Yarn
- A GitHub repository with GitHub Pages enabled (usually via the `gh-pages` branch or the `docs/` folder)
- A Travis CI account connected to the repository

## Local development

1. Install dependencies:

```bash
npm install
# or
yarn install
```

2. Start the development server:

```bash
npm start
# or
yarn start
```

The app will open at `http://localhost:3000` by default.

## Build

To create a production build locally:

```bash
npm run build
# or
yarn build
```

The optimized build output will be placed in the `build/` directory.

## Deploying to GitHub Pages via Travis CI

This project demonstrates an automated deployment workflow using Travis CI. The typical steps to enable this are:

1. Ensure `package.json` has a `homepage` field set to the URL where the site will be hosted, for example:

```json
"homepage": "https://<your-username>.github.io/<your-repo-name>"
```

2. Add a deployment script that publishes the `build/` directory to GitHub Pages. Many projects use the `gh-pages` package or a custom script (this repo includes `deploy.sh` as an example).

3. Add a `.travis.yml` file (if not already present) that installs dependencies, builds the app, and runs the deploy script on successful builds of the chosen branch (e.g., `master` or `main`).

4. Securely add a GitHub token to the Travis repository settings as an environment variable (commonly named `GH_TOKEN`). This token must have `repo` permission to push to the repository.

Example Travis steps (conceptual):

```yaml
language: node_js
node_js:
	- 14
script:
	- npm run build
deploy:
	provider: script
	script: bash deploy.sh
	on:
		branch: master
```

Note: Configure Travis to hide secure variables in build logs and add `GH_TOKEN` in the repository settings on travis-ci.com.

## Troubleshooting

- If the site does not appear after deployment, check the Travis build log for errors during `npm run build` or the deploy step.
- Verify the `homepage` URL in `package.json` is correct.
- Ensure the GitHub token has appropriate permissions and that the environment variable name in Travis matches the one used by the deploy script.

## Customization

- Replace the sample app in `src/` with your own React application.
- Adjust the Travis configuration to run tests, linting, or other build steps before deployment.

## License

This project is provided under the terms of the MIT License. See the `LICENSE` file for details.
