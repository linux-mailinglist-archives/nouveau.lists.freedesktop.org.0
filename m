Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FB62046D7
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 03:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C2B89FAC;
	Tue, 23 Jun 2020 01:47:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C0C89FAC
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 01:47:30 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef15de50000>; Mon, 22 Jun 2020 18:41:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 18:42:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 18:42:09 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 23 Jun 2020 01:42:00 +0000
To: John Hubbard <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
 <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <730e85c9-33b5-9c57-7123-057b75cbbddf@nvidia.com>
Date: Mon, 22 Jun 2020 18:42:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592876517; bh=Ho+eCbZjhjTrWCRD06h7Akh+zdWN7QHUk5iaHdiOb78=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HduvbxdXCCaTYo2FwaJeEyDbubHHSvfFOBN8SAUgTT/+gxdroCg0XP9zOCR9PccQu
 fWyBb99xw54tnFfOXqz9xBmtszRGg402zAk9PYF4qbEpWas5Pj2eGbKqP+2oT52RRy
 YqFHh0Yil5k4ll/T46AYPd8l3s7b+Zas8LaZF4TECSmq6f3MoVb6OApcAGbsztSD15
 t7NW+E0fWnF3KMaoz0CR+fseEbAPpfUEUnIXzwmheZzSxmTqcBR5Ch79BY5khNACyI
 UNwawM84nbUjWdnuuD4oX+X3AcuyevmKQtS3MNmEdTCdwQud160PdKWaZ4AOWB3tvq
 fTqOdii5CKNZA==
Subject: Re: [Nouveau] [RESEND PATCH 2/3] nouveau: fix mixed normal and
 device private page migration
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
Cc: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDYvMjIvMjAgNTozMCBQTSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IE9uIDIwMjAtMDYtMjIg
MTY6MzgsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+PiBUaGUgT3BlbkNMIGZ1bmN0aW9uIGNsRW5x
dWV1ZVNWTU1pZ3JhdGVNZW0oKSwgd2l0aG91dCBhbnkgZmxhZ3MsIHdpbGwKPj4gbWlncmF0ZSBt
ZW1vcnkgaW4gdGhlIGdpdmVuIGFkZHJlc3MgcmFuZ2UgdG8gZGV2aWNlIHByaXZhdGUgbWVtb3J5
LiBUaGUKPj4gc291cmNlIHBhZ2VzIG1pZ2h0IGFscmVhZHkgaGF2ZSBiZWVuIG1pZ3JhdGVkIHRv
IGRldmljZSBwcml2YXRlIG1lbW9yeS4KPj4gSW4gdGhhdCBjYXNlLCB0aGUgc291cmNlIHN0cnVj
dCBwYWdlIGlzIG5vdCBjaGVja2VkIHRvIHNlZSBpZiBpdCBpcwo+PiBhIGRldmljZSBwcml2YXRl
IHBhZ2UgYW5kIGluY29ycmVjdGx5IGNvbXB1dGVzIHRoZSBHUFUncyBwaHlzaWNhbAo+PiBhZGRy
ZXNzIG9mIGxvY2FsIG1lbW9yeSBsZWFkaW5nIHRvIGRhdGEgY29ycnVwdGlvbi4KPj4gRml4IHRo
aXMgYnkgY2hlY2tpbmcgdGhlIHNvdXJjZSBzdHJ1Y3QgcGFnZSBhbmQgY29tcHV0aW5nIHRoZSBj
b3JyZWN0Cj4+IHBoeXNpY2FsIGFkZHJlc3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhbHBoIENh
bXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgOCArKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1l
bS5jCj4+IGluZGV4IGNjOTk5MzgzNzUwOC4uZjZhODA2YmEzY2FhIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+PiBAQCAtNTQwLDYgKzU0MCwxMiBAQCBzdGF0
aWMgdW5zaWduZWQgbG9uZyBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29uZShzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybSwKPj4gwqDCoMKgwqDCoCBpZiAoIShzcmMgJiBNSUdSQVRFX1BGTl9NSUdS
QVRFKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiArwqDCoMKgIGlmIChzcGFn
ZSAmJiBpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHNwYWdlKSkgewo+PiArwqDCoMKgwqDCoMKgwqAg
cGFkZHIgPSBub3V2ZWF1X2RtZW1fcGFnZV9hZGRyKHNwYWdlKTsKPj4gK8KgwqDCoMKgwqDCoMKg
ICpkbWFfYWRkciA9IERNQV9NQVBQSU5HX0VSUk9SOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBk
b25lOwo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIGRwYWdlID0gbm91dmVhdV9kbWVt
X3BhZ2VfYWxsb2NfbG9ja2VkKGRybSk7Cj4+IMKgwqDCoMKgwqAgaWYgKCFkcGFnZSkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Owo+PiBAQCAtNTYwLDYgKzU2Niw3IEBAIHN0YXRpYyB1
bnNpZ25lZCBsb25nIG5vdXZlYXVfZG1lbV9taWdyYXRlX2NvcHlfb25lKHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9mcmVlX3Bh
Z2U7Cj4+IMKgwqDCoMKgwqAgfQo+PiArZG9uZToKPj4gwqDCoMKgwqDCoCAqcGZuID0gTlZJRl9W
TU1fUEZOTUFQX1YwX1YgfCBOVklGX1ZNTV9QRk5NQVBfVjBfVlJBTSB8Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCAoKHBhZGRyID4+IFBBR0VfU0hJRlQpIDw8IE5WSUZfVk1NX1BGTk1BUF9WMF9BRERS
X1NISUZUKTsKPj4gwqDCoMKgwqDCoCBpZiAoc3JjICYgTUlHUkFURV9QRk5fV1JJVEUpCj4+IEBA
IC02MTUsNiArNjIyLDcgQEAgbm91dmVhdV9kbWVtX21pZ3JhdGVfdm1hKHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtLAo+PiDCoMKgwqDCoMKgIHN0cnVjdCBtaWdyYXRlX3ZtYSBhcmdzID0gewo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgLnZtYcKgwqDCoMKgwqDCoMKgID0gdm1hLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgLnN0YXJ0wqDCoMKgwqDCoMKgwqAgPSBzdGFydCwKPj4gK8KgwqDCoMKgwqDCoMKg
IC5zcmNfb3duZXLCoMKgwqAgPSBkcm0tPmRldiwKPiAKPiBIaSBSYWxwaCwKPiAKPiBUaGlzIC5z
cmNfb3duZXIgc2V0dGluZyBkb2VzIGxvb2sgbGlrZSBhIHJlcXVpcmVkIGZpeCwgYnV0IGl0IHNl
ZW1zIGxpa2UKPiBhIGNvbXBsZXRlbHkgc2VwYXJhdGUgZml4IGZyb20gd2hhdCBpcyBsaXN0ZWQg
aW4gdGhpcyBwYXRjaCdzIGNvbW1pdAo+IGRlc2NyaXB0aW9uLCByaWdodD8gKEl0IGZlZWxzIGxp
a2UgYSBjYXN1YWx0eSBvZiByZWFycmFuZ2luZyB0aGUgcGF0Y2hlcy4pCj4gCj4gCj4gdGhhbmtz
LAoKSXQncyBhIGJpdCBtb3JlIGNvbXBsZXguIFRoZXJlIGlzIGEgY2F0Y2gtMjIgaGVyZSB3aXRo
IHRoZSBjaGFuZ2UgdG8gbW0vbWlncmF0ZS5jLgpXaXRob3V0IHRoaXMgcGF0Y2ggb3IgbW0vbWln
cmF0ZS5jLCBhIHNlY29uZCBjYWxsIHRvIGNsRW5xdWV1ZVNWTU1pZ3JhdGVNZW0oKQpmb3IgdGhl
IHNhbWUgYWRkcmVzcyByYW5nZSB3aWxsIGludmFsaWRhdGUgdGhlIEdQVSBtYXBwaW5nIHRvIGRl
dmljZSBwcml2YXRlIG1lbW9yeQpjcmVhdGVkIGJ5IHRoZSBmaXJzdCBjYWxsLgpXaXRoIHRoaXMg
cGF0Y2ggYnV0IG5vdCBtbS9taWdyYXRlLmMsIHRoZSBmaXJzdCBjYWxsIHRvIGNsRW5xdWV1ZVNW
TU1pZ3JhdGVNZW0oKQp3aWxsIGZhaWwgdG8gbWlncmF0ZSBub3JtYWwgYW5vbnltb3VzIG1lbW9y
eSB0byBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkuCldpdGhvdXQgdGhpcyBwYXRjaCBidXQgaW5jbHVk
aW5nIHRoZSBjaGFuZ2UgdG8gbW0vbWlncmF0ZS5jLCBhIHNlY29uZCBjYWxsIHRvCmNsRW5xdWV1
ZVNWTU1pZ3JhdGVNZW0oKSB3aWxsIGNyYXNoIHRoZSBrZXJuZWwgYmVjYXVzZSBkbWFfbWFwX3Bh
Z2UoKSB3aWxsIGJlCmNhbGxlZCB3aXRoIHRoZSBkZXZpY2UgcHJpdmF0ZSBQRk4gd2hpY2ggaXMg
bm90IGEgdmFsaWQgQ1BVIHBoeXNpY2FsIGFkZHJlc3MuCldpdGggYm90aCBjaGFuZ2VzLCBhIHJh
bmdlIG9mIGFub255bW91cyBhbmQgZGV2aWNlIHByaXZhdGUgcGFnZXMgY2FuIGJlIG1pZ3JhdGVk
CnRvIHRoZSBHUFUgYW5kIHRoZSBHUFUgcGFnZSB0YWJsZXMgdXBkYXRlZCBwcm9wZXJseS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
