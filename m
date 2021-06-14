Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C83A6C04
	for <lists+nouveau@lfdr.de>; Mon, 14 Jun 2021 18:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F8B6E039;
	Mon, 14 Jun 2021 16:40:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id E1D5F89FCA;
 Mon, 14 Jun 2021 16:40:17 +0000 (UTC)
Received: from [192.168.0.2] (unknown [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 332C97A03FD;
 Mon, 14 Jun 2021 18:40:15 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: "Christian =?utf-8?q?K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
Date: Mon, 14 Jun 2021 18:40:12 +0200
User-Agent: KMail/1.9.10
References: <20210614110517.1624-1-christian.koenig@amd.com>
In-Reply-To: <20210614110517.1624-1-christian.koenig@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202106141840.12702.linux@zary.sk>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix dma_address check for
 CPU/GPU sync
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
Cc: nouveau@lists.freedesktop.org, bskeggs@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uZGF5IDE0IEp1bmUgMjAyMSAxMzowNToxNyBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
IEFHUCBmb3IgZXhhbXBsZSBkb2Vzbid0IGhhdmUgYSBkbWFfYWRkcmVzcyBhcnJheS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CgpGaXhlcyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gbm91dmVhdV9ib19zeW5jX2Zvcl9k
ZXZpY2Ugb24gQUdQIGNhcmRzLgoKVGVzdGVkLWJ5OiBPbmRyZWogWmFyeSA8bGludXhAemFyeS5z
az4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAzZTA5ZGYwNDcyY2UuLjE3
MGFiYTk5YTExMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBAQCAt
NTQ2LDcgKzU0Niw3IEBAIG5vdXZlYXVfYm9fc3luY19mb3JfZGV2aWNlKHN0cnVjdCBub3V2ZWF1
X2JvICpudmJvKQo+ICAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9IChzdHJ1Y3QgdHRtX3R0ICop
bnZiby0+Ym8udHRtOwo+ICAJaW50IGksIGo7Cj4gIAo+IC0JaWYgKCF0dG1fZG1hKQo+ICsJaWYg
KCF0dG1fZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVzcykKPiAgCQlyZXR1cm47Cj4gIAlpZiAo
IXR0bV9kbWEtPnBhZ2VzKSB7Cj4gIAkJTlZfREVCVUcoZHJtLCAidHRtX2RtYSAweCVwOiBwYWdl
cyBOVUxMXG4iLCB0dG1fZG1hKTsKPiBAQCAtNTgyLDcgKzU4Miw3IEBAIG5vdXZlYXVfYm9fc3lu
Y19mb3JfY3B1KHN0cnVjdCBub3V2ZWF1X2JvICpudmJvKQo+ICAJc3RydWN0IHR0bV90dCAqdHRt
X2RtYSA9IChzdHJ1Y3QgdHRtX3R0ICopbnZiby0+Ym8udHRtOwo+ICAJaW50IGksIGo7Cj4gIAo+
IC0JaWYgKCF0dG1fZG1hKQo+ICsJaWYgKCF0dG1fZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVz
cykKPiAgCQlyZXR1cm47Cj4gIAlpZiAoIXR0bV9kbWEtPnBhZ2VzKSB7Cj4gIAkJTlZfREVCVUco
ZHJtLCAidHRtX2RtYSAweCVwOiBwYWdlcyBOVUxMXG4iLCB0dG1fZG1hKTsKCgotLSAKT25kcmVq
IFphcnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
