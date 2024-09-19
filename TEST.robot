*** Settings ***
# ไม่มีการนำเข้า BuiltIn เพราะมันถูกโหลดโดยอัตโนมัติ

*** Keywords ***
Keyword A
    [Documentation]    ทำการดำเนินการที่อาจล้มเหลว
    Log    กำลังรัน Keyword A
    # จำลองการล้มเหลว
    Fail    การทำงานของ Keyword A ล้มเหลว (สำหรับการทดสอบ)

*** Test Cases ***
Test Case with Retry
    [Documentation]    ทดสอบการทำงานของ Keyword A และลองใหม่หากล้มเหลว
    Wait Until Keyword Succeeds    3    5s    Keyword A
