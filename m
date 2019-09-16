Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF9B3D74
	for <lists+nouveau@lfdr.de>; Mon, 16 Sep 2019 17:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C446E9D3;
	Mon, 16 Sep 2019 15:18:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704E36E9D3;
 Mon, 16 Sep 2019 15:18:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so39287341wrx.5;
 Mon, 16 Sep 2019 08:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNTZhT83ANirS54NUokQWpj6aubFkaSlaInvQLAgmTk=;
 b=GdVe8XslfrMY3cujwf+67IJVABCzpSeYGx8jxD7RTNxsRluQ7bxN+B5cmu4DaSlVEE
 zQthFBa9xNQ3EpMPhpFOSLeygfictecNWyCEptTpOOBZnXJINHaFsvWmrs9WAWK8Xcuo
 dmqQUTnlLIhqMwQICzgCsAhaHhFEO+I9VdXm6opJoTpG+7KLwFY1RVr/tg93HQJcQYv3
 ZI3Wfx5vskcX95K2fPBfJHDDnR6yn93Trz26cEY1TKQA4zM+NaeFoFEUmn92eaP9uG8n
 oNNDL+iFdjbjEgP8A4P5v0KwCa43sdfTPteQnjY35CfJFYegUW2woxQvzRbSVR2owv8e
 aEyA==
X-Gm-Message-State: APjAAAUI4jZW/XvW1GKaWtGdCRPGejlzOiWGqPlqA10xawUg0RclMIAf
 evXUcTC5fFvqsKtnh3O7Xec=
X-Google-Smtp-Source: APXvYqxE5yuLjMwfES0AESIkN8aXpLueKMewVOOjt+7oKHkSfj8ZBL3xosubP3sbk63EqV2gn+F06Q==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr226635wrn.307.1568647083836;
 Mon, 16 Sep 2019 08:18:03 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y14sm55359922wrd.84.2019.09.16.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:18:02 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Sep 2019 17:17:53 +0200
Message-Id: <20190916151757.10953-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916151757.10953-1-thierry.reding@gmail.com>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNTZhT83ANirS54NUokQWpj6aubFkaSlaInvQLAgmTk=;
 b=bylDQCjBt5f5v9nVB9iFllucCQmqKgghtEOak9wpKZq8FxGbQpf76geh++5NXCspaV
 0Ev60AhBP3mUIYB3d3Ui23ewX174eftKVtTQdcH1tnfr3usKV5d+2YpwA6wB0u+BVawq
 V5D3/+tD07AGpjCMxhFwLNQIoiZ1PKqMikculdntjMCDIeOJ8XPMUvUxbsENr+cSlaMF
 bhT6p0ofA8cgo/4wetd32+qJdmoqI72awIgxckKWBOTFLfcGuilEgubAD/D3Cmn9BcLa
 ItV5X2poCkIAXPbWrbkIjd2puLx+GroIqeduIiZynSYY9adGCS3gd34/20Ddb61zVL+E
 uraA==
Subject: [Nouveau] [PATCH 2/6] drm/nouveau: fault: Widen engine field
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBlbmdpbmUgZmll
bGQgaW4gdGhlIEZJRk8gZmF1bHQgaW5mb3JtYXRpb24gcmVnaXN0ZXJzIGlzIGFjdHVhbGx5IDkK
Yml0cyB3aWRlLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlh
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9mYXVsdC9ndjEw
MC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQv
Z3YxMDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAw
LmMKaW5kZXggYjVlMzIyOTUyMzdiLi4yODMwNmM1ZjY2NTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2ZhdWx0L2d2MTAwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZmF1bHQvZ3YxMDAuYwpAQCAtMTM3LDggKzEzNyw4
IEBAIGd2MTAwX2ZhdWx0X2ludHJfZmF1bHQoc3RydWN0IG52a21fZmF1bHQgKmZhdWx0KQogCWlu
Zm8uYWRkciA9ICgodTY0KWFkZHJoaSA8PCAzMikgfCBhZGRybG87CiAJaW5mby5pbnN0ID0gKCh1
NjQpaW5zdGhpIDw8IDMyKSB8IChpbmZvMCAmIDB4ZmZmZmYwMDApOwogCWluZm8udGltZSA9IDA7
Ci0JaW5mby5lbmdpbmUgPSAoaW5mbzAgJiAweDAwMDAwMGZmKTsKIAlpbmZvLmFwZXJ0dXJlID0g
KGluZm8wICYgMHgwMDAwMGMwMCkgPj4gMTA7CisJaW5mby5lbmdpbmUgPSAoaW5mbzAgJiAweDAw
MDAwMWZmKTsKIAlpbmZvLnZhbGlkICA9IChpbmZvMSAmIDB4ODAwMDAwMDApID4+IDMxOwogCWlu
Zm8uZ3BjICAgID0gKGluZm8xICYgMHgxZjAwMDAwMCkgPj4gMjQ7CiAJaW5mby5odWIgICAgPSAo
aW5mbzEgJiAweDAwMTAwMDAwKSA+PiAyMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
