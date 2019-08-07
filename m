Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD1385698
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 01:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549BD6E778;
	Wed,  7 Aug 2019 23:47:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829E6E777;
 Wed,  7 Aug 2019 23:47:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F3824E926;
 Wed,  7 Aug 2019 23:47:18 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-121-222.rdu2.redhat.com
 [10.10.121.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94E865D9E1;
 Wed,  7 Aug 2019 23:47:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  7 Aug 2019 19:47:04 -0400
Message-Id: <20190807234709.6076-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 07 Aug 2019 23:47:18 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 0/2] drm/nouveau: CRTC Runtime PM ref tracking
 fixes
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SnVzdCBzb21lIHJ1bnRpbWUgUE0gZml4ZXMgZm9yIHNvbWUgbXVjaCBsZXNzIG5vdGljZWFibGUg
cnVudGltZSBQTSByZWYKdHJhY2tpbmcgaXNzdWVzIHRoYXQgSSBnb3QgcmVtaW5kZWQgb2Ygd2hl
biBmaXhpbmcgc29tZSB1bnJlbGF0ZWQgaXNzdWVzCndpdGggbm91dmVhdS4KCkNoYW5nZXMgc2lu
Y2UgdjE6CiogRG9uJ3QgZml4IENSVEMgUlBNIGNvZGUgaW4gZGlzcG52MDQsIGJlY2F1c2UgaXQn
cyBub3QgYWN0dWFsbHkgZG9pbmcKICBhbnl0aGluZyBpbiB0aGUgZmlyc3QgcGxhY2UuIEp1c3Qg
Z2V0IHJpZCBvZiBpdC4gLSBpbWlya2luCgpMeXVkZSBQYXVsICgyKToKICBkcm0vbm91dmVhdS9k
aXNwbnYwNDogUmVtb3ZlIHJ1bnRpbWUgUE0KICBkcm0vbm91dmVhdS9kaXNwbnY1MDogRml4IHJ1
bnRpbWUgUE0gcmVmIHRyYWNraW5nIGZvciBub24tYmxvY2tpbmcKICAgIG1vZGVzZXRzCgogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvY3J0Yy5jIHwgNTEgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIHwgMzgg
KysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5o
ICAgfCAgMyAtLQogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlv
bnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
