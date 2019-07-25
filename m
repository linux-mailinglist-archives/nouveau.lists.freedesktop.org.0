Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4327564F
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 19:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76926E7EF;
	Thu, 25 Jul 2019 17:53:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3C6E7EF;
 Thu, 25 Jul 2019 17:53:55 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d39ecb00000>; Thu, 25 Jul 2019 10:53:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 10:53:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 10:53:54 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jul
 2019 17:53:54 +0000
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190725011424.GA377@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e101947a-da37-2a9f-c673-fe0a54965e18@nvidia.com>
Date: Thu, 25 Jul 2019 10:53:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190725011424.GA377@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564077232; bh=C/3jo0jsE8wFgw2iplq9k3+bvhgHMroF2GYfUpuZsE0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DhAx15tDao86fNlJyG41mGVLdRS4/AWdLS624zZoNmWkk3D7BjMR5xCzjLZBoVLLx
 afryURRZB/swcEevPYzWOT4IVLi5ZgHxsDCQxxQZNU6w1WG01nZ+jnybjiYlec0vWp
 K6uyYQSPu7IuTdfmgboDdwx9/ORVCRuDPSJ/c/qeHQ3cU5SCDV+AE/nkHy+jt4ovLk
 pQSLsmpMP9fnSGq/ZjIzvO2xYXfrRtfQD5SL0e1xKeJ9tGrj4h282I5a4ENoccpPue
 GlSEJMxOnjXGYBZawJUxgLm5FITum1dRyJQiJGTyd/6mJ251nH2dme/+hCCQk3hiuA
 UmXZ1fHXQ2LkQ==
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDcvMjQvMTkgNjoxNCBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFR1ZSwgSnVs
IDIzLCAyMDE5IGF0IDAyOjA1OjA2UE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+PiBU
aGUgaG1tX21pcnJvcl9vcHMgY2FsbGJhY2sgZnVuY3Rpb24gc3luY19jcHVfZGV2aWNlX3BhZ2V0
YWJsZXMoKSBwYXNzZXMKPj4gYSBzdHJ1Y3QgaG1tX3VwZGF0ZSB3aGljaCBpcyBhIHNpbXBsaWZp
ZWQgdmVyc2lvbiBvZiBzdHJ1Y3QKPj4gbW11X25vdGlmaWVyX3JhbmdlLiBUaGlzIGlzIHVubmVj
ZXNzYXJ5IHNvIHJlcGxhY2UgaG1tX3VwZGF0ZSB3aXRoCj4+IG1tdV9ub3RpZmllcl9yYW5nZSBk
aXJlY3RseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBu
dmlkaWEuY29tPgo+PiBDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Pj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4gQ2M6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgo+Pgo+PiBUaGlzIGlzIGJhc2VkIG9uIDUuMy4wLXJjMSBwbHVzIENocmlzdG9waCBIZWxs
d2lnJ3MgNiBwYXRjaGVzCj4+ICgiaG1tX3JhbmdlX2ZhdWx0IHJlbGF0ZWQgZml4ZXMgYW5kIGxl
Z2FjeSBBUEkgcmVtb3ZhbCB2MiIpLgo+PiBKYXNvbiwgSSBiZWxpZXZlIHRoaXMgaXMgdGhlIHBh
dGNoIHlvdSB3ZXJlIHJlcXVlc3RpbmcuCj4gCj4gRG9lc24ndCB0aGlzIG5lZWQgcmV2aXNpb24g
dG8gaW5jbHVkZSBhbWdwdT8KPiAKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
bW4uYzogICAgICAgICAuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3lu
Y19wYWdldGFibGVzX2dmeCwKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4u
YzogICAgICAgICAuc3luY19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3luY19w
YWdldGFibGVzX2hzYSwKPiAKPiBUaGFua3MsCj4gSmFzb24KPiAKClllcy4gSSBoYXZlIGFkZGVk
IHRoaXMgdG8gdjIgd2hpY2ggSSdsbCBzZW5kIG91dCB3aXRoIENocmlzdG9waCdzIDIgCnBhdGNo
ZXMgYW5kIHRoZSBobW1fcmFuZ2Uudm1hIHJlbW92YWwgcGF0Y2ggeW91IHN1Z2dlc3RlZC4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
