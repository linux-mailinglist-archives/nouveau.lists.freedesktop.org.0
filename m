Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B887D685
	for <lists+nouveau@lfdr.de>; Thu,  1 Aug 2019 09:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F426E3BB;
	Thu,  1 Aug 2019 07:42:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5AB6E3BB;
 Thu,  1 Aug 2019 07:42:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D5C1E227A81; Thu,  1 Aug 2019 09:42:20 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:42:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190801074220.GB16178@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-2-hch@lst.de>
 <33b82c28-74be-8767-08fa-e41516d11c7e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33b82c28-74be-8767-08fa-e41516d11c7e@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 1/9] mm: turn migrate_vma upside down
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDY6NDY6MjVQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4+ICAgCWZvciAoaSA9IDA7IGkgPCBucGFnZXM7IGkgKz0gYykgewo+PiAtCQl1bnNp
Z25lZCBsb25nIG5leHQ7Cj4+IC0KPj4gICAJCWMgPSBtaW4oU0dfTUFYX1NJTkdMRV9BTExPQywg
bnBhZ2VzKTsKPj4gLQkJbmV4dCA9IHN0YXJ0ICsgKGMgPDwgUEFHRV9TSElGVCk7Cj4+IC0JCXJl
dCA9IG1pZ3JhdGVfdm1hKCZub3V2ZWF1X2RtZW1fbWlncmF0ZV9vcHMsIHZtYSwgc3RhcnQsCj4+
IC0JCQkJICBuZXh0LCBzcmNfcGZucywgZHN0X3BmbnMsICZtaWdyYXRlKTsKPj4gKwkJYXJncy5l
bmQgPSBzdGFydCArIChjIDw8IFBBR0VfU0hJRlQpOwo+Cj4gU2luY2UgbWlncmF0ZV92bWFfc2V0
dXAoKSBpcyBjYWxsZWQgaW4gYSBsb29wLCBlaXRoZXIgYXJncy5jcGFnZXMgYW5kCj4gYXJncy5u
cGFnZXMgbmVlZCB0byBiZSBjbGVhcmVkIGhlcmUgb3IgY2xlYXJlZCBpbiBtaWdyYXRlX3ZtYV9z
ZXR1cCgpLgoKSSB0aGluayBjbGVhcmluZyBldmVyeXRoaW5nIHRoYXQgaXMgbm90IHVzZWQgZm9y
IGFyZ3VtZW50IHBhc3NpbmcgaW4KbWlncmF0ZV92bWFfc2V0dXAgaXMgYSBnb29kIGlkZWEuICBJ
J2xsIGRvIHRoYXQuCgpCdHcsIGl0IHNlZW1zIGxpa2UgdGhpcyB3YXMgYSBmdWxscXVvdGUganVz
dCBmb3IgdGhlIGxpdHRsZSBjb21tZW50CmFzIGZhciBhcyBJIGNvdWxkIHRlbGwgZnJvbSB3YWRp
bmcgdGhyb3VnaCBpdC4gIEl0IHdvdWxkIGJlIHZlcnkKYXBwcmVjaWF0ZWQgdG8gcHJvcGVybHkg
cXVvdGUgdGhlIHJlcGxpZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
