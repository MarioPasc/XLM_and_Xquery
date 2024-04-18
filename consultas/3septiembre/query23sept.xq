xquery version "3.1";


(: Obtener el título de los ensayos y fecha de comienzo de los ensayos que 
 : NO comiencen en el año 2000 (start_date) 
 el título contenga "Biomarker".  
 
 Incluir etiquetas XML para que el resultado sea el siguiente:
<resultado>
<titulo>DNA Array Analysis of Patients With Cervical Cancer</titulo>
<inicio>June 2000</inicio>
</resultado> 
:)

<resultados> {
    let $collection := collection("/search_result/")
    for $doc in $collection
    let $entry := $doc/clinical_study
    where not(contains($entry/start_date, "2000")) and contains($entry/official_title, "Biomarker")
    return <resultado> 
        <titulo>{data($entry/official_title)}</titulo>
        <inicio>{data($entry/start_date)}</inicio>
    </resultado>
} </resultados>