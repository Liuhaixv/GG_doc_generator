---@author 刘海旭 qq1244653065
---@require EmmyLua-v1.3.6.219
---create time:2021-10-14 0:44:58 UTC+8

---@class int **int数据类型**
---@class double **double数据类型**
---@class bool **bool数据类型**
---@class true **真**
---@class false **假**
---@class long **long数据类型**
---@class mixed **混合数据类型**
---@class gg
gg = { ANDROID_SDK_INT = nil,
       ASM_ARM = nil,
       ASM_ARM64 = nil,
       ASM_THUMB = nil,
       BUILD = nil,
       CACHE_DIR = nil,
       DUMP_SKIP_SYSTEM_LIBS = nil,
       EXT_CACHE_DIR = nil,
       EXT_FILES_DIR = nil,
       EXT_STORAGE = nil,
       FILES_DIR = nil,
       FREEZE_IN_RANGE = nil,
       FREEZE_MAY_DECREASE = nil,
       FREEZE_MAY_INCREASE = nil,
       FREEZE_NORMAL = nil,
       LOAD_APPEND = nil,
       LOAD_VALUES = nil,
       LOAD_VALUES_FREEZE = nil,
       PACKAGE = nil,
       POINTER_EXECUTABLE = nil,
       POINTER_EXECUTABLE_WRITABLE = nil,
       POINTER_NO = nil,
       POINTER_READ_ONLY = nil,
       POINTER_WRITABLE = nil,
       PROT_EXEC = nil,
       PROT_NONE = nil,
       PROT_READ = nil,
       PROT_WRITE = nil,
       REGION_ANONYMOUS = nil,
       REGION_ASHMEM = nil,
       REGION_BAD = nil,
       REGION_C_ALLOC = nil,
       REGION_C_BSS = nil,
       REGION_C_DATA = nil,
       REGION_C_HEAP = nil,
       REGION_CODE_APP = nil,
       REGION_CODE_SYS = nil,
       REGION_JAVA = nil,
       REGION_JAVA_HEAP = nil,
       REGION_OTHER = nil,
       REGION_PPSSPP = nil,
       REGION_STACK = nil,
       REGION_VIDEO = nil,
       SAVE_AS_TEXT = nil,
       SIGN_EQUAL = nil,
       SIGN_FUZZY_EQUAL = nil,
       SIGN_FUZZY_GREATER = nil,
       SIGN_FUZZY_LESS = nil,
       SIGN_FUZZY_NOT_EQUAL = nil,
       SIGN_GREATER_OR_EQUAL = nil,
       SIGN_LESS_OR_EQUAL = nil,
       SIGN_NOT_EQUAL = nil,
       TAB_MEMORY_EDITOR = nil,
       TAB_SAVED_LIST = nil,
       TAB_SEARCH = nil,
       TAB_SETTINGS = nil,
       TYPE_AUTO = nil,
       TYPE_BYTE = nil,
       TYPE_DOUBLE = nil,
       TYPE_DWORD = nil,
       TYPE_FLOAT = nil,
       TYPE_QWORD = nil,
       TYPE_WORD = nil,
       TYPE_XOR = nil,
       VERSION = nil,
       VERSION_IN = nil
}
---# addListItems() #
---Add items to the saved list.
--->
---## Returns ##
--- True or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#abb65d2e0810c3310903158774fd9ec63)
---+ table items
---@param items table A table with a list of items to add.Each element is a table with the following fields:***address***(long,required),***value***(string with a value,optional),***flags***(one of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*,required),***name***(string,optional),***freeze***(boolean,optional,default false),***freezeType***(one of the constants<a class="el" href="classgg.html#FREEZE_">FREEZE_</a>*,optional,default<a class="el" href="classgg.html#a2e8ea09fae1c59d8fc33f5b0cd9c13b6" title="Freezes the value, not allowing it to change.">FREEZE_NORMAL</a>),***freezeFrom***(string,optional),***freezeTo***(string,optional).Values must be in<a class="el" href="scripts_locale.html">English locale</a>.
function gg.addListItems(
        items)
end


---# alert() #
---Displays a dialog with several buttons.---***The return result depends on which of the buttons was pressed.The dialog can be canceled with the"Back"button(return code 0).
--->
---## Returns ##
--- if dialog canceled-0,else:1 for positive,2 for negative,3 for neutral buttons.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a07201e70d15be5ac19da2eb3d1c0e352)
---+ string text
---+ string positive = **'ok'**
---+ string negative = **nil**
---+ string neutral = **nil**
---@param text string Text message.
---@param positive string Text for positive button.This button return code 1.
---@param negative string Text for negative button.This button return code 2.
---@param neutral string Text for neutral button.This button return code 3.
function gg.alert(
        text,
        positive,
        negative,
        neutral)
