Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1837363F
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 20:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47806E614;
	Wed, 24 Jul 2019 18:00:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB736E612;
 Wed, 24 Jul 2019 18:00:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 167CFADA2;
 Wed, 24 Jul 2019 18:00:23 +0000 (UTC)
Date: Wed, 24 Jul 2019 20:00:22 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190724180022.GD6410@dhcp22.suse.cz>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724153305.GA10681@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724153305.GA10681@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkIDI0LTA3LTE5IDE3OjMzOjA1LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBX
ZWQsIEp1bCAyNCwgMjAxOSBhdCAxMjoyODo1OFBNIC0wMzAwLCBKYXNvbiBHdW50aG9ycGUgd3Jv
dGU6Cj4gPiBIdW1tLiBBY3R1YWxseSBoYXZpbmcgbG9va2VkIHRoaXMgc29tZSBtb3JlLCBJIHdv
bmRlciBpZiB0aGlzIGlzIGEKPiA+IHByb2JsZW06Cj4gCj4gV2hhdCBhIG1lc3MuCj4gCj4gUXVl
c3Rpb246IGRvIHdlIGV2ZW4gY2FyZSBmb3IgdGhlIG5vbi1ibG9ja2luZyBldmVudHM/ICBUaGUg
b25seSBwbGFjZQo+IHdoZXJlIG1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X25v
bmJsb2NrIGlzIGNhbGxlZCBpcyB0aGUgb29tCj4ga2lsbGVyLCB3aGljaCBtZWFucyB0aGUgcHJv
Y2VzcyBpcyBhYm91dCB0byBkaWUgYW5kIHRoZSBwYWdldGFibGUgd2lsbAo+IGdldCB0b3JuIGRv
d24gQVNBUC4gIFNob3VsZCB3ZSBqdXN0IHNraXAgdGhlbSB1bmNvbmRpdGlvbmFsbHk/CgpIb3cg
ZG8geW91IHRlbGwgd2hldGhlciB0aGV5IGFyZSBnb2luZyB0byBibG9jayBvciBub3Qgd2l0aG91
dCB0cnlpbmc/Ci0tIApNaWNoYWwgSG9ja28KU1VTRSBMYWJzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
