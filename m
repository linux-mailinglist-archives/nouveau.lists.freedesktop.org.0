Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B74DA24
	for <lists+nouveau@lfdr.de>; Thu, 20 Jun 2019 21:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA146E4B3;
	Thu, 20 Jun 2019 19:26:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC66E4B0;
 Thu, 20 Jun 2019 19:26:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E42C3AC9A;
 Thu, 20 Jun 2019 19:26:50 +0000 (UTC)
Date: Thu, 20 Jun 2019 21:26:48 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190620192648.GI12083@dhcp22.suse.cz>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613094326.24093-19-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1IDEzLTA2LTE5IDExOjQzOjIxLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUg
Y29kZSBoYXNuJ3QgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBhZGRlZCB0byB0aGUgdHJlZSwgYW5k
IGRvZXNuJ3QKPiBhcHBlYXIgdG8gYWN0dWFsbHkgYmUgdXNhYmxlLiAgTWFyayBpdCBhcyBCUk9L
RU4gdW50aWwgZWl0aGVyIGEgdXNlcgo+IGNvbWVzIGFsb25nIG9yIHdlIGZpbmFsbHkgZ2l2ZSB1
cCBvbiBpdC4KCkkgd291bGQgZ28gZXZlbiBmdXJ0aGVyIGFuZCBzaW1wbHkgcmVtb3ZlIGFsbCB0
aGUgREVWSUNFX1BVQkxJQyBjb2RlLgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KCkFueXdheQpBY2tlZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3Vz
ZS5jb20+Cgo+IC0tLQo+ICBtbS9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwo+IGlu
ZGV4IDBkMmJhN2UxZjQzZS4uNDA2ZmE0NWU5ZWNjIDEwMDY0NAo+IC0tLSBhL21tL0tjb25maWcK
PiArKysgYi9tbS9LY29uZmlnCj4gQEAgLTcyMSw2ICs3MjEsNyBAQCBjb25maWcgREVWSUNFX1BS
SVZBVEUKPiAgY29uZmlnIERFVklDRV9QVUJMSUMKPiAgCWJvb2wgIkFkZHJlc3NhYmxlIGRldmlj
ZSBtZW1vcnkgKGxpa2UgR1BVIG1lbW9yeSkiCj4gIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQo+
ICsJZGVwZW5kcyBvbiBCUk9LRU4KPiAgCXNlbGVjdCBITU0KPiAgCXNlbGVjdCBERVZfUEFHRU1B
UF9PUFMKPiAgCj4gLS0gCj4gMi4yMC4xCgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
