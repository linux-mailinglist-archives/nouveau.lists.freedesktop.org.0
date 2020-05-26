Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57951E32DD
	for <lists+nouveau@lfdr.de>; Wed, 27 May 2020 00:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5189C6E23F;
	Tue, 26 May 2020 22:47:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7E76E23F
 for <nouveau@lists.freedesktop.org>; Tue, 26 May 2020 22:47:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ecd9c340000>; Tue, 26 May 2020 15:46:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 26 May 2020 15:47:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 26 May 2020 15:47:41 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 May 2020 22:47:40 +0000
To: Zi Yan <ziy@nvidia.com>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200508192009.15302-5-rcampbell@nvidia.com> <20200508195129.GA19740@lst.de>
 <1ec0511f-e6eb-3e11-ad6d-ad4e5b107464@nvidia.com>
 <B0BF5621-FEF9-446C-AAD9-81EFA1416EB1@nvidia.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <59a26e8b-0f1a-a1f6-9dc7-ebfecdd58688@nvidia.com>
Date: Tue, 26 May 2020 15:47:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <B0BF5621-FEF9-446C-AAD9-81EFA1416EB1@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590533173; bh=+36whnaOYxldGP/1VJJUddYVqVP/b5RjR/9a+iGhq/o=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=gThcUaXmi1xIuydbeU1Cauoj9YX2H27S3ySJ16Y6ABClxMf/EhE/KT2+OD5wLnTm8
 JZ7kNUBN9oN882P4KPtYejqNC7H/gDtgiFgQsr28tur2Bnn5RT0teXPaLyuFaz50kp
 N1B5nXoL/WKya4YdrmfQqffCy63rRQ5WVyWLyJ/z11Cc0zenur1/6WFNE2HEhHWbCL
 DcS/X0JgcG0rhk95gdYzUn+cm0cZ6rk2kEvhcxwkbUxpfZEvnp8KTS/DZXV0FESqBw
 //AHB+qfmd/hqVeQ9IGyhJrYMkT13+KpBrO/vB/KX3tjYJcBeIq2xhVcyJ79hUKzz9
 STujSFGO6nl5g==
Subject: Re: [Nouveau] [PATCH 4/6] mm/hmm: add output flag for compound page
 mapping
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
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, Jason
 Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDUvMjYvMjAgMzoyOSBQTSwgWmkgWWFuIHdyb3RlOgo+IE9uIDggTWF5IDIwMjAsIGF0IDE2
