Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9B1C5DD7
	for <lists+nouveau@lfdr.de>; Tue,  5 May 2020 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293B46E823;
	Tue,  5 May 2020 16:50:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net
 (p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77A86E823
 for <nouveau@lists.freedesktop.org>; Tue,  5 May 2020 16:50:19 +0000 (UTC)
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
 by : HOSTING RELAY : with ESMTP
 id W0kwjsatgNyMyW0kwjE5gu; Tue, 05 May 2020 09:49:18 -0700
X-CMAE-Analysis: v=2.3 cv=BvLjPrf5 c=1 sm=1 tr=0
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=vzojZ+xi7nkP3DSvfKPyiQ==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=sTwFKg_x9MkA:10
 a=wlxRhyA_AAAA:8 a=QomNCMz4a4JRQ_UFXN8A:9 a=QEXdDO2ut3YA:10
 a=lH2ZQbBRcvJ-3MYBAruV:22
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from ool-45758b00.dyn.optonline.net ([69.117.139.0]:47350
 helo=[192.168.62.65])
 by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <22t@tripolho.com>)
 id 1jW0kw-00FSdK-24; Tue, 05 May 2020 09:49:18 -0700
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <46ba2ff8-c8cf-0f72-62d0-b17178b0f2ac@tripolho.com>
 <CAKb7UvguvnBnauKhcc4CPoZE=vRzj46JWKQDND=MBJZ89p13vg@mail.gmail.com>
 <a6346e40-a4ed-0d59-47c9-3afea2dd7274@tripolho.com>
 <CAKb7Uvjt77zM0ATjwCNcCAh46+kj8HkOAinuN8vdUACKcPPGjg@mail.gmail.com>
From: Alberto Sentieri <22t@tripolho.com>
Message-ID: <ff90c308-a015-0dff-debc-40d618d9a579@tripolho.com>
Date: Tue, 5 May 2020 12:49:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvjt77zM0ATjwCNcCAh46+kj8HkOAinuN8vdUACKcPPGjg@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0564.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tripolho.com
X-Get-Message-Sender-Via: p3plcpnl0564.prod.phx3.secureserver.net: authenticated_id:
 a1@tripolho.com
X-Authenticated-Sender: p3plcpnl0564.prod.phx3.secureserver.net: a1@tripolho.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4wfBP8uI/7iE7jrdwSPxNAYHS0iVj45CyIPhf/Xfoqf/7O2B+ViHVDMbEGvprjW5Vc98b135JzPjm8vm97gJZrtMsJSjx9W8dbRSrIsraOMUjzg8LShzyg
 7xQKy8ttk48ZyYhYI0Jq7mEi6UQAh5o/3snk9OUQPmx6uWEFOG9kLC5ROkjUfyhxPtL1wElpnDmuKXgnM2/EiFROzM6FtaBH/1E=
