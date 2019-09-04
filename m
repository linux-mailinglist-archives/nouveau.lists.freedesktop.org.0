Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D9A8121
	for <lists+nouveau@lfdr.de>; Wed,  4 Sep 2019 13:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C02892A0;
	Wed,  4 Sep 2019 11:34:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DA68925F
 for <nouveau@lists.freedesktop.org>; Wed,  4 Sep 2019 11:34:35 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C5F8880F91
 for <nouveau@lists.freedesktop.org>; Wed,  4 Sep 2019 11:34:34 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id e14so11807164wrd.23
 for <nouveau@lists.freedesktop.org>; Wed, 04 Sep 2019 04:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwoRyPWJCJKFdxApX5peqZNAkoNSySQC7LIoJK1n4JU=;
 b=oQwi1psdpF1qxK5uV/7yQtF8gXB2TS4oy8fzcly8jOulWKWoUaHv1o6PyudMAX87iN
 Qkpvqsfg/VPKCcfLO+UxEKo04VyT6GA7PF13TTf8dz+h4I5RsErmSH6hITA7n1zbf3Cs
 tEuKQvenEaBsXh+QpxyMZ0NbxVrae+uQesPNBqCsdzw1KFBHbNiOfeaODtEqTkTBd8W4
 ALXY9BIPveiZ1tAIwOzkAtKtcAxk1VN8Dzk5UFEb8I2riMSCDrye97lw8Me2AKZOfEdE
 mwJ001jfDZ571TjPGZLxH9ggiT+AcvCVlk8MUXvr1pgi67zbzwKLEvy/mr3P5o+1T8F6
 IW5Q==
X-Gm-Message-State: APjAAAWfCtwvJtLZlhgCG2zQCVQG50Kf36tZIjLRNBj3X2dJBu2IC4Mg
 q7X76Fr13heiLjyiKPm/SKeH3l/04O+ObF93GVEFC0T/nnX+DbNvmrdEgOn/Y13qPwMYXTh+KD0
 T9U1mlodO9wt5bmq6j9Ce3oyV2w==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr3705420wma.136.1567596873383; 
 Wed, 04 Sep 2019 04:34:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy253f1BTKA8L5AV6eXgjwu9FPdZRt5jxveuFn77UpRJOmk04nwnAIyifp/ScEh5oI1H5nrtQ==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr3705404wma.136.1567596873161; 
 Wed, 04 Sep 2019 04:34:33 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h125sm4844930wmf.31.2019.09.04.04.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:34:32 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  4 Sep 2019 13:34:03 +0200
Message-Id: <20190904113403.13078-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [RFC PATCH] clk: Remove BYPASS_PLL_CHECK from PLLs
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

