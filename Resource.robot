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

    Wait Until Element Is Visible    id:5    30s    
    Click Element    id:5
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

Go To Document Prensent 
    [Arguments]    ${TittleName}
     # รอให้องค์ประกอบของ "แฟ้มนำเสนอ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]    60 seconds
    
    # คลิกที่ข้อความ "แฟ้มนำเสนอ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'แฟ้มนำเสนอ')]

    Wait Until Element Is Visible    id:20    30s    
    Click Element    id:20
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
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    
     
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

AssignNext For Present
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    Sleep    3s
    Select From List By Label    name:WorkFlowId    ส่งต่อ
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    20 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
     
    # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s


Pull Back
    Sleep    3s
    Wait Until Element Is Visible    //button[contains(@class,'btn-info') and contains(.,'ส่งคืน')]
    Click Element    xpath=//button[contains(@class,'btn-info') and contains(.,'ส่งคืน')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]

Pull Back For Present
    Sleep    3s
    Wait Until Element Is Visible    //button[contains(@class,'btn-primary') and contains(.,'ส่งคืน')]
    Click Element    xpath=//button[contains(@class,'btn-primary') and contains(.,'ส่งคืน')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    20 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    
     
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
       # รอให้องค์ประกอบของ "ส่งหนังสือ" พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]    10 seconds
    
    # คลิกที่ข้อความ "ส่งหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'ส่งหนังสือ')]
    
    Wait Until Element Is Visible    id:6   30s    
    Click Element    id:6
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
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]

RunNoPresent For Present
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
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    20 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

RunNoComarnd For Present
    [Arguments]   ${ASSIGN_NEXT_LIST}   ${NoReserve}   
    # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มเลขที่หนังสือ')]
    
    # รอให้ <label> ปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//label[@for='bookDocData_TypeRunReserve_1']    10 seconds
    
    # เลื่อนองค์ประกอบให้เข้ามุมมองและคลิกที่ <label>
    Scroll Element Into View    xpath=//label[@for='bookDocData_TypeRunReserve_1']
    Click Element    xpath=//label[@for='bookDocData_TypeRunReserve_1']    # หากยังติดปัญหาคลิกไม่ได้ ลองใช้ JavaScript คลิกด้านล่าง
    # Execute JavaScript    document.querySelector("label[for='bookDocData_TypeRunReserve_1']").click()
    
    # รอให้ radio button ที่เกี่ยวข้องกับข้อความ "47/2567" ปรากฏ
    Wait Until Element Is Visible    xpath=//tr[td[text()='${NoReserve}']]//input[@type='radio']    30s
    Scroll Element Into View    xpath=//tr[td[text()='${NoReserve}']]//input[@type='radio']
    
    # คลิกที่ radio button ที่เกี่ยวข้องกับข้อความ "${NoReserve}"
    Click Element    xpath=//tr[td[text()='${NoReserve}']]//input[@type='radio']
    
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
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
    Sleep    2s

    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]

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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

RunReciveBookNo   #ออกเลขตรายางรับภายใน
    [Arguments]   ${ASSIGN_NEXT_LIST}    
      # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขรับหนังสือ')]  
    Scroll Element Into View    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขรับหนังสือ')]   
    Click Element    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขรับหนังสือ')]
    Sleep    2s
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

RunBookMark For Present   #ออกเลขตรายางเสนอ
    [Arguments]   ${ASSIGN_NEXT_LIST}    
      # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขเสนอตรายาง')]  
    Scroll Element Into View    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขเสนอตรายาง')]   
    Click Element    xpath=//button[contains(@class,'btn-info') and contains(., 'เพิ่มเลขเสนอตรายาง')]
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn btn-success mx-1')]    30s
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]

    Wait Until Element Is Visible    //h4[contains(.,'ท่านตกลงที่จะออกเลขที่หนังสือ(ใหม่) หรือไม่')]    30s
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info')]    30s
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(.,'ตกลง')]

    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    20 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

RunBookMarkComarnd For Present    #ออกเลขตรายางเสนอ
    [Arguments]    ${ASSIGN_NEXT_LIST}    ${Text}    
      # รอให้รายการ select ปรากฏ
    Wait Until Element Is Visible    name:WorkFlowId    10 seconds
    
    # เลือกตัวเลือกจากรายการ select ตาม label
    Select From List By Label    name=WorkFlowId    ส่งต่อ
    Sleep    3s
    Scroll Element Into View    class:fa-plus-circle
    Capture Page Screenshot    clicked-paragraph.png
    Wait Until Element Is Visible    name:action    30s  
    Scroll Element Into View    name:action     
    Select From List By Label    name:action    ${Text}
    Wait Until Element Is Visible    xpath=//button[contains(@class,'btn btn-info') and contains(.,'แสดงตัวอย่างตรายางคำสั่ง')]    30s    
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(.,'แสดงตัวอย่างตรายางคำสั่ง')]


    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    20 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]
     # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    //div[contains(., 'ดำเนินการสำเร็จ')]    30s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

Assign_For_Last
    [Arguments]    ${ASSIGN_NEXT_LIST} 
    Wait Until Element Is Visible    name:WorkFlowId    30s 
    Select From List By Label    name:WorkFlowId     ส่งต่อ (ผู้รับผิดชอบ) 
    Sleep    3s
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info ng-star-inserted') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Sleep    5s
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
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
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    10 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
    
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
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Unselect Frame

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


Perform Actions For Other Users
    [Arguments]    ${username}    ${assign_next}
    FOR    ${i}    IN RANGE    2
        Log    รอบที่ ${i+1} สำหรับผู้ใช้: ${username}, Assign ให้: ${assign_next}
        User Login    ${username}
        Go To Document   ${TITLE_NAME}
        Unselect Frame
        Sleep    5s
        Recall    ${TITLE_NAME}
        Close Browser
    END

Case Pull back 
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}     
    User Login    ${USERNAME_LIST}
    Go To Document Receipt     ${TITLE_NAME}
    Pull Back   


First StepForSendIn
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    Sleep    3s
    Wait Until Element Is Visible    name:WorkFlowId    30s
    Select From List By Label    name:WorkFlowId    ส่งใหม่ หนังสือภายใน(หัวหน้างาน)   
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST}
    Wait Until Element Is Visible    name:Dateil    timeout=5s

    Wait Until Element Is Visible    //div[contains(@class, 'modal-body-content')]    30s
    Click Element    class:fa-search
    
    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    30 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
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

First StepForSendInV2
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    Sleep    3s
    Wait Until Element Is Visible    name:WorkFlowId    30s
    Select From List By Label    name:WorkFlowId     เริ่มต้นส่งหนังสือภายใน(หัวหน้างาน)    
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST}
    Wait Until Element Is Visible    name:Dateil    timeout=5s

    Wait Until Element Is Visible    //div[contains(@class, 'modal-body-content')]    30s
    Click Element    class:fa-search
    
    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    30 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-1') and contains(text(), 'ตกลง')]
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

