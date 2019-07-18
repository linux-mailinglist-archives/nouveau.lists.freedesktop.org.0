Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64D6CA9F
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77466E33E;
	Thu, 18 Jul 2019 08:07:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A326E33A
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 08:07:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id u25so14262146wmc.4
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jul 2019 01:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rSDOZJTa1FksWrolbzGt7chN2k62c/gsMqI++/syLKw=;
 b=jC9lp3IBOoavPIstWM2u2LxOvj5U5iXZEHXwl4rdm7N86cwUGR6VGOqEo8fJGH3+3+
 l1CHXcgMqFBpf2nxGr0Ry3ZeyMBwDpyS49BxKep73qiucLyAL79CDDJsqF7eKBocIbim
 mw93YA7gJI3oBFFNfyTx4ozAfMiZJ2vALL2Y3/j6IDk5o3CqEioRc7d0sSxZtvgkP2l2
 qBiAynGE+Xb/EpycU2fu+dfg/lCpdN1PKEvKsQx42V/61J0d7Tve0tb0e7hLYeeVbmlu
 DmhkLJmKDU/m3NcC0Srp8LxBlKNzSh2zPjNOkk3GKlxKKUp2oajCzFlmcpeWoO4MIGT2
 IQQw==
X-Gm-Message-State: APjAAAX+smnnaxzgRq/fB5IQvSFB0Facpg/CwjQjQ8MMfUVz3Y7a9Efz
 Ava0ElLCLxkTMO0NcEDIi8bC3saWKHM=
X-Google-Smtp-Source: APXvYqwjWhbBdMvyKVZ5Lmu5EeqOPHjYGfFpENO7Aq7ySjtyQJYzfhrNwQU2A/xLaaa3kreBUQP7IQ==
X-Received: by 2002:a05:600c:22ce:: with SMTP id
 14mr41737265wmg.27.1563437266167; 
 Thu, 18 Jul 2019 01:07:46 -0700 (PDT)
Received: from localhost.localdomain.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm28354532wrv.90.2019.07.18.01.07.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 01:07:45 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 18 Jul 2019 10:07:38 +0200
Message-Id: <20190718080741.3147-2-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190718080741.3147-1-mmenzyns@redhat.com>
References: <20190718080741.3147-1-mmenzyns@redhat.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 1/4] bios/gpio: sort gpios by values
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
