Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 430011CEEEF
	for <lists+nouveau@lfdr.de>; Tue, 12 May 2020 10:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E36C6E86F;
	Tue, 12 May 2020 08:16:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 969F76E86F;
 Tue, 12 May 2020 08:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EFFF42A6046;
 Tue, 12 May 2020 10:16:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id tQpXDyvWFP9w; Tue, 12 May 2020 10:16:40 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id AE06A2A6042;
 Tue, 12 May 2020 10:16:40 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jYQ5g-000hcP-8a; Tue, 12 May 2020 10:16:40 +0200
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com>
 <20200511171722.96576-2-christian.koenig@amd.com>
 <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ba0b1ab7-3078-a6f2-41cd-326ca21ee99f@daenzer.net>
Date: Tue, 12 May 2020 10:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MyO_L+1w69qDLzhg34W6Qer-uSRR2tb7-2uXLC_6PXSg@mail.gmail.com>
Content-Language: en-CA
Subject: Re: [Nouveau] [PATCH 1/3] drm/radeon: remove AGP support
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0xMSAxMDoxMiBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gT24gTW9uLCBN
YXkgMTEsIDIwMjAgYXQgMToxNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gQUdQIGlzIGRlcHJlY2F0ZWQgZm9yIDEw
KyB5ZWFycyBub3cgYW5kIG5vdCB1c2VkIGFueSBtb3JlIG9uIG1vZGVybiBoYXJkd2FyZS4KPj4K
Pj4gT2xkIGhhcmR3YXJlIHNob3VsZCBjb250aW51ZSB0byB3b3JrIGluIFBDSSBtb2RlLgo+IAo+
IE1pZ2h0IHdhbnQgdG8gY2xhcmlmeSB0aGF0IHRoZXJlIGlzIG5vIGxvc3Mgb2YgZnVuY3Rpb25h
bGl0eSBoZXJlLgo+IFNvbWV0aGluZyBsaWtlOgo+IAo+ICJUaGVyZSBpcyBubyBsb3NzIG9mIGZ1
bmN0aW9uYWxpdHkgaGVyZS4gIEdQVXMgd2lsbCBjb250aW51ZSB0bwo+IGZ1bmN0aW9uLiAgVGhp
cyBqdXN0IGRyb3BzIHRoZSB1c2Ugb2YgdGhlIEFHUCBNTVUgaW4gdGhlIGNoaXBzZXQgaW4KPiBm
YXZvciBvZiB0aGUgTU1VIG9uIHRoZSBkZXZpY2Ugd2hpY2ggaGFzIHByb3ZlbiB0byBiZSBtdWNo
IG1vcmUKPiByZWxpYWJsZS4gIER1ZSB0byBpdHMgdW5yZWxpYWJpbGl0eSwgQUdQIHN1cHBvcnQg
aGFzIGJlZW4gZGlzYWJsZWQgb24KPiBQb3dlclBDIGZvciB5ZWFycyBhbHJlYWR5IHNvIHRoZXJl
IGlzIG5vIGNoYW5nZSBvbiBQb3dlclBDLiIKClRoZXJlJ3MgYSBkaWZmZXJlbmNlIGJldHdlZW4g
c29tZXRoaW5nIGJlaW5nIGRpc2FibGVkIGJ5IGRlZmF1bHQgb3Igbm90CmJlaW5nIGF2YWlsYWJs
ZSBhdCBhbGwuIFdlIG1heSBkZWNpZGUgaXQncyB3b3J0aCBpdCBhbnl3YXksIGJ1dCBsZXQncyBk
bwppdCBiYXNlZCBvbiBmYWN0cy4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
