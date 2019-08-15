Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8398ECD2
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 15:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147B86E9A5;
	Thu, 15 Aug 2019 13:28:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643216E9A5;
 Thu, 15 Aug 2019 13:28:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D963768B05; Thu, 15 Aug 2019 15:28:45 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:28:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190815132845.GC12036@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
 <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] turn hmm migrate_vma upside down v3
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

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDU6MDk6NTRQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gU29tZSBvZiB0aGUgcGF0Y2hlcyBzZWVtIHRvIGhhdmUgYmVlbiBtYW5nbGVkIGlu
IHRoZSBtYWlsLgoKV2VpcmQsIEkgbmV2ZXIgaGFkIHN1Y2ggYSBhbiBpc3N1ZSB3aXRoIGdpdC1z
ZW5kLWVtYWlsLgoKQnV0IHRvIGJlIGNvdmVyZWQgZm9yIHN1Y2ggd2VpcmQgY2FzZXMgSSBhbHNv
IHBvc3RlZCBhIGdpdCB1cmwKZm9yIGV4YWN0bHkgdGhlIHRyZWUgSSd2ZSBiZWVuIHdvcmtpbmcg
b24uCgo+IEkgd2FzIGFibGUgdG8gZWRpdCB0aGVtIGFuZCBhcHBseSB0byBKYXNvbidzIHRyZWUK
PiBodHRwczovL2dpdGh1Yi5jb20vamd1bnRob3JwZS9saW51eC5naXQgbW11X25vdGlmaWVyIGJy
YW5jaC4KPiBTbyBmb3IgdGhlIHNlcmllcyB5b3UgY2FuIGFkZDoKPgo+IFRlc3RlZC1ieTogUmFs
cGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgoKVGhhbmtzIQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
