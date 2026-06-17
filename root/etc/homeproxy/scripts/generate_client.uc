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
				"tag": "local",
				"type": "h3",
				"server": "223.5.5.5",
				"path": "/dns-query"
			},
			{
				"tag": "foreign",
				"type": "h3",
				"server": "dns.google",
				"path": "/dns-query",
				"domain_resolver": {
					"server": "local"
				},
				"detour": "默认选择"
			},
			{
				"tag": "美国",
				"type": "h3",
				"server": "dns.google",
				"path": "/dns-query",
				"domain_resolver": {
					"server": "local"
				},
				"detour": "美国节点"
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
				"server": "local"
			},
			{
				"clash_mode": "global",
				"server": "foreign"
			},
			{
				"domain": [
					"httpdns.n.netease.com"
				],
				"domain_suffix": [
					"html-load.com"
				],
				"action": "route",
				"server": "local"
			},
			{
				"rule_set": [
					"广告",
					"自定义广告"
				],
				"action": "predefined",
				"rcode": "NOERROR"
			},
			{
				"domain": [
					"hhz.pgw.jp",
					"nas.136605.xyz"
				],
				"rule_set": [
					"自定义美国"
				],
				"action": "route",
				"server": "美国"
			},
			{
				"rule_set": [
					"Microsoft",
					"Apple",
					"自定义代理"
				],
				"action": "route",
				"server": "foreign",
				"strategy": "ipv4_only"
			},
			{
				"rule_set": [
					"中国域名",
					"fakeip过滤",
					"自定义中国",
					"腾讯",
					"阿里"
				],
				"action": "route",
				"server": "local"
			},
			{
				"query_type": [
					"A",
					"AAAA"
				],
				"server": "fakeip",
				"rewrite_ttl": 1
			}
		],
		"disable_cache": true,
		"client_subnet": "183.251.0.0/16",
		"final": "foreign"
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
			"sniff": true,
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
			"stack": "gvisor",
			"sniff": true
		}
	],
	"outbounds": [
		{
			"type": "direct",
			"tag": "direct-out"
		},
		{
			"type": "block",
			"tag": "block-out"
		},
		{
			"type": "selector",
			"tag": "默认选择",
			"outbounds": [
				"自动选择",
				"美国节点",
				"英国节点",
				"香港节点",
				"新加坡节点",
				"日本节点",
				"韩国节点",
				"Cloudflare",
				"direct-out"
			],
			"default": "自动选择"
		},
		{
			"type": "urltest",
			"tag": "自动选择",
			"outbounds": [
				"cf1-壹",
				"cf2-贰",
				"cf3-叁",
				"cf4-肆",
				"cf5-伍",
				"cf6-陆",
				"cf7-柒",
				"cf8-捌",
				"cf9-玖",
				"cf10-拾",
				"KR_Incheon SS - B Group",
				"剩余流量：685.46 GB",
				"SG_Singapore SS - B Group",
				"HK_HongKong SS - B Group",
				"US_California SS - B Group",
				"JP_Tokyo2 SS - B Group",
				"KR_Incheon2 SS - B Group",
				"SG_Singapore2 SS - B Group",
				"HK_HongKong2 SS - B Group",
				"US_California2 SS - B Group",
				"JP Tokyo V2 - B Group",
				"KR Incheon V2 - B Group",
				"SG Singapore V2 - B Group",
				"HK HongKong V2 - B Group",
				"US California V2 - B Group",
				"cmliu-壹",
				"visa_cn-贰",
				"Ukraine-叁",
				"Shopify-肆",
				"NexusMods-陆",
				"Ubisoft-伍",
				"icook_hk-捌",
				"time_is-柒",
				"tencentapp_cn-拾",
				"icook_tw-玖",
				"877774_xyz-贰",
				"byoip_top-壹",
				"030101_xyz-肆",
				"saas_sin_fan-叁",
				"182682_xyz-伍"
			],
			"interval": "30s",
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "Cloudflare",
			"outbounds": [
				"cf1-壹",
				"cf2-贰",
				"cf3-叁",
				"cf4-肆",
				"cf5-伍",
				"cf6-陆",
				"cf7-柒",
				"cf8-捌",
				"cf9-玖",
				"cf10-拾",
				"cmliu-壹",
				"visa_cn-贰",
				"Ukraine-叁",
				"Shopify-肆",
				"NexusMods-陆",
				"Ubisoft-伍",
				"icook_hk-捌",
				"time_is-柒",
				"tencentapp_cn-拾",
				"icook_tw-玖",
				"877774_xyz-贰",
				"byoip_top-壹",
				"030101_xyz-肆",
				"saas_sin_fan-叁",
				"182682_xyz-伍"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "美国节点",
			"outbounds": [
				"US California V2 - B Group",
				"US_California2 SS - B Group",
				"US_California SS - B Group"
			],
			"interval": "30s",
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "英国节点",
			"outbounds": [
				"GB73-叁"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "香港节点",
			"outbounds": [
				"HK_HongKong SS - B Group",
				"HK_HongKong2 SS - B Group",
				"HK HongKong V2 - B Group",
				"HK"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "新加坡节点",
			"outbounds": [
				"SG_Singapore SS - B Group",
				"SG_Singapore2 SS - B Group",
				"SG Singapore V2 - B Group",
				"SG"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "日本节点",
			"outbounds": [
				"剩余流量：685.46 GB",
				"JP_Tokyo2 SS - B Group",
				"JP Tokyo V2 - B Group",
				"JP",
				"JP (2)"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "urltest",
			"tag": "韩国节点",
			"outbounds": [
				"KR",
				"KR (2)",
				"KR_Incheon2 SS - B Group",
				"KR_Incheon SS - B Group",
				"KR Incheon V2 - B Group"
			],
			"interrupt_exist_connections": true
		},
		{
			"type": "selector",
			"tag": "Spotify",
			"outbounds": [
				"香港节点",
				"美国节点",
				"英国节点",
				"新加坡节点",
				"日本节点",
				"韩国节点"
			],
			"default": "香港节点"
		},
		{
			"type": "selector",
			"tag": "Netflix",
			"outbounds": [
				"美国节点",
				"英国节点",
				"香港节点",
				"新加坡节点",
				"日本节点",
				"韩国节点"
			],
			"default": "新加坡节点"
		},
		{
			"type": "trojan",
			"tag": "cf1-壹",
			"server": "1.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wka.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wka.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "cf2-贰",
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
			"tag": "cf3-叁",
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
			"tag": "cf4-肆",
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
			"tag": "cf5-伍",
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
			"tag": "cf6-陆",
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
			"tag": "cf7-柒",
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
			"tag": "cf8-捌",
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
			"tag": "cf9-玖",
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
			"tag": "cf10-拾",
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
			"tag": "GB73-叁",
			"server": "172.187.200.28",
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
			"tag": "US12-贰",
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
			"tag": "US13-叁",
			"server": "104.27.3.136",
			"server_port": 2053,
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
			"tag": "US15-伍",
			"server": "104.18.209.121",
			"server_port": 2053,
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
			"tag": "US18-捌",
			"server": "172.67.73.22",
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
			"tag": "US33-叁",
			"server": "54.193.104.34",
			"server_port": 80,
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
			"tag": "US34-肆",
			"server": "34.83.245.149",
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
			"tag": "US35-伍",
			"server": "104.16.37.216",
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
			"tag": "US36-陆",
			"server": "104.17.245.49",
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
			"tag": "US39-玖",
			"server": "104.17.195.232",
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
			"tag": "US40-拾",
			"server": "104.19.85.54",
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
			"tag": "cloudflare-1",
			"server": "1.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-2",
			"server": "2.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-3",
			"server": "3.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-4",
			"server": "4.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-5",
			"server": "5.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-6",
			"server": "6.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-7",
			"server": "7.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-8",
			"server": "8.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-9",
			"server": "9.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-10",
			"server": "10.136605.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-cmliu-1",
			"server": "cf.090227.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-visa_cn-2",
			"server": "www.visa.cn",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Ukraine-3",
			"server": "mfa.gov.ua",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Shopify-4",
			"server": "www.shopify.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-Ubisoft-5",
			"server": "store.ubi.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-NexusMods-6",
			"server": "staticdelivery.nexusmods.com",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-time_is-7",
			"server": "time.is",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-icook_hk-8",
			"server": "icook.hk",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-icook_tw-9",
			"server": "icook.tw",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-tencentapp_cn-10",
			"server": "cf.tencentapp.cn",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-byoip_top-1",
			"server": "cloudflare-dl.byoip.top",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-877774_xyz-2",
			"server": "cf.877774.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-saas_sin_fan-3",
			"server": "saas.sin.fan",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-030101_xyz-4",
			"server": "bestcf.030101.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "trojan",
			"tag": "cloudflare-182682_xyz-5",
			"server": "cloudflare.182682.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true
			}
		},
		{
			"type": "shadowsocks",
			"tag": "剩余流量：685.46 GB",
			"server": "bgroup.node1.s.nodelist-airport.com",
			"server_port": 53431,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "KR_Incheon SS - B Group",
			"server": "bgroup.node2.s.nodelist-airport.com",
			"server_port": 50001,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "SG_Singapore SS - B Group",
			"server": "bgroup.node3.s.nodelist-airport.com",
			"server_port": 50001,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "HK_HongKong SS - B Group",
			"server": "bgroup.node4.s.nodelist-airport.com",
			"server_port": 51135,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "US_California SS - B Group",
			"server": "bgroup.node5.s.nodelist-airport.com",
			"server_port": 59167,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "JP_Tokyo2 SS - B Group",
			"server": "bgroup.node1.s2.nodelist-airport.com",
			"server_port": 20002,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "KR_Incheon2 SS - B Group",
			"server": "bgroup.node2.s2.nodelist-airport.com",
			"server_port": 20002,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "SG_Singapore2 SS - B Group",
			"server": "bgroup.node3.s2.nodelist-airport.com",
			"server_port": 54612,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "HK_HongKong2 SS - B Group",
			"server": "bgroup.node4.s2.nodelist-airport.com",
			"server_port": 28932,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "shadowsocks",
			"tag": "US_California2 SS - B Group",
			"server": "bgroup.node5.s2.nodelist-airport.com",
			"server_port": 23122,
			"password": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"method": "aes-256-gcm"
		},
		{
			"type": "vmess",
			"tag": "JP Tokyo V2 - B Group",
			"server": "bgroup.node1.v.nodelist-airport.com",
			"server_port": 29712,
			"uuid": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"security": "auto",
			"global_padding": true,
			"packet_encoding": "xudp"
		},
		{
			"type": "vmess",
			"tag": "KR Incheon V2 - B Group",
			"server": "bgroup.node2.v.nodelist-airport.com",
			"server_port": 59312,
			"uuid": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"security": "auto",
			"global_padding": true,
			"packet_encoding": "xudp"
		},
		{
			"type": "vmess",
			"tag": "SG Singapore V2 - B Group",
			"server": "bgroup.node3.v.nodelist-airport.com",
			"server_port": 18231,
			"uuid": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"security": "auto",
			"global_padding": true,
			"packet_encoding": "xudp"
		},
		{
			"type": "vmess",
			"tag": "HK HongKong V2 - B Group",
			"server": "bgroup.node4.v.nodelist-airport.com",
			"server_port": 53213,
			"uuid": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"security": "auto",
			"global_padding": true,
			"packet_encoding": "xudp",
			"transport": {
				"type": "ws"
			}
		},
		{
			"type": "vmess",
			"tag": "US California V2 - B Group",
			"server": "bgroup.node5.v.nodelist-airport.com",
			"server_port": 27910,
			"uuid": "685ca5cc-4c5b-416b-9bb0-e016da29b2e4",
			"security": "auto",
			"global_padding": true,
			"packet_encoding": "xudp"
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
			"tag": "GB",
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
			"tag": "GB (2)",
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
			"tag": "GB (3)",
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
			"tag": "GB (4)",
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
			"server": "104.19.147.149",
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
			"server": "104.17.151.8",
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
			"server": "104.18.44.225",
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
			"server": "104.18.86.103",
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
			"server": "104.18.80.234",
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
			"server": "104.17.186.230",
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
			"server": "104.16.246.231",
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
			"server": "104.17.104.226",
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
			"server": "104.16.243.147",
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
			"server": "104.19.38.231",
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
			"server": "2606:4700:3036:6ed4:e1ed:36:8916:dace",
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
			"server": "2606:4700:3036:6ed4:e1ed:ae00:3c36:e683",
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
			"server": "2606:4700:3036:ef:db9e:ee41:a8df:d3b2",
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
			"server": "2606:4700:3036:6ed4:ffdf:15bf:7d77:5f52",
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
			"server": "2606:4700:3036:6ed4:ffdf:f2ba:820b:ed5c",
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
			"tag": "cmliu-壹",
			"server": "cf.090227.xyz",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk1.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk1.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "visa_cn-贰",
			"server": "www.visa.cn",
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
			"tag": "Ukraine-叁",
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
			"tag": "Shopify-肆",
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
			"tag": "NexusMods-陆",
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
			"tag": "Ubisoft-伍",
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
			"tag": "icook_hk-捌",
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
			"tag": "time_is-柒",
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
			"tag": "tencentapp_cn-拾",
			"server": "cf.tencentapp.cn",
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
			"tag": "icook_tw-玖",
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
			"tag": "877774_xyz-贰",
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
			"tag": "byoip_top-壹",
			"server": "cloudflare-dl.byoip.top",
			"server_port": 443,
			"password": "Hong123456",
			"tls": {
				"enabled": true,
				"server_name": "wk1.136605.xyz"
			},
			"transport": {
				"type": "ws",
				"path": "/",
				"headers": {
					"Host": "wk1.136605.xyz"
				},
				"max_early_data": 2560,
				"early_data_header_name": "Sec-WebSocket-Protocol"
			}
		},
		{
			"type": "trojan",
			"tag": "030101_xyz-肆",
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
			"tag": "saas_sin_fan-叁",
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
			"tag": "182682_xyz-伍",
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
				"outbound": "direct-out"
			},
			{
				"clash_mode": "global",
				"outbound": "GLOBAL"
			},
			{
				"rule_set": [
					"自定义美国",
					"AI"
				],
				"action": "route",
				"outbound": "美国节点",
				"tls_record_fragment": true
			},
			{
				"rule_set": [
					"自定义英国",
					"BBC"
				],
				"action": "route",
				"outbound": "英国节点"
			},
			{
				"rule_set": [
					"Spotify"
				],
				"action": "route",
				"outbound": "Spotify"
			},
			{
				"rule_set": [
					"Netflix"
				],
				"action": "route",
				"outbound": "Netflix"
			},
			{
				"rule_set": [
					"Microsoft",
					"Apple",
					"自定义代理"
				],
				"action": "route",
				"outbound": "默认选择"
			},
			{
				"rule_set": [
					"中国域名",
					"自定义中国",
					"腾讯",
					"阿里"
				],
				"action": "route",
				"outbound": "direct-out",
				"tls_record_fragment": true
			},
			{
				"action": "resolve"
			},
			{
				"rule_set": [
					"中国IP"
				],
				"action": "route",
				"outbound": "direct-out"
			}
		],
		"rule_set": [
			{
				"type": "remote",
				"tag": "中国IP",
				"format": "binary",
				"url": "https://gh-proxy.com/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo/geoip/cn.srs",
				"update_interval": "1d"
			},
			{
				"type": "remote",
				"tag": "中国域名",
				"format": "binary",
				"url": "https://gh-proxy.com/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo-lite/geosite/cn.srs",
				"update_interval": "1d"
			},
			{
				"type": "remote",
				"tag": "内网地址",
				"format": "binary",
				"url": "https://gh-proxy.com/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo-lite/geoip/private.srs",
				"update_interval": "1d"
			},
			{
				"type": "remote",
				"tag": "内网域名",
				"format": "binary",
				"url": "https://gh-proxy.com/https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo-lite/geosite/private.srs",
				"update_interval": "1d"
			},
			{
				"type": "remote",
				"tag": "广告",
				"format": "binary",
				"url": "https://gh-proxy.com/https://raw.githubusercontent.com/217heidai/adblockfilters/main/rules/adblocksingbox.srs",
				"update_interval": "1d"
			},
			{
				"type": "local",
				"tag": "自定义广告",
				"format": "source",
				"path": "/etc/momo/run/ruleset/ad.json"
			},
			{
				"type": "local",
				"tag": "自定义美国",
				"format": "source",
				"path": "/etc/momo/run/ruleset/us.json"
			},
			{
				"type": "local",
				"tag": "自定义英国",
				"format": "source",
				"path": "/etc/momo/run/ruleset/uk.json"
			},
			{
				"type": "local",
				"tag": "自定义中国",
				"format": "source",
				"path": "/etc/momo/run/ruleset/cn.json"
			},
			{
				"type": "local",
				"tag": "自定义代理",
				"format": "source",
				"path": "/etc/momo/run/ruleset/proxy.json"
			},
			{
				"type": "local",
				"tag": "fakeip过滤",
				"format": "source",
				"path": "/etc/momo/run/ruleset/fakeipfilter.json"
			},
			{
				"type": "local",
				"tag": "AI",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/category-ai-!cn.srs"
			},
			{
				"type": "local",
				"tag": "BBC",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/BBC.srs"
			},
			{
				"type": "local",
				"tag": "Spotify",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Spotify.srs"
			},
			{
				"type": "local",
				"tag": "Netflix",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Netflix.srs"
			},
			{
				"type": "local",
				"tag": "TikTok",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/TikTok.srs"
			},
			{
				"type": "local",
				"tag": "Microsoft",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Microsoft.srs"
			},
			{
				"type": "local",
				"tag": "Apple",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Apple.srs"
			},
			{
				"type": "local",
				"tag": "腾讯",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Tencent.srs"
			},
			{
				"type": "local",
				"tag": "阿里",
				"format": "binary",
				"path": "/etc/momo/run/ruleset/Alibaba.srs"
			}
		],
		"auto_detect_interface": true,
		"default_interface": "pppoe-wan",
		"default_domain_resolver": {
			"action": "resolve",
			"server": "local"
		},
		"final": "默认选择"
	},
	"experimental": {
		"cache_file": {
			"enabled": true,
			"path": "/var/run/homeproxy/cache.db",
			"store_fakeip": true,
			"store_rdrc": true
		},
		"clash_api": {
			"external_controller": "0.0.0.0:9091",
			"external_ui": "/etc/homeproxy/ui/",
			"external_ui_download_url": "https://github.com/Zephyruso/zashboard/releases/latest/download/dist-no-fonts.zip",
			"external_ui_download_detour": "direct-out",
			"default_mode": "rule"
		}
	}
}
