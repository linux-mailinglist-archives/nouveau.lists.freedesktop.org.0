Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB320A3EE
	for <lists+nouveau@lfdr.de>; Thu, 25 Jun 2020 19:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169E6E32A;
	Thu, 25 Jun 2020 17:25:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018F6EBF8
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 17:25:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef4ddbf0000>; Thu, 25 Jun 2020 10:24:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 10:25:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 10:25:49 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 17:25:39 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com> <20200624072355.GB18609@lst.de>
 <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
Date: Thu, 25 Jun 2020 10:25:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593105855; bh=uYfK6rsz5+ealU9/4gfA5Q+t0zfXrSyYkvAq9Mm4eGo=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XRF2xro5q/8nFW0qjYwB2C4HyBRCQPyCPqDcMZofasBrICeXUutwqnsZyPduCtLpq
 /ggcpTLFzaRb8MUCEsmqC8yYPn/2pY+ZgjZwdi3UDopmO98V/URpD7d9BSuxWKPA+G
 2nWK0ffA0twlTJi0w2nlPSyqlw9LesqC01C2zXdacZOl5IX+OEzPnbN5JxKfO+3mNq
 oLvpus8nOYzAdTC4mzG5HtY6eVcuvTk4GK+8EAbum/RRJFnP5wOzkH//3bk+0krJvj
 HKpTZHcZhZjtaWE+Kb3QksgDgj0vokNgKMFr+K5B2UagSY1t9LsD44MzthqGXgXuBU
 T0TO8BMY5JjBg==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, Jason
 Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TWFraW5nIHN1cmUgdG8gaW5jbHVkZSBsaW51eC1tbSBhbmQgQmhhcmF0YSBCIFJhbyBmb3IgSUJN
