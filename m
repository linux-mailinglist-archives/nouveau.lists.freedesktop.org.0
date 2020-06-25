Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D120A42F
	for <lists+nouveau@lfdr.de>; Thu, 25 Jun 2020 19:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3AC6E334;
	Thu, 25 Jun 2020 17:42:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3121C6E334
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 17:42:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef4e1a20001>; Thu, 25 Jun 2020 10:40:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 10:42:24 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 10:42:24 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 17:42:24 +0000
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com> <20200624072355.GB18609@lst.de>
 <330f6a82-d01d-db97-1dec-69346f41e707@nvidia.com>
 <a9aba057-3786-8204-f782-6e8f3c290b35@nvidia.com>
 <20200625173144.GT6578@ziepe.ca>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <412b3a51-619a-4f94-da96-f4596e5eb510@nvidia.com>
Date: Thu, 25 Jun 2020 10:42:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200625173144.GT6578@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593106851; bh=dVDtjOJNekdnS7jMIhDZrkR7SUVoPtPB26y7vdiQ8rc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=C79NzfYIZ/4/7K07xyDkDyWF09cLOtFqcAGWDpgLD6fZQTPfIVTxfx1KX73YbBEX5
 /lPoACQODhbk+hYa01hbXni4W78wr6AcXvVIyzAG0zdQlx2FtFg1fMjGGCHQ9GA8iu
 ZhYBp+2pngMltPsi9YG3jJwCKSJmCqJAqoXHEQLTZGDGuSNkde/g66HChAung88sMa
 Yn/fIm7hckavMnJq1E5saPfA+7u/Qkh3aGkER+w3SF8PIYoGYjuHKncp7/+hLfUWWo
 VokvfaTAX8aR6ZKyk9Guo7o3WeVENV12wbZ5ShgD2PtP+fkIq1KpbhHNNwmfFDGww0
 OSCwcLhSmr9Vg==
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
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ck9uIDYvMjUvMjAgMTA6MzEgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUsIEp1
biAyNSwgMjAyMCBhdCAxMDoyNTozOEFNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPj4g
TWFraW5nIHN1cmUgdG8gaW5jbHVkZSBsaW51eC1tbSBhbmQgQmhhcmF0YSBCIFJhbyBmb3IgSUJN
J3MKPj4gdXNlIG9mIG1pZ3JhdGVfdm1hKigpLgo+Pgo+PiBPbiA2LzI0LzIwIDExOjEwIEFNLCBS
YWxwaCBDYW1wYmVsbCB3cm90ZToKPj4+Cj4+PiBPbiA2LzI0LzIwIDEyOjIzIEFNLCBDaHJpc3Rv
cGggSGVsbHdpZyB3cm90ZToKPj4+PiBPbiBNb24sIEp1biAyMiwgMjAyMCBhdCAwNDozODo1M1BN
IC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPj4+Pj4gVGhlIE9wZW5DTCBmdW5jdGlvbiBj
bEVucXVldWVTVk1NaWdyYXRlTWVtKCksIHdpdGhvdXQgYW55IGZsYWdzLCB3aWxsCj4+Pj4+IG1p
Z3JhdGUgbWVtb3J5IGluIHRoZSBnaXZlbiBhZGRyZXNzIHJhbmdlIHRvIGRldmljZSBwcml2YXRl
IG1lbW9yeS4gVGhlCj4+Pj4+IHNvdXJjZSBwYWdlcyBtaWdodCBhbHJlYWR5IGhhdmUgYmVlbiBt
aWdyYXRlZCB0byBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkuCj4+Pj4+IEluIHRoYXQgY2FzZSwgdGhl
IHNvdXJjZSBzdHJ1Y3QgcGFnZSBpcyBub3QgY2hlY2tlZCB0byBzZWUgaWYgaXQgaXMKPj4+Pj4g
YSBkZXZpY2UgcHJpdmF0ZSBwYWdlIGFuZCBpbmNvcnJlY3RseSBjb21wdXRlcyB0aGUgR1BVJ3Mg
cGh5c2ljYWwKPj4+Pj4gYWRkcmVzcyBvZiBsb2NhbCBtZW1vcnkgbGVhZGluZyB0byBkYXRhIGNv
cnJ1cHRpb24uCj4+Pj4+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoZSBzb3VyY2Ugc3RydWN0IHBh
Z2UgYW5kIGNvbXB1dGluZyB0aGUgY29ycmVjdAo+Pj4+PiBwaHlzaWNhbCBhZGRyZXNzLgo+Pj4+
Cj4+Pj4gSSdtIHJlYWxseSB3b3JyaWVkIGFib3V0IGFsbCB0aGlzIGRlbGljYXRlIGNvZGUgdG8g
Zml4IHRoZSBtaXhlZAo+Pj4+IHJhbmdlcy7CoCBDYW4ndCB3ZSBtYWtlIGl0IGNsZWFyIGF0IHRo
ZSBtaWdyYXRlX3ZtYV8qIGxldmVsIGlmIHdlIHdhbnQKPj4+PiB0byBtaWdyYXRlIGZyb20gb3Ig
dHdvIGRldmljZSBwcml2YXRlIG1lbW9yeSwgYW5kIHRoZW4gc2tpcCBhbGwgdGhlIHdvcmsKPj4+
PiBmb3IgcmVnaW9ucyBvZiBtZW1vcnkgdGhhdCBhbHJlYWR5IGFyZSBpbiB0aGUgcmlnaHQgcGxh
Y2U/wqAgVGhpcyBtaWdodCBiZQo+Pj4+IGEgbGl0dGxlIG1vcmUgd29yayBpbml0aWFsbHksIGJ1
dCBJIHRoaW5rIGl0IGxlYWRzIHRvIGEgbXVjaCBiZXR0ZXIKPj4+PiBBUEkuCj4+Pj4KPj4+Cj4+
PiBUaGUgY3VycmVudCBjb2RlIGRvZXMgZW5jb2RlIHRoZSBkaXJlY3Rpb24gd2l0aCBzcmNfb3du
ZXIgIT0gTlVMTCBtZWFuaW5nCj4+PiBkZXZpY2UgcHJpdmF0ZSB0byBzeXN0ZW0gbWVtb3J5IGFu
ZCBzcmNfb3duZXIgPT0gTlVMTCBtZWFuaW5nIHN5c3RlbQo+Pj4gbWVtb3J5IHRvIGRldmljZSBw
cml2YXRlIG1lbW9yeS4gVGhpcyBwYXRjaCB3b3VsZCBvYnZpb3VzbHkgZGVmZWF0IHRoYXQKPj4+
IHNvIHBlcmhhcHMgYSBmbGFnIGNvdWxkIGJlIGFkZGVkIHRvIHRoZSBzdHJ1Y3QgbWlncmF0ZV92
bWEgdG8gaW5kaWNhdGUgdGhlCj4+PiBkaXJlY3Rpb24gYnV0IEknbSB1bmNsZWFyIGhvdyB0aGF0
IG1ha2VzIHRoaW5ncyBsZXNzIGRlbGljYXRlLgo+Pj4gQ2FuIHlvdSBleHBhbmQgb24gd2hhdCB5
b3UgYXJlIHdvcnJpZWQgYWJvdXQ/Cj4+Pgo+Pj4gVGhlIGlzc3VlIHdpdGggaW52YWxpZGF0aW9u
cyBtaWdodCBiZSBiZXR0ZXIgYWRkcmVzc2VkIGJ5IGxldHRpbmcgdGhlIGRldmljZQo+Pj4gZHJp
dmVyIGhhbmRsZSBkZXZpY2UgcHJpdmF0ZSBwYWdlIFRMQiBpbnZhbGlkYXRpb25zIHdoZW4gbWln
cmF0aW5nIHRvCj4+PiBzeXN0ZW0gbWVtb3J5IGFuZCBjaGFuZ2luZyBtaWdyYXRlX3ZtYV9zZXR1
cCgpIHRvIG9ubHkgaW52YWxpZGF0ZSBDUFUKPj4+IFRMQiBlbnRyaWVzIGZvciBub3JtYWwgcGFn
ZXMgYmVpbmcgbWlncmF0ZWQgdG8gZGV2aWNlIHByaXZhdGUgbWVtb3J5Lgo+Pj4gSWYgYSBwYWdl
IGlzbid0IG1pZ3JhdGluZywgaXQgc2VlbXMgaW5lZmZpY2llbnQgdG8gaW52YWxpZGF0ZSB0aG9z
ZSBUTEIKPj4+IGVudHJpZXMuCj4+Pgo+Pj4gQW55IG90aGVyIHN1Z2dlc3Rpb25zPwo+Pgo+PiBB
ZnRlciBhIG5pZ2h0J3Mgc2xlZXAsIEkgdGhpbmsgdGhpcyBtaWdodCB3b3JrLiBXaGF0IGRvIG90
aGVycyB0aGluaz8KPj4KPj4gMSkgQWRkIGEgbmV3IE1NVV9OT1RJRllfTUlHUkFURSBlbnVtIHRv
IG1tdV9ub3RpZmllcl9ldmVudC4KPj4KPj4gMikgQ2hhbmdlIG1pZ3JhdGVfdm1hX2NvbGxlY3Qo
KSB0byB1c2UgdGhlIG5ldyBNTVVfTk9USUZZX01JR1JBVEUgZXZlbnQgdHlwZS4KPj4KPj4gMykg
TW9kaWZ5IG5vdXZlYXVfc3ZtbV9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgdG8gc2ltcGx5IHJl
dHVybiAobm8gaW52YWxpZGF0aW9ucykKPj4gZm9yIE1NVV9OT1RJRllfTUlHUkFURSBtbXUgbm90
aWZpZXIgY2FsbGJhY2tzLgo+IAo+IElzbid0IGl0IGEgYml0IG9mIGFuIGFzc3VtcHRpb24gdGhh
dCBtaWdyYXRlX3ZtYV9jb2xsZWN0KCkgaXMgb25seQo+IHVzZWQgYnkgbm91dmVhdSBpdHNlbGY/
Cj4gCj4gV2hhdCBpZiBzb21lIG90aGVyIGRldmljZXMnIGRldmljZV9wcml2YXRlIHBhZ2VzIGFy
ZSBiZWluZyBtaWdyYXRlZD8KPiAKPiBKYXNvbgo+IAoKR29vZCBwb2ludC4gVGhlIGRyaXZlciBu
ZWVkcyBhIHdheSBvZiBrbm93aW5nIHRoZSBjYWxsYmFjayBpcyBkdWUgaXRzIGNhbGwKdG8gbWln
cmF0ZV92bWFfc2V0dXAoKSBhbmQgbm90IHNvbWUgb3RoZXIgbWlncmF0aW9uIGludmFsaWRhdGlv
bi4KSG93IGFib3V0IGFkZGluZyBhIHZvaWQgcG9pbnRlciB0byBzdHJ1Y3QgbW11X25vdGlmaWVy
X3JhbmdlCndoaWNoIG1pZ3JhdGVfdm1hX2NvbGxlY3QoKSBjYW4gc2V0IHRvIHNyY19vd25lci4g
SWYgdGhlIGV2ZW50IGlzCk1NVV9OT1RJRllfTUlHUkFURSBhbmQgdGhlIHNyY19vd25lciBtYXRj
aGVzIHRoZSB2b2lkIHBvaW50ZXIsIHRoZW4gdGhlCmNhbGxiYWNrIHNob3VsZCBiZSB0aGUgb25l
IHRoZSBkcml2ZXIgaW5pdGlhdGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXUK
