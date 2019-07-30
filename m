Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC07A92F
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 15:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86EF6E4EC;
	Tue, 30 Jul 2019 13:09:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF726E4EC;
 Tue, 30 Jul 2019 13:09:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B0B98227A8A; Tue, 30 Jul 2019 15:09:44 +0200 (CEST)
Date: Tue, 30 Jul 2019 15:09:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190730130944.GA4566@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
 <20190730123218.GA24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730123218.GA24038@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] turn the hmm migrate_vma upside down
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6MzI6MjRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IERvZXMgdGhpcyBvbmx5IGltcGFjdCBobW0gdXNlcnMsIG9yIGRvZXMgbWlncmF0
ZS5jIGhhdmUgYSBicm9hZGVyCj4gdXNhZ2U/CgptaWdyYXRlLmMgcmVhbGx5IGNvbnRhaW5zIHR3
byB0aGluZ3M6ICB0aGUgdHJhZGl0aW9uYWwgcGFnZSBtaWdyYXRpb24KY29kZSBpbXBsZW1lbnRp
bmcgYW9wcyAtPm1pZ3JhdGUgc2VtYW50aWNzLCBhbmQgbWlncmF0ZV92bWEgYW5kIGl0cwpjYWxs
YmFja3MuICBUaGUgZmlyc3QgcGFydCBpcyBicm9hZGVyLCB0aGUgc2Vjb25kIHBhcnQgaXMgaG1t
IHNwZWNpZmljCihhbmQgc2hvdWxkIHByb2JhYmx5IGhhdmUgYmVlbiBpbiBhIGZpbGUgb2YgaXRz
IG93biwgZ2l2ZW4gdGhhdCBpdCBpcwpndWFyZGVkIG9mZiBDT05GSUdfTUlHUkFURV9WTUFfSEVM
UEVSKS4gIFRoaXMgc2VyaWVzIG9ubHkgdG91Y2hlZCB0aGUKbGF0dGVyIHBhcnQuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
