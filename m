Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8F8FB6D
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 08:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874F6EAE2;
	Fri, 16 Aug 2019 06:51:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609F6EAB8;
 Fri, 16 Aug 2019 06:51:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4F8CD68AFE; Fri, 16 Aug 2019 08:51:41 +0200 (CEST)
Date: Fri, 16 Aug 2019 08:51:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Message-ID: <20190816065141.GA6996@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SmFzb24sCgphcmUgeW91IGdvaW5nIHRvIGxvb2sgaW50byBwaWNraW5nIHRoaXMgdXA/ICBVbmZv
cnR1bmF0ZWx5IHRoZXJlIGlzCmEgaG9sZSBwaWxlIGluIHRoaXMgYXJlYSBzdGlsbCBwZW5kaW5n
LCBpbmNsdWRpbmcgdGhlIGt2bXBwYyBzZWN1cmUKbWVtb3J5IGRyaXZlciBmcm9tIEJoYXJhdGEg
dGhhdCBkZXBlbmRzIG9uIHRoZSB3b3JrLgoKbW0gZm9sa3M6ICBtaWdyYXRlLmMgaXMgbW9zdGx5
IGEgY2xhc3NpYyBNTSBmaWxlIGV4Y2VwdCBmb3IgdGhlIGhtbQphZGRpdGlvbnMuICBEbyB5b3Ug
d2FudCB0byBhbHNvIGxvb2sgb3ZlciB0aGlzIG9yIGp1c3QgbGV0IGl0IHBhc3M/Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
