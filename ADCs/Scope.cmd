@echo off

rem Author    KMS - Martin Dubois, P. Eng.
rem Copyright (C) 2024 KMS
rem License   http://www.apache.org/licenses/LICENSE-2.0
rem Product   KMS-PLC-Samples
rem File      ADCs/Scope.cmd

echo Executing  Scope.cmd  ...

rem ===== Configuration =====================================================

set PLC_ID=1

set PLC_IP=192.168.0.28

rem ===== Initialisation ====================================================

set MODBUS_TOOL_EXE="C:\Program Files\KMS-PLC\ModbusTool.exe"

rem ===== Verification ======================================================

if not exist %MODBUS_TOOL_EXE% (
    echo ERROR  %MODBUS_TOOL_EXE%  does not exist
    echo Install KMS-PLC
    pause
    exit /B 10
)

rem ===== End ===============================================================

%MODBUS_TOOL_EXE% TCP DeviceAddress=%PLC_ID% Log_ConsoleMode=DEBUG RemoteAddress=IPv4:%PLC_IP%:502 "Commands+=ExecuteScript Scope.txt"

echo OK
