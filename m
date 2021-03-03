Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89E32B87A
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC786E9A4;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C1E6E8FA
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id w7so5211307wmb.5
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=Hv3a0tcAo2K75m0PVXruwEWL4rfLpWzsc4Q8ptX+wlRQui8I+T9dLgLHzoAzZ504j/
 XcEzu5iref2iOCnTh/o7cuHw+viXjLLMy8clfd4ZxtHnXl0RQYy2eGfS2ggWC1qnxc5p
 xC4l5DEddko48sXzz7/SS7YKf1p0wal7oJ5cXs9QtL18zSF/4lmjSmI2HgSN3tyE6B1S
 /FTU0+aJKxH890PwQM1AEg3ZlrQQ+JU2ilGVGkvuv97eQX2CwvOuTVNBVkTMCDWRoCS6
 t3to01UjR2QuViV0QUnqOsUPl5w4dzGd0Yi/iMWuHy/RtGZ8ifOVWd3phAkfkQ8RvNOA
 kRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTcc77PaUiGKf9phoAd/vzPQm0tz3YbgYP/6lveIZh4=;
 b=A2gblJFY3G5EM2CcFmReadDjj4LUOVHSTLKanFYHj1InGk5oQNvNtkh/65rpN2fwgk
 5TL8FT18SU1Xat+xN1sUN4u6WC+1YsVRSsl4Kxt3BgSM2MSl4IQsUB27s7Dx2VrAdkp/
 92sXfZBkkFG0P/nLidE5v7tVFPaGYkmYXTIVmuSTx3fqT/zuWgdY1tJ01BZFODWIzO5D
 S7QGT44Eyea3E2ydgbIIyC4Q+ohcl6dghNjrufYpHGbBVYmvP/p1ZIKEtuW8RUcr3Hih
 ahZ3fxH2mt1RStgDGdkEZ9/z0IeOrC/iVvQDzXSgjD1YZg7i6Ii3xGwQGjsjZwG3rHfy
 4mAQ==
X-Gm-Message-State: AOAM532mqUX3rdgvcyBjxyKI9w0dBIO1zrdOvbAWDSU+k9PI50xW7gqP
 zPdwcRfOqgqmsstGY9FJEj2iyQ==
X-Google-Smtp-Source: ABdhPJzCUtL2oe5CKkrYfLuRcO0VMQwAKyVrObWALyWobvl6AF/6diNzxih8O3BeA+r07qK/DufcjQ==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr9157109wmq.140.1614779032867; 
 Wed, 03 Mar 2021 05:43:52 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:47 +0000
Message-Id: <20210303134319.3160762-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 21/53] drm/nouveau/nouveau_svm: Remove unused
 variable 'ret' from void function
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYzogSW4gZnVuY3Rpb24g4oCYbm91dmVhdV9w
Zm5zX21hcOKAmToKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmM6ODEwOjY6
IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1i
dXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5kZXggMWMzZjg5MDM3N2Qy
Yy4uMjZhZjZlZTkxNTM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBA
IC04MTEsNyArODExLDYgQEAgbm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpz
dm1tLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAkJIHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpw
Zm5zLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJn
cyAqYXJncyA9IG5vdXZlYXVfcGZuc190b19hcmdzKHBmbnMpOwotCWludCByZXQ7CiAKIAlhcmdz
LT5wLmFkZHIgPSBhZGRyOwogCWFyZ3MtPnAuc2l6ZSA9IG5wYWdlcyA8PCBQQUdFX1NISUZUOwpA
QCAtODE5LDggKzgxOCw4IEBAIG5vdXZlYXVfcGZuc19tYXAoc3RydWN0IG5vdXZlYXVfc3ZtbSAq
c3ZtbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwog
CiAJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+c3VwZXIgPSB0cnVlOwotCXJldCA9IG52
aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFyZ3MsIHNpemVvZigqYXJn
cykgKwotCQkJCW5wYWdlcyAqIHNpemVvZihhcmdzLT5wLnBoeXNbMF0pLCBOVUxMKTsKKwludmlm
X29iamVjdF9pb2N0bCgmc3ZtbS0+dm1tLT52bW0ub2JqZWN0LCBhcmdzLCBzaXplb2YoKmFyZ3Mp
ICsKKwkJCSAgbnBhZ2VzICogc2l6ZW9mKGFyZ3MtPnAucGh5c1swXSksIE5VTEwpOwogCXN2bW0t
PnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gZmFsc2U7CiAKIAltdXRleF91bmxvY2so
JnN2bW0tPm11dGV4KTsKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
