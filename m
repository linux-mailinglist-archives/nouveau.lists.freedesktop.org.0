Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BB22A971
	for <lists+nouveau@lfdr.de>; Thu, 23 Jul 2020 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EEA6E843;
	Thu, 23 Jul 2020 07:17:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0A06E933
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 23:55:14 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id ga4so6202132ejb.11
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NjMcZXprv/nOI4forFhKBTk/9F1/kItqecbA0f3zzT8=;
 b=MK3YZsIqGYoDjbxLtQy2a2wo4ruMmS1w9QUl9/b2H1N34YqISWMm4seVahEk6vXpOI
 SgBWMKclzauV/+pl9tGCeOaTNW0t2+0vC53zrCUIN6UO6sMVq+xOis8Nnm32NMx8suxR
 UhCmTiQTZQhtWbpw2vcER4mouZPvsT8VZEXNEeATbbrxzozgbjOPBthCdAw+infZucxe
 zkUG4Enjj+ZXGXRDXzuhcOIhk127PUmHwYCqIOvVFSxdxnzVTp8DEZ/aH2mR5XH5+Ans
 xmUT27IlXZQdKBsq/7FrGNFly2GxAGf/6aYN5rJVJtKl2tow0KSBSoBWJGhErIvYIYDX
 NbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NjMcZXprv/nOI4forFhKBTk/9F1/kItqecbA0f3zzT8=;
 b=Lq3vNJ7LyRzDefA0SHuCc9RaxLZUv9DrMdJHyc+Pm9pXbPyT5JZfFkZV4ZEeKbBlX4
 L/OY1WVy07IaGCNPZl55bj8sMl1a60EjjJBI26DaDB4Rl6ASuy30lVgMOQP8Q0Tz4CKS
 nNUnT5Gix/lblqfxx6Ofb+PP12EoEeYKIMOLOuX6q8JObRsvViZT1X7tS0JqlCGvputz
 pb/4VVfrjlaAHOAPEburppx1aEBVi7fwya2b7D9Yntj8WKYpQLF1SlHUYp3apniZKSLc
 XQfgTOd+QxzCTd8AIePE4MLvD61WhrK4dtW6zpozI7qMAWaQ/lIRtoGj/5ZSKRjCOd9f
 zbAQ==
X-Gm-Message-State: AOAM5306SDDlVE8eO2LOnh9x7rSilGn9IKUHFPZGwSOTxn4zoUrZ6LSz
 3a3xooM0tzxAnMHBSBQxyHmqtqOyfknQZxrSrC4=
X-Google-Smtp-Source: ABdhPJwQzUdtQVA8N+epe6jO74BqD4xLZlDw/rWnWRA1sAy4igezZryH7Kv9srM9ru85/edGlgH35lOeiLAECSYhKcc=
X-Received: by 2002:a17:906:2b81:: with SMTP id
 m1mr17303645ejg.488.1592870112660; 
 Mon, 22 Jun 2020 16:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-14-rcampbell@nvidia.com>
 <F1872509-3B1F-4A8A-BFF5-E4D44E451920@nvidia.com>
 <b6eed976-c515-72d6-a7be-2296cab8f0d4@nvidia.com>
 <C7BEB563-3698-442C-A188-1B66CBE4CF63@nvidia.com>
 <a5f502f8-70cd-014b-8066-bbaeb8024a29@nvidia.com>
 <4C364E23-0716-4D59-85A1-0C293B86BC2C@nvidia.com>
 <CAHbLzkqe50+KUsRH92O4Be2PjuwAYGw9nK+d-73syxi2Xnf9-Q@mail.gmail.com>
 <CAHbLzko=BqtPhxgf7f1bKKqoQxK9XCCPdp4YdL80K_uXFfcETQ@mail.gmail.com>
 <fa056e5e-ca87-aef1-e66e-58e8ebe5403e@nvidia.com>
In-Reply-To: <fa056e5e-ca87-aef1-e66e-58e8ebe5403e@nvidia.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 22 Jun 2020 16:54:45 -0700
Message-ID: <CAHbLzkrR4-s+ye1F3XDV_0q+iyZOcyMQNHTggDY3Mn_e2yOZ7g@mail.gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:17:29 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org, "Huang,
 Ying" <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgNDowMiBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMC0wNi0yMiAxNTozMywgWWFuZyBTaGkgd3JvdGU6
