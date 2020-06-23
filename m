Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6432044F6
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 02:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E67E6E935;
	Tue, 23 Jun 2020 00:05:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BF26E935
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 00:05:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef147010000>; Mon, 22 Jun 2020 17:04:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 17:05:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 17:05:48 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 00:05:37 +0000
To: Yang Shi <shy828301@gmail.com>, John Hubbard <jhubbard@nvidia.com>
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
 <CAHbLzkrR4-s+ye1F3XDV_0q+iyZOcyMQNHTggDY3Mn_e2yOZ7g@mail.gmail.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a778dcec-045b-85c0-2dd3-ac700e4208c5@nvidia.com>
Date: Mon, 22 Jun 2020 17:05:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHbLzkrR4-s+ye1F3XDV_0q+iyZOcyMQNHTggDY3Mn_e2yOZ7g@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592870657; bh=IA8mI4tfaBJxUgdhsoSHZFGwUF4W2ZhqAAMGQmxEIl4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=kDjjdpQVEXSCa1TVNS3nDCYjLWqibG2+YvLVRnC85jVyJRI0lg4KOgtV0fUM/zHvp
 bq08OhMU+8HtsZ6x5EHNuV5kWKgkKvyMV44et2nJplHf4YHhvPhTvGQIJaWerpC+41
 Pi+C8uPb0TwrAYswxeDcJPhcnMrLV0NKq+CxnXHpFddgrZLWeqnYpMUCwB8InfL+BN
 Umrl89mxiAYNClyOq3gkal3n2pTblO/PWBKSv4a/Kn7WhQXRu94BIoWa1SnHXUVtKm
 z2JVcvaD2FgztdxtTabvzfJkNS2Ydd4NtjBRcKnwPDX8CXt5Jtxz/Z61zoCZ5G4HBJ
 duaFbikzI4X0Q==
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
Cc: Zi Yan <ziy@nvidia.com>, linux-rdma@vger.kernel.org,
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