end


---# allocatePage() #
---Allocated memory page(4 KB)in the target process.
--->
---## Returns ##
--- Address of the page or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a15e72eaba99c1eadac1ccdeb8e2b5009)
---+ int mode = **[gg.PROT_READ|gg.PROT_EXEC](https://gameguardian.net/help/classgg.html#a29f6b407593a8f8188af60d6012e160d)**
---+ long address = **0**
---@param mode int Bit mask of flags<a class="el" href="classgg.html#PROT_">PROT_</a>*.
---@param address long If is not 0,then the kernel takes it as a hint about where to place the page;on Android,the page will be allocated at a nearby address page boundary.
function gg.allocatePage(
        mode,
        address)
end


---# bytes() #
---Gets the text bytes in the specified encoding.
--->
---## Returns ##
--- A table with a set of bytes in the specified encoding.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a7f4074828f647ee5854aae5311bdc1e2)
---+ string text
---+ string encoding = **'UTF-8'**
---@param text string 
---@param encoding string Possible values:***'ISO-8859-1','US-ASCII','UTF-16','UTF-16BE','UTF-16LE','UTF-8'***
function gg.bytes(
        text,
        encoding)
end


---# choice() #
---Displays the selection dialog from the list.---***The list is made up of the ***items*** table.***Selected*** sets the index of the table that will be selected by default.***Items*** must be numberic-array if you want show items in specified order.
--->
---## Returns ##
--- ***nil*** if the dialog has been canceled,or the index of the selected item.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a2226dc4fe42a97691506d63e9305c728)
---+ table items
---+ string selected = **nil**
---+ string message = **nil**
---@param items table Table with items for choice.
---@param selected string Is not specified or is specified as ***nil***,then the list will be without the default choice.
---@param message string Specifies the optional title of the dialog box.
function gg.choice(
        items,
        selected,
        message)
end


---# clearList() #
---Clear the saved list.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a6c58075296a69351c0716745c53586a7)
function gg.clearList(
)
end


---# clearResults() #
---Clear the list of search results.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ae8f5b6b09c5772ca866b689675e619d8)
function gg.clearResults(
)
end


---# copyMemory() #
---Copy memory.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aa6e3128804642403defc1f1004303171)
---+ long from
---+ long to
---+ int bytes
---@param from long Address for source of copy.
---@param to long Address for destination of copy.
---@param bytes int Amount bytes to copy.
function gg.copyMemory(
        from,
        to,
        bytes)
end


---# copyText() #
---Copy text to the clipboard.---***If the second parameter is true or not specified,the text will be converted as a number from the English locale to the selected one.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ad815b037629912b68ce6e028a05f04fd)
---+ string text
---+ bool fixLocale = **true**
---@param text string The text for copy.
---@param fixLocale bool Flag to disable fix locale-specific separators.
function gg.copyText(
        text,
        fixLocale)
end


---# disasm() #
---Disassemble the specified value.
--->
---## Returns ##
--- string Disassembled opcode string.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ae67e0144331a52e3382c782f94d864c5)
---+ int type
---+ long address
---+ int opcode
---@param type int Type.One of the constants<a class="el" href="classgg.html#ASM_">ASM_</a>*.Throws an error if a non-existent type is passed.
---@param address long The address of the value.May be needed for some opcodes.
---@param opcode int Disassembly instruction.To disassemble Thumb32,the first 16-bit instruction should be in the lower half-word of the opcode,and the second in the upper half-word.
function gg.disasm(
        type,
        address,
        opcode)
end


---# dumpMemory() #
---Dump memory to files on disk.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ad597503152fd9557e59751080b418ed1)
---+ long from
---+ long to
---+ string dir
---+ int flags = **nil**
---@param from long Address for start dump.Will be rounded to largest possible memory page.
---@param to long Address for end dump.Will be rounded to smallest possible memory page.
---@param dir string Directory for save dump files.
---@param flags int Set of flags<a class="el" href="classgg.html#DUMP_">DUMP_</a>*or nil.
function gg.dumpMemory(
        from,
        to,
        dir,
        flags)
end


