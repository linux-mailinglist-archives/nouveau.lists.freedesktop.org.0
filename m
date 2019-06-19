Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB284C1AF
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2019 21:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B886E45B;
	Wed, 19 Jun 2019 19:46:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01316E45B
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 19:46:13 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id b7so220410otl.11
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jun 2019 12:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AppOhepgnEe0jjnJnZQBJyzyqCwLm69rPfFkLY+t1bc=;
 b=hv6m0DrXL5Cgp25Q5xxJDulx0EcV1OZ4PXpjA/aB/19HrVLAxD1zfgfce6vg9k7FiQ
 tQ0apOq/KCc5FyPpEAPj7U8HatI2Opi/k+ipwJR/m7Dv1a0Ftxf91yOAFrjP25VaMlav
 piZWyWV41B0K0zKiurCs0AB8ojdwCA532yTFkWKsZegs6Y4nU39PKqu5Eu3FFAEjnrB2
 2ZDvh3Dat8a+4FwkF6Rx8nOc4+tn546xwPJaG7DzfqW++x4SQ0FBWM+Kxc7h+5m0ustL
 ojYJZS9EqjUfTmSYt4KTIwOZEbpUEiWAoA6Vb/Qx7TPrIi4ATUbLVP3EBncCjdpDlQca
 wwog==
X-Gm-Message-State: APjAAAXrVEy9o23eRkl4LG783uGKlTYx/LlSCqdpbYaSBK18uk83zIUI
 0j7RB4qsbNwJzGdSEANIwvvQs1zfcjlp/WqefpmI7A==
X-Google-Smtp-Source: APXvYqyF4/fQjVQSHjLx0TTlLSRvNfoC1XWgfZBLjCA5t1eNPRU75djqD3lZLhJzoRPj37ekmpc9LL5nqKSkBxWsIsE=
X-Received: by 2002:a9d:470d:: with SMTP id a13mr36193657otf.126.1560973572970; 
 Wed, 19 Jun 2019 12:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
 <20190613194430.GY22062@mellanox.com>
 <a27251ad-a152-f84d-139d-e1a3bf01c153@nvidia.com>
 <20190613195819.GA22062@mellanox.com>
 <20190614004314.GD783@iweiny-DESK2.sc.intel.com>
 <d2b77ea1-7b27-e37d-c248-267a57441374@nvidia.com>
 <20190619192719.GO9374@mellanox.com>
In-Reply-To: <20190619192719.GO9374@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 19 Jun 2019 12:46:01 -0700
Message-ID: <CAPcyv4j+zk_5WvFXbUbQ7bWisjWSwzwLsXide1AuVL4kLX8iyQ@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AppOhepgnEe0jjnJnZQBJyzyqCwLm69rPfFkLY+t1bc=;
 b=L+LW3co1OBHWplV01UpK1fvt6NIcRF2qR2+gyrISeEZDbLPi91YZXqNIJExJQhxjVL
 7NO7u5O4wqUQFCjZA8X/xN5IC6nTONNL0PLEmadz1t01bknVW+LPFjhIpUDlZICWj1OK
 Gog3pb+AQtERVqv6j7fTaoTVYFpk5W1Hfef0DgmAjMPes0MNZ9hclPMHOd3R6z/1niZy
 xhltfPQTbipOo4AOyWvfdtdcgObLiRuElMk7blxcxcA8+NrVrohUYIrXM1xWntr04dh1
 fdyvcy8a9IUZO0qDkJUM7+nBLab/Ub+ZVWPgR39zFgOFrotnlWhaK61bEldeFuweA1TX
 hgpA==
