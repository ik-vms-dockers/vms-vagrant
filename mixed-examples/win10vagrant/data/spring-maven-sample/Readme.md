
Install and run docker compose. Just an example how to run local dynamodb in docker

### Prerequisits
1. Docker installed
1. docker-compose installed


To build the code, enter the following command in a terminal window:

```bash
 ./mvnw install -Pintegration-test
```
This will run integration tests againsta dockerized dynamodb.

## EXtras

Start dynamodb container
```bash
 docker-compose up
```

Stop dynamodb container
```bash
 docker-compose down
```

## Create test dynamo db table.

```bash
 aws dynamodb create-table --table-name testTable \
 --attribute-definitions AttributeName=id,AttributeType=S \
  --key-schema AttributeName=id,KeyType=HASH \ 
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \ 
  --endpoint-url http://0.0.0.0:8000
```

## List tables

```bash
  aws dynamodb list-tables --endpoint-url http://localhost:8000 --output json
```

# Fabric8

