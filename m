Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C260C398CF1
	for <lists+nouveau@lfdr.de>; Wed,  2 Jun 2021 16:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5AE6ECC3;
	Wed,  2 Jun 2021 14:33:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F056ECC2
 for <nouveau@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id m18so1475183wmq.0
 for <nouveau@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=gofFevHTLNP8OF2mr2XqTcfqX1D3ngKNuZkPIThUZ73Sp9nI1B1Y8Tv/hVti3HkZ4s
 tWgT8IUhvVnFoBxbeWx3jn/nCNincbNXHzx9B6lZygFD3Cmrl1/GliP9x5+FqnKxuPfm
 edhx4dGvfjtFqI2hI0dZirgAh2HzbbwtsnovQrHetfPrP5AImxGrEqUHfmWDl53UHqKs
 /+0zrGfOn8gh9ia/+b83GKKJBPIOXAVM31QEAOYOYsPQyU57Q/x0kj+ovAtNleLZnv5t
 00TuL9IjHwDR0WWej7u0zyCtlYD2ZkTnzOWAQUY+i5DZV7ZSP+s5VOJj084G1ZggEaNK
 yZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjYtCEx4Gm+TGSpGlmvvhCGW5wnbP6a4KsRuIEipo4s=;
 b=t8TTw9ba80YcHMPrKKb/D12Xow4o0uZduFFSOS/2FpH9BxzR+GMiy/jOjuqtqo7eMn
 Zp/eiTIvKDkw+esAc2jDMjUlhI8Sgd9BrA6hJDtEoz/NlpMm26ax/wKuYRdZW1s2w6r3
 o+kL2jmnd21Mly/f/xTslPldJRWYxSNvdfjJf8Yq1M1zqxAKjmWlAdkudAdJsW++OGra
 wdSjYCL9GN6d+vxmFaT5Yac1uK6Ocxa0td2n3/9Bv2C9FjvHiffAupI70W+dvLyzeXBO
 /HZ1LjotXcvhvfrxrH9li4qPS04WhyqU884njd2ebJGMLJmAEwbuLfRpAmcuiDTJQ0so
 ArIg==
X-Gm-Message-State: AOAM532qFbyoxyBVdtPpcSXpek/sfTAjnHdL03izWZkzTcWVPkeC5Z9t
 Lle6cS6fvNrOlT/xme9k89RFtA==
X-Google-Smtp-Source: ABdhPJx3OI3S8vnYR8EVGsMrIxEMMmnLlVVY9ywmN5evmDEYm9hwef+Z9UJbAvOn0EMCoEwbTJPJvg==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr5534394wmi.116.1622644406183; 
 Wed, 02 Jun 2021 07:33:26 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:49 +0100
Message-Id: <20210602143300.2330146-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [RESEND 15/26] drm/nouveau/nvkm/subdev/mc/tu102: Make
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
