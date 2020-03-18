Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE851893B2
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 02:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C552B89AC0;
	Wed, 18 Mar 2020 01:34:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from yyz.mikelr.com (yyz.mikelr.com [170.75.163.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CEB89AC0;
 Wed, 18 Mar 2020 01:34:35 +0000 (UTC)
Received: from glidewell.localnet (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 12BC73D9E7;
 Tue, 17 Mar 2020 21:34:34 -0400 (EDT)
From: Mikel Rychliski <mikel@mikelr.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Tue, 17 Mar 2020 21:34:33 -0400
Message-ID: <49518530.5kixuQOrMm@glidewell>
In-Reply-To: <20200317144731.GG23471@infradead.org>
References: <20200313222258.15659-1-mikel@mikelr.com>
 <20200313222258.15659-3-mikel@mikelr.com>
 <20200317144731.GG23471@infradead.org>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH RESEND v2 2/2] PCI: Use ioremap(),
 not phys_to_virt() for platform ROM
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, linux-pci@vger.kernel.org,
 Matthew Garrett <matthewgarrett@google.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBJJ20gYWxzbyByZXBseWlu
ZyBoZXJlIHRvIHlvdXIgY29tbWVudHMgb24gdGhlIApwcmV2aW91cyBzZXJpZXMuCgpPbiBUdWVz
ZGF5LCBNYXJjaCAxNywgMjAyMCAxMDoyODozNSBBTSBFRFQgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gQW55IHJlYXNvbiBkcml2ZXJzIGNhbid0IGp1c3QgdXNlIHBjaV9tYXBfcm9tIGluc3Rl
YWThvIUgd2hpY2ggYWxyZWFkeQo+IGRvZXMgdGhlIHJpZ2h0IHRoaW5nPwoKU29tZSBtYWNoaW5l
cyBkb24ndCBleHBvc2UgdGhlIHZpZGVvIEJJT1MgaW4gdGhlIFBDSSBCQVIgYW5kIGluc3RlYWQg
b25seSBtYWtlIAppdCBhdmFpbGFibGUgdmlhIEVGSSBib290IHNlcnZpY2VzIGNhbGxzLiBTbyBk
cml2ZXJzIG5lZWQgdG8gYmUgYWJsZSB0byB1c2UgCnRoZSBST00gcHJvdmlkZWQgYnkgRUZJIGNh
bGxzLCBidXQgb25seSBpZiB0aGV5IGNhbid0IGZpbmQgYSB2YWxpZCBvbmUgYW55d2hlcmUgCmVs
c2UuCgpBdCBvbmUgcG9pbnQsIHRoZSBFRkkgcHJvdmlkZWQgUk9NIGluIHBkZXYtPnJvbSAqd2Fz
KiBleHBvc2VkIHZpYSAKcGNpX21hcF9yb20oKS4gSG93ZXZlciBpdCBoYWQgdG8gYmUgc3BsaXQg
b3V0IGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbiBzbyB0aGF0IApkcml2ZXJzIGNvdWxkIGhhdmUg
bW9yZSBjb250cm9sIG92ZXIgd2hpY2ggc291cmNlcyB3ZXJlIHByZWZlcnJlZC4KCk9uIFR1ZXNk
YXksIE1hcmNoIDE3LCAyMDIwIDEwOjI5OjEzIEFNIEVEVCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBUaGlzIGFuZCB0aGUgbmV4dCBwYXRjaCByZWFsbHkgbmVlZCB0byBiZSBmb2xkZWQgaW50
byB0aGUgcHJldmlvdXMKPiBvbmUgdG8gYXZvaWQgcmVncmVzc2lvbnMgKGFzc3VtaW5nIG15IG90
aGVyIHN1Z2dlc3Rpb24gZG9lc24ndCB3b3JrCj4gZm9yIHNvbWUgcmVhc29uKS4KCkFkZHJlc3Nl
ZCBpbiB2MgoKT24gVHVlc2RheSwgTWFyY2ggMTcsIDIwMjAgMTA6NDc6MzEgQU0gRURUIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+IFdoYXQgaXMgdGhlIHZhbHVlIG9mIHRoaXMgaGVscGVyIG92
ZXIganVzdCBvcGVuIGNvZGluZyBhbiBpb3JlbWFwCj4gb2YgcGRldi0+cm9tIGluIHRoZSBjYWxs
ZXJzPwoKSSB0aGluayB0aGUgZGlyZWN0IGFjY2VzcyB0byBwZGV2LT5yb20geW91IHN1Z2dlc3Qg
bWFrZXMgc2Vuc2UsIGVzcGVjaWFsbHkgCmJlY2F1c2UgdXNlcnMgb2YgdGhlIHBjaV9wbGF0Zm9y
bV9yb20oKSBhcmUgZXhwb3NlZCB0byB0aGUgZmFjdCB0aGF0IGl0IGp1c3QgCmNhbGxzIGlvcmVt
YXAoKS4KCkkgZGVjaWRlZCBhZ2FpbnN0IHdyYXBwaW5nIHRoZSBpb3VubWFwKCkgd2l0aCBhIHBj
aV91bm1hcF9wbGF0Zm9ybV9yb20oKSwgYnV0IApJIGRpZG4ndCBhcHBseSB0aGUgc2FtZSBjb25z
aWRlcmF0aW9uIHRvIHRoZSBleGlzdGluZyBmdW5jdGlvbi4KCkhvdyBhYm91dCBzb21ldGhpbmcg
bGlrZSB0aGlzICh3aXRoIHBjaV9wbGF0Zm9ybV9yb20oKSByZW1vdmVkKT8KCnN0YXRpYyBib29s
IHJhZGVvbl9yZWFkX3BsYXRmb3JtX2Jpb3Moc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCnsK
CXBoeXNfYWRkcl90IHJvbSA9IHJkZXYtPnBkZXYtPnJvbTsKCXNpemVfdCByb21sZW4gPSByZGV2
LT5wZGV2LT5yb21sZW47Cgl2b2lkIF9faW9tZW0gKmJpb3M7CgoJcmRldi0+YmlvcyA9IE5VTEw7
CgoJaWYgKCFyb20gfHwgcm9tbGVuID09IDApCgkJcmV0dXJuIGZhbHNlOwoKCXJkZXYtPmJpb3Mg
PSBremFsbG9jKHJvbWxlbiwgR0ZQX0tFUk5FTCk7CglpZiAoIXJkZXYtPmJpb3MpCgkJcmV0dXJu
IGZhbHNlOwoKCWJpb3MgPSBpb3JlbWFwKHJvbSwgcm9tbGVuKTsKCWlmICghYmlvcykKCQlnb3Rv
IGZyZWVfYmlvczsKCgltZW1jcHlfZnJvbWlvKHJkZXYtPmJpb3MsIGJpb3MsIHJvbWxlbik7Cglp
b3VubWFwKGJpb3MpOwoKCWlmIChyZGV2LT5iaW9zWzBdICE9IDB4NTUgfHwgcmRldi0+Ymlvc1sx
XSAhPSAweGFhKQoJCWdvdG8gZnJlZV9iaW9zOwoKCXJldHVybiB0cnVlOwpmcmVlX2Jpb3M6Cglr
ZnJlZShyZGV2LT5iaW9zKTsKCXJldHVybiBmYWxzZTsKfQoKSWYgdGhpcyBpcyBwcmVmZXJyZWQs
IEknbGwgc2VuZCBhbiB1cGRhdGVkIHNlcmllcy4gSSdtIGFzc3VtaW5nIHRoYXQgdGhlIApyZW1v
dmFsIG9mIHBjaV9wbGF0Zm9ybV9yb20oKSBhbmQgdXBkYXRpbmcgb2YgYWxsIHRoZSBjYWxsZXJz
IHNob3VsZCBiZSAKY29tYmluZWQgaW50byB0aGlzIHBhdGNoLgoKVGhhbmtzLApNaWtlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
