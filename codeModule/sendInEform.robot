# robotcode: ignore
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
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]    60 seconds
    
    # คลิกที่ข้อความ "ส่งหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]

    Wait Until Element Is Visible    id:5    60s    
    Click Element    id:5
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

Go To Document Need To Recall
    [Arguments]    ${TittleName}
     # รอให้องค์ประกอบของ "แฟ้มนำเสนอ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]    60 seconds
    
    # คลิกที่ข้อความ "ส่งหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]

    Wait Until Element Is Visible    id:6    60s    
    Click Element    id:6
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
    Wait Until Element Is Visible    id:ngb-nav-3    60s    
    Click Element    id:ngb-nav-3

Go To Document Receipt 
    [Arguments]    ${TittleName}
     # รอให้องค์ประกอบของ "รับหนังสือ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'รับหนังสือ')]    60 seconds
    
    # คลิกที่ข้อความ "รับหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'รับหนังสือ')]

    Wait Until Element Is Visible    id:7    30s    
    Click Element    id:7
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Sleep    2s
      # รอให้ <p> พร้อมใช้งานก่อนคลิก
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Sleep    2s
    Wait Until Element Is Visible    id:ngb-nav-6    30s    
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary') and contains(text(), 'ตกลง')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds   
    Click Element    xpath=//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s

Pull Back
    Sleep    3s
    Wait Until Element Is Visible    //button[contains(@class,'btn-info') and contains(.,'ส่งคืน')]    30s
    Click Element    xpath=//button[contains(@class,'btn-info') and contains(.,'ส่งคืน')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    
     # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s
      # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Sleep    5s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s


Recall
    [Arguments]    ${TittleName}
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Click Element    xpath=//button[contains(text(), 'ดึงกลับ')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    30s
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    30s
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class, 'btn btn-success mr-3') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s


RunNoPresentForSendIn
    [Arguments]   ${ASSIGN_NEXT_LIST}    ${SelectFlow}
      # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ${SelectFlow}
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]  
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]   
    Click Element    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-success mx-1') and contains(.,'ตกลง')]    30s
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1') and contains(.,'ตกลง')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=60s
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

Close Book RecivePage
    [Arguments]    ${TittleName}    
    Wait Until Element Is Visible    id:ngb-nav-6    30s
    Click Element    id:ngb-nav-6
    Wait Until Element Is Visible    //button[contains(text(),'ปิดหนังสือ')]    30s    
    Click Element    xpath=//button[contains(text(),'ปิดหนังสือ')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-primary mr-1 ng-star-inserted')]    30s    
    Click Element    xpath=//button[contains(@class,'btn btn-primary mr-1 ng-star-inserted')]
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]

    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s
    Unselect Frame
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]    60 seconds
    # คลิกที่ข้อความ "ส่งหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]
    Wait Until Element Is Visible    id:5    30s    
    Click Element    id:5
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Click Element    id:ngb-nav-2
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    Sleep    10s



Full Normal Send
    [Arguments]     ${username}    ${TitleName}    ${AssignNext}
    User Login    ${username}
    Go To Document     ${TitleName}
    AssignNext    ${AssignNext}  
    Close Browser

Full Run Number
    [Arguments]     ${username}    ${TitleName}    ${AssignNext}    ${SelectFlow}
    User Login    ${username}
    Go To Document     ${TitleName}
    RunNoPresentForSendIn   ${AssignNext}    ${SelectFlow}
    Sleep    5s  
    Close Browser

Full Normal Send From RecivePage
    [Arguments]     ${username}    ${TitleName}    ${AssignNext}
    User Login    ${username}
    Go To Document Receipt      ${TitleName}
    AssignNext    ${AssignNext}  
    Close Browser

Full Close Book
    [Arguments]     ${username}    ${TitleName}    
    User Login    ${username}
    Go To Document Receipt      ${TitleName}
    Close Book RecivePage    TittleName=${TitleName}  
    Close Browser

Full Recall
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Need To Recall    ${TITLE_NAME}  
    Recall    TittleName=${TITLE_NAME} 
    Close Browser