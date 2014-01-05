% IPv6 Intro
% Theo Baschak
% SkullSpace Hackathon


# Online HTML5 Slides

Presentation source/download available at [github.com/tbaschak/ipv6-intro-presentation](https://github.com/tbaschak/ipv6-intro-presentation)

# Who I Am

*	Employed by VOI Network Solutions -- primary administrator of Winnipeg-based commercial Internet Service Provider and carrier.
*	Avid opensource software user/fanatic, and recently, contributor.
*	Involved with both Internet Exchanges in Winnipeg.
	*	Elected member on the Board of Directors for the Manitoba Internet Exchange (MBIX).
	*	Also involved with the creation and technical operations of the Winnipeg Internet Exchange (WpgIX).

# My IPv6 Experience

*	Running IPv6 since 2004
	*	Over tunnels for many, many years up until getting native IPv6
	*	Native IPv6 since December 2012, via Voi Networks BGP address space
*	My internal network currently runs OSPFv3 (IPv6 OSPF)
	*	2604:4280:d00d::/48

# IPv6 Address Basics

*	The IPv6 address space is 128-bits (2^128) in size, containing 340,282,366,920,938,463,463,374,607,431,768,211,456 IPv6 addresses.
*	Like IPv4, Network and Host bits.
*	Unlike IPv4, Network and Host bits are usually equal (at least on a /64 network)

# rfc4291: IPv6 Addressing

*	Valid Host Addresses
	*	2001:DB8:0:0:8:800:200C:417A
	*	2001:DB8::8:800:200C:417A
	*	2604:4280:d00d::80
	*	2604:4280:d00d:200::1
	*	::1 (loopback)
	*	:: (0:0:0:0:0:0:0:0)

# rfc4291 (cont)

*	Valid Network Addresses
	*	2001:0DB8:0000:CD30:0000:0000:0000:0000/60
	*	2001:0DB8::CD30:0:0:0:0/60
	*	2001:0DB8:0:CD30::/60
	*	::/0

# IPv6 Subnetting vs IPv4

*	Where a /24 is often used with IPv4, /64's are encouraged with IPv6.
	*	This allows various autoconfiguration mechanisms to function.
	*	a /48 (Recommended network size for one site) allows 64k /64's
	*	

# Resources

*	[ipv6.he.net/certification/](https://ipv6.he.net/certification/)
*	[www.sixxs.net/tools/grh/ula/](https://www.sixxs.net/tools/grh/ula/)
*	[ipvfoo chrome extension](https://code.google.com/p/ipvfoo/)
*	[ipvfox firefox extension](https://addons.mozilla.org/en-US/firefox/addon/ipvfox/)

# Useful IPv6 RFCs

*	[RFC2460: IPv6 Specification](http://tools.ietf.org/html/rfc2460)
*	[RFC6434: IPv6 Node Requirements](http://tools.ietf.org/html/rfc6434)
*	[RFC4291: IPv6 Addressing Architecture](http://tools.ietf.org/html/rfc4291)
*	[RFC3484: Default Address Selection](http://tools.ietf.org/html/rfc3484)
*	[RFC4193: Unique Local IPv6 Unicast Addresses (ULA)](http://tools.ietf.org/html/rfc4193)
*	[RFC4443: ICMPv6](http://tools.ietf.org/html/rfc4443)
*	[RFC3315: DHCPv6 client](http://tools.ietf.org/html/rfc3315)
*	[RFC4862: SLAAC](http://tools.ietf.org/html/rfc4862)
*	[RFC4861: Neighbor Discovery](http://tools.ietf.org/html/rfc4861)
*	[RFC6177: IPv6 Address Assignment to End Sites](http://tools.ietf.org/html/rfc6177)

# Even More IPv6 RFCs

*	[RFC1981: Path MTU Discovery](http://tools.ietf.org/html/rfc1981)
*	[RFC4213: Basic Transition Mechanisms for IPv6 Hosts and Routers](http://tools.ietf.org/html/rfc4213)
*	[RFC3596: DNS protocol extensions for incorporating IPv6 DNS resource records](http://tools.ietf.org/html/rfc3596)
*	[RFC2671: DNS message extension mechanism](http://tools.ietf.org/html/rfc2671)
*	[RFC3226: DNS message size requirements](http://tools.ietf.org/html/rfc3226)
*	[RFC5095: Deprecation of Type 0 Routing Headers in IPv6](http://tools.ietf.org/html/rfc5095)
*	More info at: http://www.ripe.net/ripe/docs/ripe-554
*	BIG GIANT list at: http://ipv6now.com.au/RFC.php

# The End

Presentation source/download available at [github.com/tbaschak/ipv6-intro-presentation](https://github.com/tbaschak/ipv6-intro-presentation)
