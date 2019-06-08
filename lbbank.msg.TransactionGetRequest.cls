Class lbbank.msg.TransactionGetRequest Extends Ens.Request
{

Property dateFrom As %String(MAXLEN = "");

Property dateTo As %String(MAXLEN = "");

Property accountId As %String(MAXLEN = "");

Storage Default
{
<Data name="TransactionGetRequestDefaultData">
<Subscript>"TransactionGetRequest"</Subscript>
<Value name="1">
<Value>dateFrom</Value>
</Value>
<Value name="2">
<Value>dateTo</Value>
</Value>
<Value name="3">
<Value>accountId</Value>
</Value>
</Data>
<DefaultData>TransactionGetRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
