Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8B46A67
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 22:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539DE894FF;
	Fri, 14 Jun 2019 20:36:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909888954A
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so5195109edr.10
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8nP1OQ6G0Sp5ISO73o32Z9psXparAm2zG0NoUdyIz0=;
 b=a+DyZheWm74cg5HD7eYFvObZdbUlwZ6aSlxCJh6rWISqpz4fvY8AgxXaAFPbxvayJ5
 HCwWVvW3S6t7AQPryf/EOAHLbh87A94OifOqj9jUlLIc4h1fMrQEj+XcH9m/q4GToina
 SGSirMp3071JknMgav7P/Xoz6wle83BXJi6AumkTZoc2OROSZE7eG8KO8oRw5Nio8Uo0
 drxR5/vP9F3i0glnDsh8B5HVskLQ72hbU0A6OXVvCZ2eC2CuUVto9HKHTvaDO3qZ+OBd
 kNrSqcDPGyxT4Akm1EMcEf5dl2AtJB0nwQAIKXO8KyczaHIN8MeGSbMkU4v+3d9VcXln
 VXEg==
X-Gm-Message-State: APjAAAV8Vt1CPhfyAmcQtCH9Or1Fh0QlrmXJ8XJuGkLoJdBgsy+dBwyT
 0E1wdlJAGxhIFnNkzCk3d/O4bA==
X-Google-Smtp-Source: APXvYqxaCuu6YBvxt8pmSExnLQ9FvSQBIly5lGJU5l2qIMpC4dbZysCYJXANqCYQHES1MLm9W0bQdA==
X-Received: by 2002:a50:b13b:: with SMTP id k56mr62378046edd.192.1560544609250; 
 Fri, 14 Jun 2019 13:36:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 14 Jun 2019 22:35:39 +0200
Message-Id: <20190614203615.12639-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8nP1OQ6G0Sp5ISO73o32Z9psXparAm2zG0NoUdyIz0=;
 b=IiMLowykDV2ETz+pZWVNtOho4ohoeWUj+nZPCKYSm0e5KT8tMQVHB1jWsiAfkUV9sr
 MI7fRZly5uwElzrMleYtgv5RSaZrzW9JFoEs7Kur7tIcnDyTjo4aJBkbcGCCroZOsvEX
 2N2/VD5l/TKGIci5oRk9ZdOX6ugOnVjvROaU0=
Subject: [Nouveau] [PATCH 23/59] drm/nouveau: Drop
 drm_gem_prime_export/import
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
Cc: nouveau@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBCZW4gU2tlZ2dz
IDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwot
LS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgfCAyIC0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0u
YwppbmRleCA4Y2IxNzRmOTU0NDguLjQzNzdiODM2MjY1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RybS5jCkBAIC0xMTMwLDggKzExMzAsNiBAQCBkcml2ZXJfc3R1YiA9IHsKIAog
CS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJp
bWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmlt
ZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRy
bV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfcGluID0gbm91dmVhdV9nZW1fcHJpbWVf
cGluLAogCS5nZW1fcHJpbWVfcmVzX29iaiA9IG5vdXZlYXVfZ2VtX3ByaW1lX3Jlc19vYmosCiAJ
LmdlbV9wcmltZV91bnBpbiA9IG5vdXZlYXVfZ2VtX3ByaW1lX3VucGluLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