First Step For Presnt
    [Arguments]   ${ASSIGN_NEXT_LIST}   
    Sleep    3s
    Wait Until Element Is Visible    name:WorkFlowId    30s
    Select From List By Label    name:WorkFlowId      ส่งใหม่ แฟ้มนำเสนอ(หัวหน้างาน)     
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]    30s 
    Scroll Element Into View    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Capture Page Screenshot    clicked-paragraph.png
    Click Element    xpath=//button[contains(@class,'btn btn-info') and contains(., 'เพิ่มรายชื่อผู้ดำเนินการถัดไป ')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    Input Text    name:Dateil    ${ASSIGN_NEXT_LIST}
    Wait Until Element Is Visible    name:Dateil    timeout=5s

    Wait Until Element Is Visible    //div[contains(@class, 'modal-body-content')]    30s
    Click Element    class:fa-search
    
    Wait Until Element Is Visible    //tr[@class='ng-star-inserted']    10s
    Wait Until Element Is Visible    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]    15s
    # คลิกที่ <label> ที่ตรงตามเงื่อนไข
    Click Element    //label[@for='data_Index_0' and contains(text(), '${ASSIGN_NEXT_LIST}')]
    # รอให้การกระทำที่เกิดขึ้นหลังคลิกเสร็จสมบูรณ์
    Wait Until Page Contains Element    //label[contains(@class, 'mb-0')]
    Click Element    xpath=//button[contains(@class,'btn btn-success mx-1')]
    Wait Until Element Is Visible    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    30 seconds
    Scroll Element Into View    //button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]    
    Click Element    xpath=//button[contains(@class, 'btn btn-primary mr-2') and contains(text(), 'ตกลง')]
     # รอให้โมดอลปรากฏและพร้อมสำหรับการคลิก
    Wait Until Element Is Visible    //div[contains(@class, 'modal-footer')]    10 seconds
    # รอให้ปุ่ม "ตกลง" ภายใน modal-footer พร้อมสำหรับการคลิก
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]    10 seconds
    # คลิกที่ปุ่ม "ตกลง" ภายใน modal-footer
    Click Element    xpath=//div[contains(@class, 'modal-footer')]//button[contains(@class, 'btn btn-success') and contains(text(), 'ตกลง')]
    Wait Until Element Is Not Visible    xpath=//app-loader    timeout=30s
    # กลับไปที่เฟรมหลักหลังจากเสร็จสิ้น
    Wait Until Element Is Visible    xpath=//table[contains(@class, 'table')]    20s
    Wait Until Element Is Visible    //td[@class='text-center']   20s

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

Full Recall
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}  
    Pull back

Full Recall For Present   #ดึงกลับFlowเสนอ
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent    ${TITLE_NAME}  
    Pull Back For Present
    Close Browser
        

Normal Send    #ส่งต่อปกติ
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....   
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    AssignNext  ${ASSIGN_NEXT_LIST}

Normal Send For Present    #ส่งต่อปกติFlowเสนอ
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....   
    User Login    ${USERNAME_LIST}
    Go To Document Prensent    ${TITLE_NAME}
    AssignNext For Present  ${ASSIGN_NEXT_LIST}
    Close Browser


Normal Send Recive    #ส่งต่อหน้ารับหนังสือปกติ
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....   
    User Login    ${USERNAME_LIST}
    Go To Document Receipt    ${TITLE_NAME}
    AssignNext  ${ASSIGN_NEXT_LIST}
    

Full NoReceipt    #ออกเลขใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    RunNoPresent  ${ASSIGN_NEXT_LIST}

Full NoReceipt For NoPresent    #ออกเลขใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent     ${TITLE_NAME}
    RunNoPresent For Present  ${ASSIGN_NEXT_LIST}
    Close Browser

Last Man For NoPresent    #ออกเลขใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent     ${TITLE_NAME}
    Close Book    ${TITLE_NAME}
    Close Browser

Full NoComarnd For NoPresent    #ออกเลขใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}   ${NoReserve} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent     ${TITLE_NAME}
    RunNoComarnd For Present  ${ASSIGN_NEXT_LIST}    ${NoReserve}
    Close Browser

Full BookMark For NoPresent    #ออกเลขตรายางใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent     ${TITLE_NAME}
    RunBookMark For Present  ${ASSIGN_NEXT_LIST}

Full BookMark For NoPresent Page 38    #ออกเลขตรายางใหม่
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}   ${Text}   ${Condition} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent     ${TITLE_NAME}
    Run Keyword If    ${Condition} == 38    RunBookMark For Present  ${ASSIGN_NEXT_LIST} 
    ...    ELSE    RunBookMarkComarnd For Present  ${ASSIGN_NEXT_LIST}    ${Text}
    Close Browser   
    
    

Full NoReceiptForSendIn    #ออกเลขใหม่สำหรับส่งภายใน
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}    ${SelectFlow} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    RunNoPresentForSendIn  ${ASSIGN_NEXT_LIST}    ${SelectFlow}
    

Full RunReciveBookNo    #ออกเลขใหม่ตรายางสำหรับส่งภายใน
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST}
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....      
    User Login    ${USERNAME_LIST}
    Go To Document Receipt    ${TITLE_NAME}
    RunReciveBookNo  ${ASSIGN_NEXT_LIST}    
    

First Man    #คนแรกของส่งภายนอกeForm
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    First Step    ${ASSIGN_NEXT_LIST} 

First Man_ForSendIn    #คนแรกของส่งภายในeForm
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    First StepForSendIn    ${ASSIGN_NEXT_LIST} 

First Man_ForSendInV2    #คนแรกของส่งภายในeForm
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    First StepForSendInV2    ${ASSIGN_NEXT_LIST}

First Man_For_Present    #คนแรกของส่งภายในeForm
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document Prensent    ${TITLE_NAME}
    First Step For Presnt    ${ASSIGN_NEXT_LIST}
    Close Browser 

Before Last Man    #ก่อนคนสุดท้ายของส่งภายนอกeForm
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....  
    User Login    ${USERNAME_LIST}
    Go To Document    ${TITLE_NAME}
    Assign_For_Last    ${ASSIGN_NEXT_LIST} 

Logout
    Unselect Frame
    Wait Until Element Is Visible    //i[contains(@class,'fa fa-user-circle fa-2x style-scope ko-profile2')]    15s
    Click Element    xpath=//i[contains(@class,'fa fa-user-circle fa-2x style-scope ko-profile2')]
    Wait Until Element Is Visible    //input[contains(@class,'button is-dark round style-scope ko-profile2')]    15s
    Click Element    xpath=//input[contains(@class,'button is-dark round style-scope ko-profile2')]
    Close All Browsers

Close BookV2
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

Close BookRecive
    [Arguments]    ${TittleName}    
    Wait Until Element Is Visible    id:ngb-nav-6    30s
    Click Element    id:ngb-nav-6
    Wait Until Element Is Visible    //button[contains(text(),'ปิดหนังสือ')]    30s    
    Click Element    xpath=//button[contains(text(),'ปิดหนังสือ')]
    Wait Until Element Is Visible    //button[contains(@class,'btn btn-primary mr-1 ng-star-inserted')]    30s    
    Click Element    xpath=//button[contains(@class,'btn btn-primary mr-1 ng-star-inserted')]
    Sleep    3s
    Click Element    xpath=//button[contains(@class,'btn btn-success mr-3')]

    Unselect Frame
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'item') and contains(., 'รับหนังสือ')]    60 seconds
    # คลิกที่ข้อความ "รับหนังสือ"
    Click Element    xpath=//div[contains(@class, 'item') and contains(., 'รับหนังสือ')]
    Wait Until Element Is Visible    id:7    30s    
    Click Element    id:7
    Wait Until Page Contains Element    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]    30s
    Select Frame    xpath=//iframe[contains(@src, 'https://chon-doc.ecm.in.th')]
    Click Element    id:ngb-nav-2
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(text()),'${TittleName}')]    30s
    # เลื่อนหน้าให้เห็น <p> ก่อน
    Scroll Element Into View    xpath=//p[contains(normalize-space(text()),'${TittleName}')]
    # คลิกปุ่ม "รายละเอียด" ที่อยู่ในแถวของ <p> ที่มีข้อความที่กำหนด
    Click Element    xpath=//p[contains(normalize-space(text()),'${TittleName}')]/following::button[contains(@class, 'button-detail')]
    Sleep    10s

Normal Recive_Assign   #รับหนังสือส่งต่อ
    [Arguments]    ${USERNAME_LIST}    ${TITLE_NAME}   ${ASSIGN_NEXT_LIST} 
    Log To Console    ${USERNAME_LIST} กำลังดำเนินการ....    
    User Login    ${USERNAME_LIST}
    Print Page To Pdf    ./PDF/${USERNAME_LIST}.pdf
    Go To Document Receipt    ${TITLE_NAME}
    AssignNext    ${ASSIGN_NEXT_LIST} 
 