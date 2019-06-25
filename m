Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A279A524C3
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE64E6E051;
	Tue, 25 Jun 2019 07:29:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4DF6E051;
 Tue, 25 Jun 2019 07:29:47 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0839568B02; Tue, 25 Jun 2019 09:29:16 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:29:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20190625072915.GD30350@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190620192648.GI12083@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620192648.GI12083@dhcp22.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMDk6MjY6NDhQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFRodSAxMy0wNi0xOSAxMTo0MzoyMSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6
Cj4gPiBUaGUgY29kZSBoYXNuJ3QgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBhZGRlZCB0byB0aGUg
dHJlZSwgYW5kIGRvZXNuJ3QKPiA+IGFwcGVhciB0byBhY3R1YWxseSBiZSB1c2FibGUuICBNYXJr
IGl0IGFzIEJST0tFTiB1bnRpbCBlaXRoZXIgYSB1c2VyCj4gPiBjb21lcyBhbG9uZyBvciB3ZSBm
aW5hbGx5IGdpdmUgdXAgb24gaXQuCj4gCj4gSSB3b3VsZCBnbyBldmVuIGZ1cnRoZXIgYW5kIHNp
bXBseSByZW1vdmUgYWxsIHRoZSBERVZJQ0VfUFVCTElDIGNvZGUuCgpJIGxvb2tlZCBpbnRvIHRo
YXQgYXMgSSBub3cgZ290IHRoZSBmZWVkYmFjayB0d2ljZS4gIEl0IHdvdWxkCmNyZWF0ZSBhIGNv
bmZsaWN0IHdpdGggYW5vdGhlciB0cmVlIGNsZWFuaW5nIHRoaW5ncyB1cCBhcm91bmQgdGhlCmlz
X2RldmljZV9wcml2YXRlIGRlZmludGlvbiwgYnV0IG90aGVyd2lzZSBJJ2QgYmUgZ2xhZCB0byBq
dXN0IHJlbW92ZQppdC4KCkphc29uLCBhcyB0aGlzIGdvZXMgdGhyb3VnaCB5b3VyIHRyZWUsIGRv
IHlvdSBtaW5kIHRoZSBhZGRpdGlvbmFsCmNvbmZsaWN0PwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
