Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8E8C591
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 03:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C206E14D;
	Wed, 14 Aug 2019 01:36:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8140B6E148
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 01:36:45 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c7so6102425otp.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2019 18:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T79FqmE4omVh8KvKRr9Ji1NiYF1jwWoBp2a4S3wYfUE=;
 b=NSgvb99N4kwvpcyvD2PpzoLru7MXw/9VI9+WuDl+hRKy7bSnMAJGA/C8g9wVrrcPTx
 bMEBc9xOHB6+pryTdY+AbbSicjvSqedKOlF+qFQOoGlX+q5FKHp3eEsIFR8tcjDSn8Zv
 IX9XK1rtAp2vhqW+LL61/KVNmnfbk4BEm0dFlwgRZot0PVRyApRQ+R7BvvnChOWnNqX2
 C+RfSh2n8ISJyKw2WXAt6GA8qFyyHkuq5l+5T2t3dHfKfsniXfJBPRIPT1Zr2K0cdOEQ
 0sPt9wWGWa6AKjOHeDhZGaxxN1pro0izv3pqceWYyzK2ZHz+F5NnofKNBetxPdSXs9ZK
 wDJw==
X-Gm-Message-State: APjAAAWKOKJ4sNBBtCLGnALvapVJTBNwZe+hMIuk0K4W7cQVofOrA3EV
 6f3BURtDgvvT7Ua3OVklAXr458h8iMVrlezzkbnNLQ==
X-Google-Smtp-Source: APXvYqyFhSP3HBfgQ2MsiomdR7DRqtrfZ8oKVdlDOpd867Al47Dg9XQhd7rDLmPFJUa0Wi698T8sKjV8Y2VXZELxn2I=
X-Received: by 2002:a9d:5f13:: with SMTP id f19mr28233915oti.207.1565746604730; 
 Tue, 13 Aug 2019 18:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
