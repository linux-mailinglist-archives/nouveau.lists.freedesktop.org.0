Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72672B3D1F
	for <lists+nouveau@lfdr.de>; Mon, 16 Sep 2019 17:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED5B6E9BB;
	Mon, 16 Sep 2019 15:04:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98796E9BD;
 Mon, 16 Sep 2019 15:04:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r4so382437edy.4;
 Mon, 16 Sep 2019 08:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=QNZxBsjBnK+yh8LTIZzmpysRdaLWhAH1h9mCGUtacDQU8O5OH8bJ5Wd9ChzuCMaLu7
 oeafGL5sg1u5aQFcJbcF/ncgLm7AOH2mZrgXBW6o//S0PbQSSWLCXRSpyJLKe2f+3PhE
 wlN0kboa2VjlpibW1o6R/SGJsk2Xj//94YhcjdpbD9LJUAbIf/6lgiIsznJgI+COtVFZ
 bqn5G7RfFrxR2P2GTwTfEFLmRMBj3SuXM+Db+nXXvXco14eoZMQxUjqjzFxK40CWcucN
 eH5s3eQVILbOc9ObvXrsaTv2VY4AMJPtEVJ4e6rWlT6kDRVZzpbis0LesNQOifQAfhUe
 VmGw==
X-Gm-Message-State: APjAAAVldKJ4369wIvzNXj4SDq2+4p5bnXeHTlV1w1j+eGTumqEw/GD+
 rlVghumFU5FVqJ/30K7lvJM=
X-Google-Smtp-Source: APXvYqwQYM/jep+uQY8ryx0IupNXrcssF3uFD6H5Sz9kk2SVEgc4TyFPeC76+VT0Cny/s2Oled2cgQ==
X-Received: by 2002:a50:ec84:: with SMTP id e4mr63730127edr.193.1568646259320; 
 Mon, 16 Sep 2019 08:04:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id qx25sm1379638ejb.61.2019.09.16.08.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:04:17 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 16 Sep 2019 17:04:03 +0200
Message-Id: <20190916150412.10025-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1tTzvYM5w9+u5hVDlIZGuSZUZEgZbCTm+ltdJcT/B4=;
 b=c2lXS8CJSnfav5ofaOvfzFlnEUvOjdwi1Y1UOQYq+PCD8YVubB+CQdtitMlDads9rD
 nq7BmSaG/Y/XEy+qAmOA1MKqm/8HV+30fEpgaPsQBmByPFz4hD+Ze13EXhSXlImc6xBp
 UKCTx2urdlcsj3VrlyVCRe0Ef+piETXHBkXZ2LHJA9CjNAIXE+3PxK45ioTM+08KVAVG
 yZ0V9Lsz0dHaVx83ihsVUDTJ3259qb+es2CRFZ2Jf8LCJhoj6tx2ITjhD2Rqfv6ZCgQb
 4w5VxcoyYXMGFrNhdmRVjwc+klo6DG9xfNs15qIhQGIfQO5rPVedbO2a6x3wMFJDoefF
 K6bg==
Subject: [Nouveau] [PATCH 02/11] drm/nouveau: tegra: Set clock rate if not
 set
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBHUFUgY2xv
Y2sgaGFzIG5vdCBoYWQgYSByYXRlIHNldCwgaW5pdGlhbGl6ZSBpdCB0byB0aGUgbWF4aW11bQpj
bG9jayByYXRlIHRvIG1ha2Ugc3VyZSBpdCBkb2VzIHJ1bi4KClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL3RlZ3JhLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwppbmRleCA3NDdhNzc1MTIxY2YuLmQwZDUyYzFk
NGFlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2
aWNlL3RlZ3JhLmMKQEAgLTI3OSw2ICsyNzksNyBAQCBudmttX2RldmljZV90ZWdyYV9uZXcoY29u
c3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1bmMsCiAJCSAgICAgIHN0cnVjdCBu
dmttX2RldmljZSAqKnBkZXZpY2UpCiB7CiAJc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhICp0ZGV2
OworCXVuc2lnbmVkIGxvbmcgcmF0ZTsKIAlpbnQgcmV0OwogCiAJaWYgKCEodGRldiA9IGt6YWxs
b2Moc2l6ZW9mKCp0ZGV2KSwgR0ZQX0tFUk5FTCkpKQpAQCAtMzA3LDYgKzMwOCwxNyBAQCBudmtt
X2RldmljZV90ZWdyYV9uZXcoY29uc3Qgc3RydWN0IG52a21fZGV2aWNlX3RlZ3JhX2Z1bmMgKmZ1
bmMsCiAJCWdvdG8gZnJlZTsKIAl9CiAKKwlyYXRlID0gY2xrX2dldF9yYXRlKHRkZXYtPmNsayk7
CisJaWYgKHJhdGUgPT0gMCkgeworCQlyZXQgPSBjbGtfc2V0X3JhdGUodGRldi0+Y2xrLCBVTE9O
R19NQVgpOworCQlpZiAocmV0IDwgMCkKKwkJCWdvdG8gZnJlZTsKKworCQlyYXRlID0gY2xrX2dl
dF9yYXRlKHRkZXYtPmNsayk7CisKKwkJZGV2X2RiZygmcGRldi0+ZGV2LCAiR1BVIGNsb2NrIHNl
dCB0byAlbHVcbiIsIHJhdGUpOworCX0KKwogCWlmIChmdW5jLT5yZXF1aXJlX3JlZl9jbGspCiAJ
CXRkZXYtPmNsa19yZWYgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgInJlZiIpOwogCWlmIChJ
U19FUlIodGRldi0+Y2xrX3JlZikpIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
