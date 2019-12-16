Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EA1211FA
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2019 18:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9A6E84D;
	Mon, 16 Dec 2019 17:42:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D2B6E84D
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2019 17:42:24 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 35790 invoked from network);
 16 Dec 2019 18:42:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1576518141; bh=Y4El8CtteZvZM7BHhTBasxA8BHjL1czoyLKEnQyLYY4=;
 h=Subject:To:Cc:From;
 b=ZMNdN/FCGn53hsk0UUUFoka/uWy91ngwuzlJfyN9hXUqQhI9T24MyxvsjrFBSn+S1
 QAWRiTYhdwtVpuz9Z0IfMHbdAkmrmxJduv/ne95aEs91AK5dByuobmFtGy0mhC/ljE
 XzDCOIO9dkcRqKihcAL+jyo9KOokrDSPGgGerA0U=
Received: from no-mans-land.m247.com (HELO me.smtp.wp.pl)
 (mszpak@wp.pl@[185.244.214.240]) (envelope-sender <mszpak@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <nouveau@lists.freedesktop.org>; 16 Dec 2019 18:42:21 +0100
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <c34a6fe1-80dd-a4db-c605-0a13c69e803f@wp.pl>
 <CAKb7UviSYORoeDm1sbDFEzkGd68+DV=StCpzsiaGbA=1VQX3gw@mail.gmail.com>
From: =?UTF-8?Q?Marcin_Zaj=c4=85czkowski?= <mszpak@wp.pl>
Message-ID: <233aafa2-1474-39bf-8ea0-fe1a3ecef167@wp.pl>
Date: Mon, 16 Dec 2019 18:42:21 +0100
User-Agent: Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UviSYORoeDm1sbDFEzkGd68+DV=StCpzsiaGbA=1VQX3gw@mail.gmail.com>
Content-Language: en-US
X-WP-MailID: 758c45743cd25f811a3a89f99b5dedfa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [oTIB]                               
Subject: Re: [Nouveau] Tracking down severe regression in 5.3-rc4/5.4 for
 TU116 - assistance needed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0xNiAxODowOCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gSGkgTWFyY2luLAo+IAo+
IFlvdSBzaG91bGQgZG8gYSBnaXQgYmlzZWN0IHJhdGhlciB0aGFuIGd1ZXNzaW5nIGFib3V0IGNv
bW1pdHMuIEkKPiBzdXNwZWN0IHRoYXQgc2VhcmNoaW5nIGZvciAia2VybmVsIGdpdCBiaXNlY3Qg
ZmVkb3JhIiBzaG91bGQgcHJvdmUKPiBpbnN0cnVjdGl2ZSBpZiB5b3UncmUgbm90IHN1cmUgaG93
IHRvIGRvIHRoaXMuCgpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4gSSByZWFsaXplIHRoYXQg
SSBjYW4gZG8gaXQgYXQgdGhlIEdpdCBsZXZlbAphbmQgaXQgaXMgdGhlIHVsdGltYXRlIHdheSB0
byBnby4gSG93ZXZlciwgYnVpbGRpbmcgdGhlIGtlcm5lbCB2ZXJzaW9uCmZyb20gc291cmNlcyB0
YWtlcyBzb21lIHRpbWUgKGluIGFkZGl0aW9uIHRvIGEgcmVndWxhciB0aW1lIG5lZWRlZCB0bwpp
bnN0YWxsL3Jlc3RhcnQvdmVyaWZ5IHdoaWNoIEkgYWxyZWFkeSBleHBlcmllbmNlZCBuYXJyb3dp
bmcgZG93biB0byBhCiJqdXN0IiB+MjUwIGNvbW1pdHMpLgoKVGhlcmVmb3JlLCBJIHdvdWxkIGJl
IHJlYWxseSB0aGFua2Z1bCBmb3IgYSBzdWdnZXN0aW9uIHdoaWNoIGNvbW1pdHMKY291bGQgYmUg
Z29vZCB0byBjaGVjayBmaXJzdCAtIGhhdmluZyAyLCA0IGlzIGJldHRlciB0aGFuIDgtMTAgKGFz
c3VtaW5nCnNvbWVvbmUgaXMgcmlnaHQgOikgKS4KCk1hcmNpbgoKCgo+IE9uIE1vbiwgRGVjIDE2
LCAyMDE5IGF0IDExOjQyIEFNIE1hcmNpbiBaYWrEhWN6a293c2tpIDxtc3pwYWtAd3AucGw+IHdy
b3RlOgo+Pgo+PiBIaSwKPj4KPj4gSSd2ZSBlbmNvdW50ZXJlZCBhIHNldmVyZSByZWdyZXNzaW9u
IGluIFRVMTE2IChwcm9iYWJseSBhbHNvIFRVMTE3KQo+PiBpbnRyb2R1Y2VkIGluIDUuMy1yYzQg
KHZhbGlkIGFsc28gZm9yIHJlY2VudCA1LjQuMikgWzFdLiBUaGUgc3lzdGVtCj4+IHVzdWFsbHkg
aGFuZ3Mgb24gdGhlIHN1YnNlcXVlbnQgZ3JhcGhpYyBtb2RlIHJlbGF0ZWQgb3BlcmF0aW9uIChj
YWxsaW5nCj4+IHhyYW5kciBhZnRlciBsb2dpbiBpcyBlbm91Z2gpIHdpdGggdGhlIGZvbGxvd2lu
ZyBlcnJvcjoKPj4KPj4+IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IFNDSEVE
X0VSUk9SIDA4IFtdCj4+IC4uLgo+Pj4ga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJN
OiBmYWlsZWQgdG8gaWRsZSBjaGFubmVsIDAgW0RSTV0KPj4+IGtlcm5lbDogbm91dmVhdSAwMDAw
OjAxOjAwLjA6IGkyYzogYXV4IDAwMDc6IGJlZ2luIGlkbGUgdGltZW91dCBmZmZmZmZmZgo+Pj4g
a2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogdG1yOiBzdGFsbGVkIGF0IGZmZmZmZmZmZmZm
ZmZmZmYKPj4+IGtlcm5lbDogLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+
PiBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiB0aW1lb3V0Cj4+PiBrZXJuZWw6IFdBUk5J
Tkc6IENQVTogMTAgUElEOiAzODQgYXQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJk
ZXYvYmFyL2c4NC5jOjM1IGc4NF9iYXJfZmx1c2grMHhjZi8+IDB4ZTAgW25vdXZlYXVdCj4+Cj4+
IChkZXRhaWxlZCBsb2cgaW4gYSBjb3JyZXNwb25kaW5nIGlzc3VlIC0gWzFdKQo+Pgo+PiBXaXRo
IGVhcmxpZXIga2VybmVscyB0aGVyZSB3YXMgbm8gaGFyZHdhcmUgYWNjZWxlcmF0aW9uIGZvciBO
VmlkaWEgR1RYCj4+IDE2NjAgVGksIGJ1dCBhdCBsZWFzdCBJIGNvdWxkIHVzZSBub3V2ZWF1IHRv
IGRpc2FibGUgaXQgKHRvIHNhdmUKPj4gYmF0dGVyeSwgdHJlZXMgYW5kIGxvd2VyIHRlbXBlcmF0
dXJlKSBvciBldmVuIGhhdmUgYW4gZXh0ZXJuYWwgb3V0cHV0Cj4+ICh3aXRoIFdheWxhbmQpLiBO
b3csIHRoZSBzeXN0ZW0gaXMgdW51c2FibGUgd2l0aCBub3V2ZWF1IDooLgo+Pgo+PiBJIHNwZW50
IHNvbWUgdGltZSB0cnlpbmcgdG8gbmFycm93IHRoZSBzY29wZSB1c2luZyBvbiB0aGUgZXhpc3Rp
bmcKPj4ga2VybmVsIGJ1aWxkcyBmb3IgRmVkb3JhLiBJIHdhcyBhYmxlIHRvIGRldGVybWluZSB0
aGF0IHRoZSBwcm9ibGVtIHdhcwo+PiBpbnRyb2R1Y2VkIGJldHdlZW4gNS4zLjAtMC5yYzMuZ2l0
MS4xIChjb21taXQgMzM5MjBmMWVjNWJmIC0gd29ya3MgZmluZSkKPj4gYW5kIDUuMy4wLTAucmM0
LmdpdDAuMSAodGFnIHY1LjMtcmM0IC0gZmFpbHMgd2l0aCBlcnJvcnMpLgo+Pgo+PiBJdCdzIGp1
c3QgYSBmZXcgZGF5cyAoNy0xMSBBdWcpIGFuZCAib25seSIgYXJvdW5kIDI1MCBjb21taXRzLiBJ
IHdlbnQKPj4gdGhyb3VnaCB0aGVtLCBidXQgKGJhc2VkIG9uIHRoZSBjb21taXRzIG5hbWUpIEkg
aGF2ZW4ndCBzZWVuIGFueSBub3V2ZWF1Cj4+IHJlbGF0ZWQgY2hhbmdlcyBhbmQgaW4gZ2VuZXJh
bCBubyB2ZXJ5IHN1c3BlY3RlZCBkcm0gcmVsYXRlZCBjaGFuZ2VzLgo+Pgo+Pj4gZ2l0IGxvZyAz
MzkyMGYxZWM1YmYuLnY1LjMtcmM0IC0tc3RhdAo+Pgo+Pgo+PiBNYXliZSBzb21lIG9mIG1vcmUg
bm91dmVhdS9kcm0tZXhwZXJpZW5jZWQgZGV2ZWxvcGVycyBjb3VsZCB0YWtlIGEgbG9vawo+PiBh
dCB0aGF0IHRvIGRldGVybWluZSB3aGljaCBjb21taXQgY291bGQgYnJlYWsgaXQgKHRvIG1ha2Ug
aXQgZWFzaWVyIHRvCj4+IGZpbmQgb3V0IHdoYXQgc2hvdWxkIGJlIGZpeGVkIHRvIHByZXZlbnQg
dGhhdCByZWdyZXNzaW9uKT8KPj4KPj4KPj4gWzFdIC0KPj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3hvcmcvZHJpdmVyL3hmODYtdmlkZW8tbm91dmVhdS9pc3N1ZXMvNTE2Cj4+Cj4+
IFRoYW5rcyBpbiBhZHZhbmNlCj4+IE1hcmNpbgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+PiBOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
