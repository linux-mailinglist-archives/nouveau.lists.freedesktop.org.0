Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DB8F9ED
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 06:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40E06EABD;
	Fri, 16 Aug 2019 04:41:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891A6EABD;
 Fri, 16 Aug 2019 04:41:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CA0E568AFE; Fri, 16 Aug 2019 06:41:37 +0200 (CEST)
Date: Fri, 16 Aug 2019 06:41:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jerome Glisse <jglisse@redhat.com>
Message-ID: <20190816044137.GA4093@lst.de>
References: <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815203306.GB25517@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 04/15] mm: remove the pgmap field from struct
 hmm_vma_walk
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6MzM6MDZQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBTbyBub3IgSE1NIG5vciBkcml2ZXIgc2hvdWxkIGRlcmVmZXJlbmNlIHRoZSBzdHJ1
Y3QgcGFnZSAoaSBkbyBub3QKPiB0aGluayBhbnkgaW9tbXUgZHJpdmVyIHdvdWxkIGVpdGhlciks
CgpCb3RoIGN1cnJlbnQgaG1tIGRyaXZlcnMgY29udmVydCB0aGUgaG1tIHBmbiBiYWNrIHRvIGEg
cGFnZSBhbmQKZXZlbnR1YWxseSBjYWxsIGRtYV9tYXBfcGFnZSBvbiBpdC4gIEFzIGRvIHRoZSBP
RFAgcGF0Y2hlcyBmcm9tIHlvdS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
