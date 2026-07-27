@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

:: ---------------------------------------------------------
:: Start in the repository root (parent of tools/) so the
:: script behaves the same when double-clicked from anywhere.
:: ---------------------------------------------------------
for %%I in ("%~dp0..") do set "REPO_ROOT=%%~fI"
cd /d "%REPO_ROOT%" || goto :FATAL

:: Python launcher: run tools as modules, not PATH executables
set "PYTHON_CMD=python"
where python >nul 2>&1
if errorlevel 1 (
    where py >nul 2>&1
    if not errorlevel 1 set "PYTHON_CMD=py"
)
:: =========================================================
:: Self-contained ASCII-only script.
:: All Russian strings are stored below as base64 (pure ASCII)
:: and restored via certutil at runtime. Because of this the
:: file itself never contains a single byte outside ASCII, so
:: git / editors / GitHub can never corrupt the encoding again.
:: =========================================================

set "RND=%RANDOM%_%RANDOM%"
set "RU_B64=%TEMP%\fmt_ru_%RND%.b64"
set "RU_BAT=%TEMP%\fmt_ru_%RND%.bat"

where certutil >nul 2>&1
if errorlevel 1 (
    echo [X] certutil not found - cannot restore Russian strings.
    echo     Falling back to English only.
    goto :SET_EN
)

if exist "%RU_B64%" del /q "%RU_B64%" >nul 2>&1
(
    >> "%RU_B64%" echo c2V0ICJMX01FTlVfUlU90KDRg9GB0YHQutC40LkiDQpzZXQgIkxfVElUTEU9ICAgINCQ0LLRgtC+
    >> "%RU_B64%" echo 0LzQsNGC0LjRh9C10YHQutC+0LUg0YTQvtGA0LzQsNGC0LjRgNC+0LLQsNC90LjQtSDQutC+0LTQ
    >> "%RU_B64%" echo sCAoUnVmZiArIEJsYWNrKSINCnNldCAiTF9TRUxFQ1RfRElSPdCS0YvQsdC10YDQuNGC0LUg0YDQ
    >> "%RU_B64%" echo sNCx0L7Rh9GD0Y4g0LTQuNGA0LXQutGC0L7RgNC40Y4g0L/RgNC+0LXQutGC0LA6Ig0Kc2V0ICJM
    >> "%RU_B64%" echo X09QVF9DVVI90KLQtdC60YPRidCw0Y8g0L/QsNC/0LrQsCINCnNldCAiTF9PUFRfUEFSPdCg0L7Q
    >> "%RU_B64%" echo tNC40YLQtdC70YzRgdC60LDRjyDQv9Cw0L/QutCwICjRg9GA0L7QstC90LXQvCDQstGL0YjQtSki
    >> "%RU_B64%" echo DQpzZXQgIkxfT1BUX01BTj3Qo9C60LDQt9Cw0YLRjCDQstGA0YPRh9C90YPRjiINCnNldCAiTF9P
    >> "%RU_B64%" echo UFRfRVhJVD3QktGL0YXQvtC0Ig0Kc2V0ICJMX0VOVEVSX05VTT3QktCy0LXQtNC40YLQtSDQvdC+
    >> "%RU_B64%" echo 0LzQtdGAIg0Kc2V0ICJMX0VOVEVSX1BBVEg90JLQstC10LTQuNGC0LUg0L/QvtC70L3Ri9C5INC/
    >> "%RU_B64%" echo 0YPRgtGMINC6INC60L7RgNC90Y4g0L/RgNC+0LXQutGC0LAiDQpzZXQgIkxfRVJSX0RJUl9DSE9J
    >> "%RU_B64%" echo Q0U90J7RiNC40LHQutCwOiDQndC10LLQtdGA0L3Ri9C5INCy0YvQsdC+0YAg0LTQuNGA0LXQutGC
    >> "%RU_B64%" echo 0L7RgNC40LghIg0Kc2V0ICJMX0VSUl9ESVJfTk9FWElTVD3QntGI0LjQsdC60LA6INCU0LjRgNC1
    >> "%RU_B64%" echo 0LrRgtC+0YDQuNGPINC90LUg0L3QsNC50LTQtdC90LAiDQpzZXQgIkxfRVJSX0xJTkVfQ0hPSUNF
    >> "%RU_B64%" echo PdCe0YjQuNCx0LrQsDog0J3QtdCy0LXRgNC90YvQuSDQstGL0LHQvtGAINC00LvQuNC90Ysg0YHR
    >> "%RU_B64%" echo gtGA0L7QutC4ISINCnNldCAiTF9FUlJfQUNUX0NIT0lDRT3QntGI0LjQsdC60LA6INCd0LXQstC1
    >> "%RU_B64%" echo 0YDQvdGL0Lkg0LLRi9Cx0L7RgCDQtNC10LnRgdGC0LLQuNGPISINCnNldCAiTF9XT1JLX0RJUj3Q
    >> "%RU_B64%" echo oNCw0LHQvtGH0LDRjyDQtNC40YDQtdC60YLQvtGA0LjRjyINCnNldCAiTF9HSVRfV0FSTj3QktCd
    >> "%RU_B64%" echo 0JjQnNCQ0J3QmNCVOiDQpNCw0LnQuyAuZ2l0aWdub3JlINCd0JUg0J3QkNCZ0JTQldCdIg0Kc2V0
    >> "%RU_B64%" echo ICJMX0dJVF9XQVJOMj3QpNC+0YDQvNCw0YLRgtC10YDRiyDQvNC+0LPRg9GCINC+0LHRgNCw0LHQ
    >> "%RU_B64%" echo vtGC0LDRgtGMINGE0LDQudC70Ysg0LIgdmVudiwgbm9kZV9tb2R1bGVzLCBfX3B5Y2FjaGVfXyDQ
    >> "%RU_B64%" echo uCDRgi7QtC4iDQpzZXQgIkxfR0lUX1dBUk4zPdCd0LDRgdGC0L7Rj9GC0LXQu9GM0L3QviDRgNC1
    >> "%RU_B64%" echo 0LrQvtC80LXQvdC00YPQtdGC0YHRjyDRgdC+0LfQtNCw0YLRjCAuZ2l0aWdub3JlISINCnNldCAi
    >> "%RU_B64%" echo TF9HSVRfT0s90KTQsNC50LsgLmdpdGlnbm9yZSDQvdCw0LnQtNC10L0uINCY0YHQutC70Y7Rh9C1
    >> "%RU_B64%" echo 0L3QuNGPINGD0YfRgtC10L3RiyDQsNCy0YLQvtC80LDRgtC40YfQtdGB0LrQuC4iDQpzZXQgIkxf
    >> "%RU_B64%" echo Q09OVElOVUU90JLRgdGRINGA0LDQstC90L4g0L/RgNC+0LTQvtC70LbQuNGC0Yw/Ig0Kc2V0ICJM
    >> "%RU_B64%" echo X1NFTEVDVF9MSU5FPdCS0YvQsdC10YDQuNGC0LUg0LTQu9C40L3RgyDRgdGC0YDQvtC60Lg6Ig0K
    >> "%RU_B64%" echo c2V0ICJMX0xJTkVfNzk90KHRgtGA0L7Qs9C40LkgUEVQOCINCnNldCAiTF9MSU5FXzgwPdCa0LvQ
    >> "%RU_B64%" echo sNGB0YHQuNGH0LXRgdC60LjQuSBQRVA4Ig0Kc2V0ICJMX0xJTkVfODg90KHRgtCw0L3QtNCw0YDR
    >> "%RU_B64%" echo giBCbGFjayINCnNldCAiTF9MSU5FXzEwMD3Qn9C+0L/Rg9C70Y/RgNC90YvQuSDQutC+0LzQv9GA
    >> "%RU_B64%" echo 0L7QvNC40YHRgSINCnNldCAiTF9MSU5FXzEyMD3QlNC70Y8g0YjQuNGA0L7QutC40YUg0LzQvtC9
    >> "%RU_B64%" echo 0LjRgtC+0YDQvtCyIg0Kc2V0ICJMX1NFTEVDVF9BQ1Q90JLRi9Cx0LXRgNC40YLQtSDQtNC10LnR
    >> "%RU_B64%" echo gdGC0LLQuNC1OiINCnNldCAiTF9BQ1RfQ0hFQ0s90KLQvtC70YzQutC+INC/0YDQvtCy0LXRgNC6
    >> "%RU_B64%" echo 0LAgKNCx0LXQtyDQuNC30LzQtdC90LXQvdC40LkpIg0Kc2V0ICJMX0FDVF9GTVQ90JDQstGC0L7R
    >> "%RU_B64%" echo hNC+0YDQvNCw0YLQuNGA0L7QstCw0L3QuNC1ICjQuNC30LzQtdC90Y/QtdGCINGE0LDQudC70Ysp
    >> "%RU_B64%" echo Ig0Kc2V0ICJMX0xBQkVMX0NIRUNLPdCf0KDQntCS0JXQoNCa0JAgKGRyeS1ydW4pIg0Kc2V0ICJM
    >> "%RU_B64%" echo X0xBQkVMX0ZNVD3QpNCe0KDQnNCQ0KLQmNCg0J7QktCQ0J3QmNCVIg0Kc2V0ICJMX01PREU90KDQ
    >> "%RU_B64%" echo tdC20LjQvCINCnNldCAiTF9MSU5FX0xFTj3QlNC70LjQvdCwINGB0YLRgNC+0LrQuCINCnNldCAi
    >> "%RU_B64%" echo TF9ESVJFQ1RPUlk90JTQuNGA0LXQutGC0L7RgNC40Y8iDQpzZXQgIkxfUlVOX1JVRkY90JfQsNC/
    >> "%RU_B64%" echo 0YPRgdC6IFJ1ZmYgKNC70LjQvdGC0LXRgCkuLi4iDQpzZXQgIkxfUlVOX0JMQUNLPdCX0LDQv9GD
    >> "%RU_B64%" echo 0YHQuiBCbGFjayAo0YTQvtGA0LzQsNGC0YLQtdGAKS4uLiINCnNldCAiTF9SVUZGX0ZBSUw9UnVm
    >> "%RU_B64%" echo Zjog0LXRgdGC0Ywg0L/RgNC+0LHQu9C10LzRiywg0L3QtSDQuNGB0L/RgNCw0LLQu9C10L3QvdGL
    >> "%RU_B64%" echo 0LUg0LDQstGC0L7QvNCw0YLQuNGH0LXRgdC60LguIg0Kc2V0ICJMX1JVRkZfT0s9UnVmZjog0LLR
    >> "%RU_B64%" echo gdGRINGH0LjRgdGC0L4uIg0Kc2V0ICJMX0JMQUNLX0ZBSUxfQ0hLPUJsYWNrOiDQvdC10LrQvtGC
    >> "%RU_B64%" echo 0L7RgNGL0LUg0YTQsNC50LvRiyDQvdGD0LbQtNCw0Y7RgtGB0Y8g0LIg0YTQvtGA0LzQsNGC0LjR
    >> "%RU_B64%" echo gNC+0LLQsNC90LjQuC4iDQpzZXQgIkxfQkxBQ0tfRkFJTF9GTVQ9QmxhY2s6INC+0YjQuNCx0LrQ
    >> "%RU_B64%" echo sCDQv9GA0Lgg0YTQvtGA0LzQsNGC0LjRgNC+0LLQsNC90LjQuC4iDQpzZXQgIkxfQkxBQ0tfT0s9
    >> "%RU_B64%" echo QmxhY2s6INCy0YHRkSDRh9C40YHRgtC+LiINCnNldCAiTF9ET05FPdCT0L7RgtC+0LLQviEiDQpz
    >> "%RU_B64%" echo ZXQgIkxfUkVUVVJOX0NPREU90LrQvtC0INCy0L7Qt9Cy0YDQsNGC0LAiDQpzZXQgIkxfTUlTU19S
    >> "%RU_B64%" echo VUZGPVJ1ZmYg0L3QtSDQvdCw0LnQtNC10L0hINCj0YHRgtCw0L3QvtCy0LjRgtC1OiBwaXAgaW5z
    >> "%RU_B64%" echo dGFsbCBydWZmIg0Kc2V0ICJMX01JU1NfQkxBQ0s9QmxhY2sg0L3QtSDQvdCw0LnQtNC10L0hINCj
    >> "%RU_B64%" echo 0YHRgtCw0L3QvtCy0LjRgtC1OiBwaXAgaW5zdGFsbCBibGFjayINCnNldCAiTF9NSVNTX0FCT1JU
    >> "%RU_B64%" echo PdCj0YHRgtCw0L3QvtCy0LjRgtC1INC90LXQtNC+0YHRgtCw0Y7RidC40LUg0LjQvdGB0YLRgNGD
    >> "%RU_B64%" echo 0LzQtdC90YLRiyDQuCDQv9C+0L/RgNC+0LHRg9C50YLQtSDRgdC90L7QstCwLiINCnNldCAiTF9E
    >> "%RU_B64%" echo RVRFQ1RfRk9VTkQ90J7QsdC90LDRgNGD0LbQtdC9INGB0YLQsNC90LTQsNGA0YIg0LTQu9C40L3R
    >> "%RU_B64%" echo iyDRgdGC0YDQvtC60Lgg0LIg0LrQvtC90YTQuNCz0LUg0L/RgNC+0LXQutGC0LAiDQpzZXQgIkxf
    >> "%RU_B64%" echo REVURUNUX1NSQz3QmNGB0YLQvtGH0L3QuNC6Ig0Kc2V0ICJMX0RFVEVDVF9WQUw90JfQvdCw0YfQ
    >> "%RU_B64%" echo tdC90LjQtSINCnNldCAiTF9ERVRFQ1RfUFJPTVBUPUVudGVyIC0g0L/RgNC40L3Rj9GC0YwsINC7
    >> "%RU_B64%" echo 0LjQsdC+INCy0LLQtdC00LjRgtC1INGB0LLQvtGRINC30L3QsNGH0LXQvdC40LU6Ig0Kc2V0ICJM
    >> "%RU_B64%" echo X0RFVEVDVF9OT05FPdCa0L7QvdGE0LjQs9GD0YDQsNGG0LjRjyDRhNC+0YDQvNCw0YLQuNGA0L7Q
    >> "%RU_B64%" echo stCw0L3QuNGPINC90LUg0L3QsNC50LTQtdC90LAg0LIg0L/RgNC+0LXQutGC0LUiDQo=
) >nul

certutil -decode -f "%RU_B64%" "%RU_BAT%" >nul 2>&1
if errorlevel 1 (
    echo [X] Failed to decode Russian strings, falling back to English.
    goto :SET_EN
)

call "%RU_BAT%"
del /q "%RU_B64%" "%RU_BAT%" >nul 2>&1

:: =========================================================
:: Language selection
:: =========================================================
echo [1] !L_MENU_RU!
echo [2] English
echo.
set /p lang_mode="Select / Vyberite (1-2): "

if "%lang_mode%"=="2" goto :SET_EN
goto :MAIN

:: =========================================================
:: English localization
:: =========================================================
:SET_EN
set "L_TITLE=    Automatic code formatting (Ruff + Black)"
set "L_SELECT_DIR=Select project root directory:"
set "L_OPT_CUR=Current folder"
set "L_OPT_PAR=Parent folder (one level up)"
set "L_OPT_MAN=Enter path manually"
set "L_OPT_EXIT=Exit"
set "L_ENTER_NUM=Enter number"
set "L_ENTER_PATH=Enter full path to project root"
set "L_ERR_DIR_CHOICE=Error: Invalid directory choice!"
set "L_ERR_DIR_NOEXIST=Error: Directory not found"
set "L_ERR_LINE_CHOICE=Error: Invalid line length choice!"
set "L_ERR_ACT_CHOICE=Error: Invalid action choice!"
set "L_WORK_DIR=Working directory"
set "L_GIT_WARN=WARNING: .gitignore file NOT FOUND"
set "L_GIT_WARN2=Formatters may process files in venv, node_modules, __pycache__, etc."
set "L_GIT_WARN3=It is strongly recommended to create a .gitignore file!"
set "L_GIT_OK=.gitignore found. Exclusions will be applied automatically."
set "L_CONTINUE=Continue anyway?"
set "L_SELECT_LINE=Select line length:"
set "L_LINE_79=Strict PEP8"
set "L_LINE_80=Classic PEP8"
set "L_LINE_88=Black default"
set "L_LINE_100=Popular compromise"
set "L_LINE_120=Wide monitors"
set "L_SELECT_ACT=Select action:"
set "L_ACT_CHECK=Check only (no changes)"
set "L_ACT_FMT=Auto-format (modifies files)"
set "L_LABEL_CHECK=CHECK (dry-run)"
set "L_LABEL_FMT=FORMAT"
set "L_MODE=Mode"
set "L_LINE_LEN=Line length"
set "L_DIRECTORY=Directory"
set "L_RUN_RUFF=Running Ruff (linter)..."
set "L_RUN_BLACK=Running Black (formatter)..."
set "L_RUFF_FAIL=Ruff: some issues could not be auto-fixed."
set "L_RUFF_OK=Ruff: all clean."
set "L_BLACK_FAIL_CHK=Black: some files need formatting."
set "L_BLACK_FAIL_FMT=Black: formatting error."
set "L_BLACK_OK=Black: all clean."
set "L_DONE=Done!"
set "L_RETURN_CODE=exit code"
set "L_MISS_RUFF=Ruff not found! Install: pip install ruff"
set "L_MISS_BLACK=Black not found! Install: pip install black"
set "L_MISS_ABORT=Install missing tools and try again."
set "L_DETECT_FOUND=Detected line length standard in project config"
set "L_DETECT_SRC=Source"
set "L_DETECT_VAL=Value"
set "L_DETECT_PROMPT=Enter - accept, or type your own value:"
set "L_DETECT_NONE=No formatting config found in project"
goto :MAIN

