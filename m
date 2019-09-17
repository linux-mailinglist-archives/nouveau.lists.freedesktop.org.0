Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45CB5746
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 23:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5126ED63;
	Tue, 17 Sep 2019 21:00:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E006ED63
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:00:56 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA7514E8AC
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 21:00:55 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id z205so11843wmb.7
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 14:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=st8b5nMltkddcxVsplmEM7w/MQTnPTBosR4LparcW3Q=;
 b=CGxNUt8czJIFriHLAGAiOzF5jWDtrp+FVPfKR9/erizrcSucKlTaB0D9luKHzFFYEr
 /dAG0j4bQ+qXB1e4XOhxB5Genhq/7M7RQlu7du53+d5Gkrczt4vfBab0L3xFhZZoedMq
 5iP8VAK2Jm6WGpyxurun6nSVcPnjae5xxB08xnxg/zzkrfWVyQ8g4lxBtzAbJmR1CzkP
 Q6Obi/RplNtBKNK19qbfmQBrgo0TcrLP2Mo1l7xIBphnXF6Kosa7khZARZMalNzjYMHa
 3imkvIH9Zn0nHDkpMwkBP2ISSYrztfUbzmJtse7u5NLVvoLegODUgjxDxJMXUJB3eO22
 hLOQ==
X-Gm-Message-State: APjAAAUr/guGQ1RyOr5FHzmFLQv0V+8sO7PvetdHlRZ0JXop26TWXGDz
 UBUcs9GcAIPMZTW1Ur0SOxIpGzvNx4jjBSHFlt9eC2j1NYZUptArOnFu0GoWdAWJWBV+uSHiVGD
 T9LA7vro5zrec3A+rUNaV1opaww==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr417905wrr.0.1568754054105;
 Tue, 17 Sep 2019 14:00:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpi1aBHzW0GgEnPuvew5NkjwF9lN6Dr6XAt9iZuQ91buhRgeXn7+1a1cIMTt+Iygm31e4fjg==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr417899wrr.0.1568754053913;
 Tue, 17 Sep 2019 14:00:53 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:e8b1:5ee7:bce5:6a14])
 by smtp.gmail.com with ESMTPSA id i74sm15907wmg.44.2019.09.17.14.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 14:00:53 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 17 Sep 2019 23:00:44 +0200
Message-Id: <20190917210050.24457-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/6] Add workaround for fixing runpm
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

SSBtZXJnZWQgdGhlIGJvdGggc2VyaWVzIEkgc2VudCBvdXQgcmVjZW50bHkgaW50byBvbmUgYmln
Z2VyIG9uZSBzbyB0aGF0Cml0J3MgbW9yZSBvYnZpb3VzIG9uIHdoeSBhbGwgb2YgdGhhdCBpcyBu
ZWVkZWQuCgpCaWdnZXN0IGNoYW5nZXMgc2luY2UgbGFzdCBzZW50OgoqIHJld29ya2VkIHRoZSBB
U1BNIHBhdGNoCiogcmVtb3ZlZCAicGNpOiBhZGQgbnZrbV9wY2llX2dldF9zcGVlZCIgcGF0Y2gK
ClBsZWFzZSB0ZXN0IHRoaXMgb24gTGFwdG9wcyBhbmQgcmVwb3J0IGJhY2sgaWYgaXQgZWl0aGVy
IGJyZWFrcyBzb21ldGhpbmcKb3IgZG9lc24ndCBmaXggcnVucG0uCgpUaGFua3MKCkthcm9sIEhl
cmJzdCAoNik6CiAgcGNpOiBkaXNhYmxlIEFTUE0gYmVmb3JlIGNoYW5naW5nIHRoZSBsaW5rIHNw
ZWVkCiAgcGNpL2drMTA0OiBlbmFibGUgZGxfbWdyIHNhZmUgbW9kZQogIHBjaS9nazEwNDogd2Fp
dCBmb3IgbHRzc20gaWRsZSBiZWZvcmUgY2hhbmdpbmcgdGhlIGxpbmsKICBwY2k6IGVuYWJsZSBw
Y2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgcGNpOiBzZXQgdGhlIHBjaWUgbGluayBzcGVl
ZCB0byA4LjAgd2hlbiBzdXNwZW5kaW5nCiAgZHJtOiBhYm9ydCBydW50aW1lIHN1c3BlbmQgaWYg
d2UgaGl0IGFuIGVycm9yCgogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL2NvcmUvZGV2aWNlLmgg
fCAgMiArKwogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaCAgfCAgMyArLQog
ZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgICAgICAgfCAgNiArKysrCiBkcm0vbm91
dmVhdS9udmttL3N1YmRldi9jbGsvYmFzZS5jICAgICB8ICAyICstCiBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvYmFzZS5jICAgICB8ICAyICsrCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvZzg0LmMgICAgICB8ICA4ICsrKysrCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZzky
LmMgICAgICB8ICAxICsKIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nOTQuYyAgICAgIHwg
IDEgKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dmMTAwLmMgICAgfCAgMSArCiBkcm0v
bm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2YxMDYuYyAgICB8ICAxICsKIGRybS9ub3V2ZWF1L252
a20vc3ViZGV2L3BjaS9nazEwNC5jICAgIHwgMjkgKysrKysrKysrKysrKy0tLS0tCiBkcm0vbm91
dmVhdS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYyAgICB8IDExICsrKysrKysKIGRybS9ub3V2ZWF1
L252a20vc3ViZGV2L3BjaS9wY2llLmMgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKyst
LS0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wcml2LmggICAgIHwgMTYgKysrKysrKysr
KwogMTQgZmlsZXMgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
