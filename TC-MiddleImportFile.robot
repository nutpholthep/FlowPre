*** Settings ***
Library             SeleniumLibrary
Resource            ./Resource.robot

Suite Teardown      Close All Browsers


*** Variables ***
${URL}                      https://chon.ecm.in.th/

@{ASSIGN_NEXT_LIST}
...                         รดาภัค พุฒิวิญญู
...                         นิรมล สิทธิไกรพงษ์
...                         ธนัชชนก เนตร์สอาด
...                         เพ็ญประภา สำเภาแก้ว
...                         เบญจรัตน์ ฐิติวร
...                         ขนิษฐา ทุมสวัสดิ์

@{USERNAME_LIST}            RADAPAK_P    niramon_s    thanutchanok_n    PENPRAPA_S    BENJARAT_T    KHANITTHA_T

@{Menu}
...                         ส่งต่อ สำนักช่าง
...                         ส่งต่อ หน่วยตรวจสอบภายใน
...                         ส่งต่อ กองพัสดุและทรัพย์สิน
...                         ส่งต่อ สำนักปลัด
...                         ส่งต่อ สำนักนโยบายบุกร
...                         ส่งต่อ กองยุทธศาสตร์และงบประมาณ
...                         ส่งต่อ กองคลัง
...                         ส่งต่อ กองสวัสดิการสังคม
...                         ส่งต่อ กองการศึกษา ศาสนา และวัฒนธรรม
...                         ส่งต่อ กองการท่องเที่ยวและกีฬา
...                         ส่งต่อ กองการเจ้าหน้าที่
...                         ส่งต่อ กองสาธารณสุข
...                         ส่งต่อ กองสวัสดิการสังคม
...                         ส่งต่อ สำนักเลขานุการ

${SELECTED}                 ส่งต่อ กองยุทธศาสตร์และงบประมาณ
${PASSWORD}                 3710f92c9aTOSH
${BROWSER}                  Chrome
${TITLE_NAME}               ทดสอบไฟล์ธุรการกลาง(กองยุทธ)2009-01
${NoReserve}                90/2567


*** Test Cases ***
ส่งคืนคนที่ 1
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[1]
    Case Pull back    ${USERNAME_LIST}[1]    ${TITLE_NAME}
    Full First Man_For Recive File    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
    Select Group For Send To    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]    ${SELECTED}

ส่งคืนคนที่ 2
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[2]
    Case Pull back    ${USERNAME_LIST}[2]    ${TITLE_NAME}
    Full First Man_For Recive File    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
    Select Group For Send To    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]    ${SELECTED}
    Full BookMark For Middle File    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]

ส่งคืนคนที่ 3
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[3]
    Case Pull back    ${USERNAME_LIST}[3]    ${TITLE_NAME}
    Full First Man_For Recive File    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
    Select Group For Send To    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]    ${SELECTED}
    Full BookMark For Middle File    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
    Normal Recive_Assign    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]

ส่งคืนคนที่ 4
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[4]
    Case Pull back    ${USERNAME_LIST}[4]    ${TITLE_NAME}
    Full First Man_For Recive File    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
    Select Group For Send To    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]    ${SELECTED}
    Full BookMark For Middle File    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
    Normal Recive_Assign    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
    Normal Recive_Assign    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]

ปืดหนังสือนที่ 5
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[5]
    Full Close Book For Recive    ${USERNAME_LIST}[5]    ${TITLE_NAME}