Cj4gPiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAzOjMwIFBNIFlhbmcgU2hpIDxzaHk4MjgzMDFA
Z21haWwuY29tPiB3cm90ZToKPiA+PiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAyOjUzIFBNIFpp
IFlhbiA8eml5QG52aWRpYS5jb20+IHdyb3RlOgo+ID4+PiBPbiAyMiBKdW4gMjAyMCwgYXQgMTc6
MzEsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+ID4+Pj4gT24gNi8yMi8yMCAxOjEwIFBNLCBaaSBZ
YW4gd3JvdGU6Cj4gPj4+Pj4gT24gMjIgSnVuIDIwMjAsIGF0IDE1OjM2LCBSYWxwaCBDYW1wYmVs
bCB3cm90ZToKPiA+Pj4+Pj4gT24gNi8yMS8yMCA0OjIwIFBNLCBaaSBZYW4gd3JvdGU6Cj4gPj4+
Pj4+PiBPbiAxOSBKdW4gMjAyMCwgYXQgMTc6NTYsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+IC4u
Lgo+ID4+PiBZaW5nKGNj4oCZZCkgZGV2ZWxvcGVkIHRoZSBjb2RlIHRvIHN3YXBvdXQgYW5kIHN3
YXBpbiBUSFAgaW4gb25lIHBpZWNlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8y
MDE4MTIwNzA1NDEyMi4yNzgyMi0xLXlpbmcuaHVhbmdAaW50ZWwuY29tLy4KPiA+Pj4gSSBhbSBu
b3Qgc3VyZSB3aGV0aGVyIHRoZSBwYXRjaHNldCBtYWtlcyBpbnRvIG1haW5zdHJlYW0gb3Igbm90
LiBJdCBjb3VsZCBiZSBhIGdvb2QgdGVjaG5pY2FsIHJlZmVyZW5jZQo+ID4+PiBmb3Igc3dhcHBp
bmcgaW4gZGV2aWNlIHByaXZhdGUgcGFnZXMsIGFsdGhvdWdoIHN3YXBwaW5nIGluIHBhZ2VzIGZy
b20gZGlzayBhbmQgZnJvbSBkZXZpY2UgcHJpdmF0ZQo+ID4+PiBtZW1vcnkgYXJlIHR3byBkaWZm
ZXJlbnQgc2NlbmFyaW9zLgo+ID4+Pgo+ID4+PiBTaW5jZSB0aGUgZGV2aWNlIHByaXZhdGUgbWVt
b3J5IHN3YXBpbiBpbXBhY3RzIGNvcmUgbW0gcGVyZm9ybWFuY2UsIHdlIG1pZ2h0IHdhbnQgdG8g
ZGlzY3VzcyB5b3VyIHBhdGNoZXMKPiA+Pj4gd2l0aCBtb3JlIHBlb3BsZSwgbGlrZSB0aGUgb25l
cyBmcm9tIFlpbmfigJlzIHBhdGNoc2V0LCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4+Cj4gPj4g
SSBiZWxpZXZlIFlpbmcgd2lsbCBnaXZlIHlvdSBtb3JlIGluc2lnaHRzIGFib3V0IGhvdyBUSFAg
c3dhcCB3b3Jrcy4KPiA+Pgo+ID4+IEJ1dCwgSU1ITyBkZXZpY2UgbWVtb3J5IG1pZ3JhdGlvbiAo
bWlncmF0ZSB0byBzeXN0ZW0gbWVtb3J5KSBzZWVtcwo+ID4+IGxpa2UgVEhQIENvVyBtb3JlIHRo
YW4gc3dhcC4KPgo+Cj4gQSBmaW5lIHBvaW50OiBvdmVyYWxsLCB0aGUgZGVzaXJlZCBiZWhhdmlv
ciBpcyAibWlncmF0ZSIsIG5vdCBDb1cuCj4gVGhhdCdzIGltcG9ydGFudC4gTWlncmF0ZSBtZWFu
cyB0aGF0IHlvdSBkb24ndCBsZWF2ZSBhIHBhZ2UgYmVoaW5kLCBldmVuCj4gYSByZWFkLW9ubHkg
b25lLiBBbmQgdGhhdCdzIGV4YWN0bHkgaG93IGRldmljZSBwcml2YXRlIG1pZ3JhdGlvbiBpcwo+
IHNwZWNpZmllZC4KPgo+IFdlIHNob3VsZCB0cnkgdG8gYXZvaWQgYW55IGVyb3Npb24gb2YgY2xh
cml0eSBoZXJlLiBFdmVuIGlmIHNvbWVob3cKPiAocmVhbGx5PykgdGhlIHVuZGVybHlpbmcgaW1w
bGVtZW50YXRpb24gY2FsbHMgdGhpcyBUSFAgQ29XLCB0aGUgYWN0dWFsCj4gZ29hbCBpcyB0byBt
aWdyYXRlIHBhZ2VzIG92ZXIgdG8gdGhlIGRldmljZSAoYW5kIGJhY2spLgo+Cj4KPiA+Pgo+ID4+
IFdoZW4gbWlncmF0aW5nIGluOgo+ID4KPiA+IFNvcnJ5IGZvciBteSBmYXQgZmluZ2VyLCBoaXQg
c2VudCBidXR0b24gaW5hZHZlcnRlbnRseSwgbGV0IG1lIGZpbmlzaCBoZXJlLgo+ID4KPiA+IFdo
ZW4gbWlncmF0aW5nIGluOgo+ID4KPiA+ICAgICAgICAgIC0gaWYgVEhQIGlzIGVuYWJsZWQ6IGFs
bG9jYXRlIFRIUCwgYnV0IG5lZWQgaGFuZGxlIGFsbG9jYXRpb24KPiA+IGZhaWx1cmUgYnkgZmFs
bGluZyBiYWNrIHRvIGJhc2UgcGFnZQo+ID4gICAgICAgICAgLSBpZiBUSFAgaXMgZGlzYWJsZWQ6
IGZhbGxiYWNrIHRvIGJhc2UgcGFnZQo+ID4KPgo+IE9LLCBidXQgKmFsbCogcGFnZSBlbnRyaWVz
IChiYXNlIGFuZCBodWdlL2xhcmdlIHBhZ2VzKSBuZWVkIHRvIGJlIGNsZWFyZWQsCj4gd2hlbiBt
aWdyYXRpbmcgdG8gZGV2aWNlIG1lbW9yeSwgdW5sZXNzIEknbSByZWFsbHkgY29uZnVzZWQgaGVy
ZS4KPiBTbzogbm90IENvVy4KCkkgcmVhbGl6ZWQgdGhlIGNvbW1lbnQgY2F1c2VkIG1vcmUgY29u
ZnVzaW9uLiBJIGFwb2xvZ2l6ZSBmb3IgdGhlCmNvbmZ1c2lvbi4gWWVzLCB0aGUgdHJpZ2dlciBj
b25kaXRpb24gZm9yIHN3YXAvbWlncmF0aW9uIGFuZCBDb1cgYXJlCmRlZmluaXRlbHkgZGlmZmVy
ZW50LiBIZXJlIEkgbWVhbiB0aGUgZmF1bHQgaGFuZGxpbmcgcGFydCBvZiBtaWdyYXRpbmcKaW50
byBzeXN0ZW0gbWVtb3J5LgoKU3dhcC1pbiBqdXN0IG5lZWRzIHRvIGhhbmRsZSB0aGUgYmFzZSBw
YWdlIGNhc2Ugc2luY2UgVEhQIHN3YXBpbiBpcwpub3Qgc3VwcG9ydGVkIGluIHVwc3RyZWFtIHll
dCBhbmQgdGhlIFBNRCBpcyBzcGxpdCBpbiBzd2FwLW91dCBwaGFzZQooc2VlIHNocmlua19wYWdl
X2xpc3QpLgoKVGhlIHBhdGNoIGFkZHMgVEhQIG1pZ3JhdGlvbiBzdXBwb3J0IHRvIGRldmljZSBt
ZW1vcnksIGJ1dCB5b3UgbmVlZCB0bwpoYW5kbGUgbWlncmF0ZSBpbiAoYmFjayB0byBzeXN0ZW0g
bWVtb3J5KSBjYXNlIGNvcnJlY3RseS4gVGhlIGZhdWx0CmhhbmRsaW5nIHNob3VsZCBsb29rIGxp
a2UgVEhQIENvVyBmYXVsdCBoYW5kbGluZyBiZWhhdmlvciAoYmVmb3JlCjUuOCk6CiAgICAtIGlm
IFRIUCBpcyBlbmFibGVkOiBhbGxvY2F0ZSBUSFAsIGZhbGxiYWNrIGlmIGFsbG9jYXRpb24gaXMg
ZmFpbGVkCiAgICAtIGlmIFRIUCBpcyBkaXNhYmxlZDogZmFsbGJhY2sgdG8gYmFzZSBwYWdlCgpT
d2FwIGZhdWx0IGhhbmRsaW5nIGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBhYm92ZS4gU28sIEkgc2Fp
ZCBpdCBzZWVtcwpsaWtlIG1vcmUgVEhQIENvVyAoZmF1bHQgaGFuZGxpbmcgcGFydCBvbmx5IGJl
Zm9yZSA1LjgpLiBJIGhvcGUgSQphcnRpY3VsYXRlIG15IG1pbmQuCgpIb3dldmVyLCBJIGRpZG4n
dCBzZWUgc3VjaCBmYWxsYmFjayBpcyBoYW5kbGVkLiBJdCBsb29rcyBpZiBUSFAKYWxsb2NhdGlv
biBpcyBmYWlsZWQsIGl0IGp1c3QgcmV0dXJucyBTSUdCVVM7IGFuZCBubyBjaGVjayBhYm91dCBU
SFAKc3RhdHVzIGlmIEkgcmVhZCB0aGUgcGF0Y2hlcyBjb3JyZWN0bHkuIFRoZSBUSFAgbWlnaHQg
YmUgZGlzYWJsZWQgZm9yCnRoZSBzcGVjaWZpYyB2bWEgb3Igc3lzdGVtIHdpZGUgYmVmb3JlIG1p
Z3JhdGluZyBmcm9tIGRldmljZSBtZW1vcnkKYmFjayB0byBzeXN0ZW0gbWVtb3J5LgoKPgo+IHRo
YW5rcywKPiAtLQo+IEpvaG4gSHViYmFyZAo+IE5WSURJQQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUK
