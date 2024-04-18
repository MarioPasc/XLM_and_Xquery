xquery version "3.1";

declare namespace ext="http://www.altova.com/xslt-extensions";

<proteinas> {
	let $doc := doc("C:\Users\Mario\Downloads\proteinas.xml")/uniprot
	for $entry in $doc/entry
	where $entry/organism/name[@type="common"] = "FV-3"
	return <proteina>
		<nombre>{data($entry/protein/recommendedName/fullName)}</nombre>
		{
			for $hostName in $entry/organismHost 
			return <hostName>{data($hostName/name[@type="scientific"])}</hostName>
		}
	</proteina>
} </proteinas>