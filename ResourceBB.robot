*** Settings ***
Library    SeleniumLibrary
# robotcode: ignore

*** Keywords ***
LogIn
    Open Browser    ${URL}    chrome    
    Maximize Browser Window
    
    # Input credentials and log in
    Input Text    id:user    ${username}
    Input Text    id:pass    ${password}
    Click Element    id:login-btn
    
    # Wait until the element is visible to verify login success
    Wait Until Element Is Visible    xpath=//div[contains(@class,"style-scope ko-home")]    30s

Click Top Menu
    Wait Until Element Is Visible    //li[@class='style-scope ko-home']//a[@id='btn_shareme']    60s
    Click Element    xpath=//li[@class='style-scope ko-home']//a[@id='btn_shareme']

    Wait Until Element Is Visible    //li[@class='style-scope ko-home']//a[@id='btn_shareto']    60s
    Click Element    xpath=//li[@class='style-scope ko-home']//a[@id='btn_shareto']

    Wait Until Element Is Visible    //li[@class='style-scope ko-home']//a[@id='btn_sharerecent']    60s
    Click Element    xpath=//li[@class='style-scope ko-home']//a[@id='btn_sharerecent']

Click SideBar
    Wait Until Element Is Visible    id:collapse    30s
    Click Element    id:collapse
    Sleep    5s
    
Go to Upload
     Wait Until Element Is Visible    id:myupload    30s
    Click Element    id:myupload
     Wait Until Element Is Visible    id:Uploadtemp    30s
    Click Element    id:Uploadtemp
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://demo-doc.ecm.in.th')]    60s
    Select Frame    xpath=//iframe[contains(@src, 'https://demo-doc.ecm.in.th')]
    Wait Until Element Is Visible    //p[contains(text(), 'ลากและวางไฟล์ที่นี่')]    30s  # รอให้ข้อความปรากฏ
    
    Execute JavaScript    document.getElementById('fileinput').hidden = false;
    Wait Until Element Is Visible    id=fileinput   30s
    Choose File    locator=id=fileinput    file_path=C:/Users/User/Downloads/export.pdf
    Sleep    5s
    # Wait Until Element Is Not Visible    xpath=//div[contains(@class,"loading-panel opacity")]    30s
   Wait Until Element Is Visible    class:btn-upload-file    30s
   Click Element    class:btn-upload-file
   Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
   Wait Until Element Is Visible    //select[@class='select-type']    timeout=10
    # รอให้ค่าใน dropdown โหลดขึ้น
    Wait Until Element Is Enabled    //select[@class='select-type']    timeout=10
    # เลือกค่าจาก dropdown
    Select From List By Value    //select[@class='select-type']    G5-2 ปรับแผน ตปท
   Wait Until Element Is Visible    class:btn-new btn-save    30s 
   Click Element    class:btn-new btn-save

Go to Scan
    Wait Until Element Is Visible    id:myupload    30s
    Click Element    id:myupload
    Wait Until Element Is Visible    id:Uploadscan    30s
    Click Element    id:Uploadscan
    Sleep    10s
    Scroll Element Into View    xpath=//label[@for='uploadFileInput']    60s 
    Click Element    xpath=//label[@for='uploadFileInput']
    Sleep    15s
    Scroll Element Into View    xpath=//label[@for='formly_11_select_doctypeId_0']    10s 
    Select From List By Label  id=formly_11_select_doctypeId_0   01 ห้องผู้อำนวยการสำนักงบประมาณ

