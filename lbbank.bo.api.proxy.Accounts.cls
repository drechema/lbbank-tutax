Class lbbank.bo.api.proxy.Accounts Extends lbbank.bo.api.proxy.Interface
{

Property response As lbbank.msg.TransactionGetResponse;

Method getResponse(pProxyResponse As %ZEN.proxyObject) As %Status
{
	set tSC = $$$OK
	 try {
		set ..response = ##class(lbbank.msg.TransactionGetResponse).%New()
		set ..response.data = ##class(%ListOfObjects).%New()
		// Recorrer la lista
		for i=1:1:pProxyResponse.transactions.data.Size {
			set item = ##class(lbbank.msg.struct.Transaction).%New()
			set item.id = pProxyResponse.transactions.data.GetAt(i).transactionId
			set item.entryReference = pProxyResponse.transactions.data.GetAt(i).entryReference
			set item.bookingDate = pProxyResponse.transactions.data.GetAt(i).bookingDate
			set item.amount = ##class(lbbank.msg.struct.Amount).%New()
			set item.amount.currency = pProxyResponse.transactions.data.GetAt(i).amount.currency
			set item.amount.amount = pProxyResponse.transactions.data.GetAt(i).amount.amount
			do ..response.data.Insert(item)
		}
	} catch err {
		set tSC=$$$ERROR("Error at "_err.Location_" *"_err.Data)
	}
	quit tSC
}

}