Ck9uIDYvMjIvMjAgNDo1NCBQTSwgWWFuZyBTaGkgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjIsIDIw
MjAgYXQgNDowMiBQTSBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+IHdyb3RlOgo+
Pgo+PiBPbiAyMDIwLTA2LTIyIDE1OjMzLCBZYW5nIFNoaSB3cm90ZToKPj4+IE9uIE1vbiwgSnVu
IDIyLCAyMDIwIGF0IDM6MzAgUE0gWWFuZyBTaGkgPHNoeTgyODMwMUBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDI6NTMgUE0gWmkgWWFuIDx6aXlAbnZpZGlh
LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDIyIEp1biAyMDIwLCBhdCAxNzozMSwgUmFscGggQ2FtcGJl
bGwgd3JvdGU6Cj4+Pj4+PiBPbiA2LzIyLzIwIDE6MTAgUE0sIFppIFlhbiB3cm90ZToKPj4+Pj4+
PiBPbiAyMiBKdW4gMjAyMCwgYXQgMTU6MzYsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pj4+Pj4+
PiBPbiA2LzIxLzIwIDQ6MjAgUE0sIFppIFlhbiB3cm90ZToKPj4+Pj4+Pj4+IE9uIDE5IEp1biAy
MDIwLCBhdCAxNzo1NiwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+IC4uLgo+Pj4+PiBZaW5nKGNj
4oCZZCkgZGV2ZWxvcGVkIHRoZSBjb2RlIHRvIHN3YXBvdXQgYW5kIHN3YXBpbiBUSFAgaW4gb25l
IHBpZWNlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDE4MTIwNzA1NDEyMi4y
NzgyMi0xLXlpbmcuaHVhbmdAaW50ZWwuY29tLy4KPj4+Pj4gSSBhbSBub3Qgc3VyZSB3aGV0aGVy
IHRoZSBwYXRjaHNldCBtYWtlcyBpbnRvIG1haW5zdHJlYW0gb3Igbm90LiBJdCBjb3VsZCBiZSBh
IGdvb2QgdGVjaG5pY2FsIHJlZmVyZW5jZQo+Pj4+PiBmb3Igc3dhcHBpbmcgaW4gZGV2aWNlIHBy
aXZhdGUgcGFnZXMsIGFsdGhvdWdoIHN3YXBwaW5nIGluIHBhZ2VzIGZyb20gZGlzayBhbmQgZnJv
bSBkZXZpY2UgcHJpdmF0ZQo+Pj4+PiBtZW1vcnkgYXJlIHR3byBkaWZmZXJlbnQgc2NlbmFyaW9z
Lgo+Pj4+Pgo+Pj4+PiBTaW5jZSB0aGUgZGV2aWNlIHByaXZhdGUgbWVtb3J5IHN3YXBpbiBpbXBh
Y3RzIGNvcmUgbW0gcGVyZm9ybWFuY2UsIHdlIG1pZ2h0IHdhbnQgdG8gZGlzY3VzcyB5b3VyIHBh
dGNoZXMKPj4+Pj4gd2l0aCBtb3JlIHBlb3BsZSwgbGlrZSB0aGUgb25lcyBmcm9tIFlpbmfigJlz
IHBhdGNoc2V0LCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pj4+Cj4+Pj4gSSBiZWxpZXZlIFlpbmcg
d2lsbCBnaXZlIHlvdSBtb3JlIGluc2lnaHRzIGFib3V0IGhvdyBUSFAgc3dhcCB3b3Jrcy4KPj4+
Pgo+Pj4+IEJ1dCwgSU1ITyBkZXZpY2UgbWVtb3J5IG1pZ3JhdGlvbiAobWlncmF0ZSB0byBzeXN0
ZW0gbWVtb3J5KSBzZWVtcwo+Pj4+IGxpa2UgVEhQIENvVyBtb3JlIHRoYW4gc3dhcC4KPj4KPj4K
Pj4gQSBmaW5lIHBvaW50OiBvdmVyYWxsLCB0aGUgZGVzaXJlZCBiZWhhdmlvciBpcyAibWlncmF0
ZSIsIG5vdCBDb1cuCj4+IFRoYXQncyBpbXBvcnRhbnQuIE1pZ3JhdGUgbWVhbnMgdGhhdCB5b3Ug
ZG9uJ3QgbGVhdmUgYSBwYWdlIGJlaGluZCwgZXZlbgo+PiBhIHJlYWQtb25seSBvbmUuIEFuZCB0
aGF0J3MgZXhhY3RseSBob3cgZGV2aWNlIHByaXZhdGUgbWlncmF0aW9uIGlzCj4+IHNwZWNpZmll
ZC4KPj4KPj4gV2Ugc2hvdWxkIHRyeSB0byBhdm9pZCBhbnkgZXJvc2lvbiBvZiBjbGFyaXR5IGhl
cmUuIEV2ZW4gaWYgc29tZWhvdwo+PiAocmVhbGx5PykgdGhlIHVuZGVybHlpbmcgaW1wbGVtZW50
YXRpb24gY2FsbHMgdGhpcyBUSFAgQ29XLCB0aGUgYWN0dWFsCj4+IGdvYWwgaXMgdG8gbWlncmF0
ZSBwYWdlcyBvdmVyIHRvIHRoZSBkZXZpY2UgKGFuZCBiYWNrKS4KPj4KPj4KPj4+Pgo+Pj4+IFdo
ZW4gbWlncmF0aW5nIGluOgo+Pj4KPj4+IFNvcnJ5IGZvciBteSBmYXQgZmluZ2VyLCBoaXQgc2Vu
dCBidXR0b24gaW5hZHZlcnRlbnRseSwgbGV0IG1lIGZpbmlzaCBoZXJlLgo+Pj4KPj4+IFdoZW4g
bWlncmF0aW5nIGluOgo+Pj4KPj4+ICAgICAgICAgICAtIGlmIFRIUCBpcyBlbmFibGVkOiBhbGxv
Y2F0ZSBUSFAsIGJ1dCBuZWVkIGhhbmRsZSBhbGxvY2F0aW9uCj4+PiBmYWlsdXJlIGJ5IGZhbGxp
bmcgYmFjayB0byBiYXNlIHBhZ2UKPj4+ICAgICAgICAgICAtIGlmIFRIUCBpcyBkaXNhYmxlZDog
ZmFsbGJhY2sgdG8gYmFzZSBwYWdlCj4+Pgo+Pgo+PiBPSywgYnV0ICphbGwqIHBhZ2UgZW50cmll
cyAoYmFzZSBhbmQgaHVnZS9sYXJnZSBwYWdlcykgbmVlZCB0byBiZSBjbGVhcmVkLAo+PiB3aGVu
IG1pZ3JhdGluZyB0byBkZXZpY2UgbWVtb3J5LCB1bmxlc3MgSSdtIHJlYWxseSBjb25mdXNlZCBo
ZXJlLgo+PiBTbzogbm90IENvVy4KPiAKPiBJIHJlYWxpemVkIHRoZSBjb21tZW50IGNhdXNlZCBt
b3JlIGNvbmZ1c2lvbi4gSSBhcG9sb2dpemUgZm9yIHRoZQo+IGNvbmZ1c2lvbi4gWWVzLCB0aGUg
dHJpZ2dlciBjb25kaXRpb24gZm9yIHN3YXAvbWlncmF0aW9uIGFuZCBDb1cgYXJlCj4gZGVmaW5p
dGVseSBkaWZmZXJlbnQuIEhlcmUgSSBtZWFuIHRoZSBmYXVsdCBoYW5kbGluZyBwYXJ0IG9mIG1p
Z3JhdGluZwo+IGludG8gc3lzdGVtIG1lbW9yeS4KPiAKPiBTd2FwLWluIGp1c3QgbmVlZHMgdG8g
aGFuZGxlIHRoZSBiYXNlIHBhZ2UgY2FzZSBzaW5jZSBUSFAgc3dhcGluIGlzCj4gbm90IHN1cHBv
cnRlZCBpbiB1cHN0cmVhbSB5ZXQgYW5kIHRoZSBQTUQgaXMgc3BsaXQgaW4gc3dhcC1vdXQgcGhh
c2UKPiAoc2VlIHNocmlua19wYWdlX2xpc3QpLgo+IAo+IFRoZSBwYXRjaCBhZGRzIFRIUCBtaWdy
YXRpb24gc3VwcG9ydCB0byBkZXZpY2UgbWVtb3J5LCBidXQgeW91IG5lZWQgdG8KPiBoYW5kbGUg
bWlncmF0ZSBpbiAoYmFjayB0byBzeXN0ZW0gbWVtb3J5KSBjYXNlIGNvcnJlY3RseS4gVGhlIGZh
dWx0Cj4gaGFuZGxpbmcgc2hvdWxkIGxvb2sgbGlrZSBUSFAgQ29XIGZhdWx0IGhhbmRsaW5nIGJl
aGF2aW9yIChiZWZvcmUKPiA1LjgpOgo+ICAgICAgLSBpZiBUSFAgaXMgZW5hYmxlZDogYWxsb2Nh
dGUgVEhQLCBmYWxsYmFjayBpZiBhbGxvY2F0aW9uIGlzIGZhaWxlZAo+ICAgICAgLSBpZiBUSFAg
aXMgZGlzYWJsZWQ6IGZhbGxiYWNrIHRvIGJhc2UgcGFnZQo+IAo+IFN3YXAgZmF1bHQgaGFuZGxp
bmcgZG9lc24ndCBsb29rIGxpa2UgdGhlIGFib3ZlLiBTbywgSSBzYWlkIGl0IHNlZW1zCj4gbGlr
ZSBtb3JlIFRIUCBDb1cgKGZhdWx0IGhhbmRsaW5nIHBhcnQgb25seSBiZWZvcmUgNS44KS4gSSBo
b3BlIEkKPiBhcnRpY3VsYXRlIG15IG1pbmQuCj4gCj4gSG93ZXZlciwgSSBkaWRuJ3Qgc2VlIHN1
Y2ggZmFsbGJhY2sgaXMgaGFuZGxlZC4gSXQgbG9va3MgaWYgVEhQCj4gYWxsb2NhdGlvbiBpcyBm
YWlsZWQsIGl0IGp1c3QgcmV0dXJucyBTSUdCVVM7IGFuZCBubyBjaGVjayBhYm91dCBUSFAKPiBz
dGF0dXMgaWYgSSByZWFkIHRoZSBwYXRjaGVzIGNvcnJlY3RseS4gVGhlIFRIUCBtaWdodCBiZSBk
aXNhYmxlZCBmb3IKPiB0aGUgc3BlY2lmaWMgdm1hIG9yIHN5c3RlbSB3aWRlIGJlZm9yZSBtaWdy
YXRpbmcgZnJvbSBkZXZpY2UgbWVtb3J5Cj4gYmFjayB0byBzeXN0ZW0gbWVtb3J5LgoKWW91IGFy
ZSBjb3JyZWN0LCB0aGUgcGF0Y2ggd2Fzbid0IGhhbmRsaW5nIHRoZSBmYWxsYmFjayBjYXNlLgpJ
J2xsIGFkZCB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+Pgo+PiB0aGFua3MsCj4+IC0tCj4+
IEpvaG4gSHViYmFyZAo+PiBOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1Cg==
