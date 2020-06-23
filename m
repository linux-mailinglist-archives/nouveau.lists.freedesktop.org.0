Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D822A96B
	for <lists+nouveau@lfdr.de>; Thu, 23 Jul 2020 09:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE9A6E840;
	Thu, 23 Jul 2020 07:17:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36E6E0C2
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 02:51:29 +0000 (UTC)
IronPort-SDR: qzoM/KIdSlY2/5FBpWhU6V5+IXWQ+v6xvFopBbLDE1A8PbWAybHVkSHuAKm7SikfG3kwsjb5N6
 9xmBSPY/sf0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="205439123"
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; d="scan'208";a="205439123"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 19:51:27 -0700
IronPort-SDR: stMi4x4u0lGE9oF6INyqSIVVZASuHoTY6RLBNhZfKd1cGfjSj+eDTH/4My3zENuLBHRiWuxxoE
 C4MywkOnf8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; d="scan'208";a="275201085"
Received: from yhuang-dev.sh.intel.com (HELO yhuang-dev) ([10.239.159.23])
 by orsmga003.jf.intel.com with ESMTP; 22 Jun 2020 19:51:24 -0700
From: "Huang\, Ying" <ying.huang@intel.com>
To: Ralph Campbell <rcampbell@nvidia.com>
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
 <a778dcec-045b-85c0-2dd3-ac700e4208c5@nvidia.com>
