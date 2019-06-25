Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3A5244D
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C2B89F01;
	Tue, 25 Jun 2019 07:23:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CDE89F01;
 Tue, 25 Jun 2019 07:23:50 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id EDBB068B02; Tue, 25 Jun 2019 09:23:17 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:23:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190625072317.GC30350@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de> <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 05/22] mm: export alloc_pages_vma
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6MjQ6NDhBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IEkgYXNrZWQgZm9yIHRoaXMgc2ltcGx5IGJlY2F1c2UgaXQgd2FzIG5vdCBleHBvcnRl
ZCBoaXN0b3JpY2FsbHkuIEluCj4gZ2VuZXJhbCBJIHdhbnQgdG8gZXN0YWJsaXNoIGV4cGxpY2l0
IGV4cG9ydC10eXBlIGNyaXRlcmlhIHNvIHRoZQo+IGNvbW11bml0eSBjYW4gc3BlbmQgbGVzcyB0
aW1lIGRlYmF0aW5nIHdoZW4gdG8gdXNlIEVYUE9SVF9TWU1CT0xfR1BMCj4gWzFdLgo+IAo+IFRo
ZSB0aG91Z2h0IGluIHRoaXMgaW5zdGFuY2UgaXMgdGhhdCBpdCBpcyBub3QgaGlzdG9yaWNhbGx5
IGV4cG9ydGVkCj4gdG8gbW9kdWxlcyBhbmQgaXQgaXMgc2FmZXIgZnJvbSBhIG1haW50ZW5hbmNl
IHBlcnNwZWN0aXZlIHRvIHN0YXJ0Cj4gd2l0aCBHUEwtb25seSBmb3IgbmV3IHN5bWJvbHMgaW4g
Y2FzZSB3ZSBkb24ndCB3YW50IHRvIG1haW50YWluIHRoYXQKPiBpbnRlcmZhY2UgbG9uZy10ZXJt
IGZvciBvdXQtb2YtdHJlZSBtb2R1bGVzLgo+IAo+IFllcywgd2UgYWx3YXlzIHJlc2VydmUgdGhl
IHJpZ2h0IHRvIHJlbW92ZSAvIGNoYW5nZSBpbnRlcmZhY2VzCj4gcmVnYXJkbGVzcyBvZiB0aGUg
ZXhwb3J0IHR5cGUsIGJ1dCBoaXN0b3J5IGhhcyBzaG93biB0aGF0IGV4dGVybmFsCj4gcHJlc3N1
cmUgdG8ga2VlcCBhbiBpbnRlcmZhY2Ugc3RhYmxlIChjb250cmFyeSB0bwo+IERvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdGFibGUtYXBpLW5vbnNlbnNlLnJzdCkgdGVuZHMgdG8gYmUgbGVzcyBmb3IK
PiBHUEwtb25seSBleHBvcnRzLgoKRnVsbHkgYWdyZWVkLiAgSW4gdGhlIGVuZCB0aGUgZGVjaXNp
b24gaXMgd2l0aCB0aGUgTU0gbWFpbnRhaW5lcnMsCnRob3VnaCwgYWx0aG91Z2ggSSdkIHByZWZl
ciB0byBrZWVwIGl0IGFzIGluIHRoaXMgc2VyaWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
