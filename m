Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BDB3D28
	for <lists+nouveau@lfdr.de>; Mon, 16 Sep 2019 17:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BF06E9C5;
	Mon, 16 Sep 2019 15:04:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319E6E9C3;
 Mon, 16 Sep 2019 15:04:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h33so330805edh.12;
 Mon, 16 Sep 2019 08:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tEI35h92cKRPz8atJCk7hAGkg2y7SwNbjm+2sjYk9Pk=;
 b=nMxuE6c53GDwx4R9ckQsSi/vYdDLt2FCOnOcXjsNxZ/htwqZ8dxorFfpQdh/Lq1OrZ
 hBVO+bAfXcP0RHg0fmRth5wzWyZ5FonJwg1Qojg2lti7I1TVTjz/BoUia8dQz4BlfGa6
 PuzU+rJzLFdg3875hn5A7VFgCPg7sWxGZH8FFRu1UOt4ugbsLj9zCT6T5mki9CzvVji0
 0vD9shoqNA+gExayRg7ccH71kaJ4waxBIoNxmjTTHDFWCrNkzMnCyfAeYePNGBPgU28j
 BP2f4T2W3mDRUs8cOjeoZZ3kw5AG5eJ/70aV9I5B+FYa8WPODylfMx2dQ0oieShj2eCF
 8dqw==
X-Gm-Message-State: APjAAAXndvMZlDDfCP1w18kVLvjfc1j3H9IqaRpZhgxlH1Rc0pC4MqMI
 5w4iHq+N2RvwXdKTCpza3J2UOcII
X-Google-Smtp-Source: APXvYqzvIaYhzg3s8/ZVisWsNvZKBFDkzIjVhtduBhgMy+imM0QojIwA3iv3W6whbTfuVCGCdfJd+Q==
X-Received: by 2002:a17:907:20a2:: with SMTP id
 pw2mr409608ejb.163.1568646267848; 
 Mon, 16 Sep 2019 08:04:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x12sm3576830ejv.69.2019.09.16.08.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 16 Sep 2019 17:04:06 +0200
Message-Id: <20190916150412.10025-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tEI35h92cKRPz8atJCk7hAGkg2y7SwNbjm+2sjYk9Pk=;
 b=LTkhXfTW7bFcAfitrOFPNRRYMEvgMbD48xTU63SQYgRdfkR2sIPv9BdrYgCQqV/dA0
 b3uq2CmPLGOOIK/tRQ2zHKu3L923Cvc3fOwMjNEI2i/PS/KkodgJ509Cz6Raduix/KYn
 bu1dEuXHFwO6itMgz9+Zgo7s1nLU0Pn8J+PoRHVhzqy6Bk2ZgG4YPS2k1igDQ05cdIdg
 msdJpWouJ7rB4+m0U+XY83GuuZnPBxquUzYwBb9Yy4uQZnVPMyOYuvTuNQR3hSiGzrXE
 nNil+VntfoDP/SNL49VxbUzXXtRKiRd9Ek95dtz1aXnGETMsZoA44VsElviGhA0++CiA
 y6nw==
Subject: [Nouveau] [PATCH 05/11] drm/nouveau: gp10b: Use correct copy engine
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCmdwMTBiIHVzZXMgdGhl
IG5ldyBlbmdpbmUgZW51bWVyYXRpb24gbWVjaGFuaXNtIGludHJvZHVjZWQgaW4gdGhlIFBhc2Nh
bAphcmNoaXRlY3R1cmUuIEFzIGEgcmVzdWx0LCB0aGUgY29weSBlbmdpbmUsIHdoaWNoIHVzZWQg
dG8gYmUgYXQgaW5kZXggMgpmb3IgcHJpb3IgVGVncmEgR1BVIGluc3RhbnRpYXRpb25zLCBoYXMg
bm93IG1vdmVkIHRvIGluZGV4IDAuIEZpeCB1cCB0aGUKaW5kZXggYW5kIGFsc28gdXNlIHRoZSBn
cDEwMCB2YXJpYW50IG9mIHRoZSBjb3B5IGVuZ2luZSBjbGFzcyBiZWNhdXNlIG9uCmdwMTBiIHRo
ZSBQQVNDQUxfRE1BX0NPUFlfQiBjbGFzcyBpcyBub3Qgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMKaW5kZXggZDJkNmQ1ZjQwMjhhLi45
OWQzZmEzZmFkODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2RldmljZS9iYXNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGV2aWNlL2Jhc2UuYwpAQCAtMjM4Nyw3ICsyMzg3LDcgQEAgbnYxM2JfY2hpcHNldCA9IHsK
IAkucG11ID0gZ20yMGJfcG11X25ldywKIAkudGltZXIgPSBnazIwYV90aW1lcl9uZXcsCiAJLnRv
cCA9IGdrMTA0X3RvcF9uZXcsCi0JLmNlWzJdID0gZ3AxMDJfY2VfbmV3LAorCS5jZVswXSA9IGdw
MTAwX2NlX25ldywKIAkuZG1hID0gZ2YxMTlfZG1hX25ldywKIAkuZmlmbyA9IGdwMTBiX2ZpZm9f
bmV3LAogCS5nciA9IGdwMTBiX2dyX25ldywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
