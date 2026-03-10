#Include "TOTVS.CH"
#Include "TopConn.ch"

/*
Exemplo didatico de API REST em ADVPL para consumo por frontend PO-UI.
Adapte rotas, autenticacao e serializacao ao framework REST usado no projeto.
*/

WsRestFul ClientesRest Description "API REST de clientes"

    WsMethod GetList Description "Lista clientes" Path "/api/clientes"
    WsMethod GetById Description "Detalha cliente" Path "/api/clientes/{id}"
    WsMethod Post Description "Cria cliente" Path "/api/clientes"
    WsMethod Put Description "Atualiza cliente" Path "/api/clientes/{id}"

End WsRestFul

WsMethod GetList WsRestFul ClientesRest
    Local cJson    := ""
    Local cAlias   := GetNextAlias()
    Local nPage    := Val(If(Empty(::GetQueryRequest()["page"]), "1", ::GetQueryRequest()["page"]))
    Local nPageSize:= Val(If(Empty(::GetQueryRequest()["pageSize"]), "20", ::GetQueryRequest()["pageSize"]))
    Local cSearch  := AllTrim(If(Empty(::GetQueryRequest()["search"]), "", ::GetQueryRequest()["search"]))
    Local aItems   := {}
    Local aArea    := GetArea()

    Begin Sequence
        BeginSQL Alias cAlias
            SELECT SA1.A1_COD, SA1.A1_LOJA, SA1.A1_NOME, SA1.A1_CGC
            FROM %table:SA1% SA1
            WHERE SA1.%notDel%
              AND SA1.A1_FILIAL = %xfilial:SA1%
              AND (%exp:Empty(cSearch)% OR SA1.A1_NOME LIKE %exp:'%' + cSearch + '%'%)
            ORDER BY SA1.A1_COD, SA1.A1_LOJA
        EndSQL

        DbSelectArea(cAlias)
        While !(cAlias)->(Eof())
            aAdd(aItems, { ;
                "id"        => (cAlias)->A1_COD + "|" + (cAlias)->A1_LOJA, ;
                "codigo"    => (cAlias)->A1_COD, ;
                "loja"      => (cAlias)->A1_LOJA, ;
                "nome"      => AllTrim((cAlias)->A1_NOME), ;
                "documento" => AllTrim((cAlias)->A1_CGC), ;
                "ativo"     => .T. ;
            })
            (cAlias)->(DbSkip())
        EndDo
        (cAlias)->(DbCloseArea())

        cJson := JsonClientesList(aItems, nPage, nPageSize)
        ::SetResponse(cJson)

    Recover Using oError
        ::SetStatus(500)
        ::SetResponse(JsonError("CLIENTES_LISTA_ERRO", oError:Description))
    End Sequence

    RestArea(aArea)
Return .T.

WsMethod GetById WsRestFul ClientesRest
    Local cId      := ::GetPathParam("id")
    Local aIdParts := StrTokArr(cId, "|")
    Local cCodigo  := Iif(Len(aIdParts) >= 1, aIdParts[1], "")
    Local cLoja    := Iif(Len(aIdParts) >= 2, aIdParts[2], "01")
    Local cJson    := ""
    Local aArea    := GetArea()

    Begin Sequence
        DbSelectArea("SA1")
        DbSetOrder(1)

        If SA1->(DbSeek(xFilial("SA1") + cCodigo + cLoja))
            cJson := JsonClienteDetail(cCodigo, cLoja, SA1->A1_NOME, SA1->A1_CGC)
            ::SetResponse(cJson)
        Else
            ::SetStatus(404)
            ::SetResponse(JsonError("CLIENTE_NAO_ENCONTRADO", "Cliente nao encontrado"))
        EndIf

    Recover Using oError
        ::SetStatus(500)
        ::SetResponse(JsonError("CLIENTE_DETALHE_ERRO", oError:Description))
    End Sequence

    RestArea(aArea)
Return .T.

WsMethod Post WsRestFul ClientesRest
    Local cBody := ::GetContent()

    // Substitua por desserializacao real e gravacao em SA1 conforme as regras do projeto.
    ::SetStatus(201)
    ::SetResponse(cBody)
Return .T.

WsMethod Put WsRestFul ClientesRest
    Local cBody := ::GetContent()

    // Substitua por update real em SA1 conforme as regras do projeto.
    ::SetResponse(cBody)
Return .T.

Static Function JsonClientesList(aItems, nPage, nPageSize)
    Local cJson := '{'
    cJson += '"items":' + FWJsonSerialize(aItems) + ','
    cJson += '"hasNext":false,'
    cJson += '"page":' + cValToChar(nPage) + ','
    cJson += '"pageSize":' + cValToChar(nPageSize) + ','
    cJson += '"total":' + cValToChar(Len(aItems))
    cJson += '}'
Return cJson

Static Function JsonClienteDetail(cCodigo, cLoja, cNome, cDocumento)
    Local cJson := '{'
    cJson += '"id":"' + cCodigo + "|" + cLoja + '",'
    cJson += '"codigo":"' + cCodigo + '",'
    cJson += '"loja":"' + cLoja + '",'
    cJson += '"nome":"' + AllTrim(cNome) + '",'
    cJson += '"documento":"' + AllTrim(cDocumento) + '",'
    cJson += '"ativo":true'
    cJson += '}'
Return cJson

Static Function JsonError(cCode, cMessage)
    Local cJson := '{'
    cJson += '"error":true,'
    cJson += '"code":"' + cCode + '",'
    cJson += '"message":"' + cMessage + '"'
    cJson += '}'
Return cJson
