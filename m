Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F045EB0E
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A506E182;
	Wed,  3 Jul 2019 18:03:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F46B6E182;
 Wed,  3 Jul 2019 18:03:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C41168B05; Wed,  3 Jul 2019 20:03:08 +0200 (CEST)
Date: Wed, 3 Jul 2019 20:03:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190703180308.GA13656@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-23-hch@lst.de> <20190703180125.GA18673@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703180125.GA18673@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
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
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDM6MDE6MjVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IENocmlzdG9waCwgSSBndWVzcyB5b3UgZGlkbid0IG1lYW4gdG8gc2VuZCB0aGlz
IGJyYW5jaCB0byB0aGUgbWFpbGluZwo+IGxpc3Q/Cj4gCj4gSW4gYW55IGV2ZW50IHNvbWUgb2Yg
dGhlc2UsIGxpa2UgdGhpcyBvbmUsIGxvb2sgb2J2aW91cyBhbmQgSSBjb3VsZAo+IHN0aWxsIGdy
YWIgYSBmZXcgZm9yIGhtbS5naXQuCj4gCj4gTGV0IG1lIGtub3cgd2hhdCB5b3UnZCBsaWtlIHBs
ZWFzZQo+IAo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
CgpUaGFua3MuICBJIHdhcyBnb2luZyB0byBzZW5kIHRoaXMgc2VyaWVzIG91dCBhcyBzb29uIGFz
IHlvdSBoYWQKYXBwbGllZCB0aGUgcHJldmlvdXMgb25lLiAgTm93IHRoYXQgaXQgbGVha2VkIEkn
bSBoYXBweSB0byBjb2xsZWN0CnJldmlld3MuICBCdXQgd2hpbGUgSSd2ZSBnb3QgeW91ciBhdHRl
bnRpb246ICB0aGUgcmRtYS5naXQgaG1tCmJyYW5jaCBpcyBzdGlsbCBhdCB0aGUgLXJjNyBtZXJn
ZSBhbmQgZG9lbid0IGhhdmUgbXkgc2VyaWVzLCBpcyB0aGF0CmludGVudGlvbmFsPwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
