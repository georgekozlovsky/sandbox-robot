*** Settings ***
Documentation     Dieses Robot Framework Test-Skript öffnet die Quick Start Guide-Seite auf GitHub, prüft die Überschrift, erstellt einen Screenshot, zeichnet Netzwerkaktivitäten auf und extrahiert alle eindeutigen Server-Domains aus dem Netzwerk-Log. Die Domains werden in einer Datei gespeichert.
Library           Browser
Library           OperatingSystem
Library           Collections
Library           String
Library           ./CustomLibrary.py

*** Variables ***
${URL}            https://github.com/robotframework/QuickStartGuide/blob/master/QuickStart.rst
${EXPECTED_TEXT}  Robot Framework Quick Start Guide
${SCREENSHOT}     ${OUTPUTDIR}/quick_start_guide_screenshot.png
${NETWORK_LOG}    ${OUTPUTDIR}/network_log.har
${URL_LIST}       ${OUTPUTDIR}/urls.txt

*** Test Cases ***
Verify Quick Start Guide Header And Log Network Activity
    New Browser    headless=false
    ${har}=    Create Dictionary    path=${NETWORK_LOG}    omitContent=True
    ${context}=    New Context    recordHar=${har}
    New Page       ${URL}
    Wait For Elements State    h1.heading-element    visible    10s
    ${header}=    Get Text    h1.heading-element
    Should Be Equal    ${header}    ${EXPECTED_TEXT}
    Take Screenshot    ${SCREENSHOT}
    Close Context      ${context}
    Close Browser
    
    # Use the new keyword
    ${domains}=    Get Server Domains From HAR    ${NETWORK_LOG}
    ${unique_domains}=    Evaluate    sorted(list(set($domains)))

    FOR    ${domain}    IN    @{unique_domains}
        Append To File    ${URL_LIST}    ${domain}${\n}
    END


