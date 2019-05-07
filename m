Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6516BEE
	for <lists+nouveau@lfdr.de>; Tue,  7 May 2019 22:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792C889F71;
	Tue,  7 May 2019 20:12:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015589F71
 for <nouveau@lists.freedesktop.org>; Tue,  7 May 2019 20:12:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o25so196025wmf.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 May 2019 13:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nKyf6025ESUlz44iZjTU3xgvh1d2L7dl/tSUxUygF54=;
 b=Oyn4QPYD3w0fRRvSSbi3iiptP6Wl/ohmX5Phruq9OuYtAIfEHbNbA8S7oIBeuJ3NW/
 YY2wPxYeG5gZiMjCUtv85bLGb5BvOzo//L+UiaPdanQ0dBEwUymJvpRZcoREvxpqzqdk
 58KnNOyoBW0d3XUXhupbgoJZ+tpjPoOFipCIThCXXOYnvrECJs35J3VxzKpBRcefqIjO
 PkpWd5igsg6Y2M3EZZVLyJGk8NY7wMGMrvRRqAu0DLScOWDRLIUf5N6N1IMHIWWcK+98
 8lYXiRsJErlrYxCiGbF2F0LIay646hdefea63177OIRFC1/mvCOi9uQzF1/Ao8rEH0Cc
 OUUw==
X-Gm-Message-State: APjAAAV1+zwxHVMw5d6hw7VfDXaHGoN8iJbt3LTw3xSl7ucEmoxNvrqI
 Njok90m4xbJDoVe4A1YRo1aZURBBIFg=
X-Google-Smtp-Source: APXvYqwZRrRSjcME6wz3K5cp6UgzFBiTNBrzm2raKXWh189lYmXlU/yFHjMwGfGrR5YMDOa7yLG/1A==
X-Received: by 2002:a1c:ce:: with SMTP id 197mr129846wma.105.1557259970785;
 Tue, 07 May 2019 13:12:50 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:ac7d:46be:871b:a956])
 by smtp.gmail.com with ESMTPSA id c10sm31816882wrd.69.2019.05.07.13.12.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 13:12:49 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue,  7 May 2019 22:12:41 +0200
Message-Id: <20190507201245.9295-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 0/4] Potential fix for runpm issues on various
 laptops
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
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Q0NpbmcgbGludXgtcGNpIGFuZCBCam9ybiBIZWxnYWFzLiBNYXliZSB3ZSBjb3VsZCBnZXQgYmV0
dGVyIGluc2lnaHRzIG9uCmhvdyBhIHJlYXNvbmFibGUgZml4IHdvdWxkIGxvb2sgbGlrZS4KCkFu
eXdheSwgdG8gbWUgdGhpcyBlbnRpcmUgaXNzdWUgbG9va3MgbGlrZSBzb21ldGhpbmcgd2hpY2gg
aGFzIHRvIGJlIGZpeGVkCm9uIGEgUENJIGxldmVsIGluc3RlYWQgb2YgaW5zaWRlIGEgZHJpdmVy
LCBzbyBpdCBtYWtlcyBzZW5zZSB0byBhc2sgdGhlCnBjaSBmb2xrcyBpZiB0aGV5IGhhdmUgYW55
IGJldHRlciBzdWdnZXN0aW9ucy4KCk9yaWdpbmFsIGNvdmVyIGxldHRlcjoKV2hpbGUgaW52ZXN0
aWdhdGluZyB0aGUgcnVucG0gaXNzdWVzIG9uIG15IEdQMTA3IEkgbm90aWNlZCB0aGF0IHNvbWV0
aGluZwppbnNpZGUgZGV2aW5pdCBtYWtlcyBydW5wbSBicmVhay4gSWYgTm91dmVhdSBsb2FkcyB1
cCB0byB0aGUgcG9pbnQgcmlnaHQKYmVmb3JlIGRvaW5nIGRldmluaXQsIHJ1bnBtIHdvcmtzIHdp
dGhvdXQgYW55IGlzc3VlcywgaWYgZGV2aW5pdCBpcyByYW4sCm5vdCBhbnltb3JlLgoKT3V0IG9m
IGN1cmlvdXNpdHkgSSBldmVuIHRyaWVkIHRvICJiaXNlY3QiIGRldmluaXQgYnkgbm90IHJ1bm5p
bmcgaXQgb24KdmJpb3MgcHJvdmlkZWQgc2lnbmVkIFBNVSBpbWFnZSwgYnV0IG9uIHRoZSBkZXZp
bml0IHBhcnNlciB3ZSBoYXZlIGluc2lkZQpOb3V2ZWF1LgpBbGx0aG91Z2ggdGhpcyBvbmUgaXNu
J3QgYXMgZmVhdHVyZSBjb21wbGV0ZSBhcyB0aGUgdmJpb3Mgb25lLCBJIHdhcyBhYmxlCnRvIHJl
cHJvZHVjZSB0aGUgcnVucG0gaXNzdWVzIGFzIHdlbGwuIEZyb20gdGhhdCBwb2ludCBJIHdhcyBh
YmxlIHRvIG9ubHkKcnVuIGEgY2VydGFpbiBhbW91bnQgb2YgY29tbWFuZHMgdW50aWwgSSBnb3Qg
dG8gc29tZSBQQ0llIGluaXRpYWxpemF0aW9uCmNvZGUgaW5zaWRlIGRldmluaXQgd2hpY2ggdHJp
Z2dlciB0aG9zZSBydW5wbSBpc3N1ZXMuCgpEZXZpbml0IG9uIG15IEdQVSB3YXMgY2hhbmdpbmcg
dGhlIFBDSWUgbGluayBmcm9tIDguMCB0byAyLjUsIHJldmVyc2luZwp0aGF0IG9uIHRoZSBmaW5p
IHBhdGggbWFrZXMgcnVucG0gd29yayBhZ2Fpbi4KClRoZXJlIGFyZSBhIGZldyBvdGhlciB0aGlu
Z3MgZ29pbmcgb24sIGJ1dCB3aXRoIG15IGxpbWl0ZWQga25vd2xlZGdlIGFib3V0ClBDSWUgaW4g
Z2VuZXJhbCwgdGhlIGNoYW5nZSBpbiB0aGUgbGluayBzcGVlZCBzb3VuZGVkIGxpa2UgaXQgY291
bGQgY2F1c2UKaXNzdWVzIG9uIHJlc3VtZSBpZiB0aGUgY29udHJvbGxlciBhbmQgdGhlIGRldmlj
ZSBkaXNhZ3JlZSBvbiB0aGUgYWN0dWFsCmxpbmsuCgpNYXliZSB0aGlzIGlzIGp1c3QgYSBidWcg
d2l0aGluIHRoZSBQQ0kgc3Vic3lzdGVtIGluc2lkZSBsaW51eCBpbnN0ZWFkIGFuZAp0aGUgY29u
dHJvbGxlciBoYXMgdG8gYmUgZm9yY2VkIHRvIGRvIF9zb21ldGhpbmdfPwoKQW55d2F5LCB3aXRo
IHRoaXMgcnVucG0gc2VlbXMgdG8gd29yayBuaWNlbHkgb24gbXkgbWFjaGluZS4gU2VjdXJlIGJv
b3RpbmcKdGhlIGdyIChldmVuIHdpdGggbXkgd29ya2Fyb3VuZCBhcHBsaWVkIEkgbmVlZCBhbnl3
YXkpIG1pZ2h0IGZhaWwgYWZ0ZXIKdGhlIEdQVSBnb3QgcnVudGltZSByZXN1bWVkIHRob3VnaC4u
LgoKS2Fyb2wgSGVyYnN0ICg0KToKICBkcm06IGRvbid0IHNldCB0aGUgcGNpIHBvd2VyIHN0YXRl
IGlmIHRoZSBwY2kgc3Vic3lzdGVtIGhhbmRsZXMgdGhlCiAgICBBQ1BJIGJpdHMKICBwY2k6IGVu
YWJsZSBwY2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgcGNpOiBhZGQgbnZrbV9wY2llX2dl
dF9zcGVlZAogIHBjaTogc2F2ZSB0aGUgYm9vdCBwY2llIGxpbmsgc3BlZWQgYW5kIHJlc3RvcmUg
aXQgb24gZmluaQoKIGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmggfCAgNiAr
KystLQogZHJtL25vdXZlYXUvbm91dmVhdV9hY3BpLmMgICAgICAgICAgICB8ICA3ICsrKysrLQog
ZHJtL25vdXZlYXUvbm91dmVhdV9hY3BpLmggICAgICAgICAgICB8ICAyICsrCiBkcm0vbm91dmVh
dS9ub3V2ZWF1X2RybS5jICAgICAgICAgICAgIHwgMTQgKysrKysrKysrLS0tCiBkcm0vbm91dmVh
dS9ub3V2ZWF1X2Rydi5oICAgICAgICAgICAgIHwgIDIgKysKIGRybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9iYXNlLmMgICAgfCAgOSArKysrKystLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2drMTA0LmMgICB8ICA4ICsrKy0tLS0KIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9n
cDEwMC5jICAgfCAxMCArKysrKysrKysKIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2ll
LmMgICAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRybS9ub3V2ZWF1L252a20v
c3ViZGV2L3BjaS9wcml2LmggICAgfCAgNyArKysrKysKIDEwIGZpbGVzIGNoYW5nZWQsIDgxIGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
