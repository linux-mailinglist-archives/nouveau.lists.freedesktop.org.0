Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C351D77875
	for <lists+nouveau@lfdr.de>; Sat, 27 Jul 2019 13:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41E56EE9C;
	Sat, 27 Jul 2019 11:37:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from relay05.pair.com (relay05.pair.com [216.92.24.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6685E6EE9C
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 11:37:29 +0000 (UTC)
Received: from orac.inputplus.co.uk (unknown [87.112.147.151])
 by relay05.pair.com (Postfix) with ESMTP id EEB581A39E2
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 07:37:26 -0400 (EDT)
Received: from orac.inputplus.co.uk (orac.inputplus.co.uk [IPv6:::1])
 by orac.inputplus.co.uk (Postfix) with ESMTP id 2EF4D21F78
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2019 12:37:26 +0100 (BST)
To: nouveau@lists.freedesktop.org
From: Ralph Corderoy <ralph@inputplus.co.uk>
MIME-Version: 1.0
Date: Sat, 27 Jul 2019 12:37:26 +0100
Message-Id: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
Subject: [Nouveau] Video Hardware Decoding: Jittery Rectangles on Nvidia
 GT218 NVA8 VP4.
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGksCgpJJ20gaGF2aW5nIHRyb3VibGUgd2l0aCBoYXJkd2FyZSBkZWNvZGluZyBvZiB2aWRlbyB3
aXRoIG1wdigxKSBoYXZpbmcKc3dpdGNoZWQgZnJvbSBOdmlkaWEncyBwcm9wcmlldGFyeSBkcml2
ZXIgdG8gbm91dmVhdSBkdWUgdG8gQXJjaCBMaW51eApyZW1vdmluZyBpdHMgbnZpZGlhLTM0MHh4
IHBhY2thZ2UuCgpUaGUgbWFjaGluZSBpcyBhbiBBY2VyIFJldm8uCgogICAgJCBsc3BjaSAtbm4g
fCBncmVwIFZHQQogICAgMDE6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyIFswMzAwXTog
TlZJRElBIENvcnBvcmF0aW9uIEdUMjE4IFtJT05dIFsxMGRlOjBhNjRdIChyZXYgYTIpCgpJIHRo
aW5rIHRoaXMgaXMgY29kZW5hbWUgTlZBOCB3aXRoIHRoZSB2aWRlby1hY2NsZXJhdGlvbiBlbmdp
bmUgVlA0LjAuCgpJJ3ZlIHRoZXNlIHBhY2thZ2VzIGluc3RhbGxlZCwgZm9sbG93aW5nCmh0dHBz
Oi8vd2lraS5hcmNobGludXgub3JnL2luZGV4LnBocC9Ob3V2ZWF1IGFuZApodHRwczovL3dpa2ku
YXJjaGxpbnV4Lm9yZy9pbmRleC5waHAvSGFyZHdhcmVfdmlkZW9fYWNjZWxlcmF0aW9uCgogICAg
JCBwYWNtYW4gLVEgfCBlZ3JlcCAnbnZpZGlhfG5vdXZlYXV8bWVzYXx2ZHBhdXx2YWFwaXx4b3Jn
LXNlcnZlcicKICAgIGxpYnZhLW1lc2EtZHJpdmVyIDE5LjEuMy0xCiAgICBsaWJ2YS12ZHBhdS1k
cml2ZXIgMC43LjQtNAogICAgbGlidmRwYXUgMS4yLTEKICAgIGxpYnZkcGF1LXZhLWdsIDAuNC4y
LTIKICAgIG1lc2EgMTkuMS4zLTEKICAgIG1lc2EtZGVtb3MgOC40LjAtMQogICAgbWVzYS12ZHBh
dSAxOS4xLjMtMQogICAgbm91dmVhdS1mdyAzMjUuMTUtMQogICAgdmRwYXVpbmZvIDEuMC0zCiAg
ICB4Zjg2LXZpZGVvLW5vdXZlYXUgMS4wLjE2LTEKICAgIHhvcmctc2VydmVyIDEuMjAuNS0yCiAg
ICB4b3JnLXNlcnZlci1jb21tb24gMS4yMC41LTIKICAgICQKCkEgcGFzdGUgb2YgdmRwYXVpbmZv
KDEpJ3Mgb3V0cHV0IGlzIGF0IGh0dHA6Ly9peC5pby8xUEhpLgoKSSd2ZSBtYW55IHNhbXBsZSB2
aWRlb3MgdGhhdCBleGhpYml0IHRoZSBzYW1lIHByb2JsZW0sIGJ1dCBJJ2xsIHN0aWNrCndpdGgg
b25lIGZyb20gQkJDJ3MgaVBsYXllciBvYnRhaW5lZCB3aXRoIGdldF9pcGxheWVyKDEpLgoKICAg
ICQgZmZtcGVnIC1pICRmIHwmIGdyZXAgVmlkZW86CiAgICAgICAgU3RyZWFtICMwOjAodW5kKTog
VmlkZW86IGgyNjQgKE1haW4pIChhdmMxIC8gMHgzMTYzNzY2MSksCiAgICAgICAgICAgIHl1djQy
MHAodHYsIGJ0NzA5KSwgOTYweDU0MCBbU0FSIDE6MSBEQVIgMTY6OV0sIDE2MDIga2IvcywKICAg
ICAgICAgICAgMjUgZnBzLCAyNSB0YnIsIDkwayB0Ym4sIDUwIHRiYyAoZGVmYXVsdCkKClBsYWlu
IG9sZCBgbXB2ICRmJyBwbGF5cyBmaW5lLCB1c2luZyBzb2Z0d2FyZSBkZWNvZGluZy4KCiAgICBW
TzogW2dwdV0gOTYweDU0MCB5dXY0MjBwCgpBZGRpbmcgYC0tdm89dmRwYXUnIGdpdmVzCgogICAg
Vk86IFt2ZHBhdV0gOTYweDU0MCB5dXY0MjBwCiAgICBbdm8vdmRwYXVdIENvbXBvc2l0aW5nIHdp
bmRvdyBtYW5hZ2VyIGRldGVjdGVkLiBBc3N1bWluZyB0aW1pbmcgaW5mbwogICAgICAgIGlzIGlu
YWNjdXJhdGUuCgpQbGF5YmFjayBpcyBmaW5lLCBzdGlsbCBzb2Z0d2FyZSBkZWNvZGluZy4KCmAt
LXZvPXZkcGF1IC0taHdkZWM9dmRwYXUnIHVzZXMgaGFyZHdhcmUgZGVjb2Rpbmc6CgogICAgVXNp
bmcgaGFyZHdhcmUgZGVjb2RpbmcgKHZkcGF1KS4KICAgIFZPOiBbdmRwYXVdIDk2MHg1NDAgdmRw
YXVbeXV2NDIwcF0KICAgIFt2by92ZHBhdV0gQ29tcG9zaXRpbmcgd2luZG93IG1hbmFnZXIgZGV0
ZWN0ZWQuIEFzc3VtaW5nIHRpbWluZyBpbmZvCiAgICAgICAgaXMgaW5hY2N1cmF0ZS4KClRoZSB2
aWRlbyBwbGF5cywgQ1BVIGxvYWQgaXMgbGVzcyAobXkgYWltKSwgYnV0IHRoZXJlJ3Mg4oCYdGVh
cmluZ+KAmSBvZiB0aGUKcGljdHVyZSBhcyBpZiBzbWFsbCByZWN0YW5nbGVzIHRoYXQgYXJlIHVw
ZGF0ZXMgYXJlIGFwcGVhcmluZyBpbiB0aGUKd3JvbmcgbG9jYXRpb24sIG9mZiBieSBhIGxpdHRs
ZS4gIElmIEkgc3RlcCB0aHJvdWdoIHRoZSBmcmFtZXMgd2l0aAptcHYncyDigJgu4oCZIGFuZCDi
gJgs4oCZIHRoZW4gSSd2ZSBmb3VuZCBhIHBhdHRlcm46IG9uZSBmcmFtZSdzIHBpY3R1cmUgaXMK
Z29vZCwgZm9sbG93ZWQgYnkgTiBiYWQgb25lcyB3aGVyZSBOIGlzIDMgb3IgNywgaS5lLiBldmVy
eSA0dGggb3IgOHRoCmZyYW1lIGlzIG9rYXkuICBEb24ndCBrbm93IGlmIHRoYXQncyBhIGNsdWUg
b3IgaGVscHMgc29tZW9uZSBoZXJlCnJlY29nbmlzZSBhIGtub3duIHByb2JsZW0uCgpJIGtub3cg
WCB3ZWxsLCBidXQgTWVzYSwgZXRjLiwgYmVsb3cgaXQgYXJlIHVua25vd24gdG8gbWUsIGV2ZW4g
dG8gdGhlCmV4dGVudCBvZiBrbm93aW5nIHF1aXRlIGhvdyBhbGwgdGhlIGJpdHMgZml0IHRvZ2V0
aGVyLiAgSSdkIGFwcHJlY2lhdGUgYQpwb2ludGVyIG9yIHR3byBhcyB0byBob3cgdG8gdGFja2xl
IHRoZSBwcm9ibGVtLCBldmVuIGlmIGl0J3MgYSDigJhZb3UndmUKY29tZSB0byB0aGUgd3Jvbmcg
cGxhY2UsIGdvIG92ZXIgdGhlcmXigJkuICA6LSkKCi0tIApDaGVlcnMsIFJhbHBoLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
