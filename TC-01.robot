*** Settings ***
Library    SeleniumLibrary
Resource    ./ResourceBB.robot
*** Variables ***
${URL}    https://demo.ecm.in.th/
${username}    admin
${password}    3710f92c9aTOSH
${FILE_PATH}    C:/Users/User/Downloads/มีม.jpg  # แทนที่ด้วยเส้นทางไฟล์ของคุณ
# "C:\Users\User\Downloads\มีม.jpg"
${BROWSER}    Chrome


*** Test Cases ***
Login
    [Documentation]    เข้าสู่ระบบ
    LogIn
    Click SideBar
    Go to Upload