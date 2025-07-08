# notes_with_supabase

This repo for the making a crud app with auth with supabase tutorial.

## Getting Started

Create a .env folder and copy dev.json file from .env.example/dev.json. Then update the values from your supabase project dashboard to run the app.

## Get the starter code

If you want the starter code clone this repo and switch to 'app_ui_starter_code' branch and then remove the .git folder.

## replace .vscode/launch.json with this content if you have issues running the app
````
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Notes App",
            "type": "dart",
            "request": "launch",
            "program": "lib/main.dart",
            "args": [
                "--dart-define-from-file",
                ".env/dev.json"
            ]
        },
    ]
}
````