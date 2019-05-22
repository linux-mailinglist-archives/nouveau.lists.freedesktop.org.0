Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1626684
	for <lists+nouveau@lfdr.de>; Wed, 22 May 2019 17:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9237B89B03;
	Wed, 22 May 2019 15:03:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B4289AC9;
 Wed, 22 May 2019 15:03:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f10so2696032wre.7;
 Wed, 22 May 2019 08:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5kGyKa6YZVs2CoLnHdrZtrYw7gGhR5+N5hGtSGcOXr8=;
 b=JekLqGamVCovf1P5mf2W9zTG4jr5HTdiT/oUJDA0L929Cxm8B0Hlh9dFmcOxwApU5/
 9dvSgYVn2UGn/kg7IbKNjQP4yYwtyCYWwm8rS4zDUZeKqXxFE/P/jW/IBG323Wx5LRY/
 jWWv9fBEOCbmyS9dD2ZoXFwg3KdQ4ihPjbfrK/qVOO0tRhbKUHY6VR1zdpxWWW7gPW4H
 I5HEtZwOUZ8LAwLh/vN7XJHDCoIf1MbpZaB/s5/i6kyBUaNULumcv7BN0EGuCVVpUe5F
 TOS/euSGuNap5HITsUVkEQ0wL2ZH5hg3q63WdfZ+mPkeNbirrdaDMAx8BsEbhVt5gSBO
 J1SQ==
X-Gm-Message-State: APjAAAXY1ZHGqNLHJs7kdErmahKkb0uZB3uW1qMBWCjKYWISKVLaKGnx
 c43FN/Q1YTgZ2ka/YBNB48taFmOk
X-Google-Smtp-Source: APXvYqwvPNvioxDO0UhXg6x/I3Qvkb7syDoVr7/9lv457FLpRCqlDnZ7GM0D0+CXI4MvleN+KUanBA==
X-Received: by 2002:adf:db87:: with SMTP id u7mr5572428wri.245.1558537422945; 
 Wed, 22 May 2019 08:03:42 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l14sm21978468wrt.57.2019.05.22.08.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 08:03:42 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 22 May 2019 16:02:19 +0100
Message-Id: <20190522150219.13913-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522150219.13913-1-emil.l.velikov@gmail.com>
References: <20190522150219.13913-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5kGyKa6YZVs2CoLnHdrZtrYw7gGhR5+N5hGtSGcOXr8=;
 b=qaXnpINeH45UpnUMeAfSA+2lirUDfqbCK5GANULVkkdme7dYqeDY1rOI8CeMuFjlOH
 YIETEOdtvWN9l+v9XOidSDKj8gH5Hx0ZdaMzmew8d4EpYDWj55d0xIuFALZaKP2SNjPx
 lM0nNs7jId/jDc1yHSPmvUVoVqyLAjpqPHzeWBPYiMMyWX1NaMqkerTeR/AmTN2Ygf3k
 GpxAqySMIOFv+ttsXIwjpN2NSc7j+VdgD4Z91KNGuuyVJBbna8VYUbR22fxUhMle1J73
 26fSyzThJ7fCktrpGMxcEboLas6w5iyyjqS9dU9uQDnGjn6pJ/F9TFib7757wXcAJggo
 HDtQ==
Subject: [Nouveau] [PATCH 2/2] drm/nouveau: remove open-coded
 drm_invalid_op()
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
Cc: nouveau@lists.freedesktop.org, emil.l.velikov@gmail.com,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkNjOiBCZW4g
U2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuYyB8IDYgLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmggfCAxIC0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9hYmkxNi5jCmluZGV4IGMzZmQ1ZGQzOWVkOS4uMGM1ODVkYzVmNWMzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9hYmkxNi5jCkBAIC0yNDQsMTIgKzI0NCw2IEBAIG5v
dXZlYXVfYWJpMTZfaW9jdGxfZ2V0cGFyYW0oQUJJMTZfSU9DVExfQVJHUykKIAlyZXR1cm4gMDsK
IH0KIAotaW50Ci1ub3V2ZWF1X2FiaTE2X2lvY3RsX3NldHBhcmFtKEFCSTE2X0lPQ1RMX0FSR1Mp
Ci17Ci0JcmV0dXJuIC1FSU5WQUw7Ci19Ci0KIGludAogbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFu
bmVsX2FsbG9jKEFCSTE2X0lPQ1RMX0FSR1MpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2FiaTE2LmgKaW5kZXggMzZmZGUxZmYzYWQ1Li45Mjc1ZDUyOWI5NDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYWJpMTYuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmgKQEAgLTYsNyArNiw2IEBACiAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYKIAog
aW50IG5vdXZlYXVfYWJpMTZfaW9jdGxfZ2V0cGFyYW0oQUJJMTZfSU9DVExfQVJHUyk7Ci1pbnQg
bm91dmVhdV9hYmkxNl9pb2N0bF9zZXRwYXJhbShBQkkxNl9JT0NUTF9BUkdTKTsKIGludCBub3V2
ZWF1X2FiaTE2X2lvY3RsX2NoYW5uZWxfYWxsb2MoQUJJMTZfSU9DVExfQVJHUyk7CiBpbnQgbm91
dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2ZyZWUoQUJJMTZfSU9DVExfQVJHUyk7CiBpbnQgbm91
dmVhdV9hYmkxNl9pb2N0bF9ncm9ial9hbGxvYyhBQkkxNl9JT0NUTF9BUkdTKTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCmluZGV4IDIyY2Q0NTg0NWUwNy4uZWQ0NWFkMmI3MmYy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKQEAgLTEwNDYsNyArMTA0Niw3
IEBAIG5vdXZlYXVfZHJtX3Bvc3RjbG9zZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZwcml2KQogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYwogbm91
dmVhdV9pb2N0bHNbXSA9IHsKIAlEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX0dFVFBBUkFNLCBu
b3V2ZWF1X2FiaTE2X2lvY3RsX2dldHBhcmFtLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwK
LQlEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX1NFVFBBUkFNLCBub3V2ZWF1X2FiaTE2X2lvY3Rs
X3NldHBhcmFtLCBEUk1fQVVUSHxEUk1fTUFTVEVSfERSTV9ST09UX09OTFkpLAorCURSTV9JT0NU
TF9ERUZfRFJWKE5PVVZFQVVfU0VUUEFSQU0sIGRybV9pbnZhbGlkX29wLCBEUk1fQVVUSHxEUk1f
TUFTVEVSfERSTV9ST09UX09OTFkpLAogCURSTV9JT0NUTF9ERUZfRFJWKE5PVVZFQVVfQ0hBTk5F
TF9BTExPQywgbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9jLCBEUk1fQVVUSHxEUk1f
UkVOREVSX0FMTE9XKSwKIAlEUk1fSU9DVExfREVGX0RSVihOT1VWRUFVX0NIQU5ORUxfRlJFRSwg
bm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2ZyZWUsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxM
T1cpLAogCURSTV9JT0NUTF9ERUZfRFJWKE5PVVZFQVVfR1JPQkpfQUxMT0MsIG5vdXZlYXVfYWJp
MTZfaW9jdGxfZ3JvYmpfYWxsb2MsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
