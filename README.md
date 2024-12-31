# Monday Manifest Import Script

This script is used to import your manifest to your Monday app using the `mapps` CLI tool.

## Prerequisites

Ensure you have the following:
- A valid Monday developer token.
- Access to the `mapps` CLI installed and configured on your machine.

## Script Usage

### Arguments

1. **`TOKEN`** (Required)  
   Your Monday developer token.  
   Can be acquired here: https://<your-monday-subdomain>.monday.com/apps/manage/tokens

2. **`APP_ID`** (Mandatory if `VERSION_ID` is provided)  
   The app ID to update.  
   Can be found using the `mapps app:list` command or in the Developer Center.

3. **`VERSION_ID`** (Optional)  
   The version ID to update, will create new version if this param will be empty.  
   Can be found using the `mapps app-version:list` command or in the Developer Center.

4. **`NEW`** (Optional)  
   Set to `true` if you want to create a new app.

5. **`MANIFEST_PATH`** (Required)  
   The path to the manifest file (./manifest.json).

### Command Example

```bash
./mapps_deploy_script.sh <TOKEN> <APP_ID> <VERSION_ID> <NEW> <MANIFEST_PATH>
```

#### Example:

```bash
./mapps_deploy_script.sh abc123-token 10110073 20210004 true ./manifest.json
```

### Example Usage in a Workflow

```yaml
name: Import app from manifest

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Import app from manifest
        run: |
          ./mapps_deploy_script.sh ${{ secrets.MONDAY_TOKEN }} 10110073 20210004 false ./manifest.json
``` 

### Script Functionality

1. Initializes the `mapps` CLI with the provided token.
2. Checks and prepares arguments for:
   - App ID (`-a`)
   - Version ID (`-i`)
   - New app creation (`-n`)
   - Manifest path (`-p`)
3. Runs the `mapps manifest:import` command with the provided arguments.
