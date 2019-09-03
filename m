Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E4A755D
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2019 22:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083BA89356;
	Tue,  3 Sep 2019 20:48:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7B89BD2;
 Tue,  3 Sep 2019 20:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8459618C4269;
 Tue,  3 Sep 2019 20:48:29 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C601001B08;
 Tue,  3 Sep 2019 20:48:26 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Date: Tue,  3 Sep 2019 16:45:52 -0400
Message-Id: <20190903204645.25487-15-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 03 Sep 2019 20:48:29 +0000 (UTC)
Subject: [Nouveau] [PATCH v2 14/27] drm/dp_mst: Destroy topology_mgr mutexes
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Juston Li <juston.li@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VHVybnMgb3V0IHdlJ3ZlIGJlZW4gZm9yZ2V0dGluZyBmb3IgYSB3aGlsZSBub3cgdG8gYWN0dWFs
bHkgZGVzdHJveSBhbnkKb2YgdGhlIG11dGV4ZXMgdGhhdCB3ZSBjcmVhdGUgaW4gZHJtX2RwX21z
dF90b3BvbG9neV9tZ3IuIFNvLCBsZXQncyBkbwp0aGF0LgoKQ2M6IEp1c3RvbiBMaSA8anVzdG9u
LmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJyeSBX
ZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwppbmRleCA3NDE2MWY0NDI1ODQuLjJmODhjYzE3MzUwMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC00MzM5LDYgKzQzMzksMTEgQEAgdm9pZCBkcm1fZHBf
bXN0X3RvcG9sb2d5X21ncl9kZXN0cm95KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyKQogCW1nci0+YXV4ID0gTlVMTDsKIAlkcm1fYXRvbWljX3ByaXZhdGVfb2JqX2ZpbmkoJm1n
ci0+YmFzZSk7CiAJbWdyLT5mdW5jcyA9IE5VTEw7CisKKwltdXRleF9kZXN0cm95KCZtZ3ItPmRl
bGF5ZWRfZGVzdHJveV9sb2NrKTsKKwltdXRleF9kZXN0cm95KCZtZ3ItPnBheWxvYWRfbG9jayk7
CisJbXV0ZXhfZGVzdHJveSgmbWdyLT5xbG9jayk7CisJbXV0ZXhfZGVzdHJveSgmbWdyLT5sb2Nr
KTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfZGVzdHJveSk7CiAK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