In-Reply-To: <20190808065933.GA29382@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Aug 2019 18:36:33 -0700
Message-ID: <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=T79FqmE4omVh8KvKRr9Ji1NiYF1jwWoBp2a4S3wYfUE=;
 b=xIgh+scFlFZaMbyoMV1IkOIlX/nYvIEVasdGR+4vgGYHLeiewku5FhfmMF/u82KCRX
 MSErqkN/DgEQsqSvd4X7p+lT0oNexeTRv86qeokYYdUP0BOeLCGjOX9Sd/JWMKEQoS6g
 PwX/lC9BqsULCOBZLAvJixho5nREePWl5uOPg2jE9g0vQx3cZII3Ilx0J7oUMkt8HCC0
 jWbfmfOLvoT/mbKLqBnkK54WVKRXTWevpUb9oXR/7WiAJXekPzezsPzhCgDd3il+q6/O
 WYUwutEc9PedlqPBB8PVWWm7kSFEs6Fj841/WMzEqYowG5ogcen99NisCiTcA9kQF5+G
 eqrQ==
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMTo1OSBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMTo0NzoyMkFNIC0wNzAw
LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IFVucmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQg
d2hhdCBpcyB0aGUgcG9pbnQgb2YgZ2V0dGluZyBjaGVja2luZwo+ID4gPiB0aGF0IHRoZSBwZ21h
cCBleGlzdHMgZm9yIHRoZSBwYWdlIGFuZCB0aGVuIGltbWVkaWF0ZWx5IHJlbGVhc2luZyBpdD8K
PiA+ID4gVGhpcyBjb2RlIGhhcyB0aGlzIHBhdHRlcm4gaW4gc2V2ZXJhbCBwbGFjZXMuCj4gPiA+
Cj4gPiA+IEl0IGZlZWxzIHJhY3kKPiA+Cj4gPiBBZ3JlZSwgbm90IHN1cmUgd2hhdCB0aGUgaW50
ZW50IGlzIGhlcmUuIFRoZSBvbmx5IG90aGVyIHJlYXNvbiBjYWxsCj4gPiBnZXRfZGV2X3BhZ2Vt
YXAoKSBpcyB0byBqdXN0IGNoZWNrIGluIGdlbmVyYWwgaWYgdGhlIHBmbiBpcyBpbmRlZWQKPiA+
IG93bmVkIGJ5IHNvbWUgWk9ORV9ERVZJQ0UgaW5zdGFuY2UsIGJ1dCBpZiB0aGUgaW50ZW50IGlz
IHRvIG1ha2Ugc3VyZQo+ID4gdGhlIGRldmljZSBpcyBzdGlsbCBhdHRhY2hlZC9lbmFibGVkIHRo
YXQgY2hlY2sgaXMgaW52YWxpZGF0ZWQgYXQKPiA+IHB1dF9kZXZfcGFnZW1hcCgpLgo+ID4KPiA+
IElmIGl0J3MgdGhlIGZvcm1lciBjYXNlLCB2YWxpZGF0aW5nIFpPTkVfREVWSUNFIHBmbnMsIEkg
aW1hZ2luZSB3ZSBjYW4KPiA+IGRvIHNvbWV0aGluZyBjaGVhcGVyIHdpdGggYSBoZWxwZXIgdGhh
dCBpcyBvbiB0aGUgb3JkZXIgb2YgdGhlIHNhbWUKPiA+IGNvc3QgYXMgcGZuX3ZhbGlkKCkuIEku
ZS4gcmVwbGFjZSBQVEVfREVWTUFQIHdpdGggYSBtZW1fc2VjdGlvbiBmbGFnCj4gPiBvciBzb21l
dGhpbmcgc2ltaWxhci4KPgo+IFRoZSBobW0gbGl0ZXJhbGx5IG5ldmVyIGRlcmVmZXJlbmNlcyB0
aGUgcGdtYXAsIHNvIHZhbGlkaXR5IGNoZWNraW5nIGlzCj4gdGhlIG9ubHkgZXhwbGFuYXRpb24g
Zm9yIGl0Lgo+Cj4gPiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gPiArICAgICAgICAgICAgICAg
ICogV2UgZG8gcHV0X2Rldl9wYWdlbWFwKCkgaGVyZSBzbyB0aGF0IHdlIGNhbiBsZXZlcmFnZQo+
ID4gPiArICAgICAgICAgICAgICAgICogZ2V0X2Rldl9wYWdlbWFwKCkgb3B0aW1pemF0aW9uIHdo
aWNoIHdpbGwgbm90IHJlLXRha2UgYQo+ID4gPiArICAgICAgICAgICAgICAgICogcmVmZXJlbmNl
IG9uIGEgcGdtYXAgaWYgd2UgYWxyZWFkeSBoYXZlIG9uZS4KPiA+ID4gKyAgICAgICAgICAgICAg
ICAqLwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHB1dF9kZXZfcGFnZW1hcChobW1fdm1hX3dhbGstPnBn
bWFwKTsKPiA+ID4gKwo+ID4KPiA+IFNlZW1zIG9rLCBidXQgb25seSBpZiB0aGUgY2FsbGVyIGlz
IGd1YXJhbnRlZWluZyB0aGF0IHRoZSByYW5nZSBkb2VzCj4gPiBub3Qgc3BhbiBvdXRzaWRlIG9m
IGEgc2luZ2xlIHBhZ2VtYXAgaW5zdGFuY2UuIElmIHRoYXQgZ3VhcmFudGVlIGlzCj4gPiBtZXQg
d2h5IG5vdCBqdXN0IGhhdmUgdGhlIGNhbGxlciBwYXNzIGluIGEgcGlubmVkIHBhZ2VtYXA/IElm
IHRoYXQKPiA+IGd1YXJhbnRlZSBpcyBub3QgbWV0LCB0aGVuIEkgdGhpbmsgd2UncmUgYmFjayB0
byB5b3VyIHJhY2UgY29uY2Vybi4KPgo+IEl0IGl0ZXJhdGVzIG92ZXIgbXVsdGlwbGUgcHRlcyBp
biBhIG5vbi1odWdlIHBtZC4gIElzIHRoZXJlIGFueSBraW5kIG9mCj4gbGltaXRhdGlvbnMgb24g
ZGlmZmVyZW50IHBnbWFwIGluc3RhbmNlcyBpbnNpZGUgYSBwbWQ/ICBJIGNhbid0IHRoaW5rCj4g
b2Ygb25lLCBzbyB0aGlzIG1pZ2h0IGFjdHVhbGx5IGJlIGEgYnVnLgoKU2VjdGlvbiBhbGlnbm1l
bnQgY29uc3RyYWludHMgc29tZXdoYXQgc2F2ZSB1cyBoZXJlLiBUaGUgb25seSBleGFtcGxlCkkg
Y2FuIHRoaW5rIG9mIGEgUE1EIG5vdCBjb250YWluaW5nIGEgdW5pZm9ybSBwZ21hcCBhc3NvY2lh
dGlvbiBmb3IKZWFjaCBwdGUgaXMgdGhlIGNhc2Ugd2hlbiB0aGUgcGdtYXAgb3ZlcmxhcHMgbm9y
bWFsIGRyYW0sIGkuZS4gc2hhcmVzCnRoZSBzYW1lICdzdHJ1Y3QgbWVtb3J5X3NlY3Rpb24nIGZv
ciBhIGdpdmVuIHNwYW4uIE90aGVyd2lzZSwgZGlzdGluY3QKcGdtYXBzIGFycmFuZ2UgdG8gbWFu
YWdlIHRoZWlyIG93biBleGNsdXNpdmUgc2VjdGlvbnMgKGFuZCBub3cKc3Vic2VjdGlvbnMgYXMg
b2YgdjUuMykuIE90aGVyd2lzZSB0aGUgaW1wbGVtZW50YXRpb24gY291bGQgbm90Cmd1YXJhbnRl
ZSBkaWZmZXJlbnQgbWFwcGluZyBsaWZldGltZXMuCgpUaGF0IHNhaWQsIHRoaXMgc2VlbXMgdG8g
d2FudCBhIGJldHRlciBtZWNoYW5pc20gdG8gZGV0ZXJtaW5lICJwZm4gaXMKWk9ORV9ERVZJQ0Ui
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
