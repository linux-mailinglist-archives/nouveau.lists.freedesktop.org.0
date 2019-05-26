Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789562D471
	for <lists+nouveau@lfdr.de>; Wed, 29 May 2019 06:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9296E077;
	Wed, 29 May 2019 04:10:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FD189D00;
 Sun, 26 May 2019 11:06:30 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a5so5904431pls.12;
 Sun, 26 May 2019 04:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=vt37nqdxlvUB79ggM15T2/FTTWBxfQWNhWkq11PROKQ=;
 b=l0xvVsLj3+u3SdGnkGb6WiJw1RE3qU9l0ffmf/GfSOVre8Ro58saus+4HzOA5h7hEB
 Gp7+i9ShneDJEpeaj1nbbNygC9+XWbRnxdP1iGomThV5Nx27oCp2nh9TX7FkjfYqBA9/
 1tYrzEH5aZ5G0Wt7il/bfUZ1IIGVBMxfjDT/FshSonjWl3kvZscMLSuV28uOMpMWhPNl
 ZUSHT184ZkO7WfuWaOptFhJZGiLwTAMY0tKD/JeeymAVn2Qpvy+6usrrpcvdFL6+8RTI
 11DG9vsehdxzlcu7tYNDbPIxCO1MG76PcnqzrDiY78QLHeu+R4XcWBLTBuwTogZ0qpEV
 C+Sw==
X-Gm-Message-State: APjAAAX+2aMuiW5Zx5mNHbcVGtjdZGEa9l8Qlr53S4zCQ5MJMlCKaZvP
 sUQPKMVsTw72jEveK4xJphU=
X-Google-Smtp-Source: APXvYqy4cPE5PR9Hq/DSIi+6zKOL0c30nNvj1cvkRhBjHOi+pePjkOCD21SRo6BUuxGBnPb8jTlJgQ==
X-Received: by 2002:a17:902:e30b:: with SMTP id
 cg11mr120042307plb.3.1558868790574; 
 Sun, 26 May 2019 04:06:30 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
 by smtp.gmail.com with ESMTPSA id z7sm9343311pfr.23.2019.05.26.04.06.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 04:06:30 -0700 (PDT)
Date: Sun, 26 May 2019 16:36:25 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <20190526110625.GA3143@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 29 May 2019 04:10:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=vt37nqdxlvUB79ggM15T2/FTTWBxfQWNhWkq11PROKQ=;
 b=oZY5h4tGiVYinWyRxT4+1A4A+uF6w2KMaCBv+yFqFaeRS84d+1dj/uLlcm5HJK2QEh
 F62VzSUcL6oZJzCV2Y2W6uU7mRSwWEP0tS4q+1FJxeETehd3qC3uzciM4atAmRGBTjay
 aRO6oeswN8RJxrGce2AOsB6C3EBsYfOMFCQuYG3R9scC7sRrRy3xa9+DbS/vazfBRfkC
 bTA7yaeIHkO17h8P/INMiYBXWkXoxWr0ijlXBRvMNtzO0VqJTnqhH3ZbmgaACeD6iTc4
 PuNwrQJ0qmIUB6Q9MwO9fHDdc/PWbyyGrMqtOloXnoeDJ5Xq0+Bp8vgVFOyAvRuYm7Cn
 FG2g==
Subject: [Nouveau] [PATCH] drm/nouveau: fix nvif/device.h is included more
 than once
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

cmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdXNpb24gb2YgbnZpZi9kZXZpY2UuaAoKSXNzdWUgaWRlbnRp
ZmllZCBieSBpbmNsdWRlY2hlY2sKClNpZ25lZC1vZmYtYnk6IEhhcmlwcmFzYWQgS2VsYW0gPGhh
cmlwcmFzYWQua2VsYW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZHJ2LmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJ2LmgKaW5kZXggMzVmZjBjYS4uY2ZlYmIxNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCkBAIC0xMjcsNyArMTI3LDYgQEAgbm91dmVh
dV9jbGkoc3RydWN0IGRybV9maWxlICpmcHJpdikKIH0KIAogI2luY2x1ZGUgPG52aWYvb2JqZWN0
Lmg+Ci0jaW5jbHVkZSA8bnZpZi9kZXZpY2UuaD4KIAogc3RydWN0IG5vdXZlYXVfZHJtIHsKIAlz
dHJ1Y3Qgbm91dmVhdV9jbGkgbWFzdGVyOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
