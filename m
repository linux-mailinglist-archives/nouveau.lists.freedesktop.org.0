Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA42536C3
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 20:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC616E85C;
	Wed, 26 Aug 2020 18:25:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8AF6E85B
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 18:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wo54Fztl+nW8iXS4XGGsRse4eb/aZW2O/0PU/MC/eQ=;
 b=BdYgeJ1CPurQD1yY5KV3P6jjTWKLjIgoKXGim7Nip9rxMS+kJwYyGtkkPD+MPMIimI9pAV
 6ePyNynWE79NIEPBXqXZfU7uk7ILaMmoQNFFL7hZ212ljVENK9mXX8zHr5gDNon3HYaQOZ
 nV1t5X91xvW7FVkDHaHWxJWtqpR2GgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-AiJmwQihO8yU5cCvcUX-wA-1; Wed, 26 Aug 2020 14:25:17 -0400
X-MC-Unique: AiJmwQihO8yU5cCvcUX-wA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98B261015DBE;
 Wed, 26 Aug 2020 18:25:15 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C225F1002382;
 Wed, 26 Aug 2020 18:25:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 26 Aug 2020 14:24:39 -0400
Message-Id: <20200826182456.322681-4-lyude@redhat.com>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: [Nouveau] [PATCH v5 03/20] drm/nouveau/kms/nv50-: Just use
 drm_dp_dpcd_read() in nouveau_dp.c
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2luY2UgdGhpcyBhY3R1YWxseSBsb2dzIGFjY2Vzc2VzLCB3ZSBzaG91bGQgcHJvYmFibHkgYWx3
YXlzIGJlIHVzaW5nCnRoaXMgaW1ob+KApgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1
ZGVAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMgfCAxMiArKysrLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcC5jCmluZGV4IGM0ZTljMjFkNGRkMmIuLjhkYjky
MTZkNTJjNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RwLmMKQEAgLTQyLDE2ICs0
MiwxMiBAQCBub3V2ZWF1X2RwX2RldGVjdChzdHJ1Y3Qgbm91dmVhdV9jb25uZWN0b3IgKm52X2Nv
bm5lY3RvciwKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbnZfZW5jb2Rlci0+YmFzZS5i
YXNlLmRldjsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7Ci0J
c3RydWN0IG52a21faTJjX2F1eCAqYXV4OwotCXU4IGRwY2RbOF07CisJc3RydWN0IGRybV9kcF9h
dXggKmF1eCA9ICZudl9jb25uZWN0b3ItPmF1eDsKKwl1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9T
SVpFXTsKIAlpbnQgcmV0OwogCi0JYXV4ID0gbnZfZW5jb2Rlci0+YXV4OwotCWlmICghYXV4KQot
CQlyZXR1cm4gLUVOT0RFVjsKLQotCXJldCA9IG52a21fcmRhdXgoYXV4LCBEUF9EUENEX1JFViwg
ZHBjZCwgc2l6ZW9mKGRwY2QpKTsKLQlpZiAocmV0KQorCXJldCA9IGRybV9kcF9kcGNkX3JlYWQo
YXV4LCBEUF9EUENEX1JFViwgZHBjZCwgRFBfUkVDRUlWRVJfQ0FQX1NJWkUpOworCWlmIChyZXQg
IT0gc2l6ZW9mKGRwY2QpKQogCQlyZXR1cm4gcmV0OwogCiAJbnZfZW5jb2Rlci0+ZHAubGlua19i
dyA9IDI3MDAwICogZHBjZFsxXTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
