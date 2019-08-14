Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576C28DFD2
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 23:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D1289A83;
	Wed, 14 Aug 2019 21:31:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34406E848
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 21:31:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 31so477894wrm.1
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 14:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tYm0oLJfCUJDLfaw8xlKVmKmh5gb1gg5bZ8BsqpbG2w=;
 b=jwo7uQl2B3Z033scVXEXRATn2u67ykFuh4d3xrNmPLlA65l5pLYJCNvo1yTeYARUDM
 cIJE5es1SzkKYMs8+H9CF6Uxr66i251NRdWjIU+Fgp61EOiTWRXfL9VN/qGgGg96e+FS
 gfRt0BRNOgJhQD1WqHUX+e0ljwGxYpxkS+qPR25DwHHEkHEA21n5YSRWtHQ6yTMCldRM
 5F68v2wPJxhEIuho6337KtEVvPMUfpQEiLmBxvUBlLoTJoO8cpQvdyE3BLaAw0vdldXo
 xx3u6DqXFDhYfUHUe6YAikmphTOkVtEVJ1QY2lSno47v0u/LYc4QKSHxbN++WTEe32wi
 MXxg==
X-Gm-Message-State: APjAAAU0RDVlWM8qXBQVfkoEwc86QAkpEzOljVobeLZmnLTc8922zZLR
 V6ljy/NAIhrOyUbRaowQq4wu5A==
X-Google-Smtp-Source: APXvYqw8lLuTxZ6hfwdZzJNnfdFn5XmLS+VVLFtxxRVv3rAphO1bdipm2Vg6J5p9FbEQHc8AEmYICA==
X-Received: by 2002:a5d:46d1:: with SMTP id g17mr1683889wrs.131.1565818282025; 
 Wed, 14 Aug 2019 14:31:22 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8108:453f:d1a0:28d1:9d88:57f6:f95b])
 by smtp.gmail.com with ESMTPSA id r17sm2095134wrg.93.2019.08.14.14.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 14:31:21 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Wed, 14 Aug 2019 23:31:11 +0200
Message-Id: <20190814213118.28473-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/7] Adding a proper workaround for fixing RTD3
 issues with Nouveau
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

Rmlyc3QgdGhyZWUgcGF0Y2hlcyBhcmUgcmVtb3ZpbmcgQUNQSSB3b3JrYXJvdW5kcyB3aGljaCBz
aG91bGQgaGF2ZSBuZXZlcgpsYW5kZWQuCgpUaGUgbGFzdCBmb3VyIGFyZSBhZGRpbmcgYSB3b3Jr
YXJvdW5kIHRvIG5vdXZlYXUgd2hpY2ggc2VlbSB0byBoZWxwIHF1aXRlCmEgbG90IHdpdGggdGhl
IFJURDMgaXNzdWVzIHdpdGggTm91dmVhdSwgc28gbGV0J3MgZGlzY3VzcyBhbmQgZ2V0IHdpZGVy
CnRlc3Rpbmcgb2YgdGhvc2UgYW5kIHNlZSBpZiB0aGVyZSBpcyBhbnkgZmFsbG91dCBvciBsYXB0
b3BzIHdoZXJlIHRoZQppc3N1ZXMgZG9uJ3QgZ2V0IGZpeGVkLgoKS2Fyb2wgSGVyYnN0ICg3KToK
ICBSZXZlcnQgIkFDUEkgLyBPU0k6IEFkZCBPRU0gX09TSSBzdHJpbmcgdG8gZW5hYmxlIGRHUFUg
ZGlyZWN0IG91dHB1dCIKICBSZXZlcnQgIkFDUEkgLyBPU0k6IEFkZCBPRU0gX09TSSBzdHJpbmcg
dG8gZW5hYmxlIE5WaWRpYSBIRE1JIGF1ZGlvIgogIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9F
TSBfT1NJIHN0cmluZ3MgdG8gZGlzYWJsZSBOVmlkaWEgUlREMyIKICBkcm0vbm91dmVhdS9wY2k6
IGVuYWJsZSBwY2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgZHJtL25vdXZlYXUvcGNpOiBh
ZGQgbnZrbV9wY2llX2dldF9zcGVlZAogIGRybS9ub3V2ZWF1L3BjaTogc2F2ZSB0aGUgYm9vdCBw
Y2llIGxpbmsgc3BlZWQgYW5kIHJlc3RvcmUgaXQgb24gZmluaQogIGRybS9ub3V2ZWF1OiBhYm9y
dCBydW50aW1lIHN1c3BlbmQgaWYgd2UgaGl0IGFuIGVycm9yCgogZHJpdmVycy9hY3BpL29zaS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjQgLS0tLS0tLS0tLQogLi4uL2RybS9ub3V2
ZWF1L2luY2x1ZGUvbnZrbS9jb3JlL2RldmljZS5oICAgIHwgIDIgKwogLi4uL2dwdS9kcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oIHwgIDkgKystLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kcm0uYyAgICAgICAgIHwgIDYgKysrCiAuLi4vZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L2Nsay9iYXNlLmMgICAgfCAgMiArLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvYmFzZS5jICAgIHwgIDkgKysrLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyAgIHwgIDggKystLQogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvZ3AxMDAuYyAgIHwgMTAgKysrKwogLi4uL2dwdS9kcm0vbm91dmVh
dS9udmttL3N1YmRldi9wY2kvcGNpZS5jICAgIHwgNDYgKysrKysrKysrKysrKysrKystLQogLi4u
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oICAgIHwgIDcgKysrCiAxMCBm
aWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
