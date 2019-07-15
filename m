Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DDB68684
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 11:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFDF89907;
	Mon, 15 Jul 2019 09:43:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5242C89907
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 09:43:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so16359848wrs.3
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itVKQ7bZZ+saQxXDBzY2LRi5MHG+WfrKcEjyFBTvwiM=;
 b=aZg1eNpNIJqrevQ7ms8Dg05NEOgTJO4sqrTj0Zv9m/ecB288LaFTYeoOq/tO9rPKQ9
 jF4nthNl7R45FpMV78VS5rBvOI6LR8P4yrtlRlFe9tKdbQ7FOnRDJ+Xw8RvHB9crJe1a
 ATA4M3fUXgak+tD2a6nxcntexaV1E6NI5cKxVe7LGnfmINSnxCGtcnWhZRc0eBIaDbHz
 BFL/MNpL71PTKNkF/x5nvmrqgOz++Y0hZ6q44A453bOM/y7PykaGQA65mYG/J0aMPyaq
 VIcCiBbjG0Mv2jwU87oIMi+NXi/9PSxgXK1UNNZGGjcQS5usEKqmAgwCYId9/0j/w52k
 eqJA==
X-Gm-Message-State: APjAAAWbaSd8h8Jv98iMYQK4W1aqORhjpmrhIOfJgauDlijFBrQYhuPq
 TEDIr1FhM2n35CrnR21iiP7QIbMi8KE=
X-Google-Smtp-Source: APXvYqw+c/Us2cbsNDxsdpqNXAkBll9/yJK/Qm6G07e1t6ascp+HO3wErQyjGvojvtf7aitl+AfXiw==
X-Received: by 2002:adf:fb52:: with SMTP id c18mr27371508wrs.216.1563183791853; 
 Mon, 15 Jul 2019 02:43:11 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o126sm14383044wmo.1.2019.07.15.02.43.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 02:43:11 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 15 Jul 2019 11:42:46 +0200
Message-Id: <20190715094247.8331-4-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715094247.8331-1-mmenzyns@redhat.com>
References: <20190715094247.8331-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 3/4] gpio: check the gpio function 16 in the
 power check as well
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

QWRkZWQgR1BJTyBpcyAiVGhlcm1hbCBhbmQgRXh0ZXJuYWwgUG93ZXIgRGV0ZWN0Ii4gSXQncyB1
bmNlcnRhaW4gaWYgdGhpcwpHUElPIGlzIHNldCBvbiBHUFUgaW5pdGlhbGl6YXRpb24gb3Igb25s
eSBpZiBhIGNoYW5nZSBpcyBkZXRlY3RlZCBieSB0aGUKR1BVIGF0IHJ1bnRpbWUuCgpUaGlzIEdQ
SU8gY2FuIGJlIGZvdW5kIGluIFJhbmtpbmUgYW5kIEN1cmllIGFuZCByYXJlbHkgb24gVGVzbGEg
R1BVcwpWQklPUy4KClVudGVzdGVkLCB3cm90ZSBhY2NvcmRpbmcgdG8gZG9jdW1lbnRhdGlvbi4K
ClNpZ25lZC1vZmYtYnk6IE1hcmsgTWVuenluc2tpIDxtbWVuenluc0ByZWRoYXQuY29tPgotLS0K
IGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggfCAxICsKIGRybS9u
b3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvaW5jbHVkZS9u
dmttL3N1YmRldi9iaW9zL2dwaW8uaCBiL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYv
Ymlvcy9ncGlvLmgKaW5kZXggYTcwZWM5ZTguLmZjMmI1ZmIwIDEwMDY0NAotLS0gYS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCisrKyBiL2RybS9ub3V2ZWF1L2lu
Y2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmgKQEAgLTUsNiArNSw3IEBAIGVudW0gZGNiX2dw
aW9fZnVuY19uYW1lIHsKIAlEQ0JfR1BJT19QQU5FTF9QT1dFUiA9IDB4MDEsCiAJRENCX0dQSU9f
RkFOID0gMHgwOSwKIAlEQ0JfR1BJT19UVkRBQzAgPSAweDBjLAorCURDQl9HUElPX1RIRVJNX0VY
VF9QT1dFUl9FVkVOVCA9IDB4MTAsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKIAlEQ0JfR1BJ
T19GQU5fU0VOU0UgPSAweDNkLAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1cgPSAweDc5LApkaWZm
IC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3Bpby9iYXNlLmMgYi9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9ncGlvL2Jhc2UuYwppbmRleCBjNDY4NTgwNy4uMGM4ODY1NDMgMTAwNjQ0
Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCisrKyBiL2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2dwaW8vYmFzZS5jCkBAIC0xODMsNiArMTgzLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGdwaW9fcmVzZXRfaWRzW10gPSB7CiB9OwogCiBzdGF0
aWMgZW51bSBkY2JfZ3Bpb19mdW5jX25hbWUgcG93ZXJfY2hlY2tzW10gPSB7CisJRENCX0dQSU9f
VEhFUk1fRVhUX1BPV0VSX0VWRU5ULAogCURDQl9HUElPX0VYVF9QT1dFUl9MT1csCiB9OwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
