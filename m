Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9C8587BA
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 18:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B876E081;
	Thu, 27 Jun 2019 16:54:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (unknown [213.95.11.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A86E21E;
 Thu, 27 Jun 2019 16:54:31 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id D884D68C7B; Thu, 27 Jun 2019 18:54:28 +0200 (CEST)
Date: Thu, 27 Jun 2019 18:54:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190627165428.GC10652@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-4-hch@lst.de> <20190627161813.GB9499@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627161813.GB9499@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 03/25] mm: remove hmm_devmem_add_resource
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
Cc: Michal Hocko <mhocko@suse.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
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

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6MTg6MjJQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDAyOjI3OjAyUE0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2Vk
IHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRlZCB0byB0aGUga2VybmVsCj4gPiBtb3JlIHRoYW4gYSB5
ZWFyIGFuZCBhIGhhbGYgYWdvLCBhbmQgaWYgd2UgZXZlciBncm93IGEgY29uc3VtZXIgb2YgdGhl
Cj4gPiBNRU1PUllfREVWSUNFX1BVQkxJQyBpbmZyYXN0cnVjdHVyZSBpdCBjYW4gZWFzaWx5IHVz
ZSBkZXZtX21lbXJlbWFwX3BhZ2VzCj4gPiBkaXJlY3RseS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiBSZXZpZXdlZC1ieTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiA+IEFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nr
b0BzdXNlLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvaG1tLmggfCAgMyAtLS0KPiA+
ICBtbS9obW0uYyAgICAgICAgICAgIHwgNTAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1MyBkZWxldGlvbnMoLSkKPiAK
PiBUaGlzIHNob3VsZCBiZSBzcXVhc2hlZCB0byB0aGUgbmV3IGVhcmxpZXIgcGF0Y2g/CgpXZSBj
b3VsZCBkbyB0aGF0LiAgRG8geW91IGp1c3Qgd2FudCB0byBkbyB0aGF0IHdoZW4geW91IGFwcGx5
IGl0PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
