Class lbbank.msg.struct.Transaction Extends (%SerialObject, %XML.Adaptor, lbbank.util.JSONAdapter)
{

Property id As %String(MAXLEN = "");

Property entryReference As %String(MAXLEN = "");

Property bookingDate As %String(MAXLEN = "");

Property amount As lbbank.msg.struct.Amount;

Storage Default
{
<Data name="TransactionState">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>entryReference</Value>
</Value>
<Value name="3">
<Value>bookingDate</Value>
</Value>
<Value name="4">
<Value>amount</Value>
</Value>
</Data>
<State>TransactionState</State>
<StreamLocation>^lbbank.msg.struct.TransactionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
