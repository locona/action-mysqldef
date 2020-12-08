# GitHub Action: Run mysqldef

This action runs [mysqldef](https://github.com/k0kubun/sqldef) on pull requests to improve code review experience.

<!-- [![sample annotation](https://user-images.githubusercontent.com/3797062/64926127-b8b0bc00-d834-11e9-97d5-5b6aa06dc573.png)](https://github.com/reviewdog/action-misspell/pull/1/files) -->

## Inputs

### `github_token`

Required. `${{ github.token }}` is used by default.

### `github_repository`

Required. `${{ github.repository }}` is used by default.

### `mysql_host`

Optional. --host flag of mysqldef. (default: 127.0.0.1)

### `mysql_port`

Optional. --port flag of mysqldef. (default: 3306)

### `mysql_user`

Required. --user flag of mysqldef.

### `mysql_password`

Required. --password flag of mysqldef.

### `mysql_database`

Required. database name of mysqldef.

### `schema_path`

Required. schema path of mysqldef. (default: schema.sql)

## Example usage

### [.github/workflows/mysqldef](.github/workflows/mysqldef.yml)

```yml
name: mysqldef
on: [pull_request]
jobs:
  mysqldef:
    name: mysqldef
    runs-on: ubuntu-latest
    services:
      mysql:
        image: mysql:5.7
        env:
          MYSQL_DATABASE: githubaction
          MYSQL_USER: githubaction
          MYSQL_PASSWORD: githubaction
    steps:
    - uses: actions/checkout@v2
    - name: Run MySQL
      uses: locona/action-mysqldef@master
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        github_repository: ${{ github.repository }}
        mysql_user: githubaction
        mysql_password: githubaction
        mysql_database: githubaction
        schema_path: schema/schema.sql
```
