Class lbbank.bo.api.proxy.Interface Extends %RegisteredObject [ Abstract ]
{

Method getRequest() As %RegisteredObject [ Abstract ]
{
	Quit $$$EnsError($$$NotImplemented)
}

Method getResponse(pProxyResponse As %ZEN.proxyObject) As %Status [ Abstract ]
{
	Quit $$$EnsError($$$NotImplemented)
}

}