---# editAll() #
---Edit all search results.---***Before call this method you must load results via[getResults](https://gameguardian.net/help/classgg.html#ad0bd7945d37dd140f977ba7180d220f6).***Value*** will be applied only for results with specified ***type***.
--->
---## Returns ##
--- Int with count of changes or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a5f859e6f707b2336152411b19fea7603)
---+ string value
---+ int type
---@param value string String with data for edit.Must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param type int One constant from<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
function gg.editAll(
        value,
        type)
end


---# getActiveTab() #
---Get active tab in the GameGuardian UI.
--->
---## Returns ##
--- int One of the constants[TAB_](https://gameguardian.net/help/classgg.html#TAB_)*.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a4ce467590b19fb53e8984746db0bbb9c)
function gg.getActiveTab(
)
end


---# getFile() #
---Gets the filename of the currently running script.
--->
---## Returns ##
--- The string with the filename of the currently running script.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a835c5691f8e6512057a87e86169a0164)
function gg.getFile(
)
end


---# getLine() #
---Gets the current line number of the script being executed.
--->
---## Returns ##
--- The current line number of the script being executed.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a9f4b62778af4c46ebfadedd8f910025f)
function gg.getLine(
)
end


---# getListItems() #
---Return the contents of the saved list as a table.
--->
---## Returns ##
--- Table with results or string with error.Each element is a table with the following fields:***address***(long),***value***(number),***flags***(one of the constants[TYPE_](https://gameguardian.net/help/classgg.html#TYPE_)*),***name***(string),***freeze***(boolean),***freezeType***(one of the constants[FREEZE_](https://gameguardian.net/help/classgg.html#FREEZE_)*),***freezeFrom***(string),***freezeTo***(string).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a4fd09c150fe2527816abb729dfea2801)
function gg.getListItems(
)
end


---# getLocale() #
---Gets the string with the currently selected locale in the GameGuardian.
--->
---## Returns ##
--- The string with the currently selected locale in the GameGuardian.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a4104ba09f92838c41afdcb011ed6b134)
function gg.getLocale(
)
end


---# getRanges() #
---Return memory regions as bit mask of flags[REGION_](https://gameguardian.net/help/classgg.html#REGION_)*.
--->
---## Returns ##
--- Bit mask of flags[REGION_](https://gameguardian.net/help/classgg.html#REGION_)*.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a046c4d7d9ad8e9a05f31f0b22f815da6)
function gg.getRanges(
)
end


---# getRangesList() #
---Get the list of memory regions of the selected process.
--->
---## Returns ##
--- A list table with memory regions.Each element is a table with fields:***state,start,end,type,name,internalName***.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a8bb9745b0b7ae43f8a228a373031b1ed)
---+ string filter = **''**
---@param filter string The filter string.If specified,only those results that fall under the filter will be returned.Optional.The filter supports wildcards:^-the start of the data,$-the end of the data,*******-any number of any characters,?-the one any character.
function gg.getRangesList(
        filter)
end


---# getResults() #
---Load results into results list and return its as a table.
--->
---## Returns ##
--- Table with results or string with error.Each element is a table with three keys:***address***(long),***value***(number),***flags***(one of the constants[TYPE_](https://gameguardian.net/help/classgg.html#TYPE_)*).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ad0bd7945d37dd140f977ba7180d220f6)
---+ int maxCount
---+ int skip = **0**
---+ long addressMin = **nil**
---+ long addressMax = **nil**
---+ string valueMin = **nil**
---+ string valueMax = **nil**
---+ int type = **nil**
---+ string fractional = **nil**
---+ int pointer = **nil**
---@param maxCount int Max count of loaded results.
---@param skip int The count of skipped results from the beginning.By default-0.
---@param addressMin long The minimum value of the address.Number or nil.
---@param addressMax long The maximum value of the address.Number or nil.
---@param valueMin string The minimum value of the value.Number as string or nil.
---@param valueMax string The maximum value of the value.Number as string or nil.
---@param type int Set of flags<a class="el" href="classgg.html#TYPE_">TYPE_</a>*or nil.
---@param fractional string Filter by fractional values.If the first character is"!",then the filter will exclude all values whose fractional part matches the specified one.
---@param pointer int Set of flags<a class="el" href="classgg.html#POINTER_">POINTER_</a>*or nil.
function gg.getResults(
        maxCount,
        skip,
        addressMin,
        addressMax,
        valueMin,
        valueMax,
        type,
        fractional,
        pointer)
end


---# getResultsCount() #
---Get the number of found results.
--->
---## Returns ##
--- The number of found results.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a1123e55c5eb365b425ccfe465c52c510)
function gg.getResultsCount(
)
end


---# getSelectedElements() #
---Returns the selected adresses in the memory editor.
--->
---## Returns ##
--- Table with adresses(long)or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a2aa4dc815a6254dfd3b04d4ed00f3625)
function gg.getSelectedElements(
)
end


---# getSelectedListItems() #
---Returns the selected items in the saved lists.
--->
---## Returns ##
--- Table with results or string with error.Each element is a table with the following fields:***address***(long),***value***(number),***flags***(one of the constants[TYPE_](https://gameguardian.net/help/classgg.html#TYPE_)*),***name***(string),***freeze***(boolean),***freezeType***(one of the constants[FREEZE_](https://gameguardian.net/help/classgg.html#FREEZE_)*),***freezeFrom***(string),***freezeTo***(string).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a6ded5810fd595f3eb7b3a6fd74ce888e)
function gg.getSelectedListItems(
)
end


---# getSelectedResults() #
---Returns the selected items in the search results.
--->
---## Returns ##
--- Table with results or string with error.Each element is a table with three keys:***address***(long),***value***(number),***flags***(one of the constants[TYPE_](https://gameguardian.net/help/classgg.html#TYPE_)*).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a15affbed7a88173aa69d92bd4d4da262)
function gg.getSelectedResults(
)
end


---# getSpeed() #
---Get the current speed from the speedhack.
--->
---## Returns ##
--- The current speed from the speedhack.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a2e4acdf2555e25e9230213f7b8c9a0d2)
function gg.getSpeed(
)
end


---# getTargetInfo() #
---Get a table with information about the selected process if possible.---***The set of fields can be different.Print the resulting table to see the available fields.---***Possible fields:***firstInstallTime,lastUpdateTime,packageName,sharedUserId,sharedUserLabel,versionCode,versionName,activities(name,label),installer,enabledSetting,backupAgentName,className,dataDir,descriptionRes,flags,icon,labelRes,logo,manageSpaceActivityName,name,nativeLibraryDir,permission,processName,publicSourceDir,sourceDir,targetSdkVersion,taskAffinity,theme,uid,label,cmdLine,pid,x64,RSS.***---******cmdLine***-The contents of ***/proc/pid/cmdline***.***pid***-PID of the process.***x64***-True if the 64-bit process.***RSS***-The amount of RSS memory for the process,in KB.---***Read about[PackageInfo](https://developer.android.com/reference/android/content/pm/PackageInfo)and[ApplicationInfo](https://developer.android.com/reference/android/content/pm/ApplicationInfo)in ***Android*** for means each field.
--->
---## Returns ##
--- A table with information about the selected process or ***nil***.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a312c7d90473026e38c67ffd24fd970d7)
function gg.getTargetInfo(
)
end


---# getTargetPackage() #
---Get the package name of the selected process,if possible.
--->
---## Returns ##
--- The package name of the selected process as string or ***nil***.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a7593ecb25a430e1f2dfda805a7799ce8)
function gg.getTargetPackage(
)
end


---# getValues() #
---Gets the values for the list of items.
--->
---## Returns ##
--- A new table with results or string with error.Each element is a table with three keys:***address***(long),***value***(number),***flags***(one of the constants[TYPE_](https://gameguardian.net/help/classgg.html#TYPE_)*).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aae2b60904e15c3612a0d2d6385e0e3e3)
---+ table values
---@param values table The table as a list of tables with ***address*** and ***flags*** fields(one of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*).
function gg.getValues(
        values)
end


---# getValuesRange() #
---Get the memory regions for the passed value table.
--->
---## Returns ##
--- A table where each key,from the original table,will be associated with a short region code(***Ch***,for example).Or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a1d5e6284862c444be70ab4cc0c805cc0)
---+ table values
---@param values table The table can be either an address list or a list of tables with the ***address*** field.
function gg.getValuesRange(
        values)
end


---# gotoAddress() #
---Go to the ***address*** in the memory editor.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a44294c4496b6b87ba9589d2691e70728)
---+ long address
---@param address long Desired address.
function gg.gotoAddress(
        address)
end


---# hideUiButton() #
---Hides the UI button.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a46b78a631174e0c2ea89664c51426440)
function gg.hideUiButton(
)
end


---# isClickedUiButton() #
---Gets the click status of the ui button.---***The call resets the click status.
--->
---## Returns ##
--- ***true*** if the button has been clicked since the last check.***false***-if there was no click.***nil***-if the button is hidden.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#add52a86cbf6695bb421cc86f4aa0e695)
function gg.isClickedUiButton(
)
end


---# isPackageInstalled() #
---Check whether the specified application is installed on the system by the package name.
--->
---## Returns ##
--- ***true*** if package installed or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#adee31e961b7c3a6c6b2f9b50f84ef5d5)
---+ string pkg
---@param pkg string String with package name.
function gg.isPackageInstalled(
        pkg)
end


---# isProcessPaused() #
---Get pause state of the selected process.
--->
---## Returns ##
--- ***true*** if the process paused or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#abf769c87d2eca8b2a61847c9e9b5440e)
function gg.isProcessPaused(
)
end


---# isVisible() #
---Check if the GameGuardian UI is open.
--->
---## Returns ##
--- ***true*** if the GameGuardian UI open or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aadc2f7e6c414e3e7016fb654293daa7f)
function gg.isVisible(
)
end


---# loadList() #
---Load the saved list from the file.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a5ddfc95e74d6db1b10edfac77da9c7bd)
---+ string file
---+ int flags = **0**
---@param file string File for load.
---@param flags int Set of flags<a class="el" href="classgg.html#LOAD_">LOAD_</a>*.
function gg.loadList(
        file,
        flags)
end


---# loadResults() #
---Loads the search results from the table.---***Existing search results will be cleared.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ade5f40667e80938ba1678d0623fe7b82)
---+ table results
---@param results table The table as a list of tables with ***address*** and ***flags*** fields(one of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*).
function gg.loadResults(
        results)
