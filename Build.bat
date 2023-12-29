@echo off
::https://github.com/mstorsjo/llvm-mingw/releases/download/20231128/llvm-mingw-20231128-msvcrt-x86_64.zip
set CLANG_OPTION=-Xlinker /SECTION:.all,ERW -Xlinker /MERGE:.text=.all -Xlinker /MERGE:.rdata=.all -Xlinker /MERGE:.data=.all -Xlinker /STACK:0x100000,0x100000 -Wl,--entry=Main,-O3,-icf=all,-s,--strip-all,--gc-sections,--disable-dynamicbase,--disable-high-entropy-va,--disable-nxcompat,--disable-reloc-section,--disable-runtime-pseudo-reloc,--no-guard-cf,--no-guard-longjmp,--no-insert-timestamp,--no-seh -fno-addrsig -fno-split-stack -fno-stack-protector -mno-stack-arg-probe -nostartfiles -nodefaultlibs -Oz -flto=full -ffunction-sections -fdata-sections -fno-exceptions -fdwarf-exceptions -fno-asynchronous-unwind-tables -fno-unwind-tables
set LINK_LIBS=-lkernel32 -lntdll -ladvapi32
set CLANG_TARGET=-m64 -target x86_64-windows-gnu
clang %CLANG_OPTION% %LINK_LIBS% %CLANG_TARGET% main.c -o WindowsMemorySwap.exe
::set CLANG_TARGET=-m32 -target i686-windows-gnu
::clang %CLANG_OPTION% %LINK_LIBS% %CLANG_TARGET% main.c -o WindowsMemorySwap_win32.exe
pause