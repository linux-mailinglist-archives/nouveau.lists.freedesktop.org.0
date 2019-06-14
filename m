Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7314549F
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE32892FF;
	Fri, 14 Jun 2019 06:21:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095E1892FF;
 Fri, 14 Jun 2019 06:21:39 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 105CE68B02; Fri, 14 Jun 2019 08:21:11 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:21:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614062110.GF7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-5-hch@lst.de> <20190613190501.GQ22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613190501.GQ22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 04/22] mm: don't clear ->mapping in
 hmm_devmem_free
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6MDU6MDdQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEh1cm0sIGlzIGhtbSBmb2xsb3dpbmcgdGhpcyBjb21tZW50IGZyb20gbW1fdHlw
ZXMuaD8KPiAKPiAgKiBJZiB5b3UgYWxsb2NhdGUgdGhlIHBhZ2UgdXNpbmcgYWxsb2NfcGFnZXMo
KSwgeW91IGNhbiB1c2Ugc29tZSBvZiB0aGUKPiAgKiBzcGFjZSBpbiBzdHJ1Y3QgcGFnZSBmb3Ig
eW91ciBvd24gcHVycG9zZXMuICBUaGUgZml2ZSB3b3JkcyBpbiB0aGUgbWFpbgo+ICAqIHVuaW9u
IGFyZSBhdmFpbGFibGUsIGV4Y2VwdCBmb3IgYml0IDAgb2YgdGhlIGZpcnN0IHdvcmQgd2hpY2gg
bXVzdCBiZQo+ICAqIGtlcHQgY2xlYXIuICBNYW55IHVzZXJzIHVzZSB0aGlzIHdvcmQgdG8gc3Rv
cmUgYSBwb2ludGVyIHRvIGFuIG9iamVjdAo+ICAqIHdoaWNoIGlzIGd1YXJhbnRlZWQgdG8gYmUg
YWxpZ25lZC4gIElmIHlvdSB1c2UgdGhlIHNhbWUgc3RvcmFnZSBhcwo+ICAqIHBhZ2UtPm1hcHBp
bmcsIHlvdSBtdXN0IHJlc3RvcmUgaXQgdG8gTlVMTCBiZWZvcmUgZnJlZWluZyB0aGUgcGFnZS4K
PiAKPiBNYXliZSB0aGUgYXNzdW1wdGlvbiB3YXMgdGhhdCBhIGRyaXZlciBpcyB1c2luZyAtPm1h
cHBpbmcgPwoKTWF5YmUuICBUaGUgdW5pb24gbGF5b3UgaW4gc3RydWN0IHBhZ2UgY2VydGFpbmx5
IGRvZXNuJ3QgaGVscC4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