Date: Tue, 23 Jun 2020 10:51:23 +0800
In-Reply-To: <a778dcec-045b-85c0-2dd3-ac700e4208c5@nvidia.com> (Ralph
 Campbell's message of "Mon, 22 Jun 2020 17:05:37 -0700")
Message-ID: <87zh8uze8k.fsf@yhuang-dev.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
 Yang Shi <shy828301@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPiB3cml0ZXM6Cgo+IE9uIDYvMjIv
MjAgNDo1NCBQTSwgWWFuZyBTaGkgd3JvdGU6Cj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDQ6
MDIgUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cm90ZToKPj4+Cj4+PiBP
biAyMDIwLTA2LTIyIDE1OjMzLCBZYW5nIFNoaSB3cm90ZToKPj4+PiBPbiBNb24sIEp1biAyMiwg
MjAyMCBhdCAzOjMwIFBNIFlhbmcgU2hpIDxzaHk4MjgzMDFAZ21haWwuY29tPiB3cm90ZToKPj4+
Pj4gT24gTW9uLCBKdW4gMjIsIDIwMjAgYXQgMjo1MyBQTSBaaSBZYW4gPHppeUBudmlkaWEuY29t
PiB3cm90ZToKPj4+Pj4+IE9uIDIyIEp1biAyMDIwLCBhdCAxNzozMSwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4+Pj4+Pj4gT24gNi8yMi8yMCAxOjEwIFBNLCBaaSBZYW4gd3JvdGU6Cj4+Pj4+Pj4+
IE9uIDIyIEp1biAyMDIwLCBhdCAxNTozNiwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+Pj4+Pj4+
PiBPbiA2LzIxLzIwIDQ6MjAgUE0sIFppIFlhbiB3cm90ZToKPj4+Pj4+Pj4+PiBPbiAxOSBKdW4g
MjAyMCwgYXQgMTc6NTYsIFJhbHBoIENhbXBiZWxsIHdyb3RlOgo+Pj4gLi4uCj4+Pj4+PiBZaW5n
KGNj4oCZZCkgZGV2ZWxvcGVkIHRoZSBjb2RlIHRvIHN3YXBvdXQgYW5kIHN3YXBpbiBUSFAgaW4g
b25lIHBpZWNlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDE4MTIwNzA1NDEy
Mi4yNzgyMi0xLXlpbmcuaHVhbmdAaW50ZWwuY29tLy4KPj4+Pj4+IEkgYW0gbm90IHN1cmUgd2hl
dGhlciB0aGUgcGF0Y2hzZXQgbWFrZXMgaW50byBtYWluc3RyZWFtIG9yIG5vdC4gSXQgY291bGQg
YmUgYSBnb29kIHRlY2huaWNhbCByZWZlcmVuY2UKPj4+Pj4+IGZvciBzd2FwcGluZyBpbiBkZXZp
Y2UgcHJpdmF0ZSBwYWdlcywgYWx0aG91Z2ggc3dhcHBpbmcgaW4gcGFnZXMgZnJvbSBkaXNrIGFu
ZCBmcm9tIGRldmljZSBwcml2YXRlCj4+Pj4+PiBtZW1vcnkgYXJlIHR3byBkaWZmZXJlbnQgc2Nl
bmFyaW9zLgo+Pj4+Pj4KPj4+Pj4+IFNpbmNlIHRoZSBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkgc3dh
cGluIGltcGFjdHMgY29yZSBtbSBwZXJmb3JtYW5jZSwgd2UgbWlnaHQgd2FudCB0byBkaXNjdXNz
IHlvdXIgcGF0Y2hlcwo+Pj4+Pj4gd2l0aCBtb3JlIHBlb3BsZSwgbGlrZSB0aGUgb25lcyBmcm9t
IFlpbmfigJlzIHBhdGNoc2V0LCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Pj4+Pgo+Pj4+PiBJIGJl
bGlldmUgWWluZyB3aWxsIGdpdmUgeW91IG1vcmUgaW5zaWdodHMgYWJvdXQgaG93IFRIUCBzd2Fw
IHdvcmtzLgo+Pj4+Pgo+Pj4+PiBCdXQsIElNSE8gZGV2aWNlIG1lbW9yeSBtaWdyYXRpb24gKG1p
Z3JhdGUgdG8gc3lzdGVtIG1lbW9yeSkgc2VlbXMKPj4+Pj4gbGlrZSBUSFAgQ29XIG1vcmUgdGhh
biBzd2FwLgo+Pj4KPj4+Cj4+PiBBIGZpbmUgcG9pbnQ6IG92ZXJhbGwsIHRoZSBkZXNpcmVkIGJl
aGF2aW9yIGlzICJtaWdyYXRlIiwgbm90IENvVy4KPj4+IFRoYXQncyBpbXBvcnRhbnQuIE1pZ3Jh
dGUgbWVhbnMgdGhhdCB5b3UgZG9uJ3QgbGVhdmUgYSBwYWdlIGJlaGluZCwgZXZlbgo+Pj4gYSBy
ZWFkLW9ubHkgb25lLiBBbmQgdGhhdCdzIGV4YWN0bHkgaG93IGRldmljZSBwcml2YXRlIG1pZ3Jh
dGlvbiBpcwo+Pj4gc3BlY2lmaWVkLgo+Pj4KPj4+IFdlIHNob3VsZCB0cnkgdG8gYXZvaWQgYW55
IGVyb3Npb24gb2YgY2xhcml0eSBoZXJlLiBFdmVuIGlmIHNvbWVob3cKPj4+IChyZWFsbHk/KSB0
aGUgdW5kZXJseWluZyBpbXBsZW1lbnRhdGlvbiBjYWxscyB0aGlzIFRIUCBDb1csIHRoZSBhY3R1
YWwKPj4+IGdvYWwgaXMgdG8gbWlncmF0ZSBwYWdlcyBvdmVyIHRvIHRoZSBkZXZpY2UgKGFuZCBi
YWNrKS4KPj4+Cj4+Pgo+Pj4+Pgo+Pj4+PiBXaGVuIG1pZ3JhdGluZyBpbjoKPj4+Pgo+Pj4+IFNv
cnJ5IGZvciBteSBmYXQgZmluZ2VyLCBoaXQgc2VudCBidXR0b24gaW5hZHZlcnRlbnRseSwgbGV0
IG1lIGZpbmlzaCBoZXJlLgo+Pj4+Cj4+Pj4gV2hlbiBtaWdyYXRpbmcgaW46Cj4+Pj4KPj4+PiAg
ICAgICAgICAgLSBpZiBUSFAgaXMgZW5hYmxlZDogYWxsb2NhdGUgVEhQLCBidXQgbmVlZCBoYW5k
bGUgYWxsb2NhdGlvbgo+Pj4+IGZhaWx1cmUgYnkgZmFsbGluZyBiYWNrIHRvIGJhc2UgcGFnZQo+
Pj4+ICAgICAgICAgICAtIGlmIFRIUCBpcyBkaXNhYmxlZDogZmFsbGJhY2sgdG8gYmFzZSBwYWdl
Cj4+Pj4KPj4+Cj4+PiBPSywgYnV0ICphbGwqIHBhZ2UgZW50cmllcyAoYmFzZSBhbmQgaHVnZS9s
YXJnZSBwYWdlcykgbmVlZCB0byBiZSBjbGVhcmVkLAo+Pj4gd2hlbiBtaWdyYXRpbmcgdG8gZGV2
aWNlIG1lbW9yeSwgdW5sZXNzIEknbSByZWFsbHkgY29uZnVzZWQgaGVyZS4KPj4+IFNvOiBub3Qg
Q29XLgo+Pgo+PiBJIHJlYWxpemVkIHRoZSBjb21tZW50IGNhdXNlZCBtb3JlIGNvbmZ1c2lvbi4g
SSBhcG9sb2dpemUgZm9yIHRoZQo+PiBjb25mdXNpb24uIFllcywgdGhlIHRyaWdnZXIgY29uZGl0
aW9uIGZvciBzd2FwL21pZ3JhdGlvbiBhbmQgQ29XIGFyZQo+PiBkZWZpbml0ZWx5IGRpZmZlcmVu
dC4gSGVyZSBJIG1lYW4gdGhlIGZhdWx0IGhhbmRsaW5nIHBhcnQgb2YgbWlncmF0aW5nCj4+IGlu
dG8gc3lzdGVtIG1lbW9yeS4KPj4KPj4gU3dhcC1pbiBqdXN0IG5lZWRzIHRvIGhhbmRsZSB0aGUg
YmFzZSBwYWdlIGNhc2Ugc2luY2UgVEhQIHN3YXBpbiBpcwo+PiBub3Qgc3VwcG9ydGVkIGluIHVw
c3RyZWFtIHlldCBhbmQgdGhlIFBNRCBpcyBzcGxpdCBpbiBzd2FwLW91dCBwaGFzZQo+PiAoc2Vl
IHNocmlua19wYWdlX2xpc3QpLgo+Pgo+PiBUaGUgcGF0Y2ggYWRkcyBUSFAgbWlncmF0aW9uIHN1
cHBvcnQgdG8gZGV2aWNlIG1lbW9yeSwgYnV0IHlvdSBuZWVkIHRvCj4+IGhhbmRsZSBtaWdyYXRl
IGluIChiYWNrIHRvIHN5c3RlbSBtZW1vcnkpIGNhc2UgY29ycmVjdGx5LiBUaGUgZmF1bHQKPj4g
aGFuZGxpbmcgc2hvdWxkIGxvb2sgbGlrZSBUSFAgQ29XIGZhdWx0IGhhbmRsaW5nIGJlaGF2aW9y
IChiZWZvcmUKPj4gNS44KToKPj4gICAgICAtIGlmIFRIUCBpcyBlbmFibGVkOiBhbGxvY2F0ZSBU
SFAsIGZhbGxiYWNrIGlmIGFsbG9jYXRpb24gaXMgZmFpbGVkCj4+ICAgICAgLSBpZiBUSFAgaXMg
ZGlzYWJsZWQ6IGZhbGxiYWNrIHRvIGJhc2UgcGFnZQo+Pgo+PiBTd2FwIGZhdWx0IGhhbmRsaW5n
IGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBhYm92ZS4gU28sIEkgc2FpZCBpdCBzZWVtcwo+PiBsaWtl
IG1vcmUgVEhQIENvVyAoZmF1bHQgaGFuZGxpbmcgcGFydCBvbmx5IGJlZm9yZSA1LjgpLiBJIGhv
cGUgSQo+PiBhcnRpY3VsYXRlIG15IG1pbmQuCj4+Cj4+IEhvd2V2ZXIsIEkgZGlkbid0IHNlZSBz
dWNoIGZhbGxiYWNrIGlzIGhhbmRsZWQuIEl0IGxvb2tzIGlmIFRIUAo+PiBhbGxvY2F0aW9uIGlz
IGZhaWxlZCwgaXQganVzdCByZXR1cm5zIFNJR0JVUzsgYW5kIG5vIGNoZWNrIGFib3V0IFRIUAo+
PiBzdGF0dXMgaWYgSSByZWFkIHRoZSBwYXRjaGVzIGNvcnJlY3RseS4gVGhlIFRIUCBtaWdodCBi
ZSBkaXNhYmxlZCBmb3IKPj4gdGhlIHNwZWNpZmljIHZtYSBvciBzeXN0ZW0gd2lkZSBiZWZvcmUg
bWlncmF0aW5nIGZyb20gZGV2aWNlIG1lbW9yeQo+PiBiYWNrIHRvIHN5c3RlbSBtZW1vcnkuCj4K
PiBZb3UgYXJlIGNvcnJlY3QsIHRoZSBwYXRjaCB3YXNuJ3QgaGFuZGxpbmcgdGhlIGZhbGxiYWNr
IGNhc2UuCj4gSSdsbCBhZGQgdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKRm9yIGZhbGxiYWNr
LCB5b3UgbmVlZCB0byBzcGxpdCB0aGUgVEhQIGluIGRldmljZSBmaXJzdGx5LiAgQmVjYXVzZSB5
b3UKd2lsbCBtaWdyYXRlIGEgYmFzZSBwYWdlIGluc3RlYWQgYSB3aG9sZSBUSFAgbm93LgoKQmVz
dCBSZWdhcmRzLApIdWFuZywgWWluZwoKPj4+Cj4+PiB0aGFua3MsCj4+PiAtLQo+Pj4gSm9obiBI
dWJiYXJkCj4+PiBOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
Cg==
