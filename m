Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD613912BC
	for <lists+nouveau@lfdr.de>; Wed, 26 May 2021 10:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA8A6EC40;
	Wed, 26 May 2021 08:47:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE36EC2F
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 08:47:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d11so189067wrw.8
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=k1w7aNlLT1e33HjFRfzfE/UNKNo0S/GpjOvyoBjBf/hSBqbU+mHpuVOC4MwqDZJDv0
 snC2Kzgy1Bmynda/6vGqWZAcIoOhIL201vTq6tYQVFZD/1G23DST+cA1Bn0EErZVOVWh
 J+81I50IbJqyFwwd+QKxO+UmcFzA0CQpPxsEmbzJrBnenMZs+9twXLjtaCkJvWf4LXLL
 HjC+MCrFrmUZNx2KrSyaJHPpyqc+jQiJZ0HlkjWoceJSs5UR2J4Lk4BMmvZSPhCMLLJB
 eeMSoO4uXccH9L0S4w9Rk9YQ5zJkC5Z/f2nJmK6Kl/ob+2DCmdVDD51nnJdAiYtHcGFO
 5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=G0E9ctVTw6yyfU36anuBljIfquF2YqO8Rv75JARGo2UH+wo/2xgE+hm7vKUrCte3ti
 sn5+8IufUuhJRy5M/FEDOS6y63uL8p3NzgktlPKfgMuUuwt0CGx62RNyLxvdLJDjwiuk
 sjmLZIJ1qoNVX+jGFRmVy6He0gAgQl0yOZL/sXwCx5YN+fC1weJ/KRiFLBTMLn+ehIvd
 5ISCpQF44oskTazbwzXUWItejxyYiwwRGoYJkdFXtphSpTVwof6OHTiQH52p/p29Ub3U
 v/foLjNz7Cooxh/ggQZN661nhlWjuvhMqF5/3SAVa5Q9x7zu/o+Qef6T/6gQS5Kuk3Gc
 kmYw==
X-Gm-Message-State: AOAM530eYhqeLN0pDPZFhWcAxdbFB+s2Y6fwJWxM/qFs8mUUzBK9381b
 2It6UhophDUUYMYDAivjyaT8qg==
X-Google-Smtp-Source: ABdhPJxkBloP9sj4QDUuVgg6Pp0GCfuC1kUavbMKW3GJ7C1DQ9Z+b1WzJFjhv91nuhvw1t+89Vvu6g==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr32450663wrr.336.1622018861604; 
 Wed, 26 May 2021 01:47:41 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed, 26 May 2021 09:47:03 +0100
Message-Id: <20210526084726.552052-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 11/34] drm/nouveau/nvkm/subdev/mc/tu102: Make
 functions called by reference static
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDIuYzo1MDoxOiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHR1MTAyX21jX2ludHJfdW5hcm3igJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMv
dHUxMDIuYzo2MjoxOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHR1MTAy
X21jX2ludHJfcmVhcm3igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDIuYzo3NDoxOiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHR1MTAyX21jX2ludHJfbWFza+KAmSBbLVdtaXNzaW5nLXByb3Rv
dHlwZXNdCgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogQWxpc3RhaXIgUG9wcGxlIDxhcG9wcGxlQG52aWRpYS5jb20+CkNjOiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L21jL3R1MTAyLmMgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9tYy90dTEwMi5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDIuYwppbmRleCA1OGRiODNlYmFk
YzVmLi5hOTYwODRiMzRhNzg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9tYy90dTEwMi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L21jL3R1MTAyLmMKQEAgLTQ2LDcgKzQ2LDcgQEAgdHUxMDJfbWNfaW50cl91cGRhdGUo
c3RydWN0IHR1MTAyX21jICptYykKIAkJbnZrbV93cjMyKGRldmljZSwgMHhiODE2MTAsIDB4Nik7
CiB9CiAKLXZvaWQKK3N0YXRpYyB2b2lkCiB0dTEwMl9tY19pbnRyX3VuYXJtKHN0cnVjdCBudmtt
X21jICpiYXNlKQogewogCXN0cnVjdCB0dTEwMl9tYyAqbWMgPSB0dTEwMl9tYyhiYXNlKTsKQEAg
LTU4LDcgKzU4LDcgQEAgdHUxMDJfbWNfaW50cl91bmFybShzdHJ1Y3QgbnZrbV9tYyAqYmFzZSkK
IAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtYy0+bG9jaywgZmxhZ3MpOwogfQogCi12b2lkCitz
dGF0aWMgdm9pZAogdHUxMDJfbWNfaW50cl9yZWFybShzdHJ1Y3QgbnZrbV9tYyAqYmFzZSkKIHsK
IAlzdHJ1Y3QgdHUxMDJfbWMgKm1jID0gdHUxMDJfbWMoYmFzZSk7CkBAIC03MCw3ICs3MCw3IEBA
IHR1MTAyX21jX2ludHJfcmVhcm0oc3RydWN0IG52a21fbWMgKmJhc2UpCiAJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmbWMtPmxvY2ssIGZsYWdzKTsKIH0KIAotdm9pZAorc3RhdGljIHZvaWQKIHR1
MTAyX21jX2ludHJfbWFzayhzdHJ1Y3QgbnZrbV9tYyAqYmFzZSwgdTMyIG1hc2ssIHUzMiBpbnRy
KQogewogCXN0cnVjdCB0dTEwMl9tYyAqbWMgPSB0dTEwMl9tYyhiYXNlKTsKLS0gCjIuMzEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
