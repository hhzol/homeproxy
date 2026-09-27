{
	"log": {
		"disabled": false,
		"level": "error",
		"output": "/var/run/homeproxy/sing-box-c.log",
		"timestamp": true
	},
	"dns": {
		"servers": [
			{
				"tag": "default-dns",
				"type": "udp",
				"server": "211.138.156.66"
			},
			{
				"tag": "system-dns",
				"type": "local"
			},
			{
				"tag": "国内",
				"type": "https",
				"server": "223.5.5.5",
				"path": "/dns-query"
			},
			{
				"tag": "国外",
				"type": "https",
				"server": "dns.google",
				"path": "/dns-query",
				"domain_resolver": {
					"server": "国内"
				},
				"detour": "🚀 默认选择"
			},
			{
				"tag": "fakeip",
				"type": "fakeip",
				"inet4_range": "198.18.0.0/15",
				"inet6_range": "fc00::/18"
			}
		],
		"rules": [
			{
				"clash_mode": "direct",
				"server": "国内"
			},
			{
				"clash_mode": "global",
				"server": "国外"
			},
			{
				"rule_set": [
					"广告"
				],
				"action": "predefined",
				"rcode": "NOERROR"
			},
			{
				"rule_set": [
					"中国域名",
					"阿里",
					"腾讯",
					"网易",
					"百度",
					"自定义中国",
					"BLIZZARD",
					"STEAM"
				],
				"action": "route",
				"server": "国内",
				"client_subnet": "183.251.0.0/16"
			},
			{
				"server": "fakeip",
				"rewrite_ttl": 1
			}
		],
		"disable_cache": true,
		"client_subnet": "183.251.0.0/16",
		"final": "国外"
	},
	"inbounds": [
		{
			"type": "direct",
			"tag": "dns-in",
			"listen": "::",
			"listen_port": 5333
		},
		{
			"type": "mixed",
			"tag": "mixed-in",
			"listen": "::",
			"listen_port": 5330,
			"set_system_proxy": false
		},
		{
			"type": "tun",
			"tag": "tun-in",
			"interface_name": "singtun0",
			"address": [
				"172.19.0.1/30",
				"fdfe:dcba:9876::1/126"
			],
			"mtu": 9000,
			"auto_route": false,
			"strict_route": true,
			"stack": "gvisor"
		}
	],
	"outbounds": [
		{
			"type": "direct",
			"tag": "直连"
		},
		{
			"type": "block",
			"tag": "block-out"
		},
		{
			"type": "selector",
			"tag": "🚀 默认选择",
			"outbounds": [
				"♻️ 自动选择",
				"🎯 机场节点",
				"🌥️ Cloudflare",
				"🖁 移动优选",
				"🛜 CMCC_IPV6",
				"🧠 AI",
				"🖐️ 手动选择",
				"🇺🇸 美国节点",
				"🇬🇧 英国节点",
				"🇭🇰 香港节点",
				"🇸🇬 新加坡节点",
				"🇯🇵 日本节点",
				"直连"
			],
			"default": "♻️ 自动选择"
		},
		{
			"type": "urltest",
			"tag": "♻️ 自动选择",
			"outbounds": [
				"cloudflare 壹",
				"cloudflare 贰",
				"cloudflare 叁",
				"cloudflare 肆",
				"cloudflare 伍",
				"cloudflare 陆",
				"cloudflare 柒",
				"cloudflare 捌",
				"cloudflare 玖",
				"cloudflare 拾",
				"cloudflare-cmliu 壹",
				"cloudflare-visa_cn 贰",
				"cloudflare-Ukraine 叁",
				"cloudflare-Shopify 肆",
				"cloudflare-Ubisoft 伍",
				"cloudflare-NexusMods 陆",
				"cloudflare-time_is 柒",
				"cloudflare-icook_hk 捌",
				"cloudflare-icook_tw 玖",
				"cloudflare-seeck 拾",
				"cloudflare-csgo_com 壹",
				"cloudflare-877774_xyz 贰",
				"cloudflare-saas_sin_fan 叁",
				"cloudflare-030101_xyz 肆",
				"cloudflare-182682_xyz 伍",
				"[vless]Tokyo1 - B Group",
				"[vless]Frankfurt1 - B Group",
				"[vless]Singapore1 - B Group",
				"[vless]HongKong1 - B Group",
				"[vless]California1 - B Group",
				"[vless]Frankfurt2 - B Group",
				"[vless]Singapore2 - B Group",
				"[vless]Tokyo2 - B Group",
				"[vless]HongKong2 - B Group",
				"[vless]California2 - B Group",
				"[vless]Tokyo3 - B Group",
				"[vless]Frankfurt3 - B Group",
				"[vless]Singapore3 - B Group",
				"[vless]HongKong3 - B Group",
				"[vless]California3 - B Group"
			],
			"interval": "30s",
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🎯 机场节点",
			"outbounds": [
				"[vless]Tokyo1 - B Group",
				"[vless]Frankfurt1 - B Group",
				"[vless]Singapore1 - B Group",
				"[vless]HongKong1 - B Group",
				"[vless]Tokyo2 - B Group",
				"[vless]California1 - B Group",
				"[vless]Frankfurt2 - B Group",
				"[vless]Singapore2 - B Group",
				"[vless]HongKong2 - B Group",
				"[vless]California2 - B Group",
				"[vless]Tokyo3 - B Group",
				"[vless]Frankfurt3 - B Group",
				"[vless]Singapore3 - B Group",
				"[vless]HongKong3 - B Group",
				"[vless]California3 - B Group"
			],
			"interval": "30s",
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🌥️ Cloudflare",
			"outbounds": [
				"cloudflare 壹",
				"cloudflare 贰",
				"cloudflare 叁",
				"cloudflare 肆",
				"cloudflare 陆",
				"cloudflare 伍",
				"cloudflare 柒",
				"cloudflare 玖",
				"cloudflare 捌",
				"cloudflare 拾",
				"cloudflare-cmliu 壹",
				"cloudflare-visa_cn 贰",
				"cloudflare-Ukraine 叁",
				"cloudflare-Shopify 肆",
				"cloudflare-Ubisoft 伍",
				"cloudflare-time_is 柒",
				"cloudflare-NexusMods 陆",
				"cloudflare-icook_hk 捌",
				"cloudflare-icook_tw 玖",
				"cloudflare-seeck 拾",
				"cloudflare-csgo_com 壹",
				"cloudflare-877774_xyz 贰",
				"cloudflare-saas_sin_fan 叁",
				"cloudflare-030101_xyz 肆",
				"cloudflare-182682_xyz 伍"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🖁 移动优选",
			"outbounds": [
				"CF 移动优选",
				"CF 移动优选 (2)",
				"CF 移动优选 (3)",
				"CF 移动优选 (4)",
				"CF 移动优选 (5)",
				"CF 移动优选 (6)",
				"CF 移动优选 (7)",
				"CF 移动优选 (8)",
				"CF 移动优选 (9)",
				"CF 移动优选 (10)"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🛜 CMCC_IPV6",
			"outbounds": [
				"CMCC-IPV6",
				"CMCC-IPV6 (2)",
				"CMCC-IPV6 (3)",
				"CMCC-IPV6 (4)",
				"CMCC-IPV6 (5)",
				"CMCC-IPV6 (6)"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🧠 AI",
			"outbounds": [
				"[vless]Tokyo1 - B Group",
				"[vless]Frankfurt1 - B Group",
				"[vless]Singapore1 - B Group",
				"[vless]California1 - B Group",
				"[vless]Tokyo2 - B Group",
				"[vless]Frankfurt2 - B Group",
				"[vless]Singapore2 - B Group",
				"[vless]California2 - B Group",
				"[vless]Tokyo3 - B Group",
				"[vless]Frankfurt3 - B Group",
				"[vless]Singapore3 - B Group",
				"[vless]California3 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "selector",
			"tag": "🖐️ 手动选择",
			"outbounds": [
				"cloudflare 壹",
				"cloudflare 贰",
				"cloudflare 叁",
				"cloudflare 肆",
				"cloudflare 伍",
				"cloudflare 陆",
				"cloudflare 柒",
				"cloudflare 捌",
				"cloudflare 玖",
				"cloudflare-cmliu 壹",
				"cloudflare 拾",
				"cloudflare-visa_cn 贰",
				"cloudflare-Ukraine 叁",
				"cloudflare-Shopify 肆",
				"cloudflare-Ubisoft 伍",
				"cloudflare-NexusMods 陆",
				"cloudflare-time_is 柒",
				"cloudflare-icook_hk 捌",
				"cloudflare-icook_tw 玖",
				"cloudflare-seeck 拾",
				"cloudflare-csgo_com 壹",
				"cloudflare-877774_xyz 贰",
				"cloudflare-saas_sin_fan 叁",
				"cloudflare-030101_xyz 肆",
				"cloudflare-182682_xyz 伍"
			],
			"default": "cloudflare 壹"
		},
		{
			"type": "urltest",
			"tag": "🇺🇸 美国节点",
			"outbounds": [
				"[vless]California3 - B Group",
				"[vless]California2 - B Group",
				"[vless]California1 - B Group",
				"US (13)",
				"US (14)",
				"US (15)",
				"US (16)",
				"US (23)",
				"US (24)",
				"US (25)"
			],
			"interval": "30s",
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🇬🇧 英国节点",
			"outbounds": [
				"UK",
				"UK (2)",
				"UK (3)",
				"UK (4)"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🇩🇪 德国节点",
			"outbounds": [
				"DE",
				"DE (3)",
				"DE (5)",
				"[vless]Frankfurt2 - B Group",
				"[vless]Frankfurt1 - B Group",
				"[vless]Frankfurt3 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🇭🇰 香港节点",
			"outbounds": [
				"HK",
				"[vless]HongKong1 - B Group",
				"[vless]HongKong3 - B Group",
				"[vless]HongKong2 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🇸🇬 新加坡节点",
			"outbounds": [
				"SG",
				"[vless]Singapore2 - B Group",
				"[vless]Singapore1 - B Group",
				"[vless]Singapore3 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "🇯🇵 日本节点",
			"outbounds": [
				"JP",
				"[vless]Tokyo1 - B Group",
				"[vless]Tokyo3 - B Group",
				"[vless]Tokyo2 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "selector",
			"tag": "🎧 Spotify",
			"outbounds": [
				"🇭🇰 香港节点",
				"🇺🇸 美国节点",
				"🇬🇧 英国节点",
				"🇸🇬 新加坡节点",
				"🇯🇵 日本节点",
				"🇩🇪 德国节点"
			],
			"default": "🇭🇰 香港节点"
		},
		{
			"type": "selector",
			"tag": "🎬 Netflix",
			"outbounds": [
				"🇺🇸 美国节点",
				"🇬🇧 英国节点",
				"🇭🇰 香港节点",
				"🇸🇬 新加坡节点",
				"🇯🇵 日本节点",
				"🇩🇪 德国节点"
			],
			"default": "🇯🇵 日本节点"
		},
		{
			"type": "selector",
			"tag": "🎵 TikTok",
			"outbounds": [
				"🇺🇸 美国节点",
				"🇬🇧 英国节点",
				"🇭🇰 香港节点",
				"🇸🇬 新加坡节点",
				"🇯🇵 日本节点",
				"🇩🇪 德国节点"
			],
			"default": "🇺🇸 美国节点"
		},
		{
			"type": "selector",
			"tag": "🅱🅱🅲",
			"outbounds": [
				"🇺🇸 美国节点",
				"🇬🇧 英国节点",
				"🇩🇪 德国节点",
				"🇭🇰 香港节点",
				"🇸🇬 新加坡节点",
				"🇯🇵 日本节点"
			]
		},
		{
			"type": "trojan",
			"tag": "cloudflare 壹",
			"server": "1.136605.xyz",
			"server_port": 443,
			"password": "aabc1b52-54bd-467d-a50f-bc73a3fe0e6b",
			"tls": {
				"enabled": true,
				"server_name": "136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 贰",
			"server": "2.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 叁",
			"server": "3.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 肆",
			"server": "4.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "jpmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "jpmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 伍",
			"server": "5.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "mloh.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "mloh.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 陆",
			"server": "6.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hmy.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hmy.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 柒",
			"server": "7.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hyc.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hyc.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 捌",
			"server": "8.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hyf.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hyf.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 玖",
			"server": "9.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare 拾",
			"server": "10.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-cmliu 壹",
			"server": "cf.090227.xyz",
			"server_port": 443,
			"password": "aabc1b52-54bd-467d-a50f-bc73a3fe0e6b",
			"tls": {
				"enabled": true,
				"server_name": "136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-visa_cn 贰",
			"server": "www.visa.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Ukraine 叁",
			"server": "mfa.gov.ua",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Shopify 肆",
			"server": "www.shopify.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "jpmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "jpmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Ubisoft 伍",
			"server": "store.ubi.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "mloh.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "mloh.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-NexusMods 陆",
			"server": "staticdelivery.nexusmods.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hmy.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hmy.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-time_is 柒",
			"server": "time.is",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hyc.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hyc.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-icook_hk 捌",
			"server": "icook.hk",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "hyf.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "hyf.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-icook_tw 玖",
			"server": "icook.tw",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-seeck 拾",
			"server": "cmcc.cloudflare.seeck.cn",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-csgo_com 壹",
			"server": "csgo.com",
			"server_port": 443,
			"password": "aabc1b52-54bd-467d-a50f-bc73a3fe0e6b",
			"tls": {
				"enabled": true,
				"server_name": "136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-877774_xyz 贰",
			"server": "cf.877774.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-saas_sin_fan 叁",
			"server": "saas.sin.fan",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-030101_xyz 肆",
			"server": "bestcf.030101.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "jpmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "jpmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-182682_xyz 伍",
			"server": "cloudflare.182682.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "mloh.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "mloh.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Tokyo1 - B Group",
			"server": "bgroup.jp1.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-northeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "firefox"
				},
				"reality": {
					"enabled": true,
					"public_key": "BJihKW3qLbtwFO_WAZ3htkU5VpWcMoFYX9tqlLmKiUY",
					"short_id": "f3f3bbfe1c"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Frankfurt1 - B Group",
			"server": "bgroup.de1.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "eu-central-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "qMS1eTXynabv32LLBUmjM4GR5qLPSTJg2QmbJ-2BAz0",
					"short_id": "e3f8da1ea7a4b55d"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Singapore1 - B Group",
			"server": "bgroup.sg1.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-southeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "3QQxF4eV_tdOD8Z5lU4PBIWFmU-pRZBvBxNTNCZBpEU",
					"short_id": "bd5795f0ab10"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]HongKong1 - B Group",
			"server": "bgroup.hk1.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-east-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "Z0sxSuzxnWYa5FNTZ-W4ImxQd674VG4KfmOBqlcudjU",
					"short_id": "7c7ad24684"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]California1 - B Group",
			"server": "bgroup.us1.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-northeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "Gox_kO96tSNtMSnuykOmIc812mXz-X8qCVum9WpZskI",
					"short_id": "6ba37b822ad1fb"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Tokyo2 - B Group",
			"server": "bgroup.jp2.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "us-west-2.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "a9G3bcSRJTo9LzFI73murfn_yfFqBD_j0tJPW2xAOmc",
					"short_id": "b585cb032866"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Frankfurt2 - B Group",
			"server": "bgroup.de2.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "eu-central-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "PI0DXi9tIweiAEsBk4_RJo2VOmxRNPfriMCPNUdhhAc",
					"short_id": "3d8aaaff6e"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Singapore2 - B Group",
			"server": "bgroup.sg2.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-southeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "GyFY9SBQ3G5pvL9ghvBxQwET2A60QhwRExjXcMZmvGQ",
					"short_id": "5a2c6f4d4604"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]HongKong2 - B Group",
			"server": "bgroup.hk2.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-east-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "vueao8fqt0okOmCjgrdUVdIZExh2RoOXEcmncaQ5Pzg",
					"short_id": "822f301dceef"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]California2 - B Group",
			"server": "bgroup.us2.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "us-west-2.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "s8KrYQFpXXkbCvW6ORmVrm4yC5GpVxCHfIoV9Z_FiUY",
					"short_id": "afe73effea"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Tokyo3 - B Group",
			"server": "bgroup.jp3.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-northeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "TDbVu9oeQc6rjrsBcHuMs0tybjKy2EQQdZalmLvwSk0",
					"short_id": "d778a3fa"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Frankfurt3 - B Group",
			"server": "bgroup.de3.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "eu-central-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "vISyEnPtrRB38JGRLcKGO8gm2IY9vOcrKXDia1GbPj4",
					"short_id": "c3cdb08edf5c"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]Singapore3 - B Group",
			"server": "bgroup.sg3.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-southeast-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "WXJgNTL_ajv7oJbE1q1-MfO66FkHtRCvNlav8ehrbkQ",
					"short_id": "385b8f25"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]HongKong3 - B Group",
			"server": "bgroup.hk3.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "ap-east-1.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "AaaVl3VyNtuR8qDtr46Z_zGK7KUU6a9szwMVThSg_HE",
					"short_id": "1a3d22622aaf8a"
				}
			}
		},
		{
			"type": "vless",
			"tag": "[vless]California3 - B Group",
			"server": "bgroup.us3.ilovegairport.com",
			"server_port": 443,
			"uuid": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"flow": "xtls-rprx-vision",
			"packet_encoding": "xudp",
			"tls": {
				"enabled": true,
				"server_name": "us-west-2.console.aws.amazon.com",
				"utls": {
					"enabled": true,
					"fingerprint": "chrome"
				},
				"reality": {
					"enabled": true,
					"public_key": "ZXK1Wj-sRELyv-xRV64qbWOAl9S4xBZc5MFoOHuuqk0",
					"short_id": "adf8401c1789bd"
				}
			}
		},
		{
			"type": "trojan",
			"tag": "CA",
			"server": "3.97.173.206",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CA (2)",
			"server": "207.61.86.114",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CA (3)",
			"server": "108.174.61.161",
			"server_port": 59581,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CA (4)",
			"server": "107.172.132.165",
			"server_port": 43333,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "DE",
			"server": "18.196.70.197",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "DE (2)",
			"server": "18.156.209.101",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "DE (3)",
			"server": "91.192.102.55",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "DE (4)",
			"server": "147.45.76.247",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "DE (5)",
			"server": "3.66.115.225",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "FR",
			"server": "34.22.190.30",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "FR (2)",
			"server": "89.168.43.31",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "UK",
			"server": "178.32.58.147",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "UK (2)",
			"server": "18.171.236.219",
			"server_port": 8443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "UK (3)",
			"server": "172.187.200.28",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "UK (4)",
			"server": "35.176.229.223",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "HK",
			"server": "172.64.147.116",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "JP",
			"server": "64.110.104.30",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "JP (2)",
			"server": "168.138.194.74",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "KR",
			"server": "52.141.25.42",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "KR (2)",
			"server": "131.186.27.112",
			"server_port": 2096,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "NL",
			"server": "13.95.69.133",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "NL (2)",
			"server": "77.223.96.232",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "RU",
			"server": "31.129.48.139",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "RU (2)",
			"server": "185.151.243.200",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "SG",
			"server": "168.138.165.174",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US",
			"server": "34.83.245.149",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (2)",
			"server": "20.36.131.211",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (3)",
			"server": "212.103.62.226",
			"server_port": 30129,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (4)",
			"server": "20.121.115.188",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (5)",
			"server": "172.174.249.255",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (6)",
			"server": "48.217.34.120",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (7)",
			"server": "67.226.222.184",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (8)",
			"server": "18.236.13.188",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (9)",
			"server": "204.110.223.105",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (10)",
			"server": "67.226.222.132",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (11)",
			"server": "20.84.117.28",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (12)",
			"server": "54.193.104.34",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (13)",
			"server": "104.18.209.121",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (14)",
			"server": "104.24.9.229",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (15)",
			"server": "104.27.3.136",
			"server_port": 2053,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (16)",
			"server": "172.65.90.25",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (17)",
			"server": "172.82.16.99",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (18)",
			"server": "66.85.139.204",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (19)",
			"server": "204.110.223.100",
			"server_port": 80,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (20)",
			"server": "44.227.209.152",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (21)",
			"server": "172.96.188.117",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (22)",
			"server": "67.226.220.10",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (23)",
			"server": "198.41.215.62",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (24)",
			"server": "172.67.73.22",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "US (25)",
			"server": "104.16.132.167",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT",
			"server": "94.177.8.54",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (2)",
			"server": "94.177.8.9",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (3)",
			"server": "94.177.8.2",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (4)",
			"server": "94.177.8.50",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (5)",
			"server": "94.177.8.23",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (6)",
			"server": "94.177.8.62",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (7)",
			"server": "94.177.8.34",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (8)",
			"server": "94.177.8.40",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (9)",
			"server": "185.225.68.232",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "AT (10)",
			"server": "46.183.186.57",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhzol.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhzol.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选",
			"server": "104.17.146.89",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (2)",
			"server": "104.17.182.94",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (3)",
			"server": "104.17.29.86",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (4)",
			"server": "104.17.117.117",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (5)",
			"server": "104.19.150.40",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (6)",
			"server": "91.193.59.50",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (7)",
			"server": "104.17.31.4",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (8)",
			"server": "104.16.145.54",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (9)",
			"server": "104.19.150.140",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CF 移动优选 (10)",
			"server": "104.17.54.7",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "kdkhhzmi.teakwondo.one.pl"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "kdkhhzmi.teakwondo.one.pl"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6",
			"server": "2606:4700:3036:ef:3f32:a9c6:39c4:9ae3",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6 (2)",
			"server": "2606:4700:3036:0:a36a:4a23:4a60:9f3f",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6 (3)",
			"server": "2606:4700:3036:6ed4:e1ed:36:7204:2031",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6 (4)",
			"server": "2606:4700:3036:ef:db9e:eecc:caef:9d4a",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6 (5)",
			"server": "2606:4700:3036:ef:95e:7a29:2ccc:d331",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "CMCC-IPV6 (6)",
			"server": "2606:4700:3036:0:a36a:4aa4:75d9:9f75",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk2.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk2.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "shadowsocks",
			"tag": "[ss]剩余流量：409.24 GB",
			"server": "1.1.1.1",
			"server_port": 443,
			"password": "58cd2b0c-c7b7-496b-b86e-ec3fcedf3ecc",
			"method": "aes-128-gcm"
		}
	],
	"route": {
		"rules": [
			{
				"inbound": "dns-in",
				"action": "hijack-dns"
			},
			{
				"clash_mode": "direct",
				"outbound": "直连"
			},
			{
				"clash_mode": "global",
				"outbound": "GLOBAL"
			},
			{
				"rule_set": [
					"美国"
				],
				"action": "route",
				"outbound": "🇺🇸 美国节点"
			},
			{
				"domain_suffix": [
					"bbcx-internal.com"
				],
				"rule_set": [
					"BBC"
				],
				"action": "route",
				"outbound": "🅱🅱🅲"
			},
			{
				"rule_set": [
					"AI"
				],
				"action": "route",
				"outbound": "🧠 AI"
			},
			{
				"rule_set": [
					"Spotify"
				],
				"action": "route",
				"outbound": "🎧 Spotify"
			},
			{
				"rule_set": [
					"Netflix"
				],
				"action": "route",
				"outbound": "🎬 Netflix"
			},
			{
				"rule_set": [
					"TikTok"
				],
				"action": "route",
				"outbound": "🎵 TikTok"
			},
			{
				"domain": [
					"bbs.livecodes.vip"
				],
				"rule_set": [
					"中国域名",
					"内网域名",
					"阿里",
					"腾讯",
					"自定义中国",
					"网易",
					"百度"
				],
				"action": "route",
				"outbound": "直连"
			},
			{
				"action": "resolve",
				"server": "国外",
				"strategy": "ipv4_only"
			},
			{
				"rule_set": [
					"中国IP",
					"内网地址"
				],
				"action": "route",
				"outbound": "直连"
			}
		],
		"rule_set": [
			{
				"type": "remote",
				"tag": "中国IP",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/cn.srs"
			},
			{
				"type": "remote",
				"tag": "中国域名",
				"format": "binary",
				"url": "https://gh-proxy.org/https://github.com/hhzol/ruleset/raw/main/Sing/cn-without-ms-apple.srs"
			},
			{
				"type": "remote",
				"tag": "内网地址",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/private.srs"
			},
			{
				"type": "remote",
				"tag": "内网域名",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/private.srs"
			},
			{
				"type": "remote",
				"tag": "广告",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/hhzol/ruleset/main/Sing/ad.srs"
			},
			{
				"type": "remote",
				"tag": "美国",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/hhzol/ruleset/main/Sing/us.srs"
			},
			{
				"type": "remote",
				"tag": "自定义中国",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/hhzol/ruleset/main/Sing/cn.srs"
			},
			{
				"type": "remote",
				"tag": "AI",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/category-ai-!cn.srs"
			},
			{
				"type": "remote",
				"tag": "BBC",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/bbc.srs"
			},
			{
				"type": "remote",
				"tag": "Spotify",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/spotify.srs"
			},
			{
				"type": "remote",
				"tag": "Netflix",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/netflix.srs"
			},
			{
				"type": "remote",
				"tag": "TikTok",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/tiktok.srs"
			},
			{
				"type": "remote",
				"tag": "阿里",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/alibaba.srs"
			},
			{
				"type": "remote",
				"tag": "腾讯",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/tencent.srs"
			},
			{
				"type": "remote",
				"tag": "网易",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/netease.srs"
			},
			{
				"type": "remote",
				"tag": "百度",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/baidu.srs"
			},
			{
				"type": "remote",
				"tag": "微软",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/microsoft.srs"
			},
			{
				"type": "remote",
				"tag": "苹果",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/apple.srs"
			},
			{
				"type": "remote",
				"tag": "STEAM",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/steam.srs"
			},
			{
				"type": "remote",
				"tag": "BLIZZARD",
				"format": "binary",
				"url": "https://gh-proxy.org/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geosite/blizzard.srs"
			}
		],
		"auto_detect_interface": false,
		"default_interface": "pppoe-wan",
		"default_http_client": "http1",
		"default_domain_resolver": {
			"action": "resolve",
			"server": "国内"
		},
		"final": "🚀 默认选择"
	},
	"experimental": {
		"cache_file": {
			"enabled": true,
			"path": "/var/run/homeproxy/cache.db",
			"store_fakeip": true,
			"store_dns": true
		},
		"clash_api": {
			"external_controller": "0.0.0.0:9090",
			"external_ui": "/etc/homeproxy/ui/",
			"external_ui_download_url": "https://gh.monlor.com/https://github.com/Zephyruso/zashboard/releases/latest/download/dist-no-fonts.zip",
			"external_ui_download_detour": "直连",
			"default_mode": "rule"
		}
	},
	"http_clients": [
		{
			"tag": "http1",
			"headers": {
				"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.2903.86"
			},
			"detour": "直连"
		}
	]
}
