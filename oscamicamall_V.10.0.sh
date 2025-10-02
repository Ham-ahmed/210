#!/bin/sh
#

# Colors to go out
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "#########################################################"
echo "#      Start downloading and installing  oscamicamall      #"
echo "#########################################################"
echo -e "${NC}"

IPK_URL="https://raw.githubusercontent.com/Ham-ahmed/210/refs/heads/main/enigma2-plugin-softcams-oscamicamall_V.10.0.Update-no-Kitte888_all.ipk"
IPK_NAME="enigma2-plugin-softcams-oscamicamall_V.10.0.Update-no-Kitte888_all.ipk"
IPK_PATH="/var/volatile/tmp/$IPK_NAME"

echo -e "${YELLOW}Downloading the oscamicamall...${NC}"
wget -O $IPK_PATH $IPK_URL

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ oscamicamall has been downloaded successfully....${NC}"
else
    echo -e "${RED}✗ Failed to download oscamicamall...${NC}"
    exit 1
fi

echo -e "${YELLOW}Downloading the oscamicamall...${NC}"
opkg install --force-overwrite $IPK_PATH

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ The plugin has been installed successfully...${NC}"
else
    echo -e "${RED}✗ Failed to download oscamicamall ...${NC}"
    exit 1
fi

echo -e "${YELLOW}Cleaning temporary files...${NC}"
rm -f $IPK_PATH

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Temporary files have been cleaned ...${NC}"
else
    echo -e "${YELLOW}⚠ Note: Unable to delete some temporary files ...${NC}"
fi

sleep 2

echo -e "${PURPLE}"
echo ""
echo ""
echo "#################################################################"
echo "#${GREEN}              تم التثبيت بنجاح                ${PURPLE}#"
echo "#${BLUE}           ON - MagicpanelPro v6.2             ${PURPLE}#"
echo "#${YELLOW}         A reboot is required Enigma2        ${PURPLE}#"
echo "#${CYAN}       .::Uploaded by  >>>> HAMDY_AHMED::.     ${PURPLE}#"
echo "#${WHITE} https://www.facebook.com/share/g/18qCRuHz26/ ${PURPLE}#"
echo "#################################################################"
echo "#${RED}           The device will now restart          ${PURPLE}#"
echo "#################################################################"
echo -e "${NC}"

wait
echo -e "${YELLOW}restart Enigma2...${NC}"
killall -9 enigma2
exit 0