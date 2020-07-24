# jake

## tools

Code format, lint and test can be executed via the tools container.  
Use the following commands to build and up the tools container.

```bash
docker-compose build tools
docker-compose up -d tools
```

fmt, lint, test via tools container.

```bash
# fmt
make tools/fmt

# lint
make tools/lint

# test
make tools/test
```
