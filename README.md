![logo-horizontal](https://user-images.githubusercontent.com/33224319/132082662-1ee95904-40bd-4a98-91a0-3765ae646a8f.png)

## Database API - Cayman Comunity
> API com funções prontas estilo ORM para facilitar o uso do CRUD com o utilizando as functions do dbConnect do MTA:SA.

## Instancia da API
> nomedaresource:function(params)

```lua

#Conexão

-- Configuração no próprio script

Database:Connect(database = "string", localhost = "string", username = "string", password = "string")

-- Selecionar

exports.nameresources:DBSelect()

DBSelect(
  tableName = "string",
  {
    verify = {
      field = "values"
      },
    condition = {
      "string"
    }
  }
)


-- verify são os campos necessários para fazer a verificação dos dados na tabela.

-- condition são os verificadores lógicos AND ou OR.

#Inserir

exports.nameresources:DBInserir()

DBInserir(
  tableName = "string",
  {
    field = "values",
    field = "values"
  }
)

-- field os tipos são number e string. 

#Atualizar

exports.nameresources:DBUpdate()

DBUpdate(
  tableName = "string",
  {
    params = {
      field = "values"
    },
    verify = {
      field = "values"
    },
    condition = {"string"}
  }
)

-- params, são campos que serão atualizados com os novos valores.

-- verify são os campos necessários para fazer a verificação dos dados na tabela.

-- condition são os verificadores lógicos AND ou OR.

#Deletar

exports.nameresources:DBDelete()

DBDelete(
  tableName = "string",
  {
    verify = {
      field = "values"
      },
    condition = {
      "string"
    }
  }
)

-- verify são os campos necessários para fazer a verificação dos dados na tabela.

-- condition são os verificadores lógicos AND ou OR.

#Raw

exports.nameresources:DBRaw()

DBRaw(query = "string")

-- query, elaboração de query personalizadas.

````