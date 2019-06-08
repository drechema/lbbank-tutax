Class lbbank.msg.AccountGetResponse Extends Ens.Response
{

Property data As list Of lbbank.msg.struct.Account;

Storage Default
{
<Data name="AccountGetResponseDefaultData">
<Subscript>"AccountGetResponse"</Subscript>
<Value name="1">
<Value>data</Value>
</Value>
</Data>
<DefaultData>AccountGetResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
