Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F42F88D7
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 23:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE186E4C7;
	Fri, 15 Jan 2021 22:51:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6F6E4EC
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id i63so8228140wma.4
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+QQ91dB4nAV9iX95BjLXpaQb9N2TCvRIGQTNY+K7sU=;
 b=yL85iXlSpJyIEsW9uR5KjI1ME5UqZGtzQv4FY99XBi+FD088mPsLJUgEUFKevvrlE9
 ksl9DXvhysqqBdDc7ZadLjyb25WhWQ3i98QOp0XqAdIZxIWspprCXgzshIS98HW4wMGh
 I+dGjog07idrdB7GQ459SKQnXFCQ4I9gK+KFnSmHEK1XhiM5kcv9UoCyCxCQC61JS0ll
 ++XOFxnTRs1eBVYdPEs8eE+RG4iiu7oN+whS/TdHU+B6/+ipOqkC164lqBL+udM5S+Pe
 D+5z0HQ/r2jtn0PRy9nwsj2+X61EY1IqPKGMyzXLvzaeE1LhdUG1dXwChy5gE9CV1QlA
 lmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+QQ91dB4nAV9iX95BjLXpaQb9N2TCvRIGQTNY+K7sU=;
 b=OsC6BHbyY/vxwX/QMzDg2u9amN3HaaJzDcmbHVtiDGpVSsjiDoTJjCcPynyIHe928b
 n91mk3jJ0qhkH6EcEcsSj6Ytf+YcJqAp37t32raPFWCmMwFbEliPK41mbhk2HAppgZlA
 WNzaNGl754PBduzEt2vGBhbQExzjk/hovbc6+KIfjJxqTU15Sawm3+9wl9c8TT1Jv2l5
 jNweTSqHxzL0efExXGoq5lrPdtgOzh92vb/ixiLVShbBwJ8beg2AGIn0HdFw9/DV18Zx
 hpgSoXO/We5JRw53vSSLaMNXG20QCWv2vJoN3QU4NdoEvKZ/atRk9tFfvE1YH0RR29+c
 cj4w==
X-Gm-Message-State: AOAM5328cck4G2VSIOGEmvrjh5n9bRXBjXqX2WcjMyyj6VO5WeTUd3Nk
 +b9UILFroMGLF9KUVM0IPLSn8Q==
X-Google-Smtp-Source: ABdhPJwD+S7K+2xo6XGPzpZWOm/R/Wcr70/IAr4BByEl7I7vZ/Ps4PA7dJVttdYLp/fDi5wADTpg5g==
X-Received: by 2002:a1c:4b14:: with SMTP id y20mr2838766wma.6.1610734603340;
 Fri, 15 Jan 2021 10:16:43 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 15 Jan 2021 18:15:59 +0000
Message-Id: <20210115181601.3432599-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Jan 2021 22:51:40 +0000
Subject: [Nouveau] [PATCH 27/29] drm/nouveau/nouveau_bios: Remove unused
 variable 'pdev' from 'nouveau_bios_init()'
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
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmM6IEluIGZ1bmN0aW9uIOKAmG5vdXZlYXVf
Ymlvc19pbml04oCZOgogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iaW9zLmM6MjA4
NjoxODogd2FybmluZzogdmFyaWFibGUg4oCYcGRlduKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9iaW9zLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jpb3MuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCmluZGV4IDdjYzY4M2I4ZGM3YTYuLmU4YzQ0NWVi
MTEwMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmlvcy5jCkBAIC0yMDgzLDEz
ICsyMDgzLDExIEBAIG5vdXZlYXVfYmlvc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7
CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShkZXYpOwogCXN0cnVjdCBu
dmJpb3MgKmJpb3MgPSAmZHJtLT52YmlvczsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldjsKIAlpbnQg
cmV0OwogCiAJLyogb25seSByZWxldmFudCBmb3IgUENJIGRldmljZXMgKi8KIAlpZiAoIWRldl9p
c19wY2koZGV2LT5kZXYpKQogCQlyZXR1cm4gMDsKLQlwZGV2ID0gdG9fcGNpX2RldihkZXYtPmRl
dik7CiAKIAlpZiAoIU5WSW5pdFZCSU9TKGRldikpCiAJCXJldHVybiAtRU5PREVWOwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
