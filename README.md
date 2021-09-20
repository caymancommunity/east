<p align="center">
  <img src="https://user-images.githubusercontent.com/33224319/134019196-82832b47-c91f-4430-85c3-092d4e2fb98c.png" width="120" style="border-radius: 60px;" />
</p>
<p align="center" style="font-size: 20pt; font-weight: 500pt;">East ORM | Database</p>


> API com funções prontas estilo ORM para facilitar o uso do CRUD com o utilizando as functions do dbConnect do MTA:SA.

## Instância da API

```lua
-- exportação da funções.
local database = nameresources()

-- funções disponíveis
database:Connect(oarams);
database:DBSelect(params);
database:DBInsert(params);
database:DBUpdate(params);
database:DBDelete(params);
database:DBRaw(params);

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

DBInsert(
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