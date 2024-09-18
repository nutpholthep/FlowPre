*** Settings ***
Library             SeleniumLibrary
Resource            ./Resource.robot

Suite Teardown      Close All Browsers


*** Variables ***
${URL}                  https://chon.ecm.in.th/
@{ASSIGN_NEXT_LIST}
...                     ภิญญดา ต้นจันทน์
...                     ปริชาติ ศิลาแยง
...                     ประภาศรี ชาญสมร
...                     กาญจน์สิตา บุญถนอม
...                     นัทธนันท์ หน่อคำ
...                     โยธกา สังข์ทอง
...                     มณฑา บุญวิสุทธานนท์
...                     สิทธิศักดิ์ นิติวุฒิวรรักษ์
...                     พันธ์ศักดิ์ เกตุวัตถา
...                     นลินี จันทร์เกลี้ยง
...                     วิทยา คุณปลื้ม
...                     นัทธนันท์ หน่อคำ
...                     ภิญญดา ต้นจันทน์
@{USERNAME_LIST}
...                     PINYADA_T
...                     parichat_s
...                     PRAPASAI_C
...                     kansita_b
...                     nattanan_n
...                     yotaga_s
...                     montha_b
...                     SITTISAK_N
...                     phansak_k
...                     nalinee_c
...                     vitaya_k
...                     nattanan_n
...                     PINYADA_T

${PASSWORD}             3710f92c9aTOSH
${BROWSER}              Chrome
${TITLE_NAME}           ทดสอบเสนอส่งคืน(กองศึกษา)1809-01
${NoReserve}            83/2567


*** Test Cases ***
# ส่งคืนคนที่ 1
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[1]
#     Full Recall For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]

# ส่งคืนคนที่ 2
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[2]
#     Full Recall For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]

# ส่งคืนคนที่ 3
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[3]
#     Full Recall For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]

# ส่งคืนคนที่ 4
#     [Documentation]    ออกเลขเสนอ สำหรับผู้ใช้ ${USERNAME_LIST}[4]
#     Full Recall For Present    ${USERNAME_LIST}[4]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]

# ส่งคืนคนที่ 5
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[5]
#     Full Recall For Present    ${USERNAME_LIST}[5]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
#     Full BookMark For NoPresent    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]

# ส่งคืนคนที่ 6
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[6]
#     Full Recall For Present    ${USERNAME_LIST}[6]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
#     Full BookMark For NoPresent    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[6]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[7]    ทราบ    37

# ส่งคืนคนที่ 7
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[7]
#     Full Recall For Present    ${USERNAME_LIST}[7]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
#     Full BookMark For NoPresent    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[6]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[7]    ทราบ    37
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[7]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[8]    ทราบ    38

ส่งคืนคนที่ 8
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[8]
   #  Full Recall For Present    ${USERNAME_LIST}[8]    ${TITLE_NAME}
   #  First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
   #  Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
   #  Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
   #  Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
   #  Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
   #  Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]    ทราบ    38
   #  Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[6]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[7]    ทราบ    37
   #  Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[7]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[8]    ทราบ    38
   #  Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[8]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[9]    ทราบ    37

ส่งคืนคนที่ 9
    [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[9]
   #  Full Recall For Present    ${USERNAME_LIST}[9]    ${TITLE_NAME}
   #  First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
   #  Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]    ทราบ    38
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[6]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[7]    ทราบ    37
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[7]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[8]    ทราบ    38
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[8]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[9]    ทราบ    37
#     Full BookMark For NoPresent Page 38
#     ...    ${USERNAME_LIST}[9]
#     ...    ${TITLE_NAME}
#     ...    ${ASSIGN_NEXT_LIST}[10]
#     ...    ทราบ
#     ...    38

# ส่งคืนคนที่ 10
#     [Documentation]    ส่งคืน สำหรับผู้ใช้ ${USERNAME_LIST}[10]
#     Full Recall For Present    ${USERNAME_LIST}[10]    ${TITLE_NAME}
#     First Man_For_Present    ${USERNAME_LIST}[0]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[1]
#     Normal Send For Present    ${USERNAME_LIST}[1]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[2]
#     Normal Send For Present    ${USERNAME_LIST}[2]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[3]
#     Normal Send For Present    ${USERNAME_LIST}[3]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]
#     Full NoReceipt For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[5]
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[5]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[6]    ทราบ    38
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[6]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[7]    ทราบ    37
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[7]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[8]    ทราบ    38
#     Full BookMark For NoPresent Page 38    ${USERNAME_LIST}[8]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[9]    ทราบ    37
#     Full BookMark For NoPresent Page 38
#     ...    ${USERNAME_LIST}[9]
#     ...    ${TITLE_NAME}
#     ...    ${ASSIGN_NEXT_LIST}[10]
#     ...    ทราบ
#     ...    38
#     Full BookMark For NoPresent Page 38
#     ...    ${USERNAME_LIST}[10]
#     ...    ${TITLE_NAME}
#     ...    ${ASSIGN_NEXT_LIST}[9]
#     ...    ทราบ
#     ...    37

# ส่งกลับมาหน้าห้อง คนที่ 9
#     [Documentation]    ส่งกลับมาหน้าห้อง สำหรับผู้ใช้ ${USERNAME_LIST}[9]
#     Normal Send For Present    ${USERNAME_LIST}[9]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[4]

ส่งกลับมา คนที่ 4 ออกเลขคำสั่ง
    [Documentation]    ส่งกลับมาหน้าห้อง สำหรับผู้ใช้ ${USERNAME_LIST}[9]
    Full NoComarnd For NoPresent    ${USERNAME_LIST}[4]    ${TITLE_NAME}    ${ASSIGN_NEXT_LIST}[0]    84/2567

ปิดหนังสือ
    [Documentation]    ปิดหนังสือ สำหรับผู้ใช้ ${USERNAME_LIST}[0]
    Last Man For NoPresent    ${USERNAME_LIST}[0]    ${TITLE_NAME}
