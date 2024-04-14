# Installation

1. Download repository
2. Change backend address in ```hrpanorama-task/quasar.config.js``` 
      ```
      env: {
        API: 'http://127.0.0.1:8080'
      },
      ```
      API: to backend address.
3. Also change proxy to proper address:
    ```
    devServer: {
      (...)
      proxy: 'http://localhost:8080/',
    },
    ```
#### With docker:

4. ```docker compose up``` address will popup in terminal, this second one (not the localhost)

#### If something went wrong

4. ```cd hrpanorama-task/```
5. ```npm install```
6. ```quasar dev``` /```npm run dev```


# DEFAULT DATA
## Login: user
## Password: strongpassword