OjA2LCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiAKPj4gT24gNS84LzIwIDEyOjUxIFBNLCBDaHJp
c3RvcGggSGVsbHdpZyB3cm90ZToKPj4+IE9uIEZyaSwgTWF5IDA4LCAyMDIwIGF0IDEyOjIwOjA3
UE0gLTA3MDAsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pj4+IGhtbV9yYW5nZV9mYXVsdCgpIHJl
dHVybnMgYW4gYXJyYXkgb2YgcGFnZSBmcmFtZSBudW1iZXJzIGFuZCBmbGFncyBmb3IKPj4+PiBo
b3cgdGhlIHBhZ2VzIGFyZSBtYXBwZWQgaW4gdGhlIHJlcXVlc3RlZCBwcm9jZXNzJyBwYWdlIHRh
Ymxlcy4gVGhlIFBGTgo+Pj4+IGNhbiBiZSB1c2VkIHRvIGdldCB0aGUgc3RydWN0IHBhZ2Ugd2l0
aCBobW1fcGZuX3RvX3BhZ2UoKSBhbmQgdGhlIHBhZ2Ugc2l6ZQo+Pj4+IG9yZGVyIGNhbiBiZSBk
ZXRlcm1pbmVkIHdpdGggY29tcG91bmRfb3JkZXIocGFnZSkgYnV0IGlmIHRoZSBwYWdlIGlzIGxh
cmdlcgo+Pj4+IHRoYW4gb3JkZXIgMCAoUEFHRV9TSVpFKSwgdGhlcmUgaXMgbm8gaW5kaWNhdGlv
biB0aGF0IHRoZSBwYWdlIGlzIG1hcHBlZAo+Pj4+IHVzaW5nIGEgbGFyZ2VyIHBhZ2Ugc2l6ZS4g
VG8gYmUgZnVsbHkgZ2VuZXJhbCwgaG1tX3JhbmdlX2ZhdWx0KCkgd291bGQgbmVlZAo+Pj4+IHRv
IHJldHVybiB0aGUgbWFwcGluZyBzaXplIHRvIGhhbmRsZSBjYXNlcyBsaWtlIGEgMUdCIGNvbXBv
dW5kIHBhZ2UgYmVpbmcKPj4+PiBtYXBwZWQgd2l0aCAyTUIgUE1EIGVudHJpZXMuIEhvd2V2ZXIs
IHRoZSBtb3N0IGNvbW1vbiBjYXNlIGlzIHRoZSBtYXBwaW5nCj4+Pj4gc2l6ZSB0aGUgc2FtZSBh
cyB0aGUgdW5kZXJseWluZyBjb21wb3VuZCBwYWdlIHNpemUuCj4+Pj4gQWRkIGEgbmV3IG91dHB1
dCBmbGFnIHRvIGluZGljYXRlIHRoaXMgc28gdGhhdCBjYWxsZXJzIGtub3cgaXQgaXMgc2FmZSB0
bwo+Pj4+IHVzZSBhIGxhcmdlIGRldmljZSBwYWdlIHRhYmxlIG1hcHBpbmcgaWYgb25lIGlzIGF2
YWlsYWJsZS4KPj4+Cj4+PiBXaHkgZG8geW91IG5lZWQgdGhlIGZsYWc/ICBUaGUgY2FsbGVyIHNo
b3VsZCBiZSBhYmxlIHRvIGp1c3QgdXNlCj4+PiBwYWdlX3NpemUoKSAob3Igd2lsbHlzIG5ldyB0
aHBfc2l6ZSBoZWxwZXIpLgo+Pj4KPj4KPj4gVGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgb3Igbm90
IGEgbGFyZ2UgcGFnZSBjYW4gYmUgbWFwcGVkIHdpdGggc21hbGxlcgo+PiBwYWdlIHRhYmxlIGVu
dHJpZXMgd2l0aCBkaWZmZXJlbnQgcGVybWlzc2lvbnMuIElmIG9uZSBwcm9jZXNzIGhhcyBhIDJN
Qgo+PiBwYWdlIG1hcHBlZCB3aXRoIDRLIFBURXMgd2l0aCBkaWZmZXJlbnQgcmVhZC93cml0ZSBw
ZXJtaXNzaW9ucywgSSBkb24ndCB0aGluawo+PiBpdCB3b3VsZCBiZSBPSyBmb3IgYSBkZXZpY2Ug
dG8gbWFwIHRoZSB3aG9sZSAyTUIgd2l0aCB3cml0ZSBhY2Nlc3MgZW5hYmxlZC4KPj4gVGhlIGZs
YWcgaXMgc3VwcG9zZWQgdG8gaW5kaWNhdGUgdGhhdCB0aGUgd2hvbGUgcGFnZSBjYW4gYmUgbWFw
cGVkIGJ5IHRoZQo+PiBkZXZpY2Ugd2l0aCB0aGUgaW5kaWNhdGVkIHJlYWQvd3JpdGUgcGVybWlz
c2lvbnMuCj4gCj4gSWYgaG1tX3JhbmdlX2ZhdWx0KCkgb25seSB3YWxrcyBvbmUgVk1BIGF0IGEg
dGltZSwgeW91IHdvdWxkIG5vdCBoYXZlIHRoaXMgcGVybWlzc2lvbgo+IGlzc3VlLCByaWdodD8g
U2luY2UgYWxsIHBhZ2VzIGZyb20gb25lIFZNQSBzaG91bGQgaGF2ZSB0aGUgc2FtZSBwZXJtaXNz
aW9uLgo+IEJ1dCBpdCBzZWVtcyB0aGF0IGhtbV9yYW5nZV9mYXVsdCgpIGRlYWxzIHdpdGggcGFn
ZXMgYWNyb3NzIG11bHRpcGxlIFZNQXMuCj4gTWF5YmUgd2Ugc2hvdWxkIG1ha2UgaG1tX3Jhbmdl
X2ZhdWx0KCkgYmFpbCBvdXQgZWFybHkgd2hlbiBpdCBlbmNvdW50ZXJzCj4gYSBWTUEgd2l0aCBh
IGRpZmZlcmVudCBwZXJtaXNzaW9uIHRoYW4gdGhlIGV4aXN0aW5nIG9uZXM/Cj4gCj4gCj4g4oCU
Cj4gQmVzdCBSZWdhcmRzLAo+IFlhbiBaaQoKSSBkb24ndCB0aGluayBzby4gVGhlIFZNQSBtaWdo
dCBoYXZlIHJlYWQvd3JpdGUgcGVybWlzc2lvbiBidXQgdGhlIHBhZ2UgdGFibGUgbWlnaHQKaGF2
ZSByZWFkLW9ubHkgcGVybWlzc2lvbiBpbiBvcmRlciB0byB0cmlnZ2VyIGEgZmF1bHQgZm9yIGNv
cHktb24td3JpdGUuIE9yIHRoZQpQVEUgbWlnaHQgYmUgcmVhZC1vbmx5IG9yIGludmFsaWQgdG8g
dHJpZ2dlciBmYXVsdHMgZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndApoYXZlIGhhcmR3YXJl
IHVwZGF0ZWQgYWNjZXNzZWQgYml0cyBhbmQgYXJlIHVzaW5nIHRoZSBtaW5vciBmYXVsdHMgdG8g
dXBkYXRlIExSVS4KVGhlIGdvYWwgaXMgdGhhdCB0aGUgTU0gY29yZSBzZWUgdGhlIHNhbWUgZmF1
bHRzIHdoZXRoZXIgdGhlIEhNTSBkZXZpY2UgYWNjZXNzZXMKbWVtb3J5IG9yIGEgQ1BVIHRocmVh
ZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
