Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFCAD511
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2019 10:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7228999C;
	Mon,  9 Sep 2019 08:47:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307FC8999C
 for <nouveau@lists.freedesktop.org>; Mon,  9 Sep 2019 08:47:34 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 55BB02F366A
 for <nouveau@lists.freedesktop.org>; Mon,  9 Sep 2019 08:47:33 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id h6so4566971wrh.6
 for <nouveau@lists.freedesktop.org>; Mon, 09 Sep 2019 01:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GNJZ7TkCz+jZRboSy3Ag14UN8Zea5NRrW2ByXsS2sVk=;
 b=Gj9iSDaYUxs15I98QEl4eQHZ761xQdU9ukAKTOK+V4HKhsiBywUciYfW/y4Grehlrc
 hrR//0n9x/0ZHjVR9HwBhB25WH7Fowd0Y/Ds3p00RU14efODoFDmpaBotyMohxXEIFWA
 hy9+q0v8cWxaQKJDyqzIyagogZxY2Q1m9cMtJ+IOtKmnWkx6kvqBjHPAvGK2e4rokKGQ
 LyszudcZ4eHhBzNopS/oPlNuvlXkH1hBcS6W3wnfYVBKGDWX7z2njpBMVoEcfBPX6Z4i
 VH5aNur2bkb+hER5f01S+zIobBVcqfgMEv68uP8Ihr0RBkmx+T/RS7uKtNMTDCsDFlb8
 bgaw==
X-Gm-Message-State: APjAAAUJtjm24GDkNqNYw4rhr1pg/S+Oo/FjE9OKmFuI6Wek1k1+96/8
 1/CXcnNjAkr7T/HBzXfVubOXWypxFDMec7huh77gbpfTrf6hTmdyUqZb8OizBN/KVUhcxFK1wo4
 GcZHS4czWImq/rU+RMc5MLXTVPA==
X-Received: by 2002:adf:e548:: with SMTP id z8mr17695788wrm.324.1568018851897; 
 Mon, 09 Sep 2019 01:47:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4dyB5/0/kph+iT7lmevgnTBNUI+q5IsJwMp+Sbl+92CzrYTa65pduYx2GzthiCZ4F7StRIA==
X-Received: by 2002:adf:e548:: with SMTP id z8mr17695772wrm.324.1568018851670; 
 Mon, 09 Sep 2019 01:47:31 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id r9sm25325456wra.19.2019.09.09.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 01:47:31 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon,  9 Sep 2019 10:47:28 +0200