end


---# makeRequest() #
---Performs a GET or POST request over HTTP or HTTPS.---***The first time the function is called,the user is asked to access the Internet.Request one for each script run.If the user declines access,all subsequent calls will immediately return an error.If allowed-will be processed immediately.Permission to access must be obtained each time the script is run.---***The function executes the query and returns a table with the result on success.On error,the string with the error text will be returned.In logcat there will be more information.---***The result table can contain the following fields:---***HTTPS requests do not perform certificate validation.
--->
---## Returns ##
--- The table on success,the string on error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ad020d50d3af0a36733e0cbc231055c55)
---+ string url
---+ table headers = **{}**
---+ string data = **nil**
---@param url string A string with a URL.
---@param headers table A table with request headers.The key is the name.The value is a table or a string.If this is a table,then the keys are ignored,and the values​​are used.
---@param data string A string with data for the POST request.If you specify ***nil***,then there will be a GET request.
function gg.makeRequest(
        url,
        headers,
        data)
end


---# multiChoice() #
---Displays the multiple choice dialog.---******Items*** must be numberic-array if you want show items in specified order.
--->
---## Returns ##
--- ***nil*** if the dialog has been canceled,or a table with the selected keys and values ***true***(analogue of the ***selected*** param).
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a1325b0f7c85d6ad6dd8c6f87ada2e126)
---+ table items
---+ table selection = **{}**
---+ string message = **nil**
---@param items table Table with items for choice.
---@param selection table The table specifies the selection status for each item from ***items*** by same key.If key not found then the element will be unchecked.
---@param message string Specifies the optional title of the dialog box.
function gg.multiChoice(
        items,
        selection,
        message)
