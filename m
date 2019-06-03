Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C332832
	for <lists+nouveau@lfdr.de>; Mon,  3 Jun 2019 07:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885F789932;
	Mon,  3 Jun 2019 05:59:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B589932
 for <nouveau@lists.freedesktop.org>; Mon,  3 Jun 2019 05:59:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z19so7996355qtz.13
 for <nouveau@lists.freedesktop.org>; Sun, 02 Jun 2019 22:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3dNwv+D5Kp6IKZ3c6YKLP5l+rpecTLncEygwdp8C92A=;
 b=MrkRW3sjUl9kCZxgnySebk/yT5BRgPpSN07IkQvlUjUf4/IUtU406hdI094UBDbs7H
 oPol9dR+0VPOPekiFBLIf6MCe4KpVtYxJb4mwdUdl17haw5KeTudp9EGqsA6X9qCwD8l
 hgkwCUe6egGzt5KdfwGqgLtqzmpxuaDoOjYbBxxDxxrs6im6h0to9dqdKo0mJFHfTou0
 etl5EuLNHMLns4RF5I0CgXpeqS9N/qSG3kZdWBTONIWXhRMcuFMbkpd7+ZFCNU3/yyfQ
 A1k2JsqEv6zBrpZ2r04eKCYbbL3z6Ms6AeiI8xQpZzJgd7y1lyJ6pzE61T3leuLVLm1N
 1upw==
X-Gm-Message-State: APjAAAUrDXd0bN2HIKGK1M9QX2QEVG986cI2geNKJNYad4DoNqBffRVq
 0xMx/lmlp9wHCk8w1kHabdcQj7OPSGw=
X-Google-Smtp-Source: APXvYqxV0EFyM3ee3VoOyMWhbpuCOxD1WxYX+i03lrCGdAHqSxpxL+A/le9t0FcQWLIvzs/zESEHBA==
X-Received: by 2002:ad4:5285:: with SMTP id v5mr13343240qvr.131.1559541583951; 
 Sun, 02 Jun 2019 22:59:43 -0700 (PDT)
Received: from athos.hellosponsor.com
 (pool-173-68-20-215.nycmny.fios.verizon.net. [173.68.20.215])
 by smtp.gmail.com with ESMTPSA id v186sm8460292qkc.36.2019.06.02.22.59.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 22:59:43 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org,
	bskeggs@redhat.com
