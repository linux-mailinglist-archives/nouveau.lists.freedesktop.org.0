Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F5454D4
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275428930B;
	Fri, 14 Jun 2019 06:36:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095788930B;
 Fri, 14 Jun 2019 06:36:18 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 50C3C68B02; Fri, 14 Jun 2019 08:35:49 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:35:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20190614063549.GK7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-14-hch@lst.de>
 <20190614002217.GB783@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614002217.GB783@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 13/22] device-dax: use the dev_pagemap
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDU6MjI6MTdQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+ID4gLQlkZXZfZGF4LT5wZ21hcC5yZWYgPSAmZGV2X2RheC0+cmVmOwo+IAo+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBleGFjdGx5IGNvcnJlY3QuICBwZ21hcC5yZWYgaXMgYSBwb2ludGVyIHRvIHRo
ZSBkZXZfZGF4IHJlZgo+IHN0cnVjdHVyZS4gIFRha2luZyBpdCBhd2F5IHdpbGwgY2F1c2UgZGV2
bV9tZW1yZW1hcF9wYWdlcygpIHRvIGZhaWwgQUZBSUNTLgo+IAo+IEkgdGhpbmsgeW91IG5lZWQg
dG8gY2hhbmdlIHN0cnVjdCBkZXZfcGFnZW1hcCBhcyB3ZWxsOgoKVGFrZSBhIGxvb2sgYXQgdGhl
IHByZXZpb3VzIHBhdGNoLCB3aGljaCBhZGRzIGFuIGludGVybmFsX3JlZiBmaWVsZAp0byBkZXZf
cGFnZW1hcCB0aGF0IC0+cmVmIGlzIHNldCB1cCB0byBwb2ludCB0byBpZiBub3Qgb3RoZXJ3aXNl
CmluaXRpYWxpemVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
