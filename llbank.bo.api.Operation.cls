Class lbbank.bo.api.Operation Extends lbbank.bo.api.RESTManager
{

Parameter SETTINGS = "MyToken";

Property MyToken As %String(MAXLEN = "");

/// GET /accounts/:account-Id/transactions?
Method OnTransactionsRequest(pRequest As lbbank.msg.TransactionGetRequest, Output pResponse As lbbank.msg.TransactionGetResponse) As %Status
{
        set proxyManager = ##class(lbbank.bo.api.proxy.Accounts).%New()
        set tSC = ..runMethod(..MyToken,proxyManager,$$$NULLOREF,"/accounts/"_pRequest.accountId_"/transactions","GET")
        set pResponse = proxyManager.response
        quit tSC
}

/// GET /accounts
Method OnAccountsRequest(pRequest As lbbank.msg.AccountGetRequest, Output pResponse As lbbank.msg.AccountGetResponse) As %Status
{
            set proxyManager = ##class(lbbank.bo.api.proxy.Accounts).%New()
            set tSC = ..runMethod(..MyToken,proxyManager,$$$NULLOREF,"/accounts","GET")
            set pResponse = proxyManager.response
            quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="lbbank.msg.TransactionGetRequest"> 
		<Method>OnTransactionsRequest</Method>
    </MapItem>
	<MapItem MessageType="lbbank.msg.AccountGetRequest"> 
		<Method>OnAccountsRequest</Method>
	</MapItem>    
</MapItems>
}

}
