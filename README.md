# liquid_bush

This repo contains the set of Ruby-based tests for:
- ToDo app http://todomvc.com/examples/react/#/
- REST API hosted on https://jsonplaceholder.typicode.com/

### How to run
1. Build an image:
    ```
    docker build -t liquid_bush .
    ```
2. Run the tests:
    ```
    docker run -e API_APP_HOST='https://jsonplaceholder.typicode.com' -e UI_APP_HOST='https://todomvc.com/examples/react/#' liquid_bush
    ```
   If you need to run specific tag:
    ```
    docker run -e API_APP_HOST='https://jsonplaceholder.typicode.com' -e UI_APP_HOST='https://todomvc.com/examples/react/#' liquid_bush --tags @J1
    ```

### What's done:
- UI test suite including critical and major functionality checks
- API test suite including basic Post items checks

### What's not done:
- several less important cases left as stubs (not implemented)
- all UI tests need to be run on all supported browsers with all display resolutions (currently only Chrome is supported)
- CI integration
- test run parallelization
- storing tests artifacts (like reports if we run with specific formatter)
