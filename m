Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF485330
	for <lists+nouveau@lfdr.de>; Wed,  7 Aug 2019 20:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6DC6E75A;
	Wed,  7 Aug 2019 18:47:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5C16E75A
 for <nouveau@lists.freedesktop.org>; Wed,  7 Aug 2019 18:47:34 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b7so58189241otl.11
 for <nouveau@lists.freedesktop.org>; Wed, 07 Aug 2019 11:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3GxMdQgJ16JYM6vB9EqrOMBguT7ZpbwaC2gFsJYblY=;
 b=B5k928RqtXrVKPPrGFaXuizs7DUdUrzLOjzxHD493kCmuFF47RNWErkv1CxVK0aEtJ
 toXMDXiJK47GI+Kl5Z1yW4NTCJcCJMZty//SU4Yq+hzu0zKe3C5FKGmCjOdvJv1UiDkz
 URUtU+hVgdi5ruVWwN2ECE65QSR/iO4oJmI1dB4hP3cDulzD1j3BfOCyJ5MV8wbNLVv0
 bit56acBJ40whqQAkstBCniNWSmhCHw5VQBG33UOnTTc1R9NHSRjwZPycmUIZ5fXJNR4
 34G+GYrq6hKNzVnC2MlYwO3j0D5KERK9XDhAdHppbNTAS9sWyduswYZ4u59OpMyIESWJ
 nRqg==
X-Gm-Message-State: APjAAAWMYWrLnWZduJJbqCCIApM8gl9jWH2KwreuvXXtlJRA6lnaKMNs
 j/umjMuet7HGrJMLX20qb0aETfe6nynN81oit4jfzKz1
X-Google-Smtp-Source: APXvYqx9iyAol+nPIwV+xm+JH3PQpbIYdFfNm3nAIBIucjDzbmxREKqG7SEfBZVZpdTmNeOyHJgfGURXESCs2jM413Q=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr916746oii.0.1565203653206;
 Wed, 07 Aug 2019 11:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
In-Reply-To: <20190807174548.GJ1571@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Aug 2019 11:47:22 -0700
Message-ID: <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I3GxMdQgJ16JYM6vB9EqrOMBguT7ZpbwaC2gFsJYblY=;
 b=eufME0A1waHaRExGiJHdT+bpIpihtaHYpBR1S379jGewd0U+Nt66U62LNva1+eZKmu
 dhy9pkKzSiX3YZhVm29ptFSIyBc9Y+KnM3g54IwyRgUpFlNR3nZhM4VXnbG2uBy1zBFV
 nKr26w6ffs+NE6K7g1U5MxcWnDwNmXhcoKU5rHdq7KGHSgy0NS2q5OLROhpdNqxicJ7A
 nR0Y2nywQGDNILibe7GM19qh275ev59HXQR5ieMatT6CC257JjLV53yo6QaYKhXIebDW
 LbLROTSOvx0EAQM7DBPCTCsnUDDTtIUa1KL4qhkROxa+QLttpESgrtP/pw7SxNnTfnyE
 BuOg==
Subject: Re: [Nouveau] [PATCH 04/15] mm: remove the pgmap field from struct
 hmm_vma_walk
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMDo0NSBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDJQTSAr
MDMwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBUaGVyZSBpcyBvbmx5IGEgc2luZ2xl
IHBsYWNlIHdoZXJlIHRoZSBwZ21hcCBpcyBwYXNzZWQgb3ZlciBhIGZ1bmN0aW9uCj4gPiBjYWxs
LCBzbyByZXBsYWNlIGl0IHdpdGggbG9jYWwgdmFyaWFibGVzIGluIHRoZSBwbGFjZXMgd2hlcmUg
d2UgZGVhbAo+ID4gd2l0aCB0aGUgcGdtYXAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAgbW0vaG1tLmMgfCA2MiArKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+ID4gaW5kZXggOWE5MDg5MDJlNGNjLi5kNjZmYTI5
YjQyZTAgMTAwNjQ0Cj4gPiArKysgYi9tbS9obW0uYwo+ID4gQEAgLTI3OCw3ICsyNzgsNiBAQCBF
WFBPUlRfU1lNQk9MKGhtbV9taXJyb3JfdW5yZWdpc3Rlcik7Cj4gPgo+ID4gIHN0cnVjdCBobW1f
dm1hX3dhbGsgewo+ID4gICAgICAgc3RydWN0IGhtbV9yYW5nZSAgICAgICAgKnJhbmdlOwo+ID4g
LSAgICAgc3RydWN0IGRldl9wYWdlbWFwICAgICAgKnBnbWFwOwo+ID4gICAgICAgdW5zaWduZWQg
bG9uZyAgICAgICAgICAgbGFzdDsKPiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGZs
YWdzOwo+ID4gIH07Cj4gPiBAQCAtNDc1LDYgKzQ3NCw3IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9o
YW5kbGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLAo+ID4gICNpZmRlZiBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UKPiA+ICAgICAgIHN0cnVjdCBobW1fdm1hX3dhbGsgKmhtbV92bWFfd2Fs
ayA9IHdhbGstPnByaXZhdGU7Cj4gPiAgICAgICBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGht
bV92bWFfd2Fsay0+cmFuZ2U7Cj4gPiArICAgICBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0g
TlVMTDsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgcGZuLCBucGFnZXMsIGk7Cj4gPiAgICAgICBi
b29sIGZhdWx0LCB3cml0ZV9mYXVsdDsKPiA+ICAgICAgIHVpbnQ2NF90IGNwdV9mbGFnczsKPiA+
IEBAIC00OTAsMTcgKzQ5MCwxNCBAQCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1
Y3QgbW1fd2FsayAqd2FsaywKPiA+ICAgICAgIHBmbiA9IHBtZF9wZm4ocG1kKSArIHB0ZV9pbmRl
eChhZGRyKTsKPiA+ICAgICAgIGZvciAoaSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9T
SVpFLCBpKyssIHBmbisrKSB7Cj4gPiAgICAgICAgICAgICAgIGlmIChwbWRfZGV2bWFwKHBtZCkp
IHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBobW1fdm1hX3dhbGstPnBnbWFwID0gZ2V0X2Rl
dl9wYWdlbWFwKHBmbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaG1tX3ZtYV93YWxrLT5wZ21hcCk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgaWYg
KHVubGlrZWx5KCFobW1fdm1hX3dhbGstPnBnbWFwKSkKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBwZ21hcCA9IGdldF9kZXZfcGFnZW1hcChwZm4sIHBnbWFwKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBpZiAodW5saWtlbHkoIXBnbWFwKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUJVU1k7Cj4KPiBVbnJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IHdo
YXQgaXMgdGhlIHBvaW50IG9mIGdldHRpbmcgY2hlY2tpbmcKPiB0aGF0IHRoZSBwZ21hcCBleGlz
dHMgZm9yIHRoZSBwYWdlIGFuZCB0aGVuIGltbWVkaWF0ZWx5IHJlbGVhc2luZyBpdD8KPiBUaGlz
IGNvZGUgaGFzIHRoaXMgcGF0dGVybiBpbiBzZXZlcmFsIHBsYWNlcy4KPgo+IEl0IGZlZWxzIHJh
Y3kKCkFncmVlLCBub3Qgc3VyZSB3aGF0IHRoZSBpbnRlbnQgaXMgaGVyZS4gVGhlIG9ubHkgb3Ro
ZXIgcmVhc29uIGNhbGwKZ2V0X2Rldl9wYWdlbWFwKCkgaXMgdG8ganVzdCBjaGVjayBpbiBnZW5l
cmFsIGlmIHRoZSBwZm4gaXMgaW5kZWVkCm93bmVkIGJ5IHNvbWUgWk9ORV9ERVZJQ0UgaW5zdGFu
Y2UsIGJ1dCBpZiB0aGUgaW50ZW50IGlzIHRvIG1ha2Ugc3VyZQp0aGUgZGV2aWNlIGlzIHN0aWxs
IGF0dGFjaGVkL2VuYWJsZWQgdGhhdCBjaGVjayBpcyBpbnZhbGlkYXRlZCBhdApwdXRfZGV2X3Bh
Z2VtYXAoKS4KCklmIGl0J3MgdGhlIGZvcm1lciBjYXNlLCB2YWxpZGF0aW5nIFpPTkVfREVWSUNF
IHBmbnMsIEkgaW1hZ2luZSB3ZSBjYW4KZG8gc29tZXRoaW5nIGNoZWFwZXIgd2l0aCBhIGhlbHBl
ciB0aGF0IGlzIG9uIHRoZSBvcmRlciBvZiB0aGUgc2FtZQpjb3N0IGFzIHBmbl92YWxpZCgpLiBJ
LmUuIHJlcGxhY2UgUFRFX0RFVk1BUCB3aXRoIGEgbWVtX3NlY3Rpb24gZmxhZwpvciBzb21ldGhp
bmcgc2ltaWxhci4KCj4KPiA+ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICBwZm5z
W2ldID0gaG1tX2RldmljZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8IGNwdV9mbGFnczsK
PiA+ICAgICAgIH0KPiA+IC0gICAgIGlmIChobW1fdm1hX3dhbGstPnBnbWFwKSB7Cj4gPiAtICAg
ICAgICAgICAgIHB1dF9kZXZfcGFnZW1hcChobW1fdm1hX3dhbGstPnBnbWFwKTsKPiA+IC0gICAg
ICAgICAgICAgaG1tX3ZtYV93YWxrLT5wZ21hcCA9IE5VTEw7Cj4KPiBQdXR0aW5nIHRoZSB2YWx1
ZSBpbiB0aGUgaG1tX3ZtYV93YWxrIHdvdWxkIGhhdmUgbWFkZSBzb21lIHNlbnNlIHRvIG1lCj4g
aWYgdGhlIHBnbWFwIHdhcyBub3Qgc2V0IHRvIE5VTEwgYWxsIG92ZXIgdGhlIHBsYWNlLiBUaGVu
IHRoZSBtb3N0Cj4geGFfbG9hZHMgd291bGQgYmUgZWxpbWluYXRlZCwgYXMgSSB3b3VsZCBleHBl
Y3QgdGhlIHBnbWFwIHRlbmRzIHRvIGJlCj4gbW9zdGx5IHVuaWZvcm0gZm9yIHRoZXNlIHVzZSBj
YXNlcy4KPgo+IElzIHRoZXJlIHNvbWUgcmVhc29uIHRoZSBwZ21hcCByZWYgY2FuJ3QgYmUgaGVs
ZCBhY3Jvc3MKPiBmYXVsdGluZy9zbGVlcGluZz8gaWUgbGlrZSBiZWxvdy4KCk5vIHJlc3RyaWN0
aW9uIG9uIGhvbGRpbmcgcmVmcyBvdmVyIGZhdWx0aW5nIC8gc2xlZXBpbmcuCgo+Cj4gQW55aG93
LCBJIGxvb2tlZCBvdmVyIHRoaXMgcHJldHR5IGNhcmVmdWxseSBhbmQgdGhlIGNoYW5nZSBsb29r
cwo+IGZ1bmN0aW9uYWxseSBPSywgSSBqdXN0IGRvbid0IGtub3cgd2h5IHRoZSBjb2RlIGlzIGxp
a2UgdGhpcyBpbiB0aGUKPiBmaXJzdCBwbGFjZS4KPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50
aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4KPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9o
bW0uYwo+IGluZGV4IDlhOTA4OTAyZTRjYzM4Li40ZTMwMTI4YzIzYTUwNSAxMDA2NDQKPiAtLS0g
YS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTQ5NywxMCArNDk3LDYgQEAgc3RhdGlj
IGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssCj4gICAgICAgICAg
ICAgICAgIH0KPiAgICAgICAgICAgICAgICAgcGZuc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfZnJv
bV9wZm4ocmFuZ2UsIHBmbikgfCBjcHVfZmxhZ3M7Cj4gICAgICAgICB9Cj4gLSAgICAgICBpZiAo
aG1tX3ZtYV93YWxrLT5wZ21hcCkgewo+IC0gICAgICAgICAgICAgICBwdXRfZGV2X3BhZ2VtYXAo
aG1tX3ZtYV93YWxrLT5wZ21hcCk7Cj4gLSAgICAgICAgICAgICAgIGhtbV92bWFfd2Fsay0+cGdt
YXAgPSBOVUxMOwo+IC0gICAgICAgfQo+ICAgICAgICAgaG1tX3ZtYV93YWxrLT5sYXN0ID0gZW5k
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gICNlbHNlCj4gQEAgLTYwNCwxMCArNjAwLDYgQEAgc3Rh
dGljIGludCBobW1fdm1hX2hhbmRsZV9wdGUoc3RydWN0IG1tX3dhbGsgKndhbGssIHVuc2lnbmVk
IGxvbmcgYWRkciwKPiAgICAgICAgIHJldHVybiAwOwo+Cj4gIGZhdWx0Ogo+IC0gICAgICAgaWYg
KGhtbV92bWFfd2Fsay0+cGdtYXApIHsKPiAtICAgICAgICAgICAgICAgcHV0X2Rldl9wYWdlbWFw
KGhtbV92bWFfd2Fsay0+cGdtYXApOwo+IC0gICAgICAgICAgICAgICBobW1fdm1hX3dhbGstPnBn
bWFwID0gTlVMTDsKPiAtICAgICAgIH0KPiAgICAgICAgIHB0ZV91bm1hcChwdGVwKTsKPiAgICAg
ICAgIC8qIEZhdWx0IGFueSB2aXJ0dWFsIGFkZHJlc3Mgd2Ugd2VyZSBhc2tlZCB0byBmYXVsdCAq
Lwo+ICAgICAgICAgcmV0dXJuIGhtbV92bWFfd2Fsa19ob2xlXyhhZGRyLCBlbmQsIGZhdWx0LCB3
cml0ZV9mYXVsdCwgd2Fsayk7Cj4gQEAgLTY5MCwxNiArNjgyLDYgQEAgc3RhdGljIGludCBobW1f
dm1hX3dhbGtfcG1kKHBtZF90ICpwbWRwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biByOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gLSAgICAgICBpZiAoaG1tX3Zt
YV93YWxrLT5wZ21hcCkgewo+IC0gICAgICAgICAgICAgICAvKgo+IC0gICAgICAgICAgICAgICAg
KiBXZSBkbyBwdXRfZGV2X3BhZ2VtYXAoKSBoZXJlIGFuZCBub3QgaW4gaG1tX3ZtYV9oYW5kbGVf
cHRlKCkKPiAtICAgICAgICAgICAgICAgICogc28gdGhhdCB3ZSBjYW4gbGV2ZXJhZ2UgZ2V0X2Rl
dl9wYWdlbWFwKCkgb3B0aW1pemF0aW9uIHdoaWNoCj4gLSAgICAgICAgICAgICAgICAqIHdpbGwg
bm90IHJlLXRha2UgYSByZWZlcmVuY2Ugb24gYSBwZ21hcCBpZiB3ZSBhbHJlYWR5IGhhdmUKPiAt
ICAgICAgICAgICAgICAgICogb25lLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAg
ICAgICAgcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwo+IC0gICAgICAgICAg
ICAgICBobW1fdm1hX3dhbGstPnBnbWFwID0gTlVMTDsKPiAtICAgICAgIH0KPiAgICAgICAgIHB0
ZV91bm1hcChwdGVwIC0gMSk7Cj4KPiAgICAgICAgIGhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7
Cj4gQEAgLTc1MSwxMCArNzMzLDYgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfcHVkKHB1ZF90
ICpwdWRwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBmbnNbaV0gPSBobW1fZGV2aWNlX2Vu
dHJ5X2Zyb21fcGZuKHJhbmdlLCBwZm4pIHwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY3B1X2ZsYWdzOwo+ICAgICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgICAgIGlm
IChobW1fdm1hX3dhbGstPnBnbWFwKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHV0X2Rl
dl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGhtbV92bWFfd2Fsay0+cGdtYXAgPSBOVUxMOwo+IC0gICAgICAgICAgICAgICB9Cj4gICAgICAg
ICAgICAgICAgIGhtbV92bWFfd2Fsay0+bGFzdCA9IGVuZDsKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gICAgICAgICB9Cj4gQEAgLTEwMjYsNiArMTAwNCwxNCBAQCBsb25nIGhtbV9yYW5n
ZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEtlZXAgdHJ5aW5nIHdoaWxlIHRoZSByYW5nZSBpcyB2
YWxpZC4gKi8KPiAgICAgICAgICAgICAgICAgfSB3aGlsZSAocmV0ID09IC1FQlVTWSAmJiByYW5n
ZS0+dmFsaWQpOwo+Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIFdl
IGRvIHB1dF9kZXZfcGFnZW1hcCgpIGhlcmUgc28gdGhhdCB3ZSBjYW4gbGV2ZXJhZ2UKPiArICAg
ICAgICAgICAgICAgICogZ2V0X2Rldl9wYWdlbWFwKCkgb3B0aW1pemF0aW9uIHdoaWNoIHdpbGwg
bm90IHJlLXRha2UgYQo+ICsgICAgICAgICAgICAgICAgKiByZWZlcmVuY2Ugb24gYSBwZ21hcCBp
ZiB3ZSBhbHJlYWR5IGhhdmUgb25lLgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAg
ICAgICAgaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cHV0X2Rldl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwo+ICsKClNlZW1zIG9rLCBidXQg
b25seSBpZiB0aGUgY2FsbGVyIGlzIGd1YXJhbnRlZWluZyB0aGF0IHRoZSByYW5nZSBkb2VzCm5v
dCBzcGFuIG91dHNpZGUgb2YgYSBzaW5nbGUgcGFnZW1hcCBpbnN0YW5jZS4gSWYgdGhhdCBndWFy
YW50ZWUgaXMKbWV0IHdoeSBub3QganVzdCBoYXZlIHRoZSBjYWxsZXIgcGFzcyBpbiBhIHBpbm5l
ZCBwYWdlbWFwPyBJZiB0aGF0Cmd1YXJhbnRlZSBpcyBub3QgbWV0LCB0aGVuIEkgdGhpbmsgd2Un
cmUgYmFjayB0byB5b3VyIHJhY2UgY29uY2Vybi4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
