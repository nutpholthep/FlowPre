*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://chon.ecm.in.th/
@{ASSIGN_NEXT_LIST}
...    อัจฉรา บัณฑิตยานุกรักษ์
...    นลินี จันทร์เกลี้ยง
...    วิทยา คุณปลื้ม
...    นลินี จันทร์เกลี้ยง
...    มลฤดี โส๊ะอ้น
...    กัญญาณัฐ ศรีบุรินทร์

@{USERNAME_LIST}
...    piyada_k
...    atchara_b
...    nalinee_c
...    vitaya_k
...    nalinee_c
...    monruedi_s
...    KANYANAT_S


${lastUser}    KANYANAT_S

${PASSWORD}    3710f92c9aTOSH
${BROWSER}    Chrome
${TITLE_NAME}    ทดสอบเสนอดึงกลับ(กองคลัง)2009-01

${NoReserve}    83/2567
${Operator}    monruedi_s

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
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    60 seconds
    
    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]

    Wait Until Element Is Visible    id:20    30s    
    Click Element    id:20
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    60s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Sleep    2s
      # รอให้ <p> พร้อมใช้งานก่อนคลิก
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    60s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Sleep    2s
    Wait Until Element Is Visible    id:ngb-nav-6    60s    
    Click Element    id:ngb-nav-6

AssignNext 
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    Sleep    3s
    Select From List By Label    name:WorkFlowId    ส่งต่อ
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST} 

    Wait Until Element Is Visible    //div[contains(@class, 'modal-body-content')]    30s
    Click Element    class:fa-search
    
    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    
     
    # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Sleep    5s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s
    

Recall
    [Arguments]    ${TittleName}
       # รอให้องค์ประกอบของ "แฟ้มนำเสนอ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    10 seconds
    
    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    id:22   30s    
    Click Element    id:22
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Sleep    2s
      # รอให้ <p> พร้อมใช้งานก่อนคลิก
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    
    Wait Until Element Is Visible    id:ngb-nav-3    30s
    Click Element    id:ngb-nav-3
    Sleep    3s
    Click Element    xpath=//button[contains(@class, 'btn btn-primary') and contains(text(), 'ดึงกลับ')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    30s
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]

    Click Element    xpath=//button[contains(@class, 'btn btn-success mr-3') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s


RunNoPresent
    [Arguments]   ${ASSIGN_NEXT_LIST} 
      # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]
    Sleep    2s

    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST} 
    Sleep    3s
    Click Element    class:fa-search

    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]

    
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

#ออกเลขคำสั่ง
RunNo
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Click Element    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]
    
    # รอให้ <label> ปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//label[@for='bookDocData_TypeRunReserve_1']    10 seconds
    
    # เลื่อนองค์ประกอบให้เข้ามุมมองและคลิกที่ <label>
    Scroll Element Into View    xpath=//label[@for='bookDocData_TypeRunReserve_1']
    Click Element    xpath=//label[@for='bookDocData_TypeRunReserve_1']    # หากยังติดปัญหาคลิกไม่ได้ ลองใช้ JavaScript คลิกด้านล่าง
    # Execute JavaScript    document.querySelector("label[for='bookDocData_TypeRunReserve_1']").click()
    
    # รอให้ radio button ที่เกี่ยวข้องกับข้อความ "47/2567" ปรากฏ
    Wait Until Element Is Visible    id:RunReserve_18    30s
    Scroll Element Into View    id:RunReserve_18
    
    # คลิกที่ radio button ที่เกี่ยวข้องกับข้อความ "${NoReserve}"
    Click Element    id:RunReserve_18
    
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST} 
    Click Element    class:fa-search

    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    
    # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # เลื่อนให้ปุ่ม "ตกลง" อยู่ในมุมมองและใช้ JavaScript คลิกหากยังไม่สามารถคลิกได้โดยตรง
    Scroll Element Into View    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Execute JavaScript    document.evaluate("//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()
    
    
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    //td[@class='text-center']   20s


Logout
    Unselect Frame
    Wait Until Element Is Visible    //i[contains(@class,'fa fa-user-circle fa-2x style-scope ko-profile2')]    15s
    Click Element    xpath=//i[contains(@class,'fa fa-user-circle fa-2x style-scope ko-profile2')]

    Wait Until Element Is Visible    //input[contains(@class,'button is-dark round style-scope ko-profile2')]    15s
    Click Element    xpath=//input[contains(@class,'button is-dark round style-scope ko-profile2')]
    Close Browser



Send Document
    [Arguments]    ${username}
    User Login    ${username}
    # Add any additional steps required for sending the document here
    Logout

Last Process
    [Arguments]    ${username}
    Log    เจอผู้ใช้ PINYADA_T เรียกใช้งาน Close Book และจบการทำงาน
    User Login    ${username}
    Go To Document   ${TITLE_NAME}
    Close Book    ${TITLE_NAME}  
    RETURN  # หยุดการทำงานของเทสเคสทั้งหมด

Process User
    [Arguments]    ${username}    ${assign_next}    ${index}    ${count_nattanan}    ${last_index}
    FOR    ${i}    IN RANGE    2
        Log    รอบที่ ${i+1} สำหรับผู้ใช้: ${username}, Assign ให้: ${assign_next}
        User Login    ${username}
        Go To Document   ${TITLE_NAME}
        
        # ตรวจสอบว่าเป็นผู้ใช้ ${Operator} หรือไม่
        Run Keyword If    '${username}' == '${Operator}'    Process Nattanan    ${index}    ${count_nattanan}    ${last_index}    ${assign_next}
        Run Keyword If    '${username}' != '${Operator}'    AssignNext    ${assign_next}

        Unselect Frame
        Sleep    5s
        Recall    ${TITLE_NAME}
        Close Browser
    END

    # ล็อกอินด้วยชื่อผู้ใช้ปัจจุบันอีกครั้งหลังจากวนลูปสองครั้ง
    User Login    ${username}
    Go To Document   ${TITLE_NAME}

    # ตรวจสอบอีกครั้งหากเจอ ${Operator} และเป็นครั้งที่สอง
    Run Keyword If    '${username}' == '${Operator}' and ${count_nattanan} == 2    RunNo    ${assign_next}
    Run Keyword If    '${username}' != '${Operator}' or ${count_nattanan} != 2    AssignNext    ${assign_next}
    Sleep    5s
    Logout

Process Nattanan
    [Arguments]    ${index}    ${count_nattanan}    ${last_index}    ${assign_next}
    # ตรวจสอบว่ามีการเปลี่ยน index จากครั้งล่าสุดหรือไม่
    Run Keyword If    ${index} != ${last_index}    Set Count Nattanan    ${index}    ${count_nattanan}

    # อัพเดต last_index เป็น index ปัจจุบัน
    ${last_index} =    Set Variable    ${index}
    
    # ถ้าเป็นการเจอ nattanan_n ครั้งแรก
    Run Keyword If    ${count_nattanan} == 1    RunNoPresent    ${assign_next}
    
    # ถ้าเป็นการเจอ nattanan_n ครั้งที่สอง
    Run Keyword If    ${count_nattanan} == 2    RunNo    ${assign_next}

Set Count Nattanan
    [Arguments]    ${index}    ${count}
    ${new_count} =    Evaluate    ${count} + 1
    Set Suite Variable    ${count_nattanan}    ${new_count}

Close Book
    [Arguments]    ${TittleName}    
    Wait Until Element Is Visible    id:ngb-nav-6    30s
    Click Element    id:ngb-nav-6
    Wait Until Element Is Visible    //button[contains(text(),'ปิดหนังสือ')]    30s    
    Click Element    xpath=//button[contains(text(),'ปิดหนังสือ')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-primary mr-2 ng-star-inserted')]    30s    
    Click Element    xpath=//button[contains(@class,'btn btn-primary mr-2 ng-star-inserted')]
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]

    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    60 seconds
    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]
    Wait Until Element Is Visible    id:20    30s    
    Click Element    id:20
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Click Element    id:ngb-nav-2
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    Sleep    10s

*** Test Cases ***
# @{USERNAME_LIST}[0]
#     [Documentation]    @{USERNAME_LIST}[0] ส่งต่อ
    # FOR    ${i}    IN RANGE    2
      #  Log    รอบที่ ${i+1}
   # User Login    ${USERNAME_LIST}[0]
   # Go To Document   ${TITLE_NAME}
    # AssignNext    ${ASSIGN_NEXT_LIST}[0]
   # Unselect Frame
   # Recall    ${TITLE_NAME}
   # END
   # User Login    ${USERNAME_LIST}[0]
   # Go To Document   ${TITLE_NAME}
   # AssignNext    ${ASSIGN_NEXT_LIST}[0]

Process Each User Twice and Assign
    [Documentation]    ส่งต่อเอกสารตามรายการผู้ใช้และรายการ Assign โดยแต่ละผู้ใช้ทำงานสองครั้ง
    ${length} =    Get Length    ${USERNAME_LIST}  # หาจำนวนผู้ใช้ในลิสต์
    ${count_nattanan} =    Set Variable    0  # ตัวนับจำนวนครั้งที่เจอ nattanan_n
    ${last_index} =    Set Variable    -1  # ตัวแปรบันทึก index ครั้งล่าสุดของ nattanan_n
    
    FOR    ${index}    IN RANGE    0    ${length}
        ${username} =    Set Variable    ${USERNAME_LIST}[${index}]
        ${assign_next} =    Set Variable    ${ASSIGN_NEXT_LIST}[${index}]
        
        Log To Console     เริ่มการทำงานสำหรับผู้ใช้: ${username} (${index + 1}/${length})
        
        # แยกการทำงานออกเป็นเคสสำหรับผู้ใช้ทั่วไป
         Run Keyword If    ${index} == ${length - 1}    Last Process   ${username}
        ...    ELSE    Process User    ${username}    ${assign_next}    ${index}    ${count_nattanan}    ${last_index}
    END


ปิดหนังสือ
    [Documentation]    ${lastUser} ปิดหนังสือ
    Last Process    ${lastUser}