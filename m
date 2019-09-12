Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42FB14A7
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 21:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9956EDFD;
	Thu, 12 Sep 2019 19:00:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D72B6EDFD
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:35 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B5353C04D293
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:00:34 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id n6so12330278wrm.20
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 12:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7CQoYYq5vmd53Jag7hnhOe0L4x5PQDQd+zBq8oL3Tqo=;
 b=RGA1lemHUGReuZZXgS+ZT379JIICtH7gUrzoZokkbQbv8Wm80VRloJx29VIEm86GuA
 KM15JWrxOQxYYyZlqupnvgw8ubQ6/+ww59BSUn4+BLrBeb4MdmE3bqO9F7auHsKl4fY7
 4WtVLY5oiJaR+IytttIg8wr5GRUVksZzY6DXf2tHI0UPxfD4hS5hgfpKvOkFdS+/dGue
 ifSbCEC8MdgRfAtyBV6CGdJQuZzg4XjAGTfcFMCO3yin1lDXY0axFH+MQIpD0wngXBxC
 sOVSXllIAfxjZFuN1lwxVJb/hQ+alrbm2V+H5gjkjAbfWbYNwQTRfX4F9YDFByfm9liq
 bHdQ==
X-Gm-Message-State: APjAAAW8gbu/LNTbC21dYHha0te2Xs99IqvK6+cLkcA3cvjJM88Q2qnN
 t768TZ4eoeGajItRAGvHN6BnXPKYhdXNDHaN/v9A2cFx+jL9bFXC3aybelEJtu5FGkc9GdMraOx
 rEZi1qhzIlhNSu1SsnNnqH25CNw==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr91677wmj.5.1568314833179;
 Thu, 12 Sep 2019 12:00:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZY++sfRWF/wowtfLWnzfrfNBSYFt6uAvDvgVl9ot6nTxiQWkazDRS9NEN3G2nVrWLyCJ7Kw==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr91659wmj.5.1568314832897;
 Thu, 12 Sep 2019 12:00:32 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:f075:99ad:7efe:778d])
 by smtp.gmail.com with ESMTPSA id i9sm34104426wrb.18.2019.09.12.12.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 12:00:30 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 12 Sep 2019 21:00:25 +0200
Message-Id: <20190912190028.27977-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/3] PCIe link change improvements
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

ZXZlcnl0aGluZyB3YXMgdGFrZW4gZnJvbSBudmdwdS4KCk1haW4gcmVhc29uIGZvciBhZGRpbmcg
aXMgdG8gaW1wcm92ZSBzdGFiaWxpdHkgb2YgdGhlIFBDSWUgbGluayBjaGFuZ2luZyBjb2RlCmFz
IHdlIG1pZ2h0IHdhbnQgdG8gZGVwZW5kIG9uIGl0IGZvciBhIHdvcmthcm91bmQgZml4aW5nIG91
ciBpbmZhbW91cyBydW5wbQppc3N1ZXMgb24gcmVjZW50IGxhcHRvcHMKCkthcm9sIEhlcmJzdCAo
Myk6CiAgcGNpOiBmb3JjZSBkaXNhYmxlIEFTUE0gYmVmb3JlIGNoYW5naW5nIHRoZSBsaW5rIHNw
ZWVkCiAgcGNpL2drMTA0OiBlbmFibGUgZGxfbWdyIHNhZmUgbW9kZQogIHBjaS9nazEwNDogd2Fp
dCBmb3IgbHRzc20gaWRsZSBiZWZvcmUgY2hhbmdpbmcgdGhlIGxpbmsKCiBkcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvZzg0LmMgICB8ICA5ICsrKysrKysrKwogZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2c5Mi5jICAgfCAgMSArCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZzk0
LmMgICB8ICAxICsKIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nZjEwMC5jIHwgIDEgKwog
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dmMTA2LmMgfCAgMSArCiBkcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvZ2sxMDQuYyB8IDExICsrKysrKysrKysrCiBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcGNpZS5jICB8IDE0ICsrKysrKysrKysrKysrCiBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcHJpdi5oICB8ICAyICsrCiA4IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKykKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
