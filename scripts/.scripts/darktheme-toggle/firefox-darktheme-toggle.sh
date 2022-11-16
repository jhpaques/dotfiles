PROFILE="t3p17f9r.default-release"
HOUR=$(date +%H)

DARK_MODE_SETTING=0
if [ $HOUR -gt 19 ] || [ $HOUR -lt 8 ]
then
	DARK_MODE_SETTING=1
fi

sed -i "s/user_pref(\"ui.systemUsesDarkTheme\",.*);/user_pref(\"ui.systemUsesDarkTheme\",$DARK_MODE_SETTING);/" ~/.mozilla/firefox/$PROFILE/prefs.js
