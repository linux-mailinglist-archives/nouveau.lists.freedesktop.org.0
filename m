Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0720442D
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 01:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339A6E1F2;
	Mon, 22 Jun 2020 23:02:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A05E6E1F2
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 23:02:06 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef138130000>; Mon, 22 Jun 2020 16:00:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 16:02:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 16:02:06 -0700
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 23:01:51 +0000
To: Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-14-rcampbell@nvidia.com>
 <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
 <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
 <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
 <a5f502f8-70cd-014b-8066-bbaeb8024a29@nvidia.com>
 <4C364E23-0716-4D59-85A1-0C293B86BC2C@nvidia.com>
 <CAHbLzkqe50+KUsRH92O4Be2PjuwAYGw9nK+d-73syxi2Xnf9-Q@mail.gmail.com>
 <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <fa056e5e-ca87-aef1-e66e-58e8ebe5403e@nvidia.com>
Date: Mon, 22 Jun 2020 16:01:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592866835; bh=Y6NBr0D1yM6UcnMk8vnlqkMWMVjsve14PP2JOfM1rUE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=N01y1zIPkJH/Lms5VPCw+1hdpKCS6PQZaY+D44RrVIXwNweSuXmYr3z3AfacpMrRd
 G6+/fqzWMSPGkgXP5CHVQpYsuLjMkY+7UKSYaWnH1EkZLLsUN4HnVHQvpRTB4ETFdv
 mhmHUu3UNo7z2CHs8x9IfXei5XwR3Y9Zs7z/4nGOSZHwHXZyStlyAfAisuSqTF6kJk
 6gCLh23dt5mh+yBb98fGlamGj9DI3thkQ6Su+m8vH3eU9D0J67Zac+QkklzP31wVYD
 lHOctZ9rMoZOScVyrBhik3PE1youRWx4x2Ase8LtWQUNfGk29QlDgJu+UXoKCypz1b
 XQu2ultXjtJaw==
Subject: Re: [Nouveau] [PATCH 13/16] mm: support THP migration to device
 private memory
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org, "Huang,
 Ying" <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gMjAyMC0wNi0yMiAxNTozMywgWWFuZyBTaGkgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjIsIDIw
MjAgYXQgMzozMCBQTSBZYW5nIFNoaSA8c2h5ODI4MzAxQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9u
IE1vbiwgSnVuIDIyLCAyMDIwIGF0IDI6NTMgUE0gWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4gd3Jv
dGU6Cj4+PiBPbiAyMiBKdW4gMjAyMCwgYXQgMTc6MzEsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+
Pj4+IE9uIDYvMjIvMjAgMToxMCBQTSwgWmkgWWFuIHdyb3RlOgo+Pj4+PiBPbiAyMiBKdW4gMjAy
MCwgYXQgMTU6MzYsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pj4+Pj4gT24gNi8yMS8yMCA0OjIw
IFBNLCBaaSBZYW4gd3JvdGU6Cj4+Pj4+Pj4gT24gMTkgSnVuIDIwMjAsIGF0IDE3OjU2LCBSYWxw
aCBDYW1wYmVsbCB3cm90ZToKLi4uCj4+PiBZaW5nKGNj4oCZZCkgZGV2ZWxvcGVkIHRoZSBjb2Rl
IHRvIHN3YXBvdXQgYW5kIHN3YXBpbiBUSFAgaW4gb25lIHBpZWNlOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tbS8yMDE4MTIwNzA1NDEyMi4yNzgyMi0xLXlpbmcuaHVhbmdAaW50ZWwu
Y29tLy4KPj4+IEkgYW0gbm90IHN1cmUgd2hldGhlciB0aGUgcGF0Y2hzZXQgbWFrZXMgaW50byBt
YWluc3RyZWFtIG9yIG5vdC4gSXQgY291bGQgYmUgYSBnb29kIHRlY2huaWNhbCByZWZlcmVuY2UK
Pj4+IGZvciBzd2FwcGluZyBpbiBkZXZpY2UgcHJpdmF0ZSBwYWdlcywgYWx0aG91Z2ggc3dhcHBp
bmcgaW4gcGFnZXMgZnJvbSBkaXNrIGFuZCBmcm9tIGRldmljZSBwcml2YXRlCj4+PiBtZW1vcnkg
YXJlIHR3byBkaWZmZXJlbnQgc2NlbmFyaW9zLgo+Pj4KPj4+IFNpbmNlIHRoZSBkZXZpY2UgcHJp
dmF0ZSBtZW1vcnkgc3dhcGluIGltcGFjdHMgY29yZSBtbSBwZXJmb3JtYW5jZSwgd2UgbWlnaHQg
d2FudCB0byBkaXNjdXNzIHlvdXIgcGF0Y2hlcwo+Pj4gd2l0aCBtb3JlIHBlb3BsZSwgbGlrZSB0
aGUgb25lcyBmcm9tIFlpbmfigJlzIHBhdGNoc2V0LCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pgo+
PiBJIGJlbGlldmUgWWluZyB3aWxsIGdpdmUgeW91IG1vcmUgaW5zaWdodHMgYWJvdXQgaG93IFRI
UCBzd2FwIHdvcmtzLgo+Pgo+PiBCdXQsIElNSE8gZGV2aWNlIG1lbW9yeSBtaWdyYXRpb24gKG1p
Z3JhdGUgdG8gc3lzdGVtIG1lbW9yeSkgc2VlbXMKPj4gbGlrZSBUSFAgQ29XIG1vcmUgdGhhbiBz
d2FwLgoKCkEgZmluZSBwb2ludDogb3ZlcmFsbCwgdGhlIGRlc2lyZWQgYmVoYXZpb3IgaXMgIm1p
Z3JhdGUiLCBub3QgQ29XLgpUaGF0J3MgaW1wb3J0YW50LiBNaWdyYXRlIG1lYW5zIHRoYXQgeW91
IGRvbid0IGxlYXZlIGEgcGFnZSBiZWhpbmQsIGV2ZW4KYSByZWFkLW9ubHkgb25lLiBBbmQgdGhh
dCdzIGV4YWN0bHkgaG93IGRldmljZSBwcml2YXRlIG1pZ3JhdGlvbiBpcwpzcGVjaWZpZWQuCgpX
ZSBzaG91bGQgdHJ5IHRvIGF2b2lkIGFueSBlcm9zaW9uIG9mIGNsYXJpdHkgaGVyZS4gRXZlbiBp
ZiBzb21laG93CihyZWFsbHk/KSB0aGUgdW5kZXJseWluZyBpbXBsZW1lbnRhdGlvbiBjYWxscyB0
aGlzIFRIUCBDb1csIHRoZSBhY3R1YWwKZ29hbCBpcyB0byBtaWdyYXRlIHBhZ2VzIG92ZXIgdG8g
dGhlIGRldmljZSAoYW5kIGJhY2spLgoKCj4+Cj4+IFdoZW4gbWlncmF0aW5nIGluOgo+IAo+IFNv
cnJ5IGZvciBteSBmYXQgZmluZ2VyLCBoaXQgc2VudCBidXR0b24gaW5hZHZlcnRlbnRseSwgbGV0
IG1lIGZpbmlzaCBoZXJlLgo+IAo+IFdoZW4gbWlncmF0aW5nIGluOgo+IAo+ICAgICAgICAgIC0g
aWYgVEhQIGlzIGVuYWJsZWQ6IGFsbG9jYXRlIFRIUCwgYnV0IG5lZWQgaGFuZGxlIGFsbG9jYXRp
b24KPiBmYWlsdXJlIGJ5IGZhbGxpbmcgYmFjayB0byBiYXNlIHBhZ2UKPiAgICAgICAgICAtIGlm
IFRIUCBpcyBkaXNhYmxlZDogZmFsbGJhY2sgdG8gYmFzZSBwYWdlCj4gCgpPSywgYnV0ICphbGwq
IHBhZ2UgZW50cmllcyAoYmFzZSBhbmQgaHVnZS9sYXJnZSBwYWdlcykgbmVlZCB0byBiZSBjbGVh
cmVkLAp3aGVuIG1pZ3JhdGluZyB0byBkZXZpY2UgbWVtb3J5LCB1bmxlc3MgSSdtIHJlYWxseSBj
b25mdXNlZCBoZXJlLgpTbzogbm90IENvVy4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklE
SUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
