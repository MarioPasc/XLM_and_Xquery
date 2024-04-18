xquery version "3.1";

(: Obtener todos los nombres posibles estados de los ensayos clínicos (overall_status) en orden alfabético descendente. :)

<result> {
    let $collection := collection("/search_result/")
    for $doc in $collection
    let $entry := $doc/clinical_study/overall_status
    order by $entry 
    group by $entry
    return <overall_status>{data($entry)}</overall_status>
} </result>