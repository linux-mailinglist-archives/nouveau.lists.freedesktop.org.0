Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91A1AF849
	for <lists+nouveau@lfdr.de>; Sun, 19 Apr 2020 09:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613926E3AC;
	Sun, 19 Apr 2020 07:44:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6B6E3AC
 for <nouveau@lists.freedesktop.org>; Sun, 19 Apr 2020 07:44:34 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id k15so3380876pfh.6
 for <nouveau@lists.freedesktop.org>; Sun, 19 Apr 2020 00:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=KyObv1dj0JvT2ps5vHfpdhJhElxedP1unYhHGlP2bg0=;
 b=eAi6t6wI2OrXL+IZVNyVhkdjuSd7vMjU+WZb8dQRdMMKFgzT3h0Zl+v19WBRb6q1o2
 mtvR7gaVAE7g7FYq0qj4Y4gUhwGeY/Xt2/T4oUDOlbfA35neFUgLybTCT5Rh/3ACY/EU
 kpy3qAmNq6w0xnTWPtRVhOcK2nba7RoLpVnOYOZpyGsAue3tzma8onMxNXWf6Cyv+ibg
 mbsgrD16At7z/Cw8C3nGvwAkdSaKXPT1hDuQvC7Ht7YGs6LxxqPQ2FXEno5jEF5Hj2UR
 zDboeMgqEA/+iCMRfI0QHSRlgQrupJCXRUdbZ/0IL7YGSp/BBwEPYSxIUf5vl0TTPvwV
 5Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=KyObv1dj0JvT2ps5vHfpdhJhElxedP1unYhHGlP2bg0=;
 b=fgMMDTRzc5pILXfBYD1P5qalCSd4UCMTQfpEOPL5VqOHv8w6N+/Lqj+HanlLBsdJ3D
 OPcoFI8bcJnu8+vNjMqLF8H0R1JpmnDyaNl3eOoaPi6Bbg3zV0efAAi7szt8qqnhqOMW
 rrso2f8YPQsPhQJsTLtqY/RpYsX5zfS5IQPSjovMkiU4yJiNBEdVCm2gGmNBNzUj78aU
 i9QXy6k/Olm1ctX8P2nenB9nuF8ayIEruSZXydjjdVDYFwaJKYyyIcClYL/WyCAF/wof
 PLjClUXN4xl0+7mn8mCE1liVS/jen5V7D9Dljy5OYAMPti2BtMYlVoeZ66vYTdwIIgre
 M3HA==
X-Gm-Message-State: AGi0PubYE7844KlKzZaJYImfQM2wYEq86xhZ+W8bm2b/+vynkRtuou5b
 uCxO/ZJJRuosEqMdc0fWGA4MLeYvuGY=
X-Google-Smtp-Source: APiQypLaJFkNVthw6UMT3MMlRTvt05axrOVqbviuyBK1ImcOgygLpFrni0y61yroikzECxYHz9pmBQ==
X-Received: by 2002:a63:2b42:: with SMTP id r63mr139865pgr.227.1587282272947; 
 Sun, 19 Apr 2020 00:44:32 -0700 (PDT)
Received: from ?IPv6:2601:647:4a00:4477:4467:7a48:311d:2412?
 ([2601:647:4a00:4477:4467:7a48:311d:2412])
 by smtp.gmail.com with ESMTPSA id ml24sm9940422pjb.48.2020.04.19.00.44.32
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 00:44:32 -0700 (PDT)
From: Christian Calderon <calderonchristian73@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 19 Apr 2020 00:44:31 -0700
Message-Id: <9CF7997B-7987-4444-85BF-2FB3AC0E030F@gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailer: iPhone Mail (17D50)
Subject: [Nouveau] Error -28
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

SeKAmW0gaGF2aW5nIHRyb3VibGUgZ2V0dGluZyBteSBHVFggMTA1MCBUaSB3b3JraW5nIGluIERl
YmlhbiBTaWQuIFRoaXMgbWFjaGluZSBpcyBhIFBvd2VyTWFjIEc1LCAyLjMgR0h6IER1YWwgQ29y
ZS4gSeKAmW0gdXNpbmcgYSBRdWFkcm8gRlggNDUwMCBhcyB3ZWxsIGFuZCBpdCBzZWVtcyB0byB3
b3JrIGFzIGV4cGVjdGVkLiBJ4oCZdmUgaW5zdGFsbGVkIHRoZSBmaXJtd2FyZS1saW51eC1ub25m
cmVlIHBhY2thZ2UsIHdoaWNoIHNlZW1zIHRvIGhhdmUgdGhlIHJlcXVpcmVkIGZpcm13YXJlIGZv
ciB0aGUgR1RYIDEwNTAgVGkuIEluIGRtZXNnIEkgc2VlIHRoaXMgZXJyb3IgYWZ0ZXIgc29tZSBs
aW5lcyB3aGljaCBtZW50aW9uIOKAnGRpcmVjdC1sb2FkaW5nIGZpcm13YXJl4oCdOgoKICAgIG5v
dXZlYXUgMDAwMTowNjowMC4wOiBnciBjdG9yIGZhaWxlZCwgLTI4CgpBbnkgaWRlYXMgb24gaG93
IHRvIGZpeCB0aGlzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
