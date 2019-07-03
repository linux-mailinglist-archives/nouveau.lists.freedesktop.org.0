Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A75EB1B
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0586E188;
	Wed,  3 Jul 2019 18:05:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B046E6E188;
 Wed,  3 Jul 2019 18:05:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9950C68B05; Wed,  3 Jul 2019 20:05:25 +0200 (CEST)
Date: Wed, 3 Jul 2019 20:05:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190703180525.GA13703@lst.de>
References: <20190701062020.19239-21-hch@lst.de>
 <20190703180356.GB18673@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703180356.GB18673@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 20/22] mm: move hmm_vma_fault to nouveau
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 AlexDeucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDM6NTZQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgd2FzIHRoaW5raW5nIGFib3V0IGRvaW5nIGV4YWN0bHkgdGhpcyB0b28sIGJ1
dCBhbWRncHUgc3RhcnRlZCB1c2luZwo+IHRoaXMgYWxyZWFkeSBvYnNvbGV0ZSBBUEkgaW4gdGhl
aXIgbGF0ZXN0IGRyaXZlciA6KAo+IAo+IFNvLCB3ZSBub3cgbmVlZCB0byBnZXQgYm90aCBkcml2
ZXJzIHRvIG1vdmUgdG8gdGhlIG1vZGVybiBBUEkuCgpBY3R1YWxseSB0aGUgQU1EIGZvbGtzIGZp
eGVkIHRoaXMgdXAgYWZ0ZXIgd2UgcG9pbnRlZCBpdCBvdXQgdG8gdGhlbSwKc28gZXZlbiBpbiBs
aW51eC1uZXh0IGl0IGp1c3QgaXMgbm91dmVhdSB0aGF0IG5lZWRzIGZpeGluZy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