:MAIN
cls
echo =======================================================
echo !L_TITLE!
echo =======================================================
echo.

:: ---------------------------------------------------------
:: Check required tools
:: ---------------------------------------------------------
set "TOOLS_OK=1"

!PYTHON_CMD! -m ruff --version >nul 2>&1
if errorlevel 1 (
    echo [X] !L_MISS_RUFF!
    set "TOOLS_OK=0"
)

!PYTHON_CMD! -m black --version >nul 2>&1
if errorlevel 1 (
    echo [X] !L_MISS_BLACK!
    set "TOOLS_OK=0"
)

if "!TOOLS_OK!"=="0" (
    echo.
    echo !L_MISS_ABORT!
    echo.
    goto :EXIT
)

:: ---------------------------------------------------------
:: Step 1: Directory selection
:: ---------------------------------------------------------
echo !L_SELECT_DIR!
echo [1] !L_OPT_CUR!:  %CD%
echo [2] !L_OPT_PAR!:  %CD%\..
echo [3] !L_OPT_MAN!
echo [0] !L_OPT_EXIT!
echo.
set /p dir_mode="!L_ENTER_NUM! (0-3): "

if "%dir_mode%"=="0" goto :EXIT

if "%dir_mode%"=="1" (
    set "PROJECT_DIR=%CD%"
)

if "%dir_mode%"=="2" (
    pushd "%CD%\.."
    set "PROJECT_DIR=!CD!"
    popd
)

if "%dir_mode%"=="3" (
    set /p "PROJECT_DIR=!L_ENTER_PATH!: "
)

if not defined PROJECT_DIR (
    echo !L_ERR_DIR_CHOICE!
    goto :EXIT
)

if "!PROJECT_DIR:~-1!"=="\" set "PROJECT_DIR=!PROJECT_DIR:~0,-1!"

if not exist "!PROJECT_DIR!\" (
    echo !L_ERR_DIR_NOEXIST!: "!PROJECT_DIR!"
    goto :EXIT
)

echo.
echo [INFO] !L_WORK_DIR!: !PROJECT_DIR!
echo.

:: ---------------------------------------------------------
:: Step 2: Check .gitignore
:: ---------------------------------------------------------
if not exist "!PROJECT_DIR!\.gitignore" (
    echo [!!] !L_GIT_WARN!: "!PROJECT_DIR!"
    echo     !L_GIT_WARN2!
    echo     !L_GIT_WARN3!
    echo.
    choice /M "!L_CONTINUE!"
    if errorlevel 2 goto :EXIT
    echo.
) else (
    echo [OK] !L_GIT_OK!
    echo.
)

