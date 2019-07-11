Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAD65931
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2019 16:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593516E258;
	Thu, 11 Jul 2019 14:42:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846226E24E
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 14:18:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s15so5875069wmj.3
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeFf4fBSym4TNKVBsfJPZJw5gyCqQhqJndntTpwV87w=;
 b=AFnwIdJOup2m0D9aGEuiFBadNAQnHqECo/y5QnOgKxnL7C9B58C/Jf/i4DG2BoxqC/
 UMCQ+4zcr2si0I5lapJTBhcmvXV1qrTxyx+3c+tg/wp5V6W7f2llrHEeMaNZrn8koLde
 WkeiLFspcXJbZ5UDNgE2I6sRvqD65PnNRX7qOAU6qz9Am4osuMdfoZrTNYwTNkKWJ51h
 qkQrFZZf6Hcimz0YuGazuSecK9bgWztEP8AovMnFRdp/xteC4nPLEnfmvQOT74GnX6xW
 /dDLtGZ6GmVx0y0PnFviqvWpxaj/qBm3vCa0GCno9H6YLKf3EyDkx7WvHrgCwtIFc+3i
 E2cQ==
X-Gm-Message-State: APjAAAUg0n3p6luThz9uo/wNIfdvD1z7XNhXDfU//HGgLZMfxocjTngN
 2UzrLG+FC2jT558rcIcys0i2eNwFwJs=
X-Google-Smtp-Source: APXvYqxUKAAkmqAYB2XcVFbtZUrxOxDcWLtVvT4WArI4Uw7gPGmE/6zefJiFVq6xc4g2DNqTQNLYQw==
X-Received: by 2002:a1c:9d53:: with SMTP id g80mr4601905wme.103.1562854703098; 
 Thu, 11 Jul 2019 07:18:23 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id 5sm5883635wmg.42.2019.07.11.07.18.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 07:18:22 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 11 Jul 2019 16:11:50 +0200
Message-Id: <20190711141153.7723-2-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711141153.7723-1-mmenzyns@redhat.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 14:42:17 +0000
Subject: [Nouveau] [PATCH 1/4] moved gpio so it is sorted by values
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

U2lnbmVkLW9mZi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+Ci0tLQog
ZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
bS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggYi9kcm0vbm91dmVhdS9p
bmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCmluZGV4IGI3MWEzNTU1Li4yZjQwOTM1ZiAx
MDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaAor
KysgYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCkBAIC0zLDkg
KzMsOSBAQAogI2RlZmluZSBfX05WQklPU19HUElPX0hfXwogZW51bSBkY2JfZ3Bpb19mdW5jX25h
bWUgewogCURDQl9HUElPX1BBTkVMX1BPV0VSID0gMHgwMSwKKwlEQ0JfR1BJT19GQU4gPSAweDA5
LAogCURDQl9HUElPX1RWREFDMCA9IDB4MGMsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgyZCwKLQlE
Q0JfR1BJT19GQU4gPSAweDA5LAogCURDQl9HUElPX0ZBTl9TRU5TRSA9IDB4M2QsCiAJRENCX0dQ
SU9fTE9HT19MRURfUFdNID0gMHg4NCwKIAlEQ0JfR1BJT19VTlVTRUQgPSAweGZmLAotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
