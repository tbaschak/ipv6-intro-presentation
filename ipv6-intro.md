% IPv6 Introduction
% Theo Baschak
% SkullSpace Hackathon


# Online HTML5 Slides

Presentation source/download available at [github.com/tbaschak/ipv6-intro-presentation](https://github.com/tbaschak/ipv6-intro-presentation)

# Who I Am

*	Primary Network Administrator of VOI Network Solutions -- Winnipeg-based commercial Internet Service Provider and carrier.
*	Involved with both Internet Exchanges in Winnipeg.
	*	Elected member on the Board of Directors for MBIX.
	*	Also involved with the creation and technical operations of WpgIX.
*	Avid opensource software user/fanatic, and recently, contributor.

# My Life with IPv6

*	Running IPv6 since ~2004.
	*	Over tunnels for many, many years.
	*	Native IPv6 since December 2012, via Voi Networks BGP address space.
*	My own network currently runs IPv6/OSPFv3 routing protocol.
	*	2604:4280:d00d::/48
	*	Most ciscodude.net/henchman21.net services are IPv4/IPv6 enabled.

# IPv6 Address Basics

*	The IPv6 address space is 128-bits (2^128) in size, containing 340,282,366,920,938,463,463,374,607,431,768,211,456 IPv6 addresses.
*	Like IPv4, Network and Host bits.
*	Unlike IPv4, Network and Host bits are usually equal.

# IPv6 Addressing (rfc4291)

*	Valid Host Addresses
	*	2001:DB8:0:0:8:800:200C:417A
	*	2001:DB8::8:800:200C:417A
	*	2604:4280:d00d::80
	*	2604:4280:d00d:200::1
	*	::1 (loopback)
	*	:: (0:0:0:0:0:0:0:0)

# IPv6 Address Sample

*	My IPv6 privacy address at the time of writing: 2604:4280:d00d:202:1986:feb8:ccb0:78e1
	*	Prefix: 2604:4280:d00d
	*	Network: $Prefix:202
	*	Host: 1986:feb8:ccb0:78e1

# rfc4291 (cont)

*	Valid Network Addresses
	*	2001:0DB8:0000:CD30:0000:0000:0000:0000/60
	*	2001:0DB8::CD30:0:0:0:0/60
	*	2001:0DB8:0:CD30::/60
	*	::/0

# ARP -> ND (rfc4861)

*	Uses link-layer multicast instead of broadcast.
*	Subcomponents include
	*	Address Resolution
	*	Duplicated Address Detection
	*	Neighbor Unreachability Detection
*	Makes use of a number of predefined multicast addresses (much like routing protocols)
	*	all-nodes (FF02::1)
	*	all-routers (FF02::2)
*	Many components require use of /64 subnet size.

# DHCP -> SLAAC / DHCPv6

*	DHCP for autoconfiguration has been replaced with SLAAC, and/or DHCPv6.
*	SLAAC uses Neighbor Discovery, ICMPv6 RA discovery, to autoconfigure addresses.
*	DHCPv6 does not currently send a default gateway, so SLAAC/RA is still required.
*	IPv4 untrusted layer 2 issues have followed to IPv6.
	*	Rogue DHCP -&gt; Rogue RA &amp; Rogue DHCPv6.
	*	DHCP Snooping -&gt; RA Guard in switches to mitigate.

# IPv4 vs IPv6 Subnets

*	Where a /24 is often used on LANs with IPv4, /64's are strongly encouraged with IPv6.
*	Recommended Site Prefix: /48 allows 64k /64's.
*	Residential providers often using DHCP6pd to allocate /60's to Customer routers (Including Xplornet).
*	Not using a /64 subnet prefix length will break many features of IPv6, including Neighbor Discovery, Secure Neighbor Discovery [[RFC3971]](http://tools.ietf.org/html/rfc3971), privacy extensions [[RFC4941]](http://tools.ietf.org/html/rfc4941), and Site Multihoming by IPv6 Intermediation [SHIM6], among others.

# Privacy Addresses (rfc4941)

*	Extension to SLAAC.
*	New random secondary privacy addresses regenerated periodically.
*	Can cause havok for Session based applications which tie the session to your IP (which is recommended to prevent session hijacking).

# ULA (rfc4193)

*	Stands for Unique Local IPv6 Unicast Addresses.
*	Similar to RFC1918 addresses, for use within LANs and/or isolated/non-connected networks.
*	Supposed to be generated using a specific algorithm, they are guaranteed of being somewhat globally unique as well.
	*	[SiXXs ULA Generator](https://www.sixxs.net/tools/grh/ula/)

# FreeBSD Server

*	<code>/etc/rc.conf</code> snippet

	```
ifconfig_em0_ipv6="inet6 2604:4280:d00d::443/64"
ipv6_defaultrouter="2604:4280:d00d::1"
```

*	In FreeBSD <code>ipv6_enable="yes"</code> is required to enable SLAAC.
*	SLAAC addresses can cause issues for mail and other servers where outbound traffic is expected to originate from a specific address.

# Debian Server

*	<code>/etc/network/interfaces</code> snippet

	```
iface eth0 inet6 static
	address 2604:4280:D00D::78
	gateway 2604:4280:D00D::1
	netmask 64
	pre-up echo 0 > /proc/sys/net/ipv6/conf/$IFACE/autoconf
```

*	The pre-up command disables SLAAC (where required).

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

# Questions / End

*	Question & Answer period as time permits.

. . .

*	Presentation source/download available at [github](https://github.com/tbaschak/ipv6-intro-presentation)