end


---# numberFromLocale() #
---Replaces the localized decimal separator and thousands separator with separators used in Lua(such as in English).
--->
---## Returns ##
--- Fixed number as string.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a6b00bebbe49d7b71e81eb394b7c1bd60)
---+ string num
---@param num string Number or string to replace.
function gg.numberFromLocale(
        num)
end


---# numberToLocale() #
---Replaces the decimal separator and the thousands separator with a localized version.
--->
---## Returns ##
--- Fixed number as string.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ae8d36bdd3fa61c880d4ac01aa1fb7840)
---+ string num
---@param num string Number or string to replace.
function gg.numberToLocale(
        num)
end


---# processKill() #
---Force kill the selected process.---***If you call this call too often,your script may be interrupted.
--->
---## Returns ##
--- ***true*** on success or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aa26601754a21b4e26d5c22f1930a424d)
function gg.processKill(
)
end


---# processPause() #
---Pauses the selected process.
--->
---## Returns ##
--- ***true*** on success or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a14e502f895d2e989ebb31dc101f1b325)
function gg.processPause(
)
end


---# processResume() #
---Resumes the selected process if it paused.
--->
---## Returns ##
--- ***true*** on success or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a631b8926d5f1457142a77e04b14479de)
function gg.processResume(
)
end