SSBoYXZlIGxvb2tlZCBhdCBwcm9ibGVtIHdpdGggRmVybWkgR1BVcyB3aGVyZSBjaGFuZ2luZyB0
byBoaWdoZXIgY2xvY2sKbGVkIHRvIHJlYWxseSBiYWQgcGVyZm9tYW5jZSAod2l0aCBHcHVUZXN0
IDIweCB3b3JzZSBwZXJmb21hbmNlKSBhbmQgbGF0ZXIgYWxzbyBjcmFzaGVzIG9mIHRoZSBub3V2
ZWF1LiBJdCBzZWVtZWQKdG8gYmUgYWZmZWN0ZWQgYnkgU2hhZGVyIENsb2NrIGluIFZvbHRhZ2Ug
RW50cmllcyBpbiB0aGUgdmlkZW8gQklPUy4gRGlzYWJsaW5nCkJZUEFTU19QTExfQ0hFQ0sgaW4g
Q0xLMF9DVFJMIHNlZW1zIHRvIGNvbXBsZXRlbHkgZml4IHRoZSBpc3N1ZS4gSSBoYXZlCnRyaWVk
IHRvIHNlYXJjaCB0aGlzIEJZUEFTU19QTExfQ0hFQ0sgaW4gTnZpZGlhIHRyYWNlcyBidXQgc2Vl
bWVkIGl0Cndhc24ndCB1c2VkIG5vd2hlcmUgZm9yIENMSyBzZXR0aW5ncy4KClJlbW92aW5nIHRo
aXMgd29ya3MgZmluZSwgYnV0IEkgZG9uJ3Qga25vdyB3aGF0IGl0J3MgcmVhbGx5IGZvci4KQWN0
dWFsIGJpdCBzZXR0aW5nIHRoaXMgQllQQVNTX1BMTF9DSEVDSyBpcyBvbiAweDEwOgoJbG9va3Vw
IC1hYzAgMHgxMzcwMDAgMHgxMAoJUENMT0NLLkNMSzBfQ1RSTCA9PiB7IEJZUEFTU19QTExfQ0hF
Q0sgfCBVTksxMiA9IDAgfQpBbHNvLCBkaXNhYmxpbmcgdGhpcyBiaXQgb24gb3RoZXIgQ0xLcyBk
b2Vzbid0IHNlZW0gdG8gYnJlYWsgYW55dGhpbmcuClRlc3RlZCB3aXRoIEdGMTE5IE5WUyAzMTAu
CgpTaWduZWQtb2ZmLWJ5OiBNYXJrIE1lbnp5bnNraSA8bW1lbnp5bnNAcmVkaGF0LmNvbT4KLS0t
CiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2YxMDAuYyB8IDggLS0tLS0tLS0KIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2Nsay9nazEwNC5jIHwgOCAtLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9jbGsvZ2YxMDAuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jCmluZGV4
IDdmNjdmOWY1Li43YmEyYTAwMCAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
Y2xrL2dmMTAwLmMKKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2dmMTAwLmMKQEAg
LTM3NSwxNCArMzc1LDYgQEAgZ2YxMDBfY2xrX3Byb2dfMihzdHJ1Y3QgZ2YxMDBfY2xrICpjbGss
IGludCBpZHgpCiAJCQludmttX3dyMzIoZGV2aWNlLCBhZGRyICsgMHgwNCwgaW5mby0+Y29lZik7
CiAJCQludmttX21hc2soZGV2aWNlLCBhZGRyICsgMHgwMCwgMHgwMDAwMDAwMSwgMHgwMDAwMDAw
MSk7CiAKLQkJCS8qIFRlc3QgUExMIGxvY2sgKi8KLQkJCW52a21fbWFzayhkZXZpY2UsIGFkZHIg
KyAweDAwLCAweDAwMDAwMDEwLCAweDAwMDAwMDAwKTsKLQkJCW52a21fbXNlYyhkZXZpY2UsIDIw
MDAsCi0JCQkJaWYgKG52a21fcmQzMihkZXZpY2UsIGFkZHIgKyAweDAwKSAmIDB4MDAwMjAwMDAp
Ci0JCQkJCWJyZWFrOwotCQkJKTsKLQkJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAw
eDAwMDAwMDEwLCAweDAwMDAwMDEwKTsKLQogCQkJLyogRW5hYmxlIHN5bmMgbW9kZSAqLwogCQkJ
bnZrbV9tYXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMDQsIDB4MDAwMDAwMDQpOwog
CQl9CmRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2sxMDQuYyBiL2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nazEwNC5jCmluZGV4IDBiMzdlM2RhLi4zYTA3ZTAz
MiAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2drMTA0LmMKKysrIGIv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2drMTA0LmMKQEAgLTM5NCwxNCArMzk0LDYgQEAg
Z2sxMDRfY2xrX3Byb2dfMihzdHJ1Y3QgZ2sxMDRfY2xrICpjbGssIGludCBpZHgpCiAJCW52a21f
d3IzMihkZXZpY2UsIGFkZHIgKyAweDA0LCBpbmZvLT5jb2VmKTsKIAkJbnZrbV9tYXNrKGRldmlj
ZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMDEsIDB4MDAwMDAwMDEpOwogCi0JCS8qIFRlc3QgUExM
IGxvY2sgKi8KLQkJbnZrbV9tYXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMTAsIDB4
MDAwMDAwMDApOwotCQludmttX21zZWMoZGV2aWNlLCAyMDAwLAotCQkJaWYgKG52a21fcmQzMihk
ZXZpY2UsIGFkZHIgKyAweDAwKSAmIDB4MDAwMjAwMDApCi0JCQkJYnJlYWs7Ci0JCSk7Ci0JCW52
a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAwMDAwMDEwLCAweDAwMDAwMDEwKTsKLQog
CQkvKiBFbmFibGUgc3luYyBtb2RlICovCiAJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAw
LCAweDAwMDAwMDA0LCAweDAwMDAwMDA0KTsKIAl9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
