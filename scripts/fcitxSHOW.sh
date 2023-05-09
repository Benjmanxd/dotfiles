FCITX_KEYBOARD=$(gdbus call -e -d org.fcitx.Fcitx -o "/inputmethod" -m "org.fcitx.Fcitx.InputMethod.GetCurrentIM" | sed "s/(\|)\|,\|'//g")

if [[ $FCITX_KEYBOARD = "fcitx-keyboard-us" ]]; then
    echo "Eng"
elif [[ $FCITX_KEYBOARD = "mozc" ]]; then
    echo "日"
elif [[ $FCITX_KEYBOARD = "rime" ]]; then
    echo "中"
fi

#fcitx-keyboard-us
#mozc
#rime
