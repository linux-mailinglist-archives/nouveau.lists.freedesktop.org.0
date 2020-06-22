Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 787AE2042BA
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 23:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82CF6E145;
	Mon, 22 Jun 2020 21:33:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7876E145
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 21:33:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef1233d0000>; Mon, 22 Jun 2020 14:31:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 14:33:12 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 14:33:12 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 21:33:06 +0000
To: Zi Yan <ziy@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-15-rcampbell@nvidia.com>
 <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <21d571c4-8442-82df-4baf-e5d1c2ced99d@nvidia.com>
Date: Mon, 22 Jun 2020 14:33:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9948121A-CA52-494F-9B68-6C0089E15057@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592861501; bh=kKhAiBb2dmKarFPnUN3DCh6t35CXVfyB9l3jASZ5HS0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HVvsXz7yZCRk/1Gi4xfI78UyQRxmdOWyHhToZ7q8RRU/XpEchdduB5J1EdR3hAspm
 hDsQe33+5+b43imv23uHWzdOtu/wdiCleINuTsdiXDSmSJnsULEXoDAOCobWjGExzN
 eEYNrUPKYEbPolDSt41vTQAjr9TmQMvXHxQaUcKq9R2q8xQ+UhWJYoTQMe2vhOrlQV
 JegU98QBSfPri8F2t4Ac/QXcgu6CafkAPjclLPvNhHAXExBGCRihESc6Ph8qBSsPkG
 duBtcb0Bqwxweelf1+NLa4tv72S5t5/a4Bt8LgxdyA7dpOkyk8XmwrLxCJ2QwYJKWx
 6+r0Eu3vPylAg==
Subject: Re: [Nouveau] [PATCH 14/16] mm/thp: add THP allocation helper
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Jason
 Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDYvMjEvMjAgNToxNSBQTSwgWmkgWWFuIHdyb3RlOgo+IE9uIDE5IEp1biAyMDIwLCBhdCAx
