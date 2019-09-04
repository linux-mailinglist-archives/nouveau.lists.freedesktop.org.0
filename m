Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D791AA859E
	for <lists+nouveau@lfdr.de>; Wed,  4 Sep 2019 16:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57CD89452;
	Wed,  4 Sep 2019 14:28:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E645889452
 for <nouveau@lists.freedesktop.org>; Wed,  4 Sep 2019 14:28:43 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F938155E0
 for <nouveau@lists.freedesktop.org>; Wed,  4 Sep 2019 14:28:43 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id r1so1183648wmr.1
 for <nouveau@lists.freedesktop.org>; Wed, 04 Sep 2019 07:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7eG/QjRDSfLmQgj4lMoaq/wfHS175jXJuaeP6xdBFM=;
 b=iuOJxrJeizLv/EJQXFFn9vpy0MkG4PfwYt30TR7x3xp4COirOUcOWM8MkY/2h0BarF
 Ad6fVRN11s1CEvOE2VUlVUbIpnnw/giWW8tFkn/7hz3JMEybvKCTNXCn+qdUwK8tvR5A
 Mpa1C8ZQKAIfL165woNOIrV8/0HfxSMfPgEQovMWVP4hZH/PY5k0ksW+0Vbk0OP/c5zD
 gx4RC7yXY0IeXVOjRO03YW61k3AtC8nmflocV3f7MmHEL1EPIdPvrmTFetCqz/ITDPyx
 0FSxc1cIAVpMpdOj8IQNl0gHhueVv+/THBUqjLoDhqm6Ba56a4poKvXU/LRaeMnINqSC
 upiQ==
X-Gm-Message-State: APjAAAVcB0V+YzVF85eZjs1Hhnepn+21XSIA1ZkTvEI2Kpi7bN5G/BS0
 0FWzLzYhTy4XBneLy1nrA2Rpoa3yyNpg5/eeqUwh9VP1K0Md4WS4OA1Z+TGPAXW7Cyd8h29yn9c
 TSLONDq6hfoGwMe070Ko1I/pOuA==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr4883998wmd.100.1567607321732; 
 Wed, 04 Sep 2019 07:28:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyanSznfbDZ3nwXJMdchEJM8LlGrHKeXHfFdJv4tLqv/RjvuKgp6NJYKeQiLiQr2qaivsND7A==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr4883974wmd.100.1567607321579; 
 Wed, 04 Sep 2019 07:28:41 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q15sm18182047wrv.1.2019.09.04.07.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 07:28:40 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  4 Sep 2019 16:28:37 +0200
Message-Id: <20190904142837.8768-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [RFC PATCH v2] clk: Remove BYPASS_PLL_CHECK from PLLs
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
b2Vzbid0IHNlZW0gdG8gYnJlYWsgYW55dGhpbmcuCgp2MjogQWRkIGJhY2sgUExMIGxvY2sgdGVz
dAoKU2lnbmVkLW9mZi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+Ci0t
LQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2dmMTAwLmMgfCAxIC0KIGRybS9ub3V2ZWF1
L252a20vc3ViZGV2L2Nsay9nazEwNC5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2dmMTAwLmMg
Yi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9jbGsvZ2YxMDAuYwppbmRleCA3ZjY3ZjlmNS4uZmU1
NjgxN2IgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jCisr
KyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nZjEwMC5jCkBAIC0zODEsNyArMzgxLDYg
QEAgZ2YxMDBfY2xrX3Byb2dfMihzdHJ1Y3QgZ2YxMDBfY2xrICpjbGssIGludCBpZHgpCiAJCQkJ
aWYgKG52a21fcmQzMihkZXZpY2UsIGFkZHIgKyAweDAwKSAmIDB4MDAwMjAwMDApCiAJCQkJCWJy
ZWFrOwogCQkJKTsKLQkJCW52a21fbWFzayhkZXZpY2UsIGFkZHIgKyAweDAwLCAweDAwMDAwMDEw
LCAweDAwMDAwMDEwKTsKIAogCQkJLyogRW5hYmxlIHN5bmMgbW9kZSAqLwogCQkJbnZrbV9tYXNr
KGRldmljZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMDQsIDB4MDAwMDAwMDQpOwpkaWZmIC0tZ2l0
IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvY2xrL2drMTA0LmMgYi9kcm0vbm91dmVhdS9udmtt
L3N1YmRldi9jbGsvZ2sxMDQuYwppbmRleCAwYjM3ZTNkYS4uMjJjYWMzMDQgMTAwNjQ0Ci0tLSBh
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Nsay9nazEwNC5jCisrKyBiL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Nsay9nazEwNC5jCkBAIC00MDAsNyArNDAwLDYgQEAgZ2sxMDRfY2xrX3Byb2df
MihzdHJ1Y3QgZ2sxMDRfY2xrICpjbGssIGludCBpZHgpCiAJCQlpZiAobnZrbV9yZDMyKGRldmlj
ZSwgYWRkciArIDB4MDApICYgMHgwMDAyMDAwMCkKIAkJCQlicmVhazsKIAkJKTsKLQkJbnZrbV9t
YXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4MDAwMDAwMTAsIDB4MDAwMDAwMTApOwogCiAJCS8q
IEVuYWJsZSBzeW5jIG1vZGUgKi8KIAkJbnZrbV9tYXNrKGRldmljZSwgYWRkciArIDB4MDAsIDB4
MDAwMDAwMDQsIDB4MDAwMDAwMDQpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
