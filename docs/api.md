FORMAT: 1A
HOST: http://localhost:8080/auth

# Authentication API
`Typescript, Golang, Python`と`DynamoDB, DocumentDB, RDS`で作成する認証API

## トークン発行 [POST /login]
認証用のトークンを発行する

+ Request (application/json)
    + Attributes
        + email: `sample@gmail.com` (string, required)
        + password: `password` (string, required)

+ Response 200 (application/json)
    + Attributes
        + access_token: `{token}` (string)
        + token_type: `bearer` (string)
        + expire_in: `60` (number) - トークンの有効期限

+ Response 401 (application/json)
    + Body
        ```
        {
            "error": "Unauthorized"
        }
        ```

## ユーザ登録 [POST auth/register]
新規ユーザを登録する

+ Request (application/json)
    + Attributes
        + name: `sample` (string, required) - ユーザ名
        + email: `sample@gmail.com` (string, required) - メールアドレス
        + password: `password` (string, required) - パスワード(ハッシュ化されて登録)

+ Response 200 (application/json)
    + Attributes
        + result: `true` (boolean) - 登録結果
        + name: `sample` (string) - ユーザ名
        + email: `sample@gmail.com` (string) - メールアドレス


## 全ユーザ情報取得 [GET /users]
全アカウント情報を取得する

+ Request
    + Headers
        ```
        Authorization: Bearer {token}
        ```

+ Response 200 (application/json)
    + Body
        ```
        [{
            "id": 1,
            "name": "sample",
            "email": "sample@gmail.com",
            "email_verified_at": null,
            "created_at": "2019-05-23 12:19:26",
            "updated_at": "2019-05-23 12:19:26"
        }, {
            "id": 2,
            "name": "sample",
            "email": "sample@gmail.com",
            "email_verified_at": null,
            "created_at": "2019-05-23 12:19:26",
            "updated_at": "2019-05-23 12:19:26"
        }]
        ```

+ Response 401 (application/json)
    + Body
        ```
        {
            "error": "Unauthorized"
        }
        ```

## ユーザ情報取得 [GET /users/:email]
特定のアカウント情報を取得する

+ Request
    + Headers
        ```
        Authorization: Bearer {token}
        ```

+ Response 200 (application/json)
    + Body
        ```
        {
            "id": 1,
            "name": "sample",
            "email": "sample@gmail.com",
            "email_verified_at": null,
            "created_at": "2019-05-23 12:19:26",
            "updated_at": "2019-05-23 12:19:26"
        }
        ```
+ Response 401 (application/json)
    + Body
        ```
        {
            "error": "Unauthorized"
        }
        ```

## ユーザ情報更新 [PUT /users/:email]
特定のアカウント情報を更新する

+ Request (application/json)
    + Attributes
        + name: `sample` (string, required) - ユーザ名
        + email: `sample@gmail.com` (string, required) - メールアドレス

+ Response 200 (application/json)
    