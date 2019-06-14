Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39C0454A8
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE089307;
	Fri, 14 Jun 2019 06:25:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758DC89307;
 Fri, 14 Jun 2019 06:25:23 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 844DF68B02; Fri, 14 Jun 2019 08:24:55 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:24:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614062455.GH7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-7-hch@lst.de> <20190613191626.GR22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613191626.GR22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 06/22] mm: factor out a
 devm_request_free_mem_region helper
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6MTY6MzVQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgd29uZGVyIGlmIElPUkVTX0RFU0NfREVWSUNFX1BSSVZBVEVfTUVNT1JZIHNo
b3VsZCBiZSBhIGZ1bmN0aW9uCj4gYXJndW1lbnQ/CgpOby4gIFRoZSBvbmx5IHJlYXNvbiB0byB1
c2UgdGhpcyBmdW5jdGlvbiBpcyB0byBhbGxvY2F0ZSB0aGUgZmFrZQpwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlIGZvciB0aGUgZGV2aWNlIHByaXZhdGUgbWVtb3J5IGNhc2UuICBJZiB5b3UnZApkZWFs
IHdpdGggcmVhbCByZXNvdXJjZXMgeW91J2QgdXNlIHRoZSBub3JtYWwgcmVzb3VyY2UgYWxsb2Nh
dG9yLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