Subject: Re: [Nouveau] [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
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
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6NDIgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA2OjIzOjA0UE0g
LTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPiA+IE9uIDYvMTMvMTkgNTo0MyBQTSwgSXJhIFdl
aW55IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwNzo1ODoyOVBNICswMDAw
LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+PiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAx
Mjo1MzowMlBNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiA+ID4+Pgo+ID4gLi4uCj4g
PiA+PiBIdW0sIHNvIHRoZSBvbmx5IHRoaW5nIHRoaXMgY29uZmlnIGRvZXMgaXMgc2hvcnQgY2ly
Y3VpdCBoZXJlOgo+ID4gPj4KPiA+ID4+IHN0YXRpYyBpbmxpbmUgYm9vbCBpc19kZXZpY2VfcHVi
bGljX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+PiB7Cj4gPiA+PiAgICAgICAg
IHJldHVybiBJU19FTkFCTEVEKENPTkZJR19ERVZfUEFHRU1BUF9PUFMpICYmCj4gPiA+PiAgICAg
ICAgICAgICAgICAgSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1BVQkxJQykgJiYKPiA+ID4+ICAg
ICAgICAgICAgICAgICBpc196b25lX2RldmljZV9wYWdlKHBhZ2UpICYmCj4gPiA+PiAgICAgICAg
ICAgICAgICAgcGFnZS0+cGdtYXAtPnR5cGUgPT0gTUVNT1JZX0RFVklDRV9QVUJMSUM7Cj4gPiA+
PiB9Cj4gPiA+Pgo+ID4gPj4gV2hpY2ggaXMgY2FsbGVkIGFsbCBvdmVyIHRoZSBwbGFjZS4uCj4g
PiA+Cj4gPiA+IDxzaWdoPiAgeWVzIGJ1dCB0aGUgZWFybGllciBwYXRjaDoKPiA+ID4KPiA+ID4g
W1BBVENIIDAzLzIyXSBtbTogcmVtb3ZlIGhtbV9kZXZtZW1fYWRkX3Jlc291cmNlCj4gPiA+Cj4g
PiA+IFJlbW92ZXMgdGhlIG9ubHkgcGxhY2UgdHlwZSBpcyBzZXQgdG8gTUVNT1JZX0RFVklDRV9Q
VUJMSUMuCj4gPiA+Cj4gPiA+IFNvIEkgdGhpbmsgaXQgaXMgb2suICBGcmFua2x5IEkgd2FzIHdv
bmRlcmluZyBpZiB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBwdWJsaWMKPiA+ID4gdHlwZSBhbHRvZ2V0
aGVyIGJ1dCBjb25jZXB0dWFsbHkgaXQgc2VlbXMgb2suICBCdXQgSSBkb24ndCBzZWUgYW55IHVz
ZXJzIG9mIGl0Cj4gPiA+IHNvLi4uICBzaG91bGQgd2UgZ2V0IHJpZCBvZiBpdCBpbiB0aGUgY29k
ZSByYXRoZXIgdGhhbiB0dXJuaW5nIHRoZSBjb25maWcgb2ZmPwo+ID4gPgo+ID4gPiBJcmEKPiA+
Cj4gPiBUaGF0IHNlZW1zIHJlYXNvbmFibGUuIEkgcmVjYWxsIHRoYXQgdGhlIGhvcGUgd2FzIGZv
ciB0aG9zZSBJQk0gUG93ZXIgOQo+ID4gc3lzdGVtcyB0byB1c2UgX1BVQkxJQywgYXMgdGhleSBo
YXZlIGhhcmR3YXJlLWJhc2VkIGNvaGVyZW50IGRldmljZSAoR1BVKQo+ID4gbWVtb3J5LCBhbmQg
c28gdGhlIG1lbW9yeSByZWFsbHkgaXMgdmlzaWJsZSB0byB0aGUgQ1BVLiBBbmQgdGhlIElCTSB0
ZWFtCj4gPiB3YXMgdGhpbmtpbmcgb2YgdGFraW5nIGFkdmFudGFnZSBvZiBpdC4gQnV0IEkgaGF2
ZW4ndCBzZWVuIGFueXRoaW5nIG9uCj4gPiB0aGF0IGZyb250IGZvciBhIHdoaWxlLgo+Cj4gRG9l
cyBhbnlvbmUga25vdyB3aG8gdGhvc2UgcGVvcGxlIGFyZSBhbmQgY2FuIHdlIGVuY291cmFnZSB0
aGVtIHRvCj4gc2VuZCBzb21lIHBhdGNoZXM/IDopCgpJIGV4cGVjdCBtYXJraW5nIGl0IENPTkZJ
R19CUk9LRU4gd2l0aCB0aGUgdGhyZWF0IG9mIGRlbGV0aW5nIGl0IGlmIG5vCnBhdGNoZXMgc2hv
dyB1cCAqaXMqIHRoZSBlbmNvdXJhZ2VtZW50LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
