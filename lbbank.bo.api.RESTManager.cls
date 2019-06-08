Class lbbank.bo.api.RESTManager Extends EnsLib.REST.Operation
{

Parameter INVOCATION = "Queue";

Method sendHttpRequest(MyToken As %String, pURL As %String, pRequest As %RegisteredObject, ByRef pProxyResponse As %ZEN.proxyObject, type As %String) As %Status
{
 	#dim tHttpResponse as %Net.HttpResponse
	if (type="GET"){
		set req = ##class(%Net.HttpRequest).%New()
		do req.SetHeader("Authorization","Bearer "_MyToken)
		set tSC=..Adapter.SendFormDataURL(pURL,.tHttpResponse,"GET",req,"","")
	}elseif (type="POST"){
 		set tBody = ##class(%GlobalCharacterStream).%New()
 		if $IsObject(pRequest){
 			do ##class(Ens.Util.JSON).ObjectToJSONStream(pRequest,.tBody,"aelotwu")
 		}			
		set tSC=..Adapter.PostURL(pURL,.tHttpResponse,,tBody)
	}elseif (type="PUT"){
 		set tBody = ##class(%GlobalCharacterStream).%New()
 		do ##class(Ens.Util.JSON).ObjectToJSONStream(pRequest,.tBody,"aelotwu")			
		set tSC=..Adapter.PutURL(pURL,.tHttpResponse,,tBody)
	}else{
		quit $$$ERROR("HTTP method not valid: "_type)
	}
			
    if $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
    	set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
    }
    if $$$ISERR(tSC) quit tSC
    
    
    if tHttpResponse.StatusCode=200{
    	set tSC = ..JSONStreamToObject(tHttpResponse.Data, .pProxyResponse)
    }elseif tHttpResponse.StatusCode=204{
	    set tSC = $$$OK
	    set pProxyResponse = ##class(Ens.StringContainer).%New()
    }
    quit tSC
}

Method runMethod(MyToken As %String, pProxyManager As lbbank.bo.api.proxy.Interface, pRequest As %RegisteredObject, pURL As %String, type As %String) As %Status
{
	// Enviar la solicitud
	set tURL=..Adapter.URL_pURL
	$$$TRACE(tURL)
	set tSC=..sendHttpRequest(MyToken, tURL,pRequest,.tProxyResponse,type)
	if $$$ISERR(tSC) quit tSC

	// Parsear la respuesta
	set tSC=pProxyManager.getResponse(tProxyResponse)
	quit tSC
}

}