---# processToggle() #
---Toggle the pause state of the selected process.---***If process paused then it will be resumed else it will be paused.
--->
---## Returns ##
--- ***true*** on success or ***false*** otherwise.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a2210c6b299c979db8366c9b73b21ce7b)
function gg.processToggle(
)
end


---# prompt() #
---Displays the dialog for data entry.---***For respect order of fields ***prompts*** must be numeric-array.---***Also for the types ***'number','setting','speed'***,the separators are converted to a localized version and vice versa during output.---***For example,the string ***'6,789.12345'*** will be in the form displayed as ***'6789,12345'*** for the German locale(***','***-decimal separator,***'.'***-thousands separator).If the user enters ***'4.567,89'***,then the script will receive ***'4567.89'***.---***To display the seek bar,you must specify the type ***'number'***,the minimum and maximum value at the end of the prompt text,separated by a semicolon and surrounded by square brackets.The minimum value must be less than the maximum.If the default value is not in the range,the closest match will be used.Only integers can be used.The step size is always 1.---***See examples.---***If the config for seek bar is not recognized,the usual input of a number as text will be used.
--->
---## Returns ##
--- ***nil*** if the dialog has been canceled,or the table with keys from ***prompts*** and values from input fields.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#afe6c5b86ba0ae295899fd259232aac2b)
---+ table prompts
---+ table defaults = **{}**
---+ table types = **{}**
---@param prompts table The table specifies the keys and description for each input field.
---@param defaults table The table specifies the default values for each key from ***prompts***.
---@param types table The table specifies the types for each key from ***prompts***.Valid types:***'number','text','path','file','new_file','setting','speed','checkbox'***.From the type depends output of additional elements near the input field(for example,buttons for selecting a path or file,internal or external keyboard and so on).
function gg.prompt(
        prompts,
        defaults,
        types)
end


---# refineAddress() #
---Perform an address refine search with the specified parameters.---***If no results in results list then do nothing.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ac9ab914721b74655c33bd4fb2c1d24fe)
---+ string text
---+ long mask = **-1**
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ int sign = **[gg.SIGN_EQUAL](https://gameguardian.net/help/classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param text string Search string.The format same as the format for the search from the GameGuardian UI.But it must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param mask long Mask.Default is ***-1(0xFFFFFFFFFFFFFFFF)***.
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param sign int Sign.<a class="el" href="classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b">SIGN_EQUAL</a>or<a class="el" href="classgg.html#a0c18d03d45168220e55194396e89dd2b">SIGN_NOT_EQUAL</a>.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.refineAddress(
        text,
        mask,
        type,
        sign,
        memoryFrom,
        memoryTo,
        limit)
end


---# refineNumber() #
---Perform a refine search for a number,with the specified parameters.---***If no results in results list then do nothing.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#af8db369eec670115dc1de4d8fcf88494)
---+ string text
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ bool encrypted = **false**
---+ int sign = **[gg.SIGN_EQUAL](https://gameguardian.net/help/classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param text string String for search.The format same as the format for the search from the GameGuardian UI.But it must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param encrypted bool Flag for run search encrypted values.
---@param sign int Sign.One of the constants<a class="el" href="classgg.html#SIGN_">SIGN_</a>*.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.refineNumber(
        text,
        type,
        encrypted,
        sign,
        memoryFrom,
        memoryTo,
        limit)
end


---# removeListItems() #
---Remove items from the saved list.
--->
---## Returns ##
--- True or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#acd9121c341a53a0979468c676f6c87c5)
---+ table items
---@param items table The table as a list of tables with ***address***.Or the table as a list of adresses.
function gg.removeListItems(
        items)
end


---# removeResults() #
---Remove ***results*** from the list of results found.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a8f071ffc8c15f4b4797af06f9e262583)
---+ table results
---@param results table The table as a list of tables with ***address*** and ***flags*** fields(one of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*).
function gg.removeResults(
        results)
end


---# require() #
---Checks the version of GameGuardian.---***If the version or build number is lower than required,the script will be ended with the message to update GameGuardian.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a4b6b2a5e23317b9fc194cdf21e3331ba)
---+ string version = **nil**
---+ int build = **0**
---@param version string Minimal version of GameGuardian to run the script.
---@param build int Minimal build number to run the script.Optional.
function gg.require(
        version,
        build)