Subject: Re: [Nouveau] problems with NVS310
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSBndWVzcyB0aGUgRFZJIGFkYXB0ZXIgaXMgcGFzc2l2ZS4KCiQgeHJhbmRyIC0tcHJvcHMKU2Ny
ZWVuIDA6IG1pbmltdW0gMzIwIHggMjAwLCBjdXJyZW50IDQ0ODAgeCAxNDQwLCBtYXhpbXVtIDgx
OTIgeCA4MTkyClhXQVlMQU5EMSBjb25uZWN0ZWQgMTkyMHgxMDgwKzArMCAobm9ybWFsIGxlZnQg
aW52ZXJ0ZWQgcmlnaHQgeCBheGlzIHkgCmF4aXMpIDUxMG1tIHggMjkwbW0KIMKgwqDCoCBub24t
ZGVza3RvcDogMAogwqDCoMKgIMKgwqDCoCBzdXBwb3J0ZWQ6IDAsIDEKIMKgwqAgMTkyMHgxMDgw
wqDCoMKgwqAgNTkuOTYqKwpYV0FZTEFORDQgY29ubmVjdGVkIDI1NjB4MTQ0MCsxOTIwKzAgKG5v
cm1hbCBsZWZ0IGludmVydGVkIHJpZ2h0IHggYXhpcyAKeSBheGlzKSA2MDBtbSB4IDM0MG1tCiDC
oMKgwqAgbm9uLWRlc2t0b3A6IDAKIMKgwqDCoCDCoMKgwqAgc3VwcG9ydGVkOiAwLCAxCiDCoMKg
IDI1NjB4MTQ0MMKgwqDCoMKgIDU5LjkxKisKCk9uIDUvNS8yMCAxMToxNyBBTSwgSWxpYSBNaXJr
aW4gd3JvdGU6Cj4gT24gVHVlLCBNYXkgNSwgMjAyMCBhdCAxMTowMiBBTSBBbGJlcnRvIFNlbnRp
ZXJpIDwyMnRAdHJpcG9saG8uY29tPiB3cm90ZToKPj4gSSBoYXZlIHR3byBtb25pdG9ycyBjb25u
ZWN0ZWQgdG8gdGhlIFBDLiBPbmUgaXMgYW4gQU9DIDIzIiAoMTkyMCB4IDEwODApCj4+IGFuZCB0
aGUgb3RoZXIgaXMgYSBCZW5RIDI3IiAoMjU2MCB4IDE0NDApLiBOb3RoaW5nIHNwZWNpYWwgYWJv
dXQgdGhlbS4KPj4gQmVuUSBoYXMgYSBkaXNwbGF5IHBvcnQgYW5kIHRoZSBBT0MgdXNlcyBzb21l
IHNvcnQgb2YgRFZJIGFkYXB0ZXIuCj4gRG8geW91IGtub3cgaWYgdGhlIERWSSBhZGFwdGVyIGlz
IGFjdGl2ZSBvciBwYXNzaXZlPyAoSWYgeW91IGluY2x1ZGUKPiB0aGUgRURJRCwgdGhhdCBzaG91
bGQgYmVjb21lIGFwcGFyZW50LiBJdCBzaG91bGQgYmUgdmlzaWJsZSBpbiAieHJhbmRyCj4gLS1w
cm9wcyIpCj4KPj4gSSBoYXZlIHRoaXMgZXZlbnQgbWFueSB0aW1lcyBhbmQgSSBjYXB0dXJlZCBk
bWVzZyB0d2ljZS4gQXQgbGVhc3QgYXQgb25lCj4+IHRpbWUgSSBjYXB0dXJlZCBkbWVzZyBteSBj
b21wdXRlciB3YXMgdW5kZXIgaGlnaCBsb2FkOiBpdCBoYWQgYWJvdXQgMTUKPj4gdG8gMjAgd2lu
ZG93cyBvcGVuZWQgKHNwcmVhZHNoZWV0cywgVGh1bmRlcmJpcmQsIEZpcmVmb3gsIHZpcnR1YWwK
Pj4gbWFjaGluZXMgdW5kZXIgdmlydHVhbCBib3gpLCB0aGVyZSB3YXMgYSBsb3Qgb2YgZGlzayBh
Y3Rpdml0eSBhbmQgSSB3YXMKPj4gYXMgdHJ5aW5nIHRvIGNhcHR1cmUgYSBzY3JlZW5zaG90IGZy
b20gRmlyZWZveCB1c2luZyB0aGUgc2NyZWVuc2hvdAo+PiB0b29sLiBJIGNvdWxkIG5vdCBtYWtl
IGV2ZXJ5dGhpbmcgZml0IGludG8gb25lIHNjcmVlbiwgc28gSSBoaXQgRjExCj4+ICh3aGlsZSBp
biBGaXJlZm94KSwgY2FwdHVyZWQgd2hhdCBJIG5lZWRlZCAobm93IGl0IGZpdCksIGFuZCB3aGVu
IEkKPj4gcHJlc3NlZCBGMTEgYWdhaW4gdG8gbWFrZSBGaXJlZm94IGNvbWUgYmFjayB0byBhIHJl
Z3VsYXIgd2luZG93LCBpdAo+PiBsb2NrZWQ6IEkgY291bGQgbm90IG1vdmUgdGhlIG1vdXNlIGFu
ZCBjYXBzIGxvY2sgbGVkIHdhcyBmcm96ZW4uCj4gSG0sIG1vdmluZyBiZXR3ZWVuIGZ1bGwgc2Ny
ZWVuL25vdCBpcyBhdCBsZWFzdCBhIHBhZ2UtZmxpcCBpZiB3YXlsYW5kCj4gaXMgYmVpbmcgdXNl
ZC4gSSBndWVzcyBpdCdzIHBsYXVzaWJsZS4KPgo+ICAgIC1pbGlhCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
