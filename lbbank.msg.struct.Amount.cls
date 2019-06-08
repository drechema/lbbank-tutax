Class lbbank.msg.struct.Amount Extends (%SerialObject, %XML.Adaptor, lbbank.util.JSONAdapter)
{

Property currency As %String(MAXLEN = "");

Property amount As %String(MAXLEN = "");

Storage Default
{
<Data name="AmountState">
<Value name="1">
<Value>currency</Value>
</Value>
<Value name="2">
<Value>amount</Value>
</Value>
</Data>
<State>AmountState</State>
<StreamLocation>^lbbank.msg.struct.AmountS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
