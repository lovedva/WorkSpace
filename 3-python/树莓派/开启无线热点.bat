netsh wlan set hostednetwork mode=allow
set /p a=Win10_hotSpot
set /p b=01234567
netsh wlan set hostednetwork ssid=%a%
netsh wlan set hostednetwork key=%b%
netsh wlan start hostednetwork