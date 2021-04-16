Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96087362279
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 16:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22E26EC01;
	Fri, 16 Apr 2021 14:37:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979B16EBFE
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:39 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id w23so26670057ejb.9
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/qJg/GxIoIQOOm1SNOLLnFRtxZCMtYZ46XvrqG7mv4=;
 b=itln6XERME/4Yh80Mask5Ou5IFhw9E4rP1eKimMutmDEThu7t2bC6wxjUfv9+3am+0
 Ivc5a9UFk2rAyPPvLw/G7NrQrAZyq3TKud34Vt5mGrX7IL5JSu1VmtugH/FcOCGKRI4G
 iCIXzZERumpfQBAlqmR1xjkxjwAPJZmF1Hj8S5yoTM51VsLTNEUuKolsvlWpOtJbSslP
 6D9/3lqjJ8B8JU1NrLhmJAEImB/HJXPjthAGwlNpzU5kOvTKjK4ziF25bgwEF/cv/vW7
 Irer8JRZejsZ1eZ5PXkstUyuQ6PaPg5YsLo+ioQ3cNpsH5qGoyk5YfmpxpOqiqzd5ZoL
 RdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/qJg/GxIoIQOOm1SNOLLnFRtxZCMtYZ46XvrqG7mv4=;
 b=cgf1qZhoGWc8hTpsPqCJINAjJi3V2Xu15bR7ARJsXKmgieWUCtdd9/eRINcICtb9f1
 jG5kQdwF81wDdtrdO1ygBHiTM/+SbPBcfHXuhfJqNyFueI0IJ5QhFJqeS5oVWZrQJc5K
 dGRIpoYQGa0hkO2msK5mQgJuFCGoth92GsDFIUMieuB+3zZ0M2pcQMsxtoLcRA6Qugpy
 NREWF+SIm7gjF73MigXvLWEeT8GIYJXeHeaGX6gIxUktxTgZVySvfsavNd7hp8RpO4T5
 r5YrQRV3L5/u3N9xPi/57s0OTgRWENwUJkECO9vD83E4YIfkYSNdD2vRbsmeniVGp23p
 zlAQ==
X-Gm-Message-State: AOAM533j21v5YxMkvfBT64b57Kutby9OL9CMeBDTthzBYn10AhEc6DnS
 XnH8Hy6Zw/6N74QJ8S5taHkILA==
X-Google-Smtp-Source: ABdhPJwyyQ78HhFxwVGsHOCCHcrMEtltPH9DKl5AUPQtj9p3tU6DB6ttsT61SqDtIpq8Q2r9Ym/3hA==
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr8346753ejz.363.1618583858315; 
 Fri, 16 Apr 2021 07:37:38 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:52 +0100
Message-Id: <20210416143725.2769053-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 07/40] drm/nouveau/nouveau_bo: Remove unused
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
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggM2UwOWRmMDQ3MmNlNC4uMzdiM2QyYzEw
ZjVjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTI1NSw3ICsxMjU1
LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCiB7
CiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwogCXN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtOwotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlib29sIHNsYXZlID0gISEodHRtLT5w
YWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7CiAKIAlpZiAodHRtX3R0X2lzX3BvcHVsYXRl
ZCh0dG0pKQpAQCAtMTI2OCw3ICsxMjY3LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3Ry
dWN0IHR0bV9kZXZpY2UgKmJkZXYsCiAJfQogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwot
CWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRt
LmJkZXYucG9vbCwgdHRtLCBjdHgpOwogfQpAQCAtMTI3OCwxNCArMTI3NiwxMiBAQCBub3V2ZWF1
X3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAogCQkJICBzdHJ1Y3Qg
dHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Ci0Jc3RydWN0IGRldmlj
ZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFH
X1NHKTsKIAogCWlmIChzbGF2ZSkKIAkJcmV0dXJuOwogCiAJZHJtID0gbm91dmVhdV9iZGV2KGJk
ZXYpOwotCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKIAlyZXR1cm4gdHRtX3Bvb2xfZnJlZSgmZHJt
LT50dG0uYmRldi5wb29sLCB0dG0pOwogfQotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
