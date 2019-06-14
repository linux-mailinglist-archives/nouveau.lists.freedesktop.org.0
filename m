Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975945500
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1189321;
	Fri, 14 Jun 2019 06:49:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C589321;
 Fri, 14 Jun 2019 06:49:12 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id AC5EF68B05; Fri, 14 Jun 2019 08:48:23 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:48:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20190614064823.GO7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-23-hch@lst.de>
 <7f6c6837-93cd-3b89-63fb-7a60d906c70c@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7f6c6837-93cd-3b89-63fb-7a60d906c70c@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER
 from HMM_MIRROR
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDY6NTM6MTVQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEZvciB0aG9zZSB3aG8gaGF2ZSBvdXQgb2YgdHJlZSBkcml2ZXJzIHRoYXQgbmVlZCBt
aWdyYXRlX3ZtYSgpLCBidXQgYXJlIG5vdAo+IE5vdXZlYXUsIGNvdWxkIHdlIHByZXR0eSBwbGVh
c2UgYWxsb3cgYSB3YXkgdG8gc2VsZWN0IHRoYXQgaW5kZXBlbmRlbnRseT8KCk5vLiAgVGhlIHdo
b2xlIHBvaW50IGlzIHRvIG5vdCBidWlsZCB0aGlzIGZhaXJseSBiaWcgY2h1bmsgb2YgY29kZSBp
bgp1bmxlc3Mgd2UgaGF2ZSBhIHVzZXIgaW4gdGhlIHRyZWUuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