:: ---------------------------------------------------------
:: Step 3: Line length (auto-detect from project config)
:: ---------------------------------------------------------
set "LINE_LEN="
set "DETECT_SRC="

if exist "!PROJECT_DIR!\pyproject.toml" (
    for /f "tokens=2 delims== " %%A in ('findstr /R /C:"line-length" "!PROJECT_DIR!\pyproject.toml"') do (
        if not defined LINE_LEN (
            set "LINE_LEN=%%A"
            set "DETECT_SRC=pyproject.toml"
        )
    )
)

if not defined LINE_LEN if exist "!PROJECT_DIR!\ruff.toml" (
    for /f "tokens=2 delims== " %%A in ('findstr /R /C:"line-length" "!PROJECT_DIR!\ruff.toml"') do (
        if not defined LINE_LEN (
            set "LINE_LEN=%%A"
            set "DETECT_SRC=ruff.toml"
        )
    )
)

if not defined LINE_LEN if exist "!PROJECT_DIR!\.ruff.toml" (
    for /f "tokens=2 delims== " %%A in ('findstr /R /C:"line-length" "!PROJECT_DIR!\.ruff.toml"') do (
        if not defined LINE_LEN (
            set "LINE_LEN=%%A"
            set "DETECT_SRC=.ruff.toml"
        )
    )
)

if not defined LINE_LEN if exist "!PROJECT_DIR!\setup.cfg" (
    for /f "tokens=2 delims== " %%A in ('findstr /R /C:"max-line-length" "!PROJECT_DIR!\setup.cfg"') do (
        if not defined LINE_LEN (
            set "LINE_LEN=%%A"
            set "DETECT_SRC=setup.cfg"
        )
    )
)

if not defined LINE_LEN if exist "!PROJECT_DIR!\.flake8" (
    for /f "tokens=2 delims== " %%A in ('findstr /R /C:"max-line-length" "!PROJECT_DIR!\.flake8"') do (
        if not defined LINE_LEN (
            set "LINE_LEN=%%A"
            set "DETECT_SRC=.flake8"
        )
    )
)

if defined LINE_LEN set "LINE_LEN=!LINE_LEN: =!"

