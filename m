Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233D341FA5
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB11C6EA3B;
	Fri, 19 Mar 2021 14:36:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7C96E9A2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id va9so8266555ejb.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGGhPwZOypkRysPaew36bi2SL/oARoSOfv3/qOj60LY=;
 b=WkLf4se2ygcdBQIKbKwxqNveqB4koJlwdEfRBk1zP567hFamNxEMmDrYvU2lwE1cGJ
 u/AMNzO8QJnK7GmHddKQOpo6CfX1WGlP63nCTGh6wvTpl2Mo0PagzBkfowMdUOroYUga
 SaSe3CUWN0oq0wfCbBXT58D57a/vt286ZOMWRekrefpL46cI9PkOM9Sr3QR8NlxtLtJ7
 VW9x7B7zjtJPr8y4Hsr491F/ugrzs3zKGPkVBKc8RaMul6eV3CeguJuqGPIuWdfcUU72
 Z+yo/fyhUyqdEeXXzp14uKEhsbgptSrlNN2RwpVQy4ts/emeD7BM3gMv/SAarogZXO05
 oiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGGhPwZOypkRysPaew36bi2SL/oARoSOfv3/qOj60LY=;
 b=mrbw+OyXwgN7nW7uo5HDqlUl7eQ7rSgIcwxWadg6Jsm2kFHdDiEuVI0hXlREf3PvON
 NOD8bIeRH/ntImArLVj1Mp/hCYnq/JUy+4luY4Wmk0vkjFNS28ZV2dDtq98YRg/x3BFR
 SaQbDoImrCDNtM44IiinBx6kVGg5QrIUocZMOg6RNruUVjn53oLUYpMFizmIYM3G4INI
 qFb+kqW0jYmz0peKksMRHkbXjcL07SJEH/vEFbwqWFAmstLqBhsMf2DqduP7Im+uKhPY
 7KZGgozqrQgTvmk/Oh/uKQMm/8YDJPdsETD6yanebAM9J/tKb6SbUOEJQCHSVRSP8wax
 RoIw==
X-Gm-Message-State: AOAM531hAVi0f+Gs0HgGsONJHVzfME7kXNX16Wfa2GMy2jZWIrQ3/3Jp
 4IK62EvKReII3pGhHXWoHWekSg==
X-Google-Smtp-Source: ABdhPJy+b/uG5tTgU/yThQRTfU//08a1wHRYy9jj2+EPGa3YZj1QuCGlUX6+CDNbqK5fXTdf6lOGkw==
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr3043046eja.278.1616142282308; 
 Fri, 19 Mar 2021 01:24:42 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:19 +0000
Message-Id: <20210319082428.3294591-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 10/19] drm/nouveau/nouveau_bo: Remove unused
 variables 'dev'
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0
bV90dF9wb3B1bGF0ZeKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzox
MjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZeKAmToKIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjUyOjE3OiB3YXJuaW5nOiB2YXJpYWJs
ZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
CkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBKZXJlbXkgS29sYiA8amtvbGJAYnJh
bmRlaXMuZWR1PgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpD
YzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9iby5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggMjgxZTllZDEzOTg5NS4uOTEzMDM1YWI4
NWVjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTI1MCw3ICsxMjUw
LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCiB7
CiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwogCXN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtOwotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlib29sIHNsYXZlID0gISEodHRtLT5w
YWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlpZiAodHRtX3R0X2lzX3BvcHVsYXRl
ZCh0dG0pKQpAQCAtMTI2Myw3ICsxMjYyLDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3Ry
dWN0IHR0bV9kZXZpY2UgKmJkZXYsCiAJfQogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwot
CWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRt
LmJkZXYucG9vbCwgdHRtLCBjdHgpOwogfQpAQCAtMTI3MywxNCArMTI3MSwxMiBAQCBub3V2ZWF1
X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAogCQkJICBzdHJ1Y3Qg
dHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Ci0Jc3RydWN0IGRldmlj
ZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFH
X1NHKTsKIAogCWlmIChzbGF2ZSkKIAkJcmV0dXJuOwogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJk
ZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfZnJlZSgmZHJt
LT50dG0uYmRldi5wb29sLCB0dG0pOwogfQotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
