Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2D5D816
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 00:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC599898C6;
	Tue,  2 Jul 2019 22:35:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB55898C6;
 Tue,  2 Jul 2019 22:35:36 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F38A21904;
 Tue,  2 Jul 2019 22:35:36 +0000 (UTC)
Date: Tue, 2 Jul 2019 15:35:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-Id: <20190702153535.228365fea7f0063cceec96cd@linux-foundation.org>
In-Reply-To: <CAPcyv4h90DAVHbZ4bgvJwpfB8wr2K28oEes6HcdQOpf02+NL=g@mail.gmail.com>
References: <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
 <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
 <20190628190207.GA9317@lst.de>
 <CAPcyv4h90DAVHbZ4bgvJwpfB8wr2K28oEes6HcdQOpf02+NL=g@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562106936;
 bh=c/MyoEL1y9iSRH8tUqhzcXV9ntk3My2ap/3Dn7awyKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l01hbVKK1DS91crh+dWLCuA/4HwJhhjblV3ZmG7+ToSZt2H6+9chb5C6lWKcVbpZT
 6yf7b0ESc5qYx1xKDTnqLzeOjjZhZFZwE/7x1lR6/PQ/5qZQPNx1I+vWXKWbwacqes
 0uz8JuzySX1Z2Xp+A47oGKzrXsLwsUNXRd+bPFwo=
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyOCBKdW4gMjAxOSAxMjoxNDo0NCAtMDcwMCBEYW4gV2lsbGlhbXMgPGRhbi5qLndp
bGxpYW1zQGludGVsLmNvbT4gd3JvdGU6Cgo+IEkgYmVsaWV2ZSAtbW0gYXV0byBkcm9wcyBwYXRj
aGVzIHdoZW4gdGhleSBhcHBlYXIgaW4gdGhlIC1uZXh0Cj4gYmFzZWxpbmUuIFNvIGl0IHNob3Vs
ZCAianVzdCB3b3JrIiB0byBwdWxsIGl0IGludG8gdGhlIHNlcmllcyBhbmQgc2VuZAo+IGl0IGFs
b25nIGZvciAtbmV4dCBpbmNsdXNpb24uCgpZdXAuICBBbHRob3VnaCBpdCBpc24ndCB2ZXJ5ICJh
dXRvIiAtIEkgbWFudWFsbHkgY2hlY2sgdGhhdCB0aGUgcGF0Y2gKd2hpY2ggdHVybmVkIHVwIGlu
IC1uZXh0IHdhcyBpZGVudGljYWwgdG8gdGhlIHZlcnNpb24gd2hpY2ggSSBoYWQuICBJZgpub3Qs
IEkgZ28gZmluZCBvdXQgd2h5Li4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