end


---# saveList() #
---Save the saved list to the file.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a18bdecc384ccee353a2fc2eab24b0c5b)
---+ string file
---+ int flags = **0**
---@param file string File to save.
---@param flags int Set of flags<a class="el" href="classgg.html#SAVE_">SAVE_</a>*.
function gg.saveList(
        file,
        flags)
end


---# saveVariable() #
---Saves the variable to a file.---***The result of the execution will be a.lua file,which can then be loaded via---***Stores only strings,numbers,and tables.Cyclic references are processed correctly.If you need something more,read:[lua-users wiki:Table Serialization](http://lua-users.org/wiki/TableSerialization)
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a204f5dea60cac80c39521ceb4936a83b)
---+ mixed variable
---+ string filename
---@param variable mixed Variable to save.
---@param filename string Full path to save the file.
function gg.saveVariable(
        variable,
        filename)
end


---# searchAddress() #
---Perform an address search with the specified parameters.---***If no results in results list then perform new search,else refine search.So if you need to perform a search,without refine,you must first call ***clearResults***.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a74d5735b2f21d39e4fda5a787ddb10a2)
---+ string text
---+ long mask = **-1**
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ int sign = **[gg.SIGN_EQUAL](https://gameguardian.net/help/classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param text string Search string.The format same as the format for the search from the GameGuardian UI.But it must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param mask long Mask.Default is ***-1(0xFFFFFFFFFFFFFFFF)***.
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param sign int Sign.<a class="el" href="classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b">SIGN_EQUAL</a>or<a class="el" href="classgg.html#a0c18d03d45168220e55194396e89dd2b">SIGN_NOT_EQUAL</a>.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.searchAddress(
        text,
        mask,
        type,
        sign,
        memoryFrom,
        memoryTo,
        limit)
end


---# searchFuzzy() #
---Refine fuzzy search,with the specified parameters.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aa6e630607d1378da33bf34203a81ea66)
---+ string difference = **'0'**
---+ int sign = **[gg.SIGN_FUZZY_EQUAL](https://gameguardian.net/help/classgg.html#a07729687f603d1c7e442f53dc23d5c03)**
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param difference string Difference between old and new values.By default is ***'0'***.Must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param sign int Sign.One of the constants<a class="el" href="classgg.html#SIGN_FUZZY_">SIGN_FUZZY_</a>*.
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.searchFuzzy(
        difference,
        sign,
        type,
        memoryFrom,
        memoryTo,
        limit)
end


---# searchNumber() #
---Perform a search for a number,with the specified parameters.---***If no results in results list then perform new search,else refine search.So if you need to perform a search,without refine,you must first call ***clearResults***.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a14685d871e664a2f8ea74dc3293e428e)
---+ string text
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ bool encrypted = **false**
---+ int sign = **[gg.SIGN_EQUAL](https://gameguardian.net/help/classgg.html#abbeb4e97410b798aafde34f6bd4e5b1b)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param text string String for search.The format same as the format for the search from the GameGuardian UI.But it must be in<a class="el" href="scripts_locale.html">English locale</a>.
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param encrypted bool Flag for run search encrypted values.
---@param sign int Sign.One of the constants<a class="el" href="classgg.html#SIGN_">SIGN_</a>*.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.searchNumber(
        text,
        type,
        encrypted,
        sign,
        memoryFrom,
        memoryTo,
        limit)
end


---# searchPointer() #
---Searches for values that may be pointers to elements of the current search result.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a5eef9aac9f02932a4c67a184edec2bd4)
---+ int maxOffset
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param maxOffset int Maximum offset for pointers.Valid values:0-65535.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.searchPointer(
        maxOffset,
        memoryFrom,
        memoryTo,
        limit)
end


---# setRanges() #
---Set memory regions to desired bit mask of flags[REGION_](https://gameguardian.net/help/classgg.html#REGION_)*.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a26f376a1d243ec199b1ae48578d2a303)
---+ int ranges
---@param ranges int Bit mask of flags<a class="el" href="classgg.html#REGION_">REGION_</a>*.
function gg.setRanges(
        ranges)
end


---# setSpeed() #
---Set the speed of the speedhack.---***If speedhack was not loaded,then it will be loaded.The call is blocking.The script will wait for speedhack full load.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a9251c9728e8ce91588581222a885457e)
---+ double speed
---@param speed double Desired speed.Must be in range[1.0E-9;1.0E9].
function gg.setSpeed(
        speed)
