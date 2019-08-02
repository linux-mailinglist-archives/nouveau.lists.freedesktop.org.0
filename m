Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD67F056
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2019 11:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE46ED74;
	Fri,  2 Aug 2019 09:21:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2CE6ED74
 for <nouveau@lists.freedesktop.org>; Fri,  2 Aug 2019 09:21:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f9so76390967wre.12
 for <nouveau@lists.freedesktop.org>; Fri, 02 Aug 2019 02:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SX28WGqA/lr86TyEjUs0XInQyeewubg1zmQViuY7ZSE=;
 b=FyYtTYPqaVeKZsLn5ER6MWX6woytikho/8qcIF2n9u3izK7sW+VeV7jCs1GUZpZaHj
 vpyRPqV6kC+BeLpYNksSxAAxVMdi/gqSCUE6h7BPLRCe8Bb7pJfj5tFgNsS7jXEW7zmj
 //2QKDsxACnXYAf1twMqv20Z0otRNgoBkoGLR5ytUwFfuDNMR7aOX9VOjj29m5jm5sbT
 H+YdvmiwtBDQwr6znDGkLqxlKSY/D0iuPru1D38LDo9j4jGdMQYAt/XGCjatC4S+jG2H
 XFck51vOb2wrgyq1njKlhx/GHBnCO3YvhDBmxUlX6nGd6Dr3h6ekSOeHGtqxkvbxEeRC
 1pwA==
X-Gm-Message-State: APjAAAXjor1d5UjSKLsijtLcpbvO7ckqgEHzeeVPEN/f5Murhk07eErh
 xvgc1pnfrrXSQkJdJ68XXIDGY9xyKGU=
X-Google-Smtp-Source: APXvYqww2cRDrvtMoScSEfmdGDXsDQiw3oNpP4nohAPP5cHf6XtxpvHTIfzsiTQSTSIbbmzpHvP2fA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr58056396wrt.253.1564737692110; 
 Fri, 02 Aug 2019 02:21:32 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u186sm138249688wmu.26.2019.08.02.02.21.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 02:21:31 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri,  2 Aug 2019 11:21:00 +0200
Message-Id: <20190802092100.5897-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH] volt: Fix for some cards having 0 maximum voltage
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U29tZSwgbW9zdGx5IEZlcm1pLCB2Ymlvc2VzIGFwcGVhciB0byBoYXZlIHplcm8gbWF4IHZvbHRh
Z2UuIFRoYXQgY2F1c2VzIE5vdXZlYXUgdG8gbm90IHBhcnNlIHZvbHRhZ2UgZW50cmllcywgdGh1
cyB1c2VycyBub3QgYmVpbmcgYWJsZSB0byBzZXQgaGlnaGVyIGNsb2Nrcy4KCldoZW4gY2hhbmdp
bmcgdGhpcyB2YWx1ZSBOdmlkaWEgZHJpdmVyIHN0aWxsIGFwcGVhcmVkIHRvIGlnbm9yZSBpdCwg
YW5kIEkgd2Fzbid0IGFibGUgdG8gZmluZCBvdXQgd2h5LCB0aHVzIHRoZSBjb2RlIGlzIGlnbm9y
aW5nIHRoZSB2YWx1ZSBpZiBpdCBpcyB6ZXJvLgoKQ0M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVuenlu
c2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jp
b3Mvdm9sdC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mvdm9sdC5jIGIvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvYmlvcy92b2x0LmMKaW5kZXggNzE0M2VhNDYuLjMzYTlmYjVhIDEwMDY0NAot
LS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL3ZvbHQuYworKysgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9iaW9zL3ZvbHQuYwpAQCAtOTYsNiArOTYsOCBAQCBudmJpb3Nfdm9sdF9w
YXJzZShzdHJ1Y3QgbnZrbV9iaW9zICpiaW9zLCB1OCAqdmVyLCB1OCAqaGRyLCB1OCAqY250LCB1
OCAqbGVuLAogCQlpbmZvLT5taW4gICAgID0gbWluKGluZm8tPmJhc2UsCiAJCQkJICAgIGluZm8t
PmJhc2UgKyBpbmZvLT5zdGVwICogaW5mby0+dmlkbWFzayk7CiAJCWluZm8tPm1heCAgICAgPSBu
dmJpb3NfcmQzMihiaW9zLCB2b2x0ICsgMHgwZSk7CisJCWlmICghaW5mby0+bWF4KQorCQkJaW5m
by0+bWF4ID0gbWF4KGluZm8tPmJhc2UsIGluZm8tPmJhc2UgKyBpbmZvLT5zdGVwICogaW5mby0+
dmlkbWFzayk7CiAJCWJyZWFrOwogCWNhc2UgMHg1MDoKIAkJaW5mby0+bWluICAgICA9IG52Ymlv
c19yZDMyKGJpb3MsIHZvbHQgKyAweDBhKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
