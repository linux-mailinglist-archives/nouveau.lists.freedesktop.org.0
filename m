Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE356951
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFEF6E3D8;
	Wed, 26 Jun 2019 12:36:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F91C6E3D8;
 Wed, 26 Jun 2019 12:36:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A640BAD78;
 Wed, 26 Jun 2019 12:36:24 +0000 (UTC)
Date: Wed, 26 Jun 2019 14:36:23 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190626123623.GU17798@dhcp22.suse.cz>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626122724.13313-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH 06/25] mm: export alloc_pages_vma
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkIDI2LTA2LTE5IDE0OjI3OjA1LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBub3V2
ZWF1IGlzIGN1cnJlbnRseSB1c2luZyB0aGlzIHRocm91Z2ggYW4gb2RkIGhtbSB3cmFwcGVyLCBh
bmQgSSBwbGFuCj4gdG8gc3dpdGNoIGl0IHRvIHRoZSByZWFsIHRoaW5nIGxhdGVyIGluIHRoaXMg
c2VyaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
Pgo+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CgpBY2tl
ZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CgpUaGFua3MhCgo+IC0tLQo+ICBt
bS9tZW1wb2xpY3kuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvbW0vbWVtcG9saWN5LmMgYi9tbS9tZW1wb2xpY3kuYwo+IGluZGV4IDAx
NjAwZDgwYWUwMS4uZjQ4NTY5YWExODYzIDEwMDY0NAo+IC0tLSBhL21tL21lbXBvbGljeS5jCj4g
KysrIGIvbW0vbWVtcG9saWN5LmMKPiBAQCAtMjA5OCw2ICsyMDk4LDcgQEAgYWxsb2NfcGFnZXNf
dm1hKGdmcF90IGdmcCwgaW50IG9yZGVyLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAg
b3V0Ogo+ICAJcmV0dXJuIHBhZ2U7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChhbGxvY19wYWdlc192
bWEpOwo+ICAKPiAgLyoqCj4gICAqIAlhbGxvY19wYWdlc19jdXJyZW50IC0gQWxsb2NhdGUgcGFn
ZXMuCj4gLS0gCj4gMi4yMC4xCgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
