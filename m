Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50B3A1BC8
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 19:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4B6E9F9;
	Wed,  9 Jun 2021 17:29:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3206E9F9;
 Wed,  9 Jun 2021 17:29:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q5so26397742wrm.1;
 Wed, 09 Jun 2021 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
 b=J3x9CdeBpq+5uCmg69UOOA+CCvqmLVZmMtJbo2BeBn33JUlCbULGgK6jzjNw+kk7lc
 6XWAbz852Q41K5al5xO7F5i+ggLcin9N4KsgPX77Qp03+aA3PCLcwAr9AkZF/Ry+2/Lp
 sumWm5XvkviOOVlZc/i6abIxDBUcu0nuPotCtP2P6LMaHgNijFkuRQs7l/rIc+xdqsg4
 2t1SY1aU6ixWWrORWV0lSV6fjbqlIrp8vlfyC6PSmgcubA5EZWVh4yAq0TvBJwWQ1VOz
 RLbA8OYolfH1n/3q9HU3J2+XNZ/5HLuEN6reYV7QvYKobDdzueIV7xM4vSUJckdUKuZz
 3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
 b=XToxRcpgbTdfHK5CIOJxCd2cCwhDZJP01ppG3aE9eg2tEhTNX1kcTXrsC+z9QfgY4n
 RHm8xq/xuYzoUjm4uhpkTDm+SrVG6BGUvry5FKGXkTW2b5ZQlQSAwbmkYLyiF50Lwcnl
 CKJbYBdJMXg5538+dVNKgUbvkKv+3smC6K7ZVLwT/h8gEsOGxTLqDX6nDULVW09QAFip
 1aiPDDTwepq0RGaMV4diwo4iAooIzUiiryMRTPVfNMhSC0+ZmdwnaVr+SO2/4VNwSkfE
 DsKMSjC9K7QGVLFDniS2lFTKSl1A+TDRXLi0XO5LAUex1t1hYJKBL6FQi2NvjDLSCFzd
 7blQ==
X-Gm-Message-State: AOAM530D5GDmNt5uPbHC7/4yOZTtP3Cqo7uAfa4M8CNcGAjJpSR2Dqtd
 QS/LGo/aovaggsSZnkbRWo4=
X-Google-Smtp-Source: ABdhPJy85u2jsCOke2wD/gZLF8ArY3JCZKYO07JVfhpzyRmDf61JGNZzvRYD4gJ3l5dxpgdnH44+cA==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr884648wrv.371.1623259743420;
 Wed, 09 Jun 2021 10:29:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b195:7245:6855:de04])
 by smtp.gmail.com with ESMTPSA id w13sm364488wmi.48.2021.06.09.10.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:29:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: imirkin@alum.mit.edu, cyndis@kapsi.fi, linux-tegra@vger.kernel.org,
 nouveau@lists.freedesktop.org, ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Date: Wed,  9 Jun 2021 19:29:02 +0200
Message-Id: <20210609172902.1937-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] drm/nouveau: init the base GEM fields for
 internal BOs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VFRNcyBidWZmZXIgb2JqZWN0cyBhcmUgYmFzZWQgb24gR0VNIG9iamVjdHMgZm9yIHF1aXRlIGEg
d2hpbGUKYW5kIHJlbHkgb24gaW5pdGlhbGl6aW5nIHRob3NlIGZpZWxkcyBiZWZvcmUgaW5pdGlh
bGl6aW5nIHRoZSBUVE0gQk8uCgpOb3ZlYXUgbm93IGRvZXNuJ3QgaW5pdCB0aGUgR0VNIG9iamVj
dCBmb3IgaW50ZXJuYWxseSBhbGxvY2F0ZWQgQk9zLApzbyBtYWtlIHN1cmUgdGhhdCB3ZSBhdCBs
ZWFzdCBpbml0aWFsaXplIHNvbWUgbmVjZXNzYXJ5IGZpZWxkcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA1MjBi
MWVhOWQxNmMuLjA4NTAyMzYyNGZiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
YwpAQCAtMTQ5LDYgKzE0OSw4IEBAIG5vdXZlYXVfYm9fZGVsX3R0bShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvKQogCSAqLwogCWlmIChiby0+YmFzZS5kZXYpCiAJCWRybV9nZW1fb2JqZWN0
X3JlbGVhc2UoJmJvLT5iYXNlKTsKKwllbHNlCisJCWRtYV9yZXN2X2ZpbmkoJmJvLT5iYXNlLl9y
ZXN2KTsKIAogCWtmcmVlKG52Ym8pOwogfQpAQCAtMzMwLDYgKzMzMiwxMCBAQCBub3V2ZWF1X2Jv
X25ldyhzdHJ1Y3Qgbm91dmVhdV9jbGkgKmNsaSwgdTY0IHNpemUsIGludCBhbGlnbiwKIAlpZiAo
SVNfRVJSKG52Ym8pKQogCQlyZXR1cm4gUFRSX0VSUihudmJvKTsKIAorCW52Ym8tPmJvLmJhc2Uu
c2l6ZSA9IHNpemU7CisJZG1hX3Jlc3ZfaW5pdCgmbnZiby0+Ym8uYmFzZS5fcmVzdik7CisJZHJt
X3ZtYV9ub2RlX3Jlc2V0KCZudmJvLT5iby5iYXNlLnZtYV9ub2RlKTsKKwogCXJldCA9IG5vdXZl
YXVfYm9faW5pdChudmJvLCBzaXplLCBhbGlnbiwgZG9tYWluLCBzZywgcm9iaik7CiAJaWYgKHJl
dCkKIAkJcmV0dXJuIHJldDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
