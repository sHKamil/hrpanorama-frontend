# Installation

1. Download repository
2. Change backend address in ```hrpanorama-task/quasar.config.js``` 
      ```
      env: {
        API: 'http://127.0.0.1:8080'
      },
      ```
      API: na address backendu.
#### With docker:

3. ```docker compose up``` address will popup in terminal, this second one (not the localhost)

#### If something went wrong

3. ```cd hrpanorama-task/```
4. ```npm install```
5. ```quasar dev``` /```npm run dev```
