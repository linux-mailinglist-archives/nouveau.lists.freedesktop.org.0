Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6456839B3
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 21:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E036E89C46;
	Tue,  6 Aug 2019 19:31:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2019 19:31:12 UTC
Received: from o4.31pqt.s2shared.sendgrid.net (o4.31pqt.s2shared.sendgrid.net
 [167.89.55.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38289C46
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 19:31:12 +0000 (UTC)
Received: by filter0040p3iad2.sendgrid.net with SMTP id
 filter0040p3iad2-13919-5D49D44B-1E
 2019-08-06 19:26:03.37979265 +0000 UTC m=+952829.501058008
Received: from mail.lockie.ca (unknown [216.58.19.197])
 by ismtpd0015p1iad1.sendgrid.net (SG) with ESMTP id FqKALBcMTfWlhFQu18oMJw
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 19:26:03.298 +0000 (UTC)
Received: from [192.168.1.45] (Tomato-Router [192.168.1.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.lockie.ca (Postfix) with ESMTPSA id B5B1C51E18
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 15:26:02 -0400 (EDT)
From: James Lockie <bjlockie@lockie.ca>
Date: Tue, 06 Aug 2019 19:26:03 +0000 (UTC)
Message-ID: <16c68653940.279c.665a3322dda79c663fe860d9fff7dd5d@lockie.ca>
In-Reply-To: <CAKb7Uvgnegj15BMoUoH9UT1oP6e4+KHxUShwpMTnu1U5xOu9_A@mail.gmail.com>
References: <qic915$1j2$1@blaine.gmane.org>
 <CAKb7Uvg-7UVzYJXy3YBpV038yfsZx2hx-LZ7omR9HnCiZwYmXA@mail.gmail.com>
 <qicbpr$6q56$1@blaine.gmane.org> <qicci7$9ci$1@blaine.gmane.org>
 <CAKb7Uvgnegj15BMoUoH9UT1oP6e4+KHxUShwpMTnu1U5xOu9_A@mail.gmail.com>
User-Agent: AquaMail/1.20.0-1469 (build: 102100004)
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?1X41iaRO4wVP+tFXGLuxpd1C9qDgZBQBkY8GJJwx0SvCy6+WH=2FfsvgqT58AhWG?=
 =?us-ascii?Q?Qdc0TQMtYjhuqG5m3aFmB22VD6cJL4PYfGTlQFs?=
 =?us-ascii?Q?gyXxaZcww7QUR4lZzr=2FZLA3bHdLKlpw1sKSHvOH?=
 =?us-ascii?Q?2B1tdrDmyFeFhxYTSp0IeEIpnX8QGgEbgNTuEka?=
 =?us-ascii?Q?=2FP0bagxhL8jT3wgqX1IYyI002gJCgc1uAEWk4En?=
 =?us-ascii?Q?jgZPnJXQiiSCUYO5nji9eLk2ufccGS7am7XQx6?=
Cc: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sendgrid.net; 
 h=from:in-reply-to:references:subject:mime-version:cc:content-type:
 content-transfer-encoding;
 s=smtpapi; bh=ZaLo8+4UtgHt3QuNjMjLoqJtSNR9CLbC2HMGQTlVTP4=;
 b=oF/wjSu+c6rT3WTZtfKU5aHQ2m5VCx2yYG0+rTZb9Qeomni4aC39f3Qebo2Y4zYfNZtI
 ESw9kmr2oR7NEANphjhQeDHy2D+ou4kG0eUtPft6lPSEy9AQxmgSHZ2gJjz8gUpkH3OEvC
 1UK2yQAr5/hRfarerPekYIwN47eoxFu2Y=
Subject: Re: [Nouveau] unstable refresh rate
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gQXVndXN0IDYsIDIwMTkgMTozNjowOSBwLm0uIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4gd3JvdGU6Cgo+IENhbiB5b3UgdHJ5IHNvbWV0aGluZyB2ZXJ5IHNpbXBsZSAtIHVu
cGx1ZyB0aGUgY2FibGUsIGFuZCBwbHVnIGl0IGJhY2sKPiBpbiwgd2hpbGUgdGhlIFRWIGlzIG9u
LCBhbmQgc2V0IHRvIHRoZSBIRE1JIGlucHV0PwpJIHN0aWxsIG9ubHkgZ2V0IDMwSHouCkkgZGlk
IGp1c3QgdXBkYXRlIHRoZSB0diBmaXJtd2FyZSBzOSBtYXliZSB0aGF0IGlzIHdoeSBJIGNhbid0
IGdldCBpdCA2MEh6IAphbnltb3JlLgpJIHdpc2ggSSBrZXB0IGJldHRlciB0cmFjayBvZiB0aGUg
dGltZWxpbmUuCgpXaXRoIHRoZSBuZXcgSERNSSAyIGNhYmxlIEkgZ2V0IDQwOTZ4MjE2MEAzMEh6
ICh0aGVyZSBpcyBubyA2MEh6IG9wdGlvbikuCjM4NDB4MjE2MEA1OS45Njg1SHogZ2l2ZXMgbWUg
bm8gc2lnbmFsLgoKCj4gVGhhdCBzaG91bGQgZW5zdXJlCj4gdGhhdCB0aGUgU0NEQyB3cml0ZSBj
YW4gZ28gdGhyb3VnaCBhdCBtb2Rlc2V0IHRpbWUuCj4KPiBZb3UgY2FuIGFsc28gZm9yY2Ugbm91
dmVhdSB0byBhdm9pZCBhbnkgbW9kZXMgdGhhdCByZXF1aXJlIHNjcmFtYmxpbmcKPiBieSBib290
aW5nIHdpdGggbm91dmVhdS5oZG1pbWh6PTM0MC4KPgo+IENoZWVycywKPgo+ICAtaWxpYQo+Cj4g
T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjE1IFBNIEphbWVzIDxiamxvY2tpZUBsb2NraWUuY2E+
IHdyb3RlOgo+Pgo+PiBJIHdhcyBnb2luZyB0byBidXkgYSBuZXcgY2FibGUgYW5kIEkgY2FtZSBh
Y3Jvc3MgdGhpcyBkZXNjcmlwdGlvbjoKPj4+IENhdGVnb3J5IDIgQ2VydGlmaWVkIEhETUkgd2ly
ZSBzdXBwb3J0cyByZXNvbHV0aW9ucyB1cCB0byA0S3gySyAoVUhEKQo+PiBAMzAgSHoKPj4KPj4g
aHR0cHM6Ly93d3cuY25ldC5jb20vaG93LXRvL3doYXQtaXMtaGRtaS0yLTBiLwo+Pj4gSERNSSB2
ZXJzaW9ucyBjb21wYXJlZAo+Pj4gSERNSSBWZXJzaW9uICBNYXggUmVzb2x1dGlvbiAgTWF4IDRL
IEZyYW1lIHJhdGUgICAgICAgSERDUCAyLjIgICAgICAgIEhEUiAgIAo+Pj4gICBXQ0cgICAgIEh5
YnJpZCBMb2cgR2FtbWEgICAgICAgIER5bmFtaWMgTWV0YWRhdGEKPj4+IDEuNCAgIDRLICAgICAg
MzBIeiAgICBObyAgICAgIE5vICAgICAgTm8gICAgICBObyAgICAgIE5vCj4+PiAyLjAgICA0SyAg
ICAgIDYwSHogICAgWWVzICAgICBObyAgICAgIE5vICAgICAgTm8gICAgICBObwo+Pj4gMi4wYSAg
NEsgICAgICA2MEh6ICAgIFllcyAgICAgWWVzICAgICBZZXMgICAgIE5vICAgICAgTm8KPj4+IDIu
MGIgIDRLICAgICAgNjBIeiAgICBZZXMgICAgIFllcyAgICAgWWVzICAgICBZZXMgICAgIE5vCj4+
PiAyLjEgICAxMEsgICAgIDEyMEh6ICAgWWVzICAgICBZZXMgICAgIFllcyAgICAgWWVzICAgICBZ
ZXMKPj4KPj4gIkNhdGVnb3J5IDIiIGltcGxpZXMgSERNSSAyIGJ1dCB0aGUgIk1heCA0SyBGcmFt
ZSByYXRlIiBvZiAzMEh6IHNheXMgaXQKPj4gaXMgSERNSS0xLjQuCj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IE5vdXZlYXUgbWFpbGluZyBs
aXN0Cj4+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
