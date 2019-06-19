Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9F4B51B
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2019 11:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC526E33B;
	Wed, 19 Jun 2019 09:41:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34266E33B;
 Wed, 19 Jun 2019 09:41:06 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 5F43068B05; Wed, 19 Jun 2019 11:40:33 +0200 (CEST)
Date: Wed, 19 Jun 2019 11:40:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190619094032.GA8928@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] dev_pagemap related cleanups v2
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
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMTI6NDc6MTBQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gR2l0IHRyZWU6Cj4gPgo+ID4gICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3Vz
ZXJzL2hjaC9taXNjLmdpdCBobW0tZGV2bWVtLWNsZWFudXAuMgo+ID4KPiA+IEdpdHdlYjoKPiA+
Cj4gPiAgICAgaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdC9zaG9y
dGxvZy9yZWZzL2hlYWRzL2htbS1kZXZtZW0tY2xlYW51cC4yCgo+IAo+IEF0dGFjaGVkIGlzIG15
IGluY3JlbWVudGFsIGZpeHVwcyBvbiB0b3Agb2YgdGhpcyBzZXJpZXMsIHdpdGggdGhvc2UKPiBp
bnRlZ3JhdGVkIHlvdSBjYW4gYWRkOgoKSSd2ZSBmb2xkZWQgeW91ciBpbmNyZW1lbnRhbCBiaXRz
IGluIGFuZCBwdXNoZWQgb3V0IGEgbmV3CmhtbS1kZXZtZW0tY2xlYW51cC4zIHRvIHRoZSByZXBv
IGFib3ZlLiAgTGV0IG1lIGtub3cgaWYgSSBkaWRuJ3QgbWVzcwp1cCBhbnl0aGluZyBlbHNlLiAg
SSdsbCB3YWl0IGZvciBhIGZldyBtb3JlIGNvbW1lbnRzIGFuZCBKYXNvbidzCnBsYW5uZWQgcmVi
YXNlIG9mIHRoZSBobW0gYnJhbmNoIGJlZm9yZSByZXBvc3RpbmcuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