Message-Id: <20190909084728.13349-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4] clk: Restore BYPASS_PLL_CHECK from PLLs
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
b2Vzbid0IHNlZW0gdG8gYnJlYWsgYW55dGhpbmcuCgp2MjogYWRkIGJhY2sgUExMIGxvY2sgdGVz
dAp2MzogYWRkIHJlc3RvcmluZyBvcmlnaW5hbCB2YWx1ZSBhZnRlciBQTEwgbG9jayB0ZXN0CnY0
OiByZWFkIHRoZSBiaXQgd2l0aCBudmttX21hc2sKClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVuenlu
c2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2Ns
ay9nZjEwMC5jIHwgOCArKysrKy0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2drMTA0
LmMgfCA2ICsrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2dmMTAwLmMg
Yi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2YxMDAuYwppbmRleCA3ZjY3ZjlmNS4uNTEw
YWI4Y2UgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jCisr
KyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jCkBAIC0zNjgsNiArMzY4LDcg
QEAgZ2YxMDBfY2xrX3Byb2dfMihzdHJ1Y3QgZ2YxMDBfY2xrICpjbGssIGludCBpZHgpCiAJc3Ry
dWN0IGdmMTAwX2Nsa19pbmZvICppbmZvID0gJmNsay0+ZW5nW2lkeF07CiAJc3RydWN0IG52a21f
ZGV2aWNlICpkZXZpY2UgPSBjbGstPmJhc2Uuc3ViZGV2LmRldmljZTsKIAljb25zdCB1MzIgYWRk
ciA9IDB4MTM3MDAwICsgKGlkeCAqIDB4MjApOworCWJvb2wgYnlwYXNzX3N0YXRlID0gZmFsc2U7
CiAJaWYgKGlkeCA8PSA3KSB7CiAJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAw
MDAwMDA0LCAweDAwMDAwMDAwKTsKIAkJbnZrbV9tYXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4
MDAwMDAwMDEsIDB4MDAwMDAwMDApOwpAQCAtMzc2LDEyICszNzcsMTMgQEAgZ2YxMDBfY2xrX3By
b2dfMihzdHJ1Y3QgZ2YxMDBfY2xrICpjbGssIGludCBpZHgpCiAJCQludmttX21hc2soZGV2aWNl
LCBhZGRyICsgMHgwMCwgMHgwMDAwMDAwMSwgMHgwMDAwMDAwMSk7CiAKIAkJCS8qIFRlc3QgUExM
IGxvY2sgKi8KLQkJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAwMDAwMDEwLCAw
eDAwMDAwMDAwKTsKKwkJCWJ5cGFzc19zdGF0ZSA9IG52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAw
eDAwLCAweDAwMDAwMDEwLCAweDAwMDAwMDAwKSAmIDB4MDAwMDAwMTA7CiAJCQludmttX21zZWMo
ZGV2aWNlLCAyMDAwLAogCQkJCWlmIChudmttX3JkMzIoZGV2aWNlLCBhZGRyICsgMHgwMCkgJiAw
eDAwMDIwMDAwKQogCQkJCQlicmVhazsKIAkJCSk7Ci0JCQludmttX21hc2soZGV2aWNlLCBhZGRy
ICsgMHgwMCwgMHgwMDAwMDAxMCwgMHgwMDAwMDAxMCk7CisJCQlpZiAoYnlwYXNzX3N0YXRlKQor
CQkJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAwMDAwMDEwLCAweDAwMDAwMDEw
KTsKIAogCQkJLyogRW5hYmxlIHN5bmMgbW9kZSAqLwogCQkJbnZrbV9tYXNrKGRldmljZSwgYWRk
ciArIDB4MDAsIDB4MDAwMDAwMDQsIDB4MDAwMDAwMDQpOwpAQCAtNDc2LDUgKzQ3OCw1IEBAIGdm
MTAwX2Nsa19uZXcoc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2UsIGludCBpbmRleCwgc3RydWN0
IG52a21fY2xrICoqcGNsaykKIAkJcmV0dXJuIC1FTk9NRU07CiAJKnBjbGsgPSAmY2xrLT5iYXNl
OwogCi0JcmV0dXJuIG52a21fY2xrX2N0b3IoJmdmMTAwX2NsaywgZGV2aWNlLCBpbmRleCwgZmFs
c2UsICZjbGstPmJhc2UpOworCXJldHVybiBudmttX2Nsa19jdG9yKCZnZjEwMF9jbGssIGRldmlj
ZSwgaW5kZXgsIHRydWUsICZjbGstPmJhc2UpOwogfQpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvY2xrL2drMTA0LmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2sx
MDQuYwppbmRleCAwYjM3ZTNkYS4uZGUzZTAwYzkgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Nsay9nazEwNC5jCisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9n
azEwNC5jCkBAIC0zODgsNiArMzg4LDcgQEAgZ2sxMDRfY2xrX3Byb2dfMihzdHJ1Y3QgZ2sxMDRf
Y2xrICpjbGssIGludCBpZHgpCiAJc3RydWN0IGdrMTA0X2Nsa19pbmZvICppbmZvID0gJmNsay0+
ZW5nW2lkeF07CiAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2UgPSBjbGstPmJhc2Uuc3ViZGV2
LmRldmljZTsKIAljb25zdCB1MzIgYWRkciA9IDB4MTM3MDAwICsgKGlkeCAqIDB4MjApOworCWJv
b2wgYnlwYXNzX3N0YXRlID0gZmFsc2U7CiAJbnZrbV9tYXNrKGRldmljZSwgYWRkciArIDB4MDAs
IDB4MDAwMDAwMDQsIDB4MDAwMDAwMDApOwogCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAw
LCAweDAwMDAwMDAxLCAweDAwMDAwMDAwKTsKIAlpZiAoaW5mby0+Y29lZikgewpAQCAtMzk1LDEy
ICszOTYsMTMgQEAgZ2sxMDRfY2xrX3Byb2dfMihzdHJ1Y3QgZ2sxMDRfY2xrICpjbGssIGludCBp
ZHgpCiAJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAwMDAwMDAxLCAweDAwMDAw
MDAxKTsKIAogCQkvKiBUZXN0IFBMTCBsb2NrICovCi0JCW52a21fbWFzayhkZXZpY2UsIGFkZHIg
KyAweDAwLCAweDAwMDAwMDEwLCAweDAwMDAwMDAwKTsKKwkJYnlwYXNzX3N0YXRlID0gbnZrbV9t
YXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMTAsIDB4MDAwMDAwMDApICYgMHgwMDAw
MDAxMDsKIAkJbnZrbV9tc2VjKGRldmljZSwgMjAwMCwKIAkJCWlmIChudmttX3JkMzIoZGV2aWNl
LCBhZGRyICsgMHgwMCkgJiAweDAwMDIwMDAwKQogCQkJCWJyZWFrOwogCQkpOwotCQludmttX21h
c2soZGV2aWNlLCBhZGRyICsgMHgwMCwgMHgwMDAwMDAxMCwgMHgwMDAwMDAxMCk7CisJCWlmIChi
eXBhc3Nfc3RhdGUpCisJCQludmttX21hc2soZGV2aWNlLCBhZGRyICsgMHgwMCwgMHgwMDAwMDAx
MCwgMHgwMDAwMDAxMCk7CiAKIAkJLyogRW5hYmxlIHN5bmMgbW9kZSAqLwogCQludmttX21hc2so
ZGV2aWNlLCBhZGRyICsgMHgwMCwgMHgwMDAwMDAwNCwgMHgwMDAwMDAwNCk7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