J3MKdXNlIG9mIG1pZ3JhdGVfdm1hKigpLgoKT24gNi8yNC8yMCAxMToxMCBBTSwgUmFscGggQ2Ft
cGJlbGwgd3JvdGU6Cj4gCj4gT24gNi8yNC8yMCAxMjoyMyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDA0OjM4OjUzUE0gLTA3MDAsIFJhbHBo
IENhbXBiZWxsIHdyb3RlOgo+Pj4gVGhlIE9wZW5DTCBmdW5jdGlvbiBjbEVucXVldWVTVk1NaWdy
YXRlTWVtKCksIHdpdGhvdXQgYW55IGZsYWdzLCB3aWxsCj4+PiBtaWdyYXRlIG1lbW9yeSBpbiB0
aGUgZ2l2ZW4gYWRkcmVzcyByYW5nZSB0byBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkuIFRoZQo+Pj4g
c291cmNlIHBhZ2VzIG1pZ2h0IGFscmVhZHkgaGF2ZSBiZWVuIG1pZ3JhdGVkIHRvIGRldmljZSBw
cml2YXRlIG1lbW9yeS4KPj4+IEluIHRoYXQgY2FzZSwgdGhlIHNvdXJjZSBzdHJ1Y3QgcGFnZSBp
cyBub3QgY2hlY2tlZCB0byBzZWUgaWYgaXQgaXMKPj4+IGEgZGV2aWNlIHByaXZhdGUgcGFnZSBh
bmQgaW5jb3JyZWN0bHkgY29tcHV0ZXMgdGhlIEdQVSdzIHBoeXNpY2FsCj4+PiBhZGRyZXNzIG9m
IGxvY2FsIG1lbW9yeSBsZWFkaW5nIHRvIGRhdGEgY29ycnVwdGlvbi4KPj4+IEZpeCB0aGlzIGJ5
IGNoZWNraW5nIHRoZSBzb3VyY2Ugc3RydWN0IHBhZ2UgYW5kIGNvbXB1dGluZyB0aGUgY29ycmVj
dAo+Pj4gcGh5c2ljYWwgYWRkcmVzcy4KPj4KPj4gSSdtIHJlYWxseSB3b3JyaWVkIGFib3V0IGFs
bCB0aGlzIGRlbGljYXRlIGNvZGUgdG8gZml4IHRoZSBtaXhlZAo+PiByYW5nZXMuwqAgQ2FuJ3Qg
d2UgbWFrZSBpdCBjbGVhciBhdCB0aGUgbWlncmF0ZV92bWFfKiBsZXZlbCBpZiB3ZSB3YW50Cj4+
IHRvIG1pZ3JhdGUgZnJvbSBvciB0d28gZGV2aWNlIHByaXZhdGUgbWVtb3J5LCBhbmQgdGhlbiBz
a2lwIGFsbCB0aGUgd29yawo+PiBmb3IgcmVnaW9ucyBvZiBtZW1vcnkgdGhhdCBhbHJlYWR5IGFy
ZSBpbiB0aGUgcmlnaHQgcGxhY2U/wqAgVGhpcyBtaWdodCBiZQo+PiBhIGxpdHRsZSBtb3JlIHdv
cmsgaW5pdGlhbGx5LCBidXQgSSB0aGluayBpdCBsZWFkcyB0byBhIG11Y2ggYmV0dGVyCj4+IEFQ
SS4KPj4KPiAKPiBUaGUgY3VycmVudCBjb2RlIGRvZXMgZW5jb2RlIHRoZSBkaXJlY3Rpb24gd2l0
aCBzcmNfb3duZXIgIT0gTlVMTCBtZWFuaW5nCj4gZGV2aWNlIHByaXZhdGUgdG8gc3lzdGVtIG1l
bW9yeSBhbmQgc3JjX293bmVyID09IE5VTEwgbWVhbmluZyBzeXN0ZW0KPiBtZW1vcnkgdG8gZGV2
aWNlIHByaXZhdGUgbWVtb3J5LiBUaGlzIHBhdGNoIHdvdWxkIG9idmlvdXNseSBkZWZlYXQgdGhh
dAo+IHNvIHBlcmhhcHMgYSBmbGFnIGNvdWxkIGJlIGFkZGVkIHRvIHRoZSBzdHJ1Y3QgbWlncmF0
ZV92bWEgdG8gaW5kaWNhdGUgdGhlCj4gZGlyZWN0aW9uIGJ1dCBJJ20gdW5jbGVhciBob3cgdGhh
dCBtYWtlcyB0aGluZ3MgbGVzcyBkZWxpY2F0ZS4KPiBDYW4geW91IGV4cGFuZCBvbiB3aGF0IHlv
dSBhcmUgd29ycmllZCBhYm91dD8KPiAKPiBUaGUgaXNzdWUgd2l0aCBpbnZhbGlkYXRpb25zIG1p
Z2h0IGJlIGJldHRlciBhZGRyZXNzZWQgYnkgbGV0dGluZyB0aGUgZGV2aWNlCj4gZHJpdmVyIGhh
bmRsZSBkZXZpY2UgcHJpdmF0ZSBwYWdlIFRMQiBpbnZhbGlkYXRpb25zIHdoZW4gbWlncmF0aW5n
IHRvCj4gc3lzdGVtIG1lbW9yeSBhbmQgY2hhbmdpbmcgbWlncmF0ZV92bWFfc2V0dXAoKSB0byBv
bmx5IGludmFsaWRhdGUgQ1BVCj4gVExCIGVudHJpZXMgZm9yIG5vcm1hbCBwYWdlcyBiZWluZyBt
aWdyYXRlZCB0byBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkuCj4gSWYgYSBwYWdlIGlzbid0IG1pZ3Jh
dGluZywgaXQgc2VlbXMgaW5lZmZpY2llbnQgdG8gaW52YWxpZGF0ZSB0aG9zZSBUTEIKPiBlbnRy
aWVzLgo+IAo+IEFueSBvdGhlciBzdWdnZXN0aW9ucz8KCkFmdGVyIGEgbmlnaHQncyBzbGVlcCwg
SSB0aGluayB0aGlzIG1pZ2h0IHdvcmsuIFdoYXQgZG8gb3RoZXJzIHRoaW5rPwoKMSkgQWRkIGEg
bmV3IE1NVV9OT1RJRllfTUlHUkFURSBlbnVtIHRvIG1tdV9ub3RpZmllcl9ldmVudC4KCjIpIENo
YW5nZSBtaWdyYXRlX3ZtYV9jb2xsZWN0KCkgdG8gdXNlIHRoZSBuZXcgTU1VX05PVElGWV9NSUdS
QVRFIGV2ZW50IHR5cGUuCgozKSBNb2RpZnkgbm91dmVhdV9zdm1tX2ludmFsaWRhdGVfcmFuZ2Vf
c3RhcnQoKSB0byBzaW1wbHkgcmV0dXJuIChubyBpbnZhbGlkYXRpb25zKQpmb3IgTU1VX05PVElG
WV9NSUdSQVRFIG1tdSBub3RpZmllciBjYWxsYmFja3MuCgo0KSBMZWF2ZSB0aGUgc3JjX293bmVy
IGNoZWNrIGluIG1pZ3JhdGVfdm1hX2NvbGxlY3RfcG1kKCkgZm9yIG5vcm1hbCBwYWdlcyBzbyBp
ZiB0aGUKZGV2aWNlIGRyaXZlciBpcyBtaWdyYXRpbmcgbm9ybWFsIHBhZ2VzIHRvIGRldmljZSBw
cml2YXRlIG1lbW9yeSwgdGhlIGRyaXZlciB3b3VsZApzZXQgc3JjX293bmVyID0gTlVMTCBhbmQg
YWxyZWFkeSBtaWdyYXRlZCBkZXZpY2UgcHJpdmF0ZSBwYWdlcyB3b3VsZCBiZSBza2lwcGVkLgpT
aW5jZSB0aGUgbW11IG5vdGlmaWVyIGNhbGxiYWNrIGRpZCBub3RoaW5nLCB0aGUgZGV2aWNlIHBy
aXZhdGUgZW50cmllcyByZW1haW4gdmFsaWQKaW4gdGhlIGRldmljZSdzIE1NVS4gbWlncmF0ZV92
bWFfY29sbGVjdF9wbWQoKSB3b3VsZCBzdGlsbCBpbnZhbGlkYXRlIHRoZSBDUFUgcGFnZQp0YWJs
ZXMgZm9yIG1pZ3JhdGVkIG5vcm1hbCBwYWdlcy4KSWYgdGhlIGRyaXZlciBpcyBtaWdyYXRpbmcg
ZGV2aWNlIHByaXZhdGUgcGFnZXMgdG8gc3lzdGVtIG1lbW9yeSwgaXQgd291bGQgc2V0CnNyY19v
d25lciAhPSBOVUxMLCBub3JtYWwgcGFnZXMgd291bGQgYmUgc2tpcHBlZCwgYnV0IG5vdyB0aGUg
ZGV2aWNlIGRyaXZlciBoYXMgdG8KaW52YWxpZGF0ZSBkZXZpY2UgTU1VIG1hcHBpbmdzIGluIHRo
ZSAiYWxsb2MgYW5kIGNvcHkiIGJlZm9yZSBkb2luZyB0aGUgY29weS4KVGhpcyB3b3VsZCBiZSBh
ZnRlciBtaWdyYXRlX3ZtYV9zZXR1cCgpIHJldHVybnMgc28gdGhlIGxpc3Qgb2YgbWlncmF0aW5n
IGRldmljZQpwYWdlcyBpcyBrbm93biB0byB0aGUgZHJpdmVyLgoKVGhlIHJlc3Qgb2YgdGhlIG1p
Z3JhdGVfdm1hX3BhZ2VzKCkgYW5kIG1pZ3JhdGVfdm1hX2ZpbmFsaXplKCkgcmVtYWluIHRoZSBz
YW1lLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
