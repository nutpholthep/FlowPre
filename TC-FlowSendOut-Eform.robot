*** Settings ***
Library             SeleniumLibrary
Resource            ./codeModule/sendOutEform.robot

Suite Teardown      Close All Browsers


*** Variables ***
${URL}                  https://chon.ecm.in.th/

@{ASSIGN_NEXT_LIST}
...                     กัญญาณัฐ ศรีบุรินทร์
...                     ทิตยเพ็ญ สมานคติ
...                     วีระนุช ฮุ่งหวล
...                     สุภาวดี อุดมเดชดิษยา
...                     มลฤดี โส๊ะอ้น
...                     ปนัดดา

@{USERNAME_LIST}
...                     KANYANAT_S
...                     TIDTAYAPEN_S
...                     VEERANOOT_H
...                     SUPAVADEE_U
...                     monruedi_s
...                     panadda_t

@{SelectFlow}
...                     ส่งภายในกอง
...                     ส่งระหว่างกอง สำนักช่าง
...                     ส่งระหว่างกอง หน่วยตรวจสอบภายใน
...                     ส่งระหว่างกอง กองพัสดุและทรัพย์สิน
...                     ส่งระหว่างกอง สำนักปลัด
...                     ส่งระหว่างกอง สำนักเลขาธิการ
...                     ส่งระหว่างกอง กองยุทธศาสตร์และงบประมาณ
...                     ส่งระหว่างกอง กองคลัง
...                     ส่งระหว่างกอง กองสวัสดิการสังคม
...                     ส่งระหว่างกอง กองการศึกษา ศาสนา และวัฒนธรรม
...                     ส่งระหว่างกอง กองการท่องเที่ยวและกีฬา
...                     ส่งระหว่างกอง กองการเจ้าหน้าที่
...                     ส่งระหว่างกอง กองสาธารณสุข

${Flow}                 ส่งต่อ

${PASSWORD}             3710f92c9aTOSH
${BROWSER}              Chrome
${TITLE_NAME}           TestFlow(SendOut)Bot2309-01
${NoReserve}            90/2567


*** Test Cases ***
คนที่ 1 ส่งต่อ
    [Documentation]    คนที่ 1 ${USERNAME_LIST}[1]
    FOR  ${i}  IN  RANGE  2
    Full Normal Send    username=${USERNAME_LIST}[1]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[2]
    Full Recall    ${USERNAME_LIST}[1]    ${TITLE_NAME} 
    END
    Full Normal Send    username=${USERNAME_LIST}[1]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[2]
    

คนที่ 2 ส่งต่อ
    [Documentation]    คนที่ 2 ${USERNAME_LIST}[2]
    FOR  ${i}  IN  RANGE  2
    Full Normal Send    username=${USERNAME_LIST}[2]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[3]
    Full Recall    ${USERNAME_LIST}[2]    ${TITLE_NAME} 
    END
    Full Normal Send    username=${USERNAME_LIST}[2]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[3]


คนที่ 3 ส่งต่อ
    [Documentation]    คนที่ 3 ${USERNAME_LIST}[3]
    FOR  ${i}  IN  RANGE  2
    Full Normal Send    username=${USERNAME_LIST}[3]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[4]
    Full Recall    ${USERNAME_LIST}[3]    ${TITLE_NAME} 
    END
    Full Normal Send    username=${USERNAME_LIST}[3]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[4]

คนที่ 4 ออกเลข
    [Documentation]    คนที่ 4 ${USERNAME_LIST}[4]
    Full Run Number
    ...    username=${USERNAME_LIST}[4]
    ...    TitleName=${TITLE_NAME}
    ...    AssignNext=${ASSIGN_NEXT_LIST}[0]
    ...    SelectFlow=${Flow}

Before Last man
    [Documentation]    คนที่ 2 ${USERNAME_LIST}[2]
    Full Before Last man    username=${USERNAME_LIST}[0]    TitleName=${TITLE_NAME}    AssignNext=${ASSIGN_NEXT_LIST}[5]

ปิดหนังสือ
    [Documentation]    ปิดหนังสือ ${USERNAME_LIST}[5]
    Full Close Book
    ...    username=${USERNAME_LIST}[5]
    ...    TitleName=${TITLE_NAME}
