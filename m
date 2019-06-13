Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0B44E70
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 23:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48596891D6;
	Thu, 13 Jun 2019 21:27:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2019 21:27:24 UTC
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2663D891D6
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 21:27:24 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id A375468B02; Thu, 13 Jun 2019 23:21:01 +0200 (CEST)
Date: Thu, 13 Jun 2019 23:21:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190613212101.GA27174@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190613204043.GD22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613204043.GD22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] dev_pagemap related cleanups
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6NDA6NDZQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gUGVyaGFwcyB3ZSBzaG91bGQgcHVsbCB0aG9zZSBvdXQgYW5kIHJlc2VuZCB0
aGVtIHRocm91Z2ggaG1tLmdpdD8KPiAKPiBJdCBjb3VsZCBiZSBkb25lIC0gYnV0IGhvdyBiYWQg
aXMgdGhlIGNvbmZsaWN0IHJlc29sdXRpb24/CgpUcml2aWFsLiAgQWxsIGJ1dCBvbmUgcGF0Y2gg
anVzdCBhcHBseSB1c2luZyBnaXQtYW0sIGFuZCB0aGUgb3RoZXIgb25lCmp1c3QgaGFzIGEgZmV3
IGxpbmVzIG9mIG9mZnNldHMuCgpJJ3ZlIGFsc28gZG9uZSBhIHByZWxpbWluYXJ5IHJlYmFzZSBv
ZiBteSBzZXJpZXMgb24gdG9wIG9mIHRob3NlCnBhdGNoZXMsIGFuZCBpdCByZWFsbHkgbmljZWx5
IGhlbHBzIG1ha2luZyB0aGUgZHJpdmVycyBldmVuIHNpbXBsZXIKYW5kIGFsbG93cyB1c2luZyB0
aGUgaW50ZXJuYWwgcmVmY291bnQgaW4gcDJwZG1hLmMgYXMgd2VsbC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
