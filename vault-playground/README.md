# vault-playground
Vault playground

## Paso 1 unseal vault
[tutorial](https://blog.ruanbekker.com/blog/2019/05/06/setup-hashicorp-vault-server-on-docker-and-cli-guide/)
Seguir hasta Authenticate against the vault

## Paso 2 Generar Token
[tutorial](https://learn.hashicorp.com/vault/operations/ops-generate-root)
Ejemplo
Root token: s.BHY0h7edpWx7jO7ntqkPthie

## Ejemplos con el API REST
Añadir
```
curl \
--header "X-Vault-Token: s.BHY0h7edpWx7jO7ntqkPthie" \
--request POST \
--data '{ "data": {"password": "my-long-password"} }' \
http://127.0.0.1:8200/v1/secret/fred | jq
```

Obtener
```
curl \
--header "X-Vault-Token: s.BHY0h7edpWx7jO7ntqkPthie" \
--request GET \
http://127.0.0.1:8200/v1/secret/fred | jq
```

