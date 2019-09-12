Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA5B14A9
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 21:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EC36EDFF;
	Thu, 12 Sep 2019 19:00:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAEA6EE00
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:38 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2E3C64042
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:37 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id n2so12462643wru.9
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 12:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYYZAG/3uAx2Pc5sGrWADY1Gswl1j6P2VHmgnxNPC48=;
 b=A6Et1R2TAFDQeHTGwLZiTXl5EV+P1EcEKsx9YMMcUwRhUmWNNF4Mx0wxvpoxwUlJ+y
 DbzoNwE75WpN68ViK2ceKEY0MgzQ6y2F3HuSlSTc01D+VvjcXhSy5nmCg9SXRbB8dP56
 m5xlybDYACNkTdGxGdQ8jgXXfV7ZN7l66wIx/dHpsEleMaKuk+F7Z3D2Q3x70wnTruOt
 xD4qRayYX2nkRLvBD19O4hKV3zNlBfupKIS3k0jX8CpOBCmQyqiQyR2B0bSwNXSqAhUc
 4en3Mw3tAQf10vUtxFr8c4MYhfYUsNrlHuqnR5aj4/lw/rZ/NrR5x4xGrmgW4ULo5Ww4
 b/Mg==
X-Gm-Message-State: APjAAAWltt6JZ5HaaP4UxvTNlCaD5gC7ghop6Vr7OR9K/KSFy3TaeuQq
 PK+hNDmPkaEXBOB64oLHhvDPx71z+3eSgGPGii602u5GsyFYaZia11RHVeSnDvtuOg7rU5RKe9/
 YLyqEMNryVKVu7MvKhqGWlUO4IA==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr39343188wrb.61.1568314836077; 
 Thu, 12 Sep 2019 12:00:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzas6Sq3HCVkKJDma3BF1T77zP8LfMA8J2QDiT2ZiR6yL3tuql1Chs4q0XhuMl8NRNycYQkOg==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr39343180wrb.61.1568314835922; 
 Thu, 12 Sep 2019 12:00:35 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:f075:99ad:7efe:778d])
 by smtp.gmail.com with ESMTPSA id i9sm34104426wrb.18.2019.09.12.12.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 12:00:34 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 12 Sep 2019 21:00:27 +0200
Message-Id: <20190912190028.27977-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912190028.27977-1-kherbst@redhat.com>
References: <20190912190028.27977-1-kherbst@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/3] pci/gk104: enable dl_mgr safe mode
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

bm8gaWRlYSB3aHkgYW5kIHdoYXQgaXQgZG9lcywgdGFrZW4gZnJvbSBudmdwdQoKU2lnbmVkLW9m
Zi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Ci0tLQogZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5j
IGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKaW5kZXggYjczOTIyYzUyLi42
YWViMDdmZTQgMTAwNjQ0Ci0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5j
CisrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCkBAIC0xODQsNiArMTg0
LDcgQEAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51bSBudmtt
X3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCXN0cnVjdCBudmttX3N1YmRldiAqc3ViZGV2
ID0gJnBjaS0+c3ViZGV2OwogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua19jdGxfc3BlZWQgPSBn
azEwNF9wY2llX2xua2N0bF9zcGVlZChwY2kpOwogCWVudW0gbnZrbV9wY2llX3NwZWVkIGxua19j
YXBfc3BlZWQgPSBnazEwNF9wY2llX2NhcF9zcGVlZChwY2kpOworCXUzMiBvbGRfZGxfbWdyOwog
CiAJaWYgKHNwZWVkID4gbG5rX2NhcF9zcGVlZCkgewogCQlzcGVlZCA9IGxua19jYXBfc3BlZWQ7
CkBAIC0xOTcsNyArMTk4LDkgQEAgZ2sxMDRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgZW51bSBudmttX3BjaWVfc3BlZWQgc3BlZWQsIHU4IHdpZHRoKQogCQkJICAiIGxua2N0
bCBzcGVlZFxuIik7CiAJfQogCisJb2xkX2RsX21nciA9IG52a21fbWFzayhzdWJkZXYtPmRldmlj
ZSwgMHg4YjhjMCwgMHg0LCAweDQpOwogCWdrMTA0X3BjaWVfc2V0X2xpbmtfc3BlZWQocGNpLCBz
cGVlZCk7CisJbnZrbV93cjMyKHN1YmRldi0+ZGV2aWNlLCAweDhiOGMwLCBvbGRfZGxfbWdyKTsK
IAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
