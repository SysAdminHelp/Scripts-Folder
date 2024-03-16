# Dirty Pipe Vuln Checker

KERNELVARIABLE=$(uname -r| grep -o -e .\\...)
if [[ $KERNELVARIABLE == "5.8" || $KERNELVARIABLE == "5.9" || $KERNELVARIABLE == "5.10" || $KERNELVARIABLE == "5.11" || $KERNELVARIABLE == "5.12" || $KERNELVARIABLE == "5.13" || $KERNELVARIABLE == "5.14" || $KERNELVARIABLE == "5.15" || $KERNELVARIABLE == "5.16" || $KERNELVARIABLE == "5.17" ]];
then
echo "This system has kernel $KERNELVARIABLE, it MAY vulnerable to the Dirty Pipe Vulnerability CVE-2022-0847 "
else 
echo "This system has kernel $KERNELVARIABLE, it IS NOT not vulnerable to the Dirty Pipe Vulnerability CVE-2022-0847 "
fi



