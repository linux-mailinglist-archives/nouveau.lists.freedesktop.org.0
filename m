Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F26116CB5
	for <lists+nouveau@lfdr.de>; Mon,  9 Dec 2019 13:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04C6E42F;
	Mon,  9 Dec 2019 12:00:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A1B6E439;
 Mon,  9 Dec 2019 12:00:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so14620489wmi.3;
 Mon, 09 Dec 2019 04:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
 b=DBFZOF11FCfD/6mQQFnXnCaZKswJZxkGyIHqNs7HNcJX+ZCFr0wEu/nMYIO6id09pt
 ue0cN3r63+MoF3EWX7caf4lKqLnS/SvJSnCVSYVVTXpqnEvC+jlW7LsXqwbn5ivxU8+h
 1scE/zjf4M2S5VeAuO+enR7D0LfK6MJqwT0lsHev2hDnfelrRB2CbBTi1Q+P/ObaEVkW
 1QzhOjxeUQgsnCHHMD1FpyS3VfHiDlLoivwtY3p8+/JszBAd+hCNdFsyKoA9gPyTpSVW
 wIR2LYp0v892hcx6FjbLWh66gT/IThpx1LMWn6VtCJw2RdEWJEe5ErAWjlex3+kbvO2L
 +DTw==
X-Gm-Message-State: APjAAAXE4HdNxFDLXhlVAa78oQIh5FxDzKpH24Y8R1Zhb5pEVcTbYtcg
 fEymrbr8KID3CdEzyURqINM=
X-Google-Smtp-Source: APXvYqwKIXZ/lXiOYFdsUXHqh0kNtYZfFbMT/CChCt4KHa9eSuuvZ5vhaaf3RW3PIdOimww2wv4/zw==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr24015907wmj.105.1575892815703; 
 Mon, 09 Dec 2019 04:00:15 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id a78sm12038740wme.9.2019.12.09.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:00:14 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  9 Dec 2019 13:00:00 +0100
Message-Id: <20191209120005.2254786-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/XOpyZsqG/KWvoSisq6x7AhYat6zso8yO/F5thGj3A=;
 b=YQ4tBVvZm7q1NFbRpNhvsjkaHYJErSU7MKuJbBquAJbCD7/ye0m706FMsJ3DPetesS
 TMJcsNW8KXAtebsAXU8nBeuTOpGKEDDw5XxlFF9WSpkwntHbkDpcwzLKl11n+kXmslvG
 qL0kmFAPqo4itQJBEt+7Elt0zDKiZzT61XVMkW5kTaZwXxhculSaBr/O29cn7Yq3TNM8
 bv2yD3oFJy8Mv3QnYc6FSbGHQC61b20oW2OHoHpzQ47kqushGoSb0EWhuR2U4YLyiQ/2
 OhAm5KFpHPduHDXKwh6a/pGmEiy1JRofZmccSfzJjpTbS7olaQ+Y3R6XIA26WLGTS/De
 kOWg==
Subject: [Nouveau] [PATCH v3 4/9] drm/nouveau: tegra: Do not try to disable
 PCI device
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
 Joerg Roedel <joro@8bytes.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gTm91dmVhdSBp
cyBpbnN0YW50aWF0ZWQgb24gdG9wIG9mIGEgcGxhdGZvcm0gZGV2aWNlLCB0aGUgZGV2LT5wZGV2
CmZpZWxkIHdpbGwgYmUgTlVMTCBhbmQgY2FsbGluZyBwY2lfZGlzYWJsZV9kZXZpY2UoKSB3aWxs
IGNyYXNoLiBNb3ZlIHRoZQpQQ0kgZGlzYWJsaW5nIGNvZGUgdG8gdGhlIFBDSSBzcGVjaWZpYyBk
cml2ZXIgcmVtb3ZhbCBjb2RlLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRp
bmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCAyY2Q4Mzg0OTYwMGYuLmI2
NWFlODE3ZWFiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
cm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jCkBAIC03MTUs
NyArNzE1LDYgQEAgc3RhdGljIGludCBub3V2ZWF1X2RybV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIHZvaWQKIG5vdXZlYXVfZHJtX2RldmljZV9yZW1vdmUoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGRldi0+cGRldjsKIAlzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7CiAJc3RydWN0IG52a21fY2xpZW50ICpj
bGllbnQ7CiAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2U7CkBAIC03MjcsNyArNzI2LDYgQEAg
bm91dmVhdV9kcm1fZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRldmlj
ZSA9IG52a21fZGV2aWNlX2ZpbmQoY2xpZW50LT5kZXZpY2UpOwogCiAJbm91dmVhdV9kcm1fZGV2
aWNlX2ZpbmkoZGV2KTsKLQlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7CiAJZHJtX2Rldl9wdXQo
ZGV2KTsKIAludmttX2RldmljZV9kZWwoJmRldmljZSk7CiB9CkBAIC03MzgsNiArNzM2LDcgQEAg
bm91dmVhdV9kcm1fcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAKIAlub3V2ZWF1X2RybV9kZXZpY2Vf
cmVtb3ZlKGRldik7CisJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwogfQogCiBzdGF0aWMgaW50
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
