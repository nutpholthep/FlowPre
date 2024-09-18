*** Settings ***
Library             SeleniumLibrary

Suite Teardown      Close All Browsers


*** Variables ***
${URL}                  https://chon.ecm.in.th/
@{USERNAME_LIST}
...    PRAPASAI_C
...    kansita_b
...    nattanan_n
...    yotaga_s
...    montha_b
...    SITTISAK_N
...    phansak_k
...    nalinee_c
...    vitaya_k
...    nalinee_c
...    nattanan_n
...    PINYADA_T
@{USERNAME_LIST2}
...    parichat_s
...    PRAPASAI_C
...    kansita_b
...    nattanan_n
...    yotaga_s
...    montha_b
...    SITTISAK_N
...    phansak_k
...    nalinee_c
...    vitaya_k
...    nalinee_c
...    nattanan_n
...    PINYADA_T
${PASSWORD}             3710f92c9aTOSH
${BROWSER}              Chrome
${TITLE_NAME}           TestBot0909-01
@{ASSIGN_NEXT_LIST}
...    กาญจน์สิตา บุญถนอม
...    นัทธนันท์ หน่อคำ
...    โยธกา สังข์ทอง
...    มณฑา บุญวิสุทธานนท์
...    สิทธิศักดิ์ นิติวุฒิวรรักษ์
...    พันธ์ศักดิ์ เกตุวัตถา
...    นลินี จันทร์เกลี้ยง
...    วิทยา คุณปลื้ม
...    นลินี จันทร์เกลี้ยง
...    นัทธนันท์ หน่อคำ
...    ภิญญดา ต้นจันทร์
@{ASSIGN_NEXT_LIST2}
...    ประภาศรี ชาญสมร
...    กาญจน์สิตา บุญถนอม
...    นัทธนันท์ หน่อคำ
...    โยธกา สังข์ทอง
...    มณฑา บุญวิสุทธานนท์
...    สิทธิศักดิ์ นิติวุฒิวรรักษ์
...    พันธ์ศักดิ์ เกตุวัตถา
...    นลินี จันทร์เกลี้ยง
...    วิทยา คุณปลื้ม
...    นลินี จันทร์เกลี้ยง
...    นัทธนันท์ หน่อคำ
...    ภิญญดา ต้นจันทร์


*** Test Cases ***
Process Each User Twice and Assign
    [Documentation]    ${USERNAME_LIST}[3] ออกเลข
    User Login    ${USERNAME_LIST}[3]
    Go To Document    ${TITLE_NAME}
    RunNoPresent    ${ASSIGN_NEXT_LIST}[3]
    Unselect Frame
    Recall    ${TITLE_NAME}


*** Keywords ***
User Login
    [Arguments]    ${username}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    name:username    ${username}
    Input Text    name:password    ${PASSWORD}
    Click Element    id:login-button
    Wait Until Element Is Visible    xpath=//*[@id="0"]    60s
    Click Element    id:0

Go To Document
    [Arguments]    ${TittleName}
    # รอให้องค์ประกอบของ "แฟ้มนำเสนอ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    10 seconds

    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]

    Wait Until Element Is Visible    id:20
    Click Element    id:20
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Sleep    2s
    # รอให้ <p> พร้อมใช้งานก่อนคลิก
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element
    ...    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Sleep    5s
    Click Element    id:ngb-nav-6

# ออกเลขคำสั่ง

RunNo
    [Arguments]    ${ASSIGN_NEXT_LIST}
    # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds

    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Click Element
    ...    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]

    # รอให้ <label> ปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//label[@for='bookDocData_TypeRunReserve_1']    10 seconds

    # คลิกที่ <label> เพื่อเลือก radio button ที่เชื่อมโยง
    Click Element    xpath=//label[@for='bookDocData_TypeRunReserve_1']

    # รอให้ radio button ที่เกี่ยวข้องกับข้อความ "47/2567" ปรากฏ
    Wait Until Element Is Visible    xpath=//tr[td[text()='47/2567']]//input[@type='radio']    10 seconds
    Scroll Element Into View    xpath=//tr[td[text()='47/2567']]//input[@type='radio']

    # คลิกที่ radio button ที่เกี่ยวข้องกับข้อความ "47/2567"
    Click Element    xpath=//tr[td[text()='47/2567']]//input[@type='radio']

    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]

    Scroll Element Into View
    ...    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Sleep    5s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST}
    Click Element    class:fa-search
    Click Element    class:mb-0
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Sleep    5s
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-primary mr-2')]
    Click Element    xpath=//button[contains(@class,'btn btn-primary mr-2')]

    # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible
    ...    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    ...    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element
    ...    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]

    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s

RunNoPresent
    [Arguments]    ${ASSIGN_NEXT_LIST}
    # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds

    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Click Element
    ...    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]
    Sleep    2s

    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Scroll Element Into View
    ...    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]

    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST}
    Sleep    3s
    Click Element    class:fa-search
    Sleep    3s
    Click Element    class:mb-0
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Sleep    5s
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-primary mr-2')]
    Click Element    xpath=//button[contains(@class,'btn btn-primary mr-2')]
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
    Sleep    5s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s

Recall
    [Arguments]    ${TittleName}
    # รอให้องค์ประกอบของ "แฟ้มนำเสนอ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    10 seconds

    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]

    Wait Until Element Is Visible    id:22    30s
    Click Element    id:22
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Sleep    2s
    # รอให้ <p> พร้อมใช้งานก่อนคลิก
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element
    ...    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    Sleep    5s
    Wait Until Element Is Visible    id:ngb-nav-3    10s
    Click Element    id:ngb-nav-3
    Sleep    5s
    Click Element    xpath=//button[contains(@class, 'btn btn-primary') and contains(text(), 'ดึงกลับ')]
    Wait Until Element Is Visible
    ...    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    ...    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Sleep    3s
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]

    Sleep    3s
    Click Element    xpath=//button[contains(@class, 'btn btn-success mr-3') and contains(text(), 'ตกลง')]
    Sleep    3s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
