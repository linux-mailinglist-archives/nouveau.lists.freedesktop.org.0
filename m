Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF275EFB
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2019 08:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FCD6E85F;
	Fri, 26 Jul 2019 06:24:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9336E85F;
 Fri, 26 Jul 2019 06:24:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 75E5C68BFE; Fri, 26 Jul 2019 08:24:37 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:24:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190726062437.GC22881@lst.de>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
 <20190726005650.2566-7-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726005650.2566-7-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v2 6/7] mm/hmm: remove hugetlbfs check in
 hmm_vma_walk_pmd
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDU6NTY6NDlQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gd2Fsa19wYWdlX3JhbmdlKCkgd2lsbCBvbmx5IGNhbGwgaG1tX3ZtYV93YWxrX2h1
Z2V0bGJfZW50cnkoKSBmb3IKPiBodWdldGxiZnMgcGFnZXMgYW5kIGRvZXNuJ3QgY2FsbCBobW1f
dm1hX3dhbGtfcG1kKCkgaW4gdGhpcyBjYXNlLgo+IFRoZXJlZm9yZSwgaXQgaXMgc2FmZSB0byBy
ZW1vdmUgdGhlIGNoZWNrIGZvciB2bWEtPnZtX2ZsYWdzICYgVk1fSFVHRVRMQgo+IGluIGhtbV92
bWFfd2Fsa19wbWQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBi
ZWxsQG52aWRpYS5jb20+CgpMb29rcyBnb29kLAoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
