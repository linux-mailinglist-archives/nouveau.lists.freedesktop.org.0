Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E575815
	for <lists+nouveau@lfdr.de>; Thu, 25 Jul 2019 21:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BB16E832;
	Thu, 25 Jul 2019 19:40:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90BD6E81B;
 Thu, 25 Jul 2019 19:40:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2257D85550;
 Thu, 25 Jul 2019 19:40:13 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 076836012D;
 Thu, 25 Jul 2019 19:40:09 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 Jul 2019 15:39:59 -0400
Message-Id: <20190725194005.16572-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 25 Jul 2019 19:40:13 +0000 (UTC)
Subject: [Nouveau] [PATCH 0/2] drm/nouveau: i2c over DP AUX fixes
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
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBpcyBhbm90aGVyIGF0dGVtcHQgYXQgZml4aW5nIGFuIGlzc3VlIHdpdGgKCnllcyB8IHNl
bnNvcnMtZGV0ZWN0CgpDYXVzaW5nIHNvbWUgbWFjaGluZXMgd2l0aCBub3V2ZWF1IGxvYWRlZCB0
byBoYW5nIGlmIGNlcnRhaW4ga2luZHMgb2YKZGlzcGxheXMgYXJlIGF0dGFjaGVkLiBJJ3ZlIGFs
c28gaW5jbHVkZWQgb25lIG1pbm9yIGZpeCB0aGF0IEkgZm91bmQKYWxvbmcgdGhlIHdheSBvZiB0
cm91Ymxlc2hvb3RpbmcgdGhpcyBpc3N1ZS4KCkx5dWRlIFBhdWwgKDIpOgogIGRybS9ub3V2ZWF1
OiBGaXggbWlzc2luZyBlbHNlcyBpbiBnOTRfaTJjX2F1eF94ZmVyCiAgZHJtL25vdXZlYXU6IERv
bid0IHJldHJ5IGluZmluaXRlbHkgd2hlbiByZWNlaXZpbmcgbm8gZGF0YSBvbiBpMmMgb3Zlcgog
ICAgQVVYCgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvaTJjL2F1eC5jIHwg
MjQgKysrKysrKysrKysrKy0tLS0tLQogLi4uL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9p
MmMvYXV4Zzk0LmMgIHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
