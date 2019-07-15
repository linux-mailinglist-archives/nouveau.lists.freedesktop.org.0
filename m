Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC4E68683
	for <lists+nouveau@lfdr.de>; Mon, 15 Jul 2019 11:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92689915;
	Mon, 15 Jul 2019 09:43:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4A89907
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 09:43:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y4so16349948wrm.2
 for <nouveau@lists.freedesktop.org>; Mon, 15 Jul 2019 02:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rSDOZJTa1FksWrolbzGt7chN2k62c/gsMqI++/syLKw=;
 b=Qw6Tj/wkjOQ/W9uDnmImvsWgG2/au2k4xS8DDVAtEjOZP89BJDf1QbaafPe70ehJjN
 b8Svhto2bStJyW8xCZvDi/OQomfRO2v0Hp/vOl2Dr/4fVPVM/V6gBj6N6DTB2VePFGep
 oL5+xga4/bL/qhmTM1vI0oCbq/rpvtzMqaXGjl4pVBGSX0VAndXwyAyNaRYh+wqQXNFh
 NABphDHhu1zbHZkxSmpYyyj00bb20etu/JZEC7FHUpghxuGgdbaHC1uCYZckAVesQOcc
 vHhUx+BUSaB5sKWlD6fyoJP7SnxYfKAQQEWcQ0VJX4Ic7U9KGCOEJD+3vpPZBXZeY19f
 aTdg==
X-Gm-Message-State: APjAAAX4B3Qkss6By5BdPuG0+jUXIXAP5fLrjp/7l9yLgFX5qbtowUqP
 Vwc/60rmTVivfkjT35VEg7ujq12gUco=
X-Google-Smtp-Source: APXvYqzvQN9mBFK1zY/Yh9N+qPAR72THVsVwoZCjCUxDCpZD5FWuHS2QelTwpjvVDYVOylW6Ucc6JQ==
X-Received: by 2002:adf:f286:: with SMTP id k6mr18094613wro.320.1563183789954; 
 Mon, 15 Jul 2019 02:43:09 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o126sm14383044wmo.1.2019.07.15.02.43.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 02:43:09 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 15 Jul 2019 11:42:44 +0200
Message-Id: <20190715094247.8331-2-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715094247.8331-1-mmenzyns@redhat.com>
References: <20190715094247.8331-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 1/4] bios/gpio: sort gpios by values
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

T25lIGdwaW8gd2FzIGluIHdyb25nIHBsYWNlLCBtb3ZlZCBpdCBmb3IgYmV0dGVyIHJlYWRhYmls
aXR5LgoKU2lnbmVkLW9mZi1ieTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+
Ci0tLQogZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dwaW8uaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvYmlvcy9ncGlvLmggYi9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCmluZGV4IGI3MWEzNTU1Li4yZjQw
OTM1ZiAxMDA2NDQKLS0tIGEvZHJtL25vdXZlYXUvaW5jbHVkZS9udmttL3N1YmRldi9iaW9zL2dw
aW8uaAorKysgYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2Jpb3MvZ3Bpby5oCkBA
IC0zLDkgKzMsOSBAQAogI2RlZmluZSBfX05WQklPU19HUElPX0hfXwogZW51bSBkY2JfZ3Bpb19m
dW5jX25hbWUgewogCURDQl9HUElPX1BBTkVMX1BPV0VSID0gMHgwMSwKKwlEQ0JfR1BJT19GQU4g
PSAweDA5LAogCURDQl9HUElPX1RWREFDMCA9IDB4MGMsCiAJRENCX0dQSU9fVFZEQUMxID0gMHgy
ZCwKLQlEQ0JfR1BJT19GQU4gPSAweDA5LAogCURDQl9HUElPX0ZBTl9TRU5TRSA9IDB4M2QsCiAJ
RENCX0dQSU9fTE9HT19MRURfUFdNID0gMHg4NCwKIAlEQ0JfR1BJT19VTlVTRUQgPSAweGZmLAot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
