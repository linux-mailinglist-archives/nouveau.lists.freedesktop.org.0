Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0732B87D
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87C16E9A5;
	Wed,  3 Mar 2021 14:09:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0656E8F0
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u16so5732663wrt.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=b8s1GADMy3KCr1xBwRkJxqrHKcPwaqZuz/sooEbpFBd2wLj+LQxrMwWz3TBw/Vlja7
 9WlmxMg3FND6FswMAyNnsSIunYjTbwzz3+KFzk9Rd8fwcKLsPbG3JWLJ57I6S+zBV8uw
 N5LxB9/i1sAnWt65VqWTe3+gddF+brZb0ZhOl7kzIzYGu6ErsNhO02pFM6qk0r/JPqGx
 PQ59WcXnAdN6Al+FNN0k/T6klL5epStV/txWxabOxawEY5hEM3Ir+uhkuDsngHx2eeod
 4vdzgdGYV6/hW/g0s46y8B9nkF0v3AdxgmJWsMn/VnDTuOXSn+yweuNGiBmmEFVB5HoX
 eMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=NhowalMtaOlDaXcrYbfoeFpOxRy+pBS+HBThlvKavFXw5/niaFjFiXvgnT4R+AhnXa
 2dP21mdjIn0/Svyk2MhuqhLRvwm+c8FEG9PlC12XcMef6CyvaHKH6QBFJ1yhHTuvcE4A
 Icrfst77ffDgkovv4Nb6ijbQx4TOE0h21KvZOSXbGiiaY7DQf1BatXNesZn3LM2bb8Di
 anMPCGtZykrOjLV4wyB4V36z033lQVKfKGcXSZxIiZsrhzbtUtnoTVCtCzmDkKh17K8s
 hYB/wKJD9d6d43FW3UiIPcaKVxKWOpeXYc6jh43dcpbjR4+Nkm0dWn0KbuRODtLk4Non
 gFaw==
X-Gm-Message-State: AOAM532E1tgbv6XiXdL4ewdRI+C+39yUEMP0SzvSYv7pKOICeTecABkO
 RdsRUVf4oRV2fMFFd44QH4RaMQ==
X-Google-Smtp-Source: ABdhPJw8poGH42pSfanQCsguNS4B/QAleU7GHwRIqu0RlxmsWTz/8hZAQXuIPpPcZu9zagNyWVO7aw==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr16913767wrs.43.1614779028142; 
 Wed, 03 Mar 2021 05:43:48 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:43 +0000
Message-Id: <20210303134319.3160762-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 17/53] drm/nouveau/dispnv50/headc57d: Make local
 function 'headc57d_olut' static
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
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYzoxNzM6MTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMKaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCkBAIC0xNjks
NyArMTY5LDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwg
aW50IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQogCXdyaXRldyhyZWFkdyhtZW0gLSA0KSwgbWVt
ICsgNCk7CiB9CiAKLWJvb2wKK3N0YXRpYyBib29sCiBoZWFkYzU3ZF9vbHV0KHN0cnVjdCBudjUw
X2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50IHNpemUpCiB7CiAJ
aWYgKHNpemUgIT0gMCAmJiBzaXplICE9IDI1NiAmJiBzaXplICE9IDEwMjQpCi0tIAoyLjI3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
