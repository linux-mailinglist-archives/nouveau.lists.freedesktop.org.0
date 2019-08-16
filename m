Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85EE8FBC5
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 09:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A196EAEF;
	Fri, 16 Aug 2019 07:11:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2556EAEF;
 Fri, 16 Aug 2019 07:11:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1811768B02; Fri, 16 Aug 2019 09:11:33 +0200 (CEST)
Date: Fri, 16 Aug 2019 09:11:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <20190816071132.GA7513@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
 <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: map pages after migration
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTI6NDI6MzBQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4KPiBPbiA4LzEwLzE5IDQ6MTMgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+
PiBPbiBzb21ldGhpbmcgdmFndWVseSByZWxhdGVkIHRvIHRoaXMgcGF0Y2g6Cj4+Cj4+IFlvdSB1
c2UgdGhlIE5WSUZfVk1NX1BGTk1BUF9WMF9WKiBkZWZpbmVzIGZyb20gbnZpZi9pZjAwMGMuaCwg
d2hpY2ggYXJlCj4+IGEgbGl0dGxlIG9kZCBhcyB3ZSBvbmx5IGV2ZXIgc2V0IHRoZXNlIGJpdHMs
IGJ1dCB0aGV5IGFsc28gZG9uJ3Qgc2VlbQo+PiB0byBhcHBlYXIgdG8gYmUgaW4gdmFsdWVzIHRo
YXQgYXJlIGRpcmVjdGx5IGZlZCB0byB0aGUgaGFyZHdhcmUuCj4+Cj4+IE9uIHRoZSBvdGhlciBo
YW5kIG1tdS92bW0uaCBkZWZpbmVzIGEgc2V0IG9mIE5WSUZfVk1NX1BGTk1BUF9WMF8qCj4KPiBZ
ZXMsIEkgc2VlIE5WS01fVk1NX1BGTl8qCj4KPj4gY29uc3RhbnRzIHdpdGggc2ltaWxhciBuYW1l
cyBhbmQgaWRlbnRpY2FsIHZhbHVlcywgYW5kIHRob3NlIGFyZSB1c2VkCj4+IGluIG1tdS92bW1n
cDEwMC5jIGFuZCB3aGF0IGFwcGVhcnMgdG8gZmluYWxseSBkbyB0aGUgbG93LWxldmVsIGRtYQo+
PiBtYXBwaW5nIGFuZCB0YWxraW5nIHRvIHRoZSBoYXJkd2FyZS4gIEFyZSB0aGVzZSB0d28gc2V0
cyBvZiBjb25zdGFudHMKPj4gc3VwcG9zZWQgdG8gYmUgdGhlIHNhbWU/ICBBcmUgdGhlIGFjdHVh
bCBoYXJkd2FyZSB2YWx1ZXMgb3IganVzdCBhCj4+IGRyaXZlciBpbnRlcm5hbCBpbnRlcmZhY2U/
Cj4KPiBJdCBsb29rcyBhIGJpdCBvZGQgdG8gbWUgdG9vLgo+IEkgZG9uJ3QgcmVhbGx5IGtub3cg
dGhlIHN0cnVjdHVyZS9oaXN0b3J5IG9mIG5vdXZlYXUuCj4gUGVyaGFwcyBCZW4gU2tlZ2dzIGNh
biBzaGVkIG1vcmUgbGlnaHQgb24geW91ciBxdWVzdGlvbi4KCkJlbiwgZG8geW91IGhhdmUgYW55
IGluc2lnaHRzIG9uIHRoZXNlIGNvbnN0YW50cz8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
