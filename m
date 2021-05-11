Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66437A27E
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 10:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F7889D44;
	Tue, 11 May 2021 08:50:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6D989D44;
 Tue, 11 May 2021 08:50:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1D90C67373; Tue, 11 May 2021 10:50:12 +0200 (CEST)
Date: Tue, 11 May 2021 10:50:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <20210511085011.GA14477@lst.de>
References: <20210511060514.3956745-1-hch@lst.de>
 <20210511060514.3956745-2-hch@lst.de>
 <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH] drm/ttm: use dma_alloc_pages for the page pool
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 iommu@lists.linux-foundation.org, Maxime Ripard <mripard@kernel.org>,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Christoph Hellwig <hch@lst.de>,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgMDk6MzU6MjBBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBXZSBjZXJ0YWlubHkgZ29pbmcgdG8gbmVlZCB0aGUgZHJtX25lZWRfc3dpb3Rs
YigpIGZvciB1c2VycHRyIHN1cHBvcnQgCj4gKHVubGVzcyB3ZSBhZGQgc29tZSBhcHByb2FjaCBm
b3IgZHJpdmVycyB0byBvcHQgb3V0IG9mIHN3aW90bGIpLgoKc3dpb3RsYiB1c2UgaXMgZHJpdmVu
IGJ5IHRocmVlIHRoaW5nczoKCiAxKSBhZGRyZXNzaW5nIGxpbWl0YXRpb25zIG9mIHRoZSBkZXZp
Y2UKIDIpIGFkZHJlc3NpbmcgbGltaXRhdGlvbnMgb2YgdGhlIGludGVyY29ubmVjdAogMykgdmly
dHVhbGl6dGlvbiBtb2RlcyB0aGF0IHJlcXVpcmUgaXQKCm5vdCBzdXJlIGhvdyB0aGUgZHJpdmVy
IGNvdWxkIG9wdCBvdXQuICBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggdXNlcnB0cgpzdXBwb3J0
PwoKPiBUaGVuIHdoaWxlIEkgcmVhbGx5IHdhbnQgdG8gZ2V0IHJpZCBvZiBHRlBfRE1BMzIgYXMg
d2VsbCBJJ20gbm90IDEwMCUgc3VyZSAKPiBpZiB3ZSBjYW4gaGFuZGxlIHRoaXMgd2l0aG91dCB0
aGUgZmxhZy4KCk5vdGUgdGhhdCB0aGlzIGlzIHN0aWxsIHVzaW5nIEdGUF9ETUEzMiB1bmRlcm5l
YXRoIHdoZXJlIHJlcXVpcmVkLApqdXN0IGluIGEgbGF5ZXIgdGhhdCBjYW4gZGVjaWRlIHRoYXQg
0ZVlbnNpYmx5LgoKPiBBbmQgbGFzdCB3ZSBuZWVkIHNvbWV0aGluZyBiZXR0ZXIgdG8gc3RvcmUg
dGhlIERNQSBhZGRyZXNzIGFuZCBvcmRlciB0aGFuIAo+IGFsbG9jYXRpbmcgYSBzZXBhcmF0ZSBt
ZW1vcnkgb2JqZWN0IGZvciBlYWNoIHBhZ2UuCgpZZWFoLiAgSWYgeW91IHVzZSBfX0dGUF9DT01Q
IGZvciB0aGUgYWxsb2NhdGlvbnMgd2UgY2FuIGZpbmQgdGhlIG9yZGVyCmZyb20gdGhlIHBhZ2Ug
aXRzZWxmLCB3aGljaCBtaWdodCBiZSB1c2VmdWwuICBGb3IgNjQtYml0IHBsYXRmb3Jtcwp0aGUg
ZG1hIGFkZHJlc3MgY291bGQgYmUgc3RvcmUgaW4gcGFnZS0+cHJpdmF0ZSwgb3IgZGVwZW5kaW5n
IG9uIGhvdwp0aGUgcGFnZSBnZXRzIHVzZWQgdGhlIGRtYV9hZGRyIGZpZWxkIGluIHN0cnVjdCBw
YWdlIHRoYXQgb3ZlcmxvYWRzCnRoZSBscnUgZmllbGQgYW5kIGlzIHVzZWQgYnkgdGhlIG5ldHdv
cmtpbmcgcGFnZSBwb29sIGNvdWxkIGJlIHVzZWQuCgpNYXliZSB3ZSBjb3VsZCBldmVuIGhhdmUg
YSBjb21tb24gcGFnZSBwb29sIGJldHdlZW4gbmV0IGFuZCBkcm0sIGJ1dApJIGRvbid0IHdhbnQg
dG8gZ28gdGhlcmUgbXlzZWxmLCBub3QgYmVpbmcgYW4gZXhwZXJ0IG9uIGVpdGhlciBzdWJzeXN0
ZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
