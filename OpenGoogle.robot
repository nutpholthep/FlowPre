*** Settings ***
Documentation     ทดสอบการทำงานของระบบ
Suite Setup       เตรียมพร้อมการทดสอบ
Suite Teardown    ทำความสะอาดหลังทดสอบ
# Test Setup        เตรียมพร้อมสำหรับแต่ละเทสต์
# Test Teardown     ล้างค่าหลังการทดสอบ

Library           SeleniumLibrary   # กรณีใช้ Selenium ทดสอบเว็บ
Library           OperatingSystem   # ใช้ตรวจสอบระบบปฏิบัติการ

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.co.th/

*** Test Cases ***
ทดสอบหน้าแรกของเว็บไซต์
    [Documentation]    ทดสอบว่าหน้าแรกของเว็บไซต์โหลดถูกต้องหรือไม่
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Google

*** Keywords ***
เตรียมพร้อมการทดสอบ
    Log    เริ่มการทดสอบ

ทำความสะอาดหลังทดสอบ
    Close All Browsers
