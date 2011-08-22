
function opschat {
 message="{\"message\":{\"body\":\"$@\"}}"
 curl -v -H'Content-Type: application/json' -d "$message" -u 48742007985bf1dc7b2918eaa07bcba1f878baff:X https://absperf.campfirenow.com/room/277790/speak.json
}
