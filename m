Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36DB1C67
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2019 13:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2C6EF1E;
	Fri, 13 Sep 2019 11:33:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CD86EF1E
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:12 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A1DEC08C33F
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 11:33:11 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id 124so936667wmz.1
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2019 04:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MGLHAj3UwndyKrfhP7GBchMza1m1kvZwr7PMSTJoio=;
 b=H18kbgRvugkTuwAPlAnn+pMwM4k+4LS44H/kxIES7MZ5eycsKlEFR4besqhenTBG+H
 MA6P0tTBbc/OGzGqsIyPbei5ws2uAUa1YmAZOcF43AIZiCLQ8fiYTnZwgVCiRhPg9iW9
 cwmgDRY+h0rqFLHEKLl8orfzhOT+lg4y36FFevTBQfKIy0/eY799hLk45m1ZjX06J68z
 eRV8tsLK7V+uG9kHD+A+2aWmK4l9XYPqCgFIHQSmsYbSYwHPVugfGDmHwvF/GQyM6iCZ
 Cyk/IUbrECoRCtT2BREMLV9LRMaJmVptDVCzG0fk4beUjZBJWVddOdxvC8noF42JMOiy
 Chww==
X-Gm-Message-State: APjAAAWGm0Phw4v3yZb6RIoPweQ6lrEzlenF782X73qXXIlKz8if+K4t
 vkXnEkN7nw1A+p6B5movMFLn18bWCMzl1xSZqstfLKaE7xlNTzDA2dkfa9F1xkMc3wCbSJxUy9x
 sYAhCVGYwpA/D1qL7LqTLE6jCHA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr2917180wmk.17.1568374389912; 
 Fri, 13 Sep 2019 04:33:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9sIdJ1veES7zh5QxMs8mvfxwwcab+IBB3YCfffSMSMgM4hsWlvoKS4tTi1jiijKxKiQgbjA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr2917170wmk.17.1568374389735; 
 Fri, 13 Sep 2019 04:33:09 -0700 (PDT)
Received: from kherbst.pingu.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r15sm2262769wmh.42.2019.09.13.04.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 04:33:08 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 13 Sep 2019 13:33:02 +0200
Message-Id: <20190913113306.20972-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v4 0/4] add PCIe workaround to fix runpm on laptops
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

bm90IG11Y2ggY2hhbmdlZCBzaW5jZSB0aGUgbGFzdCB0aW1lIEkgc2VudCB0aG9zZSBwYXRjaGVz
IG91dCwgYnV0IHRoZXJlCmFyZSBhIGNvdXBsZSBvZiBhbm5veWluZyBidWcgZml4ZXMsIHdoaWNo
IHVzZXJzIHdvdWxkIHByb2JhYmx5IG5ldmVyIGhpdAp1bmxlc3MgdGhleSBkbyBybW1vZC9tb2Rw
cm9iZSBub3V2ZWF1IGN5Y2xlcy4KCkJpZ2dlc3QgY2hhbmdlIGlzIHRoYXQgSSBmb3JjZSB0aGUg
bGluayB0byBhIDguMCBzcGVlZCByYXRoZXIgdGhhbiB0aGUKc3BlZWQgdGhlIEdQVSBjYW1lIHVw
IHdpdGguCgpBbHNvIHRoaXMgc2VyaWVzIGRlcGVuZHMgb24gdGhlIFBDSWUgaW1wcm92ZW1lbnQg
cGF0Y2hlcyBJIHNlbnQgb3V0CnJlY2VudGx5LgoKS2Fyb2wgSGVyYnN0ICg0KToKICBwY2k6IGVu
YWJsZSBwY2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgcGNpOiBhZGQgbnZrbV9wY2llX2dl
dF9zcGVlZAogIHBjaTogc2V0IHRoZSBwY2llIGxpbmsgc3BlZWQgdG8gOC4wIHdoZW4gc3VzcGVu
ZGluZwogIGRybTogYWJvcnQgcnVudGltZSBzdXNwZW5kIGlmIHdlIGhpdCBhbiBlcnJvcgoKIGRy
bS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL2RldmljZS5oIHwgIDIgKysKIGRybS9ub3V2ZWF1
L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmggIHwgIDQgKystCiBkcm0vbm91dmVhdS9ub3V2ZWF1
X2RybS5jICAgICAgICAgICAgICB8ICA2ICsrKysrCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9j
bGsvYmFzZS5jICAgICB8ICAyICstCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvYmFzZS5j
ICAgICB8ICAyICsrCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyAgICB8ICA4
ICsrKy0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMgICAgfCAxMSArKysr
KysrKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICAgfCAzNSArKysrKysr
KysrKysrKysrKysrKysrKy0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaCAg
ICAgfCAgNiArKysrKwogOSBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
