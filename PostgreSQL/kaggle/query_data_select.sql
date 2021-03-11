COPY( SELECT
CASE
    WHEN (gender LIKE '-unknown-') THEN 1
    WHEN (gender LIKE 'MALE') THEN 2
    WHEN (gender LIKE 'FEMALE') THEN 3
    WHEN (gender LIKE 'OTHER') THEN 4
    ELSE 0
END AS "gender",
CASE
    WHEN (signup_method LIKE 'facebook') THEN 1
    WHEN (signup_method LIKE 'basic') THEN 2
    WHEN (signup_method LIKE 'google') THEN 3
    WHEN (signup_method LIKE 'weibo') THEN 4
    ELSE 0
END AS "signup_method",
CASE
    WHEN (language LIKE 'en') THEN 1
    WHEN (language LIKE 'fr') THEN 2
    WHEN (language LIKE 'de') THEN 3
    WHEN (language LIKE 'es') THEN 4
    WHEN (language LIKE 'it') THEN 5
    WHEN (language LIKE 'pt') THEN 6
    WHEN (language LIKE 'zh') THEN 7
    WHEN (language LIKE 'ko') THEN 8
    WHEN (language LIKE 'ja') THEN 9
    WHEN (language LIKE 'ru') THEN 10
    WHEN (language LIKE 'pl') THEN 11
    WHEN (language LIKE 'el') THEN 12
    WHEN (language LIKE 'sv') THEN 13
    WHEN (language LIKE 'nl') THEN 14
    WHEN (language LIKE 'hu') THEN 15
    WHEN (language LIKE 'da') THEN 16
    WHEN (language LIKE 'id') THEN 17
    WHEN (language LIKE 'fi') THEN 18
    WHEN (language LIKE 'no') THEN 19
    WHEN (language LIKE 'tr') THEN 20
    WHEN (language LIKE 'th') THEN 21
    WHEN (language LIKE 'cs') THEN 22
    WHEN (language LIKE 'hr') THEN 23
    WHEN (language LIKE 'ca') THEN 24
    WHEN (language LIKE 'is') THEN 25
    WHEN (language LIKE '-unknown-') THEN 26
    ELSE 0
END AS "language",
CASE
    WHEN (affiliate_channel LIKE 'direct') THEN 1
    WHEN (affiliate_channel LIKE 'seo') THEN 2
    WHEN (affiliate_channel LIKE 'other') THEN 3
    WHEN (affiliate_channel LIKE 'sem-non-brand') THEN 4
    WHEN (affiliate_channel LIKE 'content') THEN 5
    WHEN (affiliate_channel LIKE 'sem-brand') THEN 6
    WHEN (affiliate_channel LIKE 'remarketing') THEN 7
    WHEN (affiliate_channel LIKE 'api') THEN 8
    ELSE 0
END AS "affiliate_channel",
CASE
    WHEN (affiliate_provider LIKE 'direct') THEN 1
    WHEN (affiliate_provider LIKE 'google') THEN 2
    WHEN (affiliate_provider LIKE 'other') THEN 3
    WHEN (affiliate_provider LIKE 'craigslist') THEN 4
    WHEN (affiliate_provider LIKE 'facebook') THEN 5
    WHEN (affiliate_provider LIKE 'vast') THEN 6
    WHEN (affiliate_provider LIKE 'bing') THEN 7
    WHEN (affiliate_provider LIKE 'meetup') THEN 8
    WHEN (affiliate_provider LIKE 'facebook-open-graph') THEN 9
    WHEN (affiliate_provider LIKE 'email-marketing') THEN 10
    WHEN (affiliate_provider LIKE 'yahoo') THEN 11
    WHEN (affiliate_provider LIKE 'padmapper') THEN 12
    WHEN (affiliate_provider LIKE 'gsp') THEN 13
    WHEN (affiliate_provider LIKE 'wayn') THEN 14
    WHEN (affiliate_provider LIKE 'naver') THEN 15
    WHEN (affiliate_provider LIKE 'baidu') THEN 16
    WHEN (affiliate_provider LIKE 'yandex') THEN 17
    WHEN (affiliate_provider LIKE 'daum') THEN 18
    ELSE 0
END AS "affiliate_provider",
CASE
    WHEN (first_affiliate_tracked LIKE 'untracked') THEN 1
    WHEN (first_affiliate_tracked LIKE 'omg') THEN 2
    WHEN (first_affiliate_tracked LIKE 'first_affiliate_tracked_unknown') THEN 3
    WHEN (first_affiliate_tracked LIKE 'linked') THEN 4
    WHEN (first_affiliate_tracked LIKE 'tracked-other') THEN 5
    WHEN (first_affiliate_tracked LIKE 'product') THEN 6
    WHEN (first_affiliate_tracked LIKE 'marketing') THEN 7
    WHEN (first_affiliate_tracked LIKE 'local ops') THEN 8
    ELSE 0
END AS "first_affiliate_tracked",
CASE
    WHEN (signup_app LIKE 'Web') THEN 1
    WHEN (signup_app LIKE 'Moweb') THEN 2
    WHEN (signup_app LIKE 'iOS') THEN 3
    WHEN (signup_app LIKE 'Android') THEN 4
    ELSE 0
END AS "signup_app",
CASE
    WHEN (first_device_type LIKE 'Mac Desktop') THEN 1
    WHEN (first_device_type LIKE 'Windows Desktop') THEN 2
    WHEN (first_device_type LIKE 'iPhone') THEN 3
    WHEN (first_device_type LIKE 'Other/Unknown') THEN 4
    WHEN (first_device_type LIKE 'Desktop (Other)') THEN 5
    WHEN (first_device_type LIKE 'Android Tablet') THEN 6
    WHEN (first_device_type LIKE 'iPad') THEN 7
    WHEN (first_device_type LIKE 'Android Phone') THEN 8
    WHEN (first_device_type LIKE 'SmartPhone (Other)') THEN 9
    ELSE 0
END AS "first_device_type",
CASE
    WHEN (first_browser LIKE 'Chrome') THEN 1
    WHEN (first_browser LIKE 'IE') THEN 2
    WHEN (first_browser LIKE 'Firefox') THEN 3
    WHEN (first_browser LIKE 'Safari') THEN 4
    WHEN (first_browser LIKE '-unknown-') THEN 5
    WHEN (first_browser LIKE 'Mobile Safari') THEN 6
    WHEN (first_browser LIKE 'Chrome Mobile') THEN 7
    WHEN (first_browser LIKE 'RockMelt') THEN 8
    WHEN (first_browser LIKE 'Chromium') THEN 9
    WHEN (first_browser LIKE 'Android Browser') THEN 10
    WHEN (first_browser LIKE 'AOL Explorer') THEN 11
    WHEN (first_browser LIKE 'Palm Pre web browser') THEN 12
    WHEN (first_browser LIKE 'Mobile Firefox') THEN 13
    WHEN (first_browser LIKE 'Opera') THEN 14
    WHEN (first_browser LIKE 'TenFourFox') THEN 15
    WHEN (first_browser LIKE 'IE Mobile') THEN 16
    WHEN (first_browser LIKE 'Apple Mail') THEN 17
    WHEN (first_browser LIKE 'Silk') THEN 18
    WHEN (first_browser LIKE 'Camino') THEN 19
    WHEN (first_browser LIKE 'Arora') THEN 20
    WHEN (first_browser LIKE 'BlackBerry Browser') THEN 21
    WHEN (first_browser LIKE 'SeaMonkey') THEN 22
    WHEN (first_browser LIKE 'Iron') THEN 23
    WHEN (first_browser LIKE 'Sogou Explorer') THEN 24
    WHEN (first_browser LIKE 'IceWeasel') THEN 25
    WHEN (first_browser LIKE 'Opera Mini') THEN 26
    WHEN (first_browser LIKE 'SiteKiosk') THEN 27
    WHEN (first_browser LIKE 'Maxthon') THEN 28
    WHEN (first_browser LIKE 'Kindle Browser') THEN 29
    WHEN (first_browser LIKE 'CoolNovo') THEN 30
    WHEN (first_browser LIKE 'Conkeror') THEN 31
    WHEN (first_browser LIKE 'wOSBrowser') THEN 32
    WHEN (first_browser LIKE 'Google Earth') THEN 33
    WHEN (first_browser LIKE 'Crazy Browser') THEN 34
    WHEN (first_browser LIKE 'Mozilla') THEN 35
    WHEN (first_browser LIKE 'OmniWeb') THEN 36
    WHEN (first_browser LIKE 'PS Vita browser') THEN 37
    WHEN (first_browser LIKE 'NetNewsWire') THEN 38
    WHEN (first_browser LIKE 'CometBird') THEN 39
    WHEN (first_browser LIKE 'Comodo Dragon') THEN 40
    WHEN (first_browser LIKE 'Flock') THEN 41
    WHEN (first_browser LIKE 'Pale Moon') THEN 42
    WHEN (first_browser LIKE 'Avant Browser') THEN 43
    WHEN (first_browser LIKE 'Opera Mobile') THEN 44
    WHEN (first_browser LIKE 'Yandex.Browser') THEN 45
    WHEN (first_browser LIKE 'TheWorld Browser') THEN 46
    WHEN (first_browser LIKE 'SlimBrowser') THEN 47
    WHEN (first_browser LIKE 'Epic') THEN 48
    WHEN (first_browser LIKE 'Stainless') THEN 49
    WHEN (first_browser LIKE 'Googlebot') THEN 50
    WHEN (first_browser LIKE 'Outlook 2007') THEN 51
    WHEN (first_browser LIKE 'IceDragon') THEN 52
    WHEN (first_browser LIKE 'IBrowse') THEN 53
    WHEN (first_browser LIKE 'Nintendo Browser') THEN 54
    WHEN (first_browser LIKE 'UC Browser') THEN 55
    ELSE 0
END AS "first_browser"
FROM data )
TO '/var/lib/postgresql/data_tratado.csv'
DELIMITER ','
CSV HEADER;