end


---# setValues() #
---Set the values for the list of items.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a91d0ba1d5ff843ce26eef210dae956f1)
---+ table values
---@param values table The table as a list of tables with three keys:***address***(long),***value***(string with a value),***flags***(one of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*).Values must be in<a class="el" href="scripts_locale.html">English locale</a>.
function gg.setValues(
        values)
end


---# setVisible() #
---Open or close the GameGuardian UI.---***If you call this call too often,your script may be interrupted.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a6d8ab51c745808c554f4f953d8e05c94)
---+ bool visible
---@param visible bool ***true*** for open GameGuardian UI or ***false*** for hide.*
function gg.setVisible(
        visible)
end


---# showUiButton() #
---Shows the UI button.---***The UI button has an icon with the letters"Sx"and is visible only when you open the GameGuardian interface.The button is floating,displayed on top of the main GameGuardian interface.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#aff2f0d578e76655f85062c2af181f5c0)
function gg.showUiButton(
)
end


---# skipRestoreState() #
---Do not restore the state of the GameGuardian,after the script is completed.---***For example,by default,a set of memory regions restored after end script execution.This call allow prevent this.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#adeeda53b8c73719751b8a61682686152)
function gg.skipRestoreState(
)
end


---# sleep() #
---Causes the currently executing script to sleep(temporarily cease execution)for the specified number of milliseconds,subject to the precision and accuracy of system timers and schedulers.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a5f281d50d0ff0846c9c0594a61895dce)
---+ int milliseconds
---@param milliseconds int The length of time to sleep in milliseconds.
function gg.sleep(
        milliseconds)
end


---# startFuzzy() #
---Start a fuzzy search,with the specified parameters.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ab0389889345fcbe17ff30518813d679a)
---+ int type = **[gg.TYPE_AUTO](https://gameguardian.net/help/classgg.html#a2caf0befac443b24f1044eeb4003eee4)**
---+ long memoryFrom = **0**
---+ long memoryTo = **-1**
---+ long limit = **0**
---@param type int Type.One of the constants<a class="el" href="classgg.html#TYPE_">TYPE_</a>*.
---@param memoryFrom long Start memory address for the search.
---@param memoryTo long End memory address for the search.
---@param limit long Stopping the search after finding the specified number of results.0 means to search all results.
function gg.startFuzzy(
        type,
        memoryFrom,
        memoryTo,
        limit)
end


---# timeJump() #
---Performs a time jump.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#ac68c41b1af585cbfb94aeae01389a798)
---+ string time
---@param time string String with time.The format is similar to the time format in the time jump dialog.But it must be in<a class="el" href="scripts_locale.html">English locale</a>.
function gg.timeJump(
        time)
end


---# toast() #
---Show the toast.---***If the second parameter is true,show the toast for a short period of time.---***A toast is a view containing a quick little message for the user.---***When the view is shown to the user,appears as a floating view over the application.It will never receive focus.The user will probably be in the middle of typing something else.The idea is to be as unobtrusive as possible,while still showing the user the information you want them to see.Two examples are the volume control,and the brief message saying that your settings have been saved.
--->
---## Returns ##
---null
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a14144989fbce29eb3547068c524fa433)
---+ string text
---+ bool fast = **false**
---@param text string The text for toast.
---@param fast bool Flag for show the toast for a short period of time.
function gg.toast(
        text,
        fast)
end


---# unrandomizer() #
---Work with Unrandomizer.---***If Unrandomizer was not loaded,then it will be loaded.The call is blocking.The script will wait for Unrandomizer full load.You can set any parameter in ***nil*** so that it is not used.
--->
---## Returns ##
--- ***true*** or string with error.
---***
---[官方文档 Official Doc](https://gameguardian.net/help/classgg.html#a731e37ee1e891c708dc58d61e7005dab)
---+ long qword = **nil**
---+ long qincr = **nil**
---+ double double_ = **nil**
---+ double dincr = **nil**
---@param qword long Qword parameter.Set to ***nil*** to disable.
---@param qincr long Qword increment.Set to ***nil*** to disable.
---@param double_ double Double parameter.Set to ***nil*** to disable.
---@param dincr double Double increment.Set to ***nil*** to disable.
function gg.unrandomizer(
        qword,
        qincr,
        double_,
        dincr)
end