Nzo1NiwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4gCj4+IFRyYW5zcGFyZW50IGh1Z2UgcGFnZSBh
bGxvY2F0aW9uIHBvbGljeSBpcyBjb250cm9sbGVkIGJ5IHNldmVyYWwgc3lzZnMKPj4gdmFyaWFi
bGVzLiBSYXRoZXIgdGhhbiBleHBvc2UgdGhlc2UgdG8gZWFjaCBkZXZpY2UgZHJpdmVyIHRoYXQg
bmVlZHMgdG8KPj4gYWxsb2NhdGUgVEhQcywgcHJvdmlkZSBhIGhlbHBlciBmdW5jdGlvbi4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+
PiAtLS0KPj4gICBpbmNsdWRlL2xpbnV4L2dmcC5oIHwgMTAgKysrKysrKysrKwo+PiAgIG1tL2h1
Z2VfbWVtb3J5LmMgICAgfCAxNiArKysrKysrKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dmcC5o
IGIvaW5jbHVkZS9saW51eC9nZnAuaAo+PiBpbmRleCA2N2EwNzc0ZTA4MGIuLjFjN2Q5NjhhMjdk
MyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9nZnAuaAo+PiArKysgYi9pbmNsdWRlL2xp
bnV4L2dmcC5oCj4+IEBAIC01NjIsNiArNTYyLDE2IEBAIGV4dGVybiBzdHJ1Y3QgcGFnZSAqYWxs
b2NfcGFnZXNfdm1hKGdmcF90IGdmcF9tYXNrLCBpbnQgb3JkZXIsCj4+ICAgCWFsbG9jX3BhZ2Vz
X3ZtYShnZnBfbWFzaywgMCwgdm1hLCBhZGRyLCBudW1hX25vZGVfaWQoKSwgZmFsc2UpCj4+ICAg
I2RlZmluZSBhbGxvY19wYWdlX3ZtYV9ub2RlKGdmcF9tYXNrLCB2bWEsIGFkZHIsIG5vZGUpCQlc
Cj4+ICAgCWFsbG9jX3BhZ2VzX3ZtYShnZnBfbWFzaywgMCwgdm1hLCBhZGRyLCBub2RlLCBmYWxz
ZSkKPj4gKyNpZmRlZiBDT05GSUdfQVJDSF9FTkFCTEVfVEhQX01JR1JBVElPTgo+PiArZXh0ZXJu
IHN0cnVjdCBwYWdlICphbGxvY190cmFuc2h1Z2VwYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAo+PiArCQkJCQl1bnNpZ25lZCBsb25nIGFkZHIpOwo+PiArI2Vsc2UKPj4gK3N0YXRpYyBp
bmxpbmUgc3RydWN0IHBhZ2UgKmFsbG9jX3RyYW5zaHVnZXBhZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsCj4+ICsJCQkJCQl1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICt7Cj4+ICsJcmV0dXJu
IE5VTEw7Cj4+ICt9Cj4+ICsjZW5kaWYKPj4KPj4gICBleHRlcm4gdW5zaWduZWQgbG9uZyBfX2dl
dF9mcmVlX3BhZ2VzKGdmcF90IGdmcF9tYXNrLCB1bnNpZ25lZCBpbnQgb3JkZXIpOwo+PiAgIGV4
dGVybiB1bnNpZ25lZCBsb25nIGdldF96ZXJvZWRfcGFnZShnZnBfdCBnZnBfbWFzayk7Cj4+IGRp
ZmYgLS1naXQgYS9tbS9odWdlX21lbW9yeS5jIGIvbW0vaHVnZV9tZW1vcnkuYwo+PiBpbmRleCAy
NWQ5NWY3YjFlOTguLmY3NDk2MzNlZDM1MCAxMDA2NDQKPj4gLS0tIGEvbW0vaHVnZV9tZW1vcnku
Ywo+PiArKysgYi9tbS9odWdlX21lbW9yeS5jCj4+IEBAIC03NzUsNiArNzc1LDIyIEBAIHZtX2Zh
dWx0X3QgZG9faHVnZV9wbWRfYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+
ICAgCXJldHVybiBfX2RvX2h1Z2VfcG1kX2Fub255bW91c19wYWdlKHZtZiwgcGFnZSwgZ2ZwKTsK
Pj4gICB9Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX0FSQ0hfRU5BQkxFX1RIUF9NSUdSQVRJT04KPj4g
K3N0cnVjdCBwYWdlICphbGxvY190cmFuc2h1Z2VwYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAo+PiArCQkJCSB1bnNpZ25lZCBsb25nIGhhZGRyKQo+PiArewo+PiArCWdmcF90IGdmcDsK
Pj4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4gKwo+PiArCWdmcCA9IGFsbG9jX2h1Z2VwYWdlX2Rp
cmVjdF9nZnBtYXNrKHZtYSk7Cj4+ICsJcGFnZSA9IGFsbG9jX2h1Z2VwYWdlX3ZtYShnZnAsIHZt
YSwgaGFkZHIsIEhQQUdFX1BNRF9PUkRFUik7Cj4+ICsJaWYgKHBhZ2UpCj4+ICsJCXByZXBfdHJh
bnNodWdlX3BhZ2UocGFnZSk7Cj4+ICsJcmV0dXJuIHBhZ2U7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lN
Qk9MX0dQTChhbGxvY190cmFuc2h1Z2VwYWdlKTsKPj4gKyNlbmRpZgo+PiArCj4+ICAgc3RhdGlj
IHZvaWQgaW5zZXJ0X3Bmbl9wbWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVk
IGxvbmcgYWRkciwKPj4gICAJCXBtZF90ICpwbWQsIHBmbl90IHBmbiwgcGdwcm90X3QgcHJvdCwg
Ym9vbCB3cml0ZSwKPj4gICAJCXBndGFibGVfdCBwZ3RhYmxlKQo+PiAtLSAKPj4gMi4yMC4xCj4g
Cj4gV2h5IHVzZSBDT05GSUdfQVJDSF9FTkFCTEVfVEhQX01JR1JBVElPTiB0byBndWFyZCBUSFAg
YWxsb2NhdG9yIGhlbHBlcj8KPiBTaG91bGRu4oCZdCBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UgYmUgdXNlZD8gQWxzbyB0aGUgaGVscGVyIHN0aWxsIGFsbG9jYXRlcwo+IGEgVEhQIGV2ZW4g
aWYgdHJhbnNwYXJlbnRfaHVnZXBhZ2VfZW5hYmxlZCh2bWEpIGlzIGZhbHNlLCB3aGljaCBpcyB3
cm9uZywgcmlnaHQ/Cj4gCj4gCj4gLS0KPiBCZXN0IFJlZ2FyZHMsCj4gWWFuIFppCj4gCgpPb3Bz
LCBJJ20gbm90IHN1cmUgd2h5IEkgdGhvdWdodCB0aGF0IHdhcyBuZWVkZWQuIFRoZSB3aG9sZSBm
aWxlIGlzIG9ubHkgY29tcGlsZWQKaWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIGRl
ZmluZWQgYW5kIHRoZSBjYWxscyB0byBhbGxvY19odWdlcGFnZV92bWEoKQphbmQgYWxsb2NfaHVn
ZXBhZ2VfZGlyZWN0X2dmcG1hc2soKSBhcmUgdW5wcm90ZWN0ZWQganVzdCBhYm92ZSB0aGlzIGlu
CmRvX2h1Z2VfcG1kX2Fub255bW91c19wYWdlKCkuIEknbGwgZml4IHRoYXQgaW4gdjIuCgpUaGUg
aGVscGVyIGlzIGludGVuZGVkIHRvIGJlIGNhbGxlZCBieSBhIGRldmljZSBkcml2ZXIgdG8gYWxs
b2NhdGUgYSBUSFAgd2hlbgptaWdyYXRpbmcgZGV2aWNlIHByaXZhdGUgbWVtb3J5IGJhY2sgdG8g
c3lzdGVtIG1lbW9yeS4gVGhlIFRIUCBzaG91bGQgbmV2ZXIgYmUKbWlncmF0ZWQgdG8gZGV2aWNl
IHByaXZhdGUgbWVtb3J5IGluIHRoZSBmaXJzdCBwbGFjZSBpZgp0cmFuc3BhcmVudF9odWdlcGFn
ZV9lbmFibGVkKHZtYSkgaXMgZmFsc2UuCkkgc3VwcG9zZSBJIGNvdWxkIGFkZCBhIGlmIChXQVJO
X09OX09OQ0UoKSkgcmV0dXJuIE5VTEwgYXMgYSBzYW5pdHkgY2hlY2suClRoZSByZWFsIGNoZWNr
cyBhcmUgaW4gbWlncmF0ZV92bWFfc2V0dXAoKSBhbmQgbWlncmF0ZV92bWFfcGFnZXMoKS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFp
bGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
