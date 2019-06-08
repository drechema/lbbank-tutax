Class lbbank.msg.struct.Account Extends (%SerialObject, %XML.Adaptor, lbbank.util.JSONAdapter)
{

Property iban As %String(MAXLEN = "");

Property currency As %String(MAXLEN = "");

Property resourceId As %String(MAXLEN = "");

Property product As %String(MAXLEN = "");

Storage Default
{
<Data name="AccountState">
<Value name="1">
<Value>iban</Value>
</Value>
<Value name="2">
<Value>currency</Value>
</Value>
<Value name="3">
<Value>resourceId</Value>
</Value>
<Value name="4">
<Value>product</Value>
</Value>
</Data>
<State>AccountState</State>
<StreamLocation>^lbbank.msg.struct.AccountS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