Date: Mon,  3 Jun 2019 01:59:42 -0400
Message-Id: <20190603055942.11148-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3dNwv+D5Kp6IKZ3c6YKLP5l+rpecTLncEygwdp8C92A=;
 b=jd5Bic1aOI4N30N/Vnrp/IdBiNy1FABT1PJ31VqOraNcbPxTdDygFNkKP5AJJNNItP
 wJI8XrY6yDdIk/KC+sqto10A1V1SjltkSH8MTASGyqCRBfdV7fEQenLpRFTs/ke331s1
 9GktLRL2Oa9eYdsQfiRPuQXR8Sdo9XGUl13L8RtLJzU/H5Zx2WVde9v4qqP6Rz9fhqjg
 vRplS/icRrkD+nWNrbl2R5/ymckM5Bsl9agapl9yiLuCnoexPuRZ7vR4kBF8eqUYPnLB
 om86j536QTqKw2LfugTNkOKHoyuDgP1VksJQnFHJY6leeP58a9CE8jcwdG9S1HzV/q37
 iczA==
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: remove overlay alpha
 formats
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIG92ZXJsYXkgbG9naWMgY2FuIG9ubHkgZG8gY29sb3JrZXktYmFzZWQgc2VsZWN0aW9uLCBu
b3QKYWxwaGEtYmxlbmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBh
bHVtLm1pdC5lZHU+Ci0tLQoKVGhpcyBhcHBsaWVzIG9uIHRvcCBvZiB0aGUgRlAxNiBwYXRjaCBJ
IHNlbnQgZWFybGllci4KCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5NTA3
ZS5jIHwgMiAtLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTgyN2UuYyB8
IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5OTA3ZS5jIHwgNCAt
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5OTE3ZS5jIHwgNSAtLS0t
LQogNCBmaWxlcyBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5NTA3ZS5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvb3ZseTUwN2UuYwppbmRleCBjYzQxNzY2NGY4MjMuLjljMDc0ZGI5YjVi
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTUwN2Uu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5NTA3ZS5jCkBAIC0x
NjAsOSArMTYwLDcgQEAgb3ZseTUwN2VfZm9ybWF0W10gPSB7CiAJRFJNX0ZPUk1BVF9ZVVlWLAog
CURSTV9GT1JNQVRfVVlWWSwKIAlEUk1fRk9STUFUX1hSR0I4ODg4LAotCURSTV9GT1JNQVRfQVJH
Qjg4ODgsCiAJRFJNX0ZPUk1BVF9YUkdCMTU1NSwKLQlEUk1fRk9STUFUX0FSR0IxNTU1LAogCTAK
IH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk4
MjdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5ODI3ZS5jCmluZGV4
IGFhYTlmZTVhNGZjOC4uMmU2OGZjNzM2ZmUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9vdmx5ODI3ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL292bHk4MjdlLmMKQEAgLTkwLDExICs5MCw4IEBAIG92bHk4MjdlX2Zvcm1hdFtd
ID0gewogCURSTV9GT1JNQVRfWVVZViwKIAlEUk1fRk9STUFUX1VZVlksCiAJRFJNX0ZPUk1BVF9Y
UkdCODg4OCwKLQlEUk1fRk9STUFUX0FSR0I4ODg4LAogCURSTV9GT1JNQVRfWFJHQjE1NTUsCi0J
RFJNX0ZPUk1BVF9BUkdCMTU1NSwKIAlEUk1fRk9STUFUX1hCR1IyMTAxMDEwLAotCURSTV9GT1JN
QVRfQUJHUjIxMDEwMTAsCiAJMAogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52NTAvb3ZseTkwN2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL292bHk5MDdlLmMKaW5kZXggZjk0NzExN2Q2MmIxLi45ZWZlNWU5ZDVjZTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk5MDdlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvb3ZseTkwN2UuYwpAQCAtNjYsMTMgKzY2LDkg
QEAgb3ZseTkwN2VfZm9ybWF0W10gPSB7CiAJRFJNX0ZPUk1BVF9ZVVlWLAogCURSTV9GT1JNQVRf
VVlWWSwKIAlEUk1fRk9STUFUX1hSR0I4ODg4LAotCURSTV9GT1JNQVRfQVJHQjg4ODgsCiAJRFJN
X0ZPUk1BVF9YUkdCMTU1NSwKLQlEUk1fRk9STUFUX0FSR0IxNTU1LAogCURSTV9GT1JNQVRfWEJH
UjIxMDEwMTAsCi0JRFJNX0ZPUk1BVF9BQkdSMjEwMTAxMCwKIAlEUk1fRk9STUFUX1hCR1IxNjE2
MTYxNkYsCi0JRFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTZGLAogCTAKIH07CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk5MTdlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9vdmx5OTE3ZS5jCmluZGV4IGZhYjU2N2UyNThmOS4uZTI0
ZDZmZDIzNDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9v
dmx5OTE3ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk5MTdl
LmMKQEAgLTI2LDE1ICsyNiwxMCBAQCBvdmx5OTE3ZV9mb3JtYXRbXSA9IHsKIAlEUk1fRk9STUFU
X1lVWVYsCiAJRFJNX0ZPUk1BVF9VWVZZLAogCURSTV9GT1JNQVRfWFJHQjg4ODgsCi0JRFJNX0ZP
Uk1BVF9BUkdCODg4OCwKIAlEUk1fRk9STUFUX1hSR0IxNTU1LAotCURSTV9GT1JNQVRfQVJHQjE1
NTUsCiAJRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMCwKLQlEUk1fRk9STUFUX0FCR1IyMTAxMDEwLAog
CURSTV9GT1JNQVRfWFJHQjIxMDEwMTAsCi0JRFJNX0ZPUk1BVF9BUkdCMjEwMTAxMCwKIAlEUk1f
Rk9STUFUX1hCR1IxNjE2MTYxNkYsCi0JRFJNX0ZPUk1BVF9BQkdSMTYxNjE2MTZGLAogCTAKIH07
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
