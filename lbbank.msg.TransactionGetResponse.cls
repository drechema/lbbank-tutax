Class lbbank.msg.TransactionGetResponse Extends Ens.Response
{

Property data As list Of lbbank.msg.struct.Transaction;

Storage Default
{
<Data name="TransactionGetResponseDefaultData">
<Subscript>"TransactionGetResponse"</Subscript>
<Value name="1">
<Value>data</Value>
</Value>
</Data>
<DefaultData>TransactionGetResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
