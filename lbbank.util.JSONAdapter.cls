Class lbbank.util.JSONAdapter Extends %RegisteredObject
{

Method outout2JSON(ByRef pStream As %GlobalCharacterStream)
{
	// parametro opcional formato = "aelotw"
	do ##class(Ens.Util.JSON).ObjectToJSONStream(##this,.pStream)
}

}