if defined LINE_LEN (
    echo !L_DETECT_FOUND!
    echo     !L_DETECT_SRC!: !DETECT_SRC!  ^|  !L_DETECT_VAL!: !LINE_LEN!
    echo.
    set /p "line_override=!L_DETECT_PROMPT! "
    if defined line_override set "LINE_LEN=!line_override!"
) else (
    echo !L_DETECT_NONE!
    echo.
    echo !L_SELECT_LINE!
    echo [1]  79  (!L_LINE_79!)
    echo [2]  80  (!L_LINE_80!)
    echo [3]  88  (!L_LINE_88!)
    echo [4] 100  (!L_LINE_100!)
    echo [5] 120  (!L_LINE_120!)
    echo [0] !L_OPT_EXIT!
    echo.
    set /p line_mode="!L_ENTER_NUM! (0-5): "

    if "!line_mode!"=="0" goto :EXIT
    if "!line_mode!"=="1" set LINE_LEN=79
    if "!line_mode!"=="2" set LINE_LEN=80
    if "!line_mode!"=="3" set LINE_LEN=88
    if "!line_mode!"=="4" set LINE_LEN=100
    if "!line_mode!"=="5" set LINE_LEN=120
)

if not defined LINE_LEN (
    echo !L_ERR_LINE_CHOICE!
    goto :EXIT
)

:: ---------------------------------------------------------
:: Step 4: Action
:: ---------------------------------------------------------
echo.
echo !L_SELECT_ACT!
echo [1] !L_ACT_CHECK!
echo [2] !L_ACT_FMT!
echo [0] !L_OPT_EXIT!
echo.
set /p action_mode="!L_ENTER_NUM! (0-2): "

if "%action_mode%"=="0" goto :EXIT

if "%action_mode%"=="1" (
    set "RUFF_ARGS=check . --line-length !LINE_LEN!"
    set "BLACK_ARGS=. --check --diff --line-length !LINE_LEN!"
    set "ACTION_LABEL=!L_LABEL_CHECK!"
)

if "%action_mode%"=="2" (
    set "RUFF_ARGS=check . --fix --line-length !LINE_LEN!"
    set "BLACK_ARGS=. --line-length !LINE_LEN!"
    set "ACTION_LABEL=!L_LABEL_FMT!"
)

if not defined ACTION_LABEL (
    echo !L_ERR_ACT_CHOICE!
    goto :EXIT
)

:: ---------------------------------------------------------
:: Step 5: Run
:: ---------------------------------------------------------
echo.
echo =======================================================
echo  !L_MODE!:       !ACTION_LABEL!
echo  !L_LINE_LEN!:  !LINE_LEN!
echo  !L_DIRECTORY!: !PROJECT_DIR!
echo =======================================================
echo.

pushd "!PROJECT_DIR!"

:: --- Ruff ---
echo [1/2] !L_RUN_RUFF!
echo       !PYTHON_CMD! -m ruff !RUFF_ARGS!
echo.
!PYTHON_CMD! -m ruff !RUFF_ARGS!
set RUFF_EXIT=!errorlevel!

if !RUFF_EXIT! NEQ 0 (
    echo.
    echo [!] !L_RUFF_FAIL!
) else (
    echo [OK] !L_RUFF_OK!
)

echo.
echo -------------------------------------------------------
echo.

:: --- Black ---
echo [2/2] !L_RUN_BLACK!
echo       !PYTHON_CMD! -m black !BLACK_ARGS!
echo.
!PYTHON_CMD! -m black !BLACK_ARGS!
set BLACK_EXIT=!errorlevel!

if !BLACK_EXIT! NEQ 0 (
    echo.
    if "%action_mode%"=="1" (
        echo [!] !L_BLACK_FAIL_CHK!
    ) else (
        echo [!] !L_BLACK_FAIL_FMT!
    )
) else (
    echo [OK] !L_BLACK_OK!
)

popd

:: ---------------------------------------------------------
:: Summary
:: ---------------------------------------------------------
echo.
echo =======================================================
echo  !L_DONE!
echo  Ruff  - !L_RETURN_CODE!: !RUFF_EXIT!
echo  Black - !L_RETURN_CODE!: !BLACK_EXIT!
echo =======================================================
goto :EXIT

:FATAL
echo.
echo [X] Fatal error: could not enter repository root "%REPO_ROOT%".

:EXIT
echo.
echo Press any key to close
pause >nul
