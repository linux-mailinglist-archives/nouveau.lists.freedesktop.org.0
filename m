Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16DED028
	for <lists+nouveau@lfdr.de>; Sat,  2 Nov 2019 18:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826BC6E500;
	Sat,  2 Nov 2019 17:57:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACE56E500;
 Sat,  2 Nov 2019 17:57:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q130so12044037wme.2;
 Sat, 02 Nov 2019 10:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
 b=DGCLmKbr29oaN5qiB0pqVP6rrJakaJxG6neTC/o+CSuWyHtaF092uxFZr7ds/y5RpA
 GIIJP+IcbhR12MglyKMjjnI+tqBqfP5JRhHXCs4jsCxEA1CWBxgvh1HetEtIeB3eHk7x
 mwzz1Qns6BS+uzbxWAbWAtDY164UUBJrmECuzwh1OnGyhRWqCIJGv4Uke9uV4rRhzO/H
 L1N7Q9fdkMPAY0H/ZK4lVzCwrG5VVg8q4RuNsM6z4HjdCIL1375zhaZO///2OHxBVjcc
 HxVW2/q3tUAKGpyMUVTyZQCRxrgiW0Dj5twQ8to6LOe5usv5OrqoD8ThMgTEkkcThPZ4
 3rLQ==
X-Gm-Message-State: APjAAAXz046opAxiZIZOifydkomjoXrHqYOJP9b76R3h5H3JuMjTroy/
 uDSrkBLGHCvRvuxGDGtYWtJberMN
X-Google-Smtp-Source: APXvYqylSa5xQza6BCuat0c+VFhWosAfc/mcoFK3Z3DTN66n2gfL4tq3KX7mnuNq/rdbV9NYuPbAcw==
X-Received: by 2002:a1c:7ec2:: with SMTP id z185mr15811883wmc.79.1572717420566; 
 Sat, 02 Nov 2019 10:57:00 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b3sm6918849wmh.17.2019.11.02.10.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Date: Sat,  2 Nov 2019 18:56:37 +0100
Message-Id: <20191102175637.3065-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
 b=kGdAlsC0kEb4EWVcirGKrl+8N8G7z11eyL+N++FGbwwSzSoE6ZcKMLbYcO8O5MdHOg
 /IO8dqfY6v0T5HTtAWyebqsKBaTGXbhc9QsdM8p72pWjQu+b7J+v8R1PZIHMiVh0nFjI
 uM1nErfIpv1RyrpdMMbnwoT1L7pfUI3/Gv0yONmxOc32v6QGgAj+wsOU3sPZggGQdUtv
 0gBO1OXVkMZiZPD4RnAsf8+xvDExix3v/FbSNTLdzkj6GsKNigJ/txIoV4KYIw/N11wB
 GFd5SNI+R06IQtGoyrul/YY6ihqwEkhOwNXA1P/S8jcoculMy2EX307WJrYSmpcc0FW/
 PKeA==
Subject: [Nouveau] [PATCH v2 9/9] drm/nouveau: gp10b: Use correct copy engine
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCmdwMTBiIHVzZXMgdGhl
IG5ldyBlbmdpbmUgZW51bWVyYXRpb24gbWVjaGFuaXNtIGludHJvZHVjZWQgaW4gdGhlIFBhc2Nh
bAphcmNoaXRlY3R1cmUuIEFzIGEgcmVzdWx0LCB0aGUgY29weSBlbmdpbmUsIHdoaWNoIHVzZWQg
dG8gYmUgYXQgaW5kZXggMgpmb3IgcHJpb3IgVGVncmEgR1BVIGluc3RhbnRpYXRpb25zLCBoYXMg
bm93IG1vdmVkIHRvIGluZGV4IDAuIEZpeCB1cCB0aGUKaW5kZXggYW5kIGFsc28gdXNlIHRoZSBn
cDEwMCB2YXJpYW50IG9mIHRoZSBjb3B5IGVuZ2luZSBjbGFzcyBiZWNhdXNlIG9uCmdwMTBiIHRo
ZSBQQVNDQUxfRE1BX0NPUFlfQiBjbGFzcyBpcyBub3Qgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvYmFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9lbmdpbmUvZGV2aWNlL2Jhc2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS9iYXNlLmMKaW5kZXggMjMxZWMwMDczYWYzLi5l
YmE0NTBlNjg5YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5n
aW5lL2RldmljZS9iYXNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9lbmdp
bmUvZGV2aWNlL2Jhc2UuYwpAQCAtMjM4Nyw3ICsyMzg3LDcgQEAgbnYxM2JfY2hpcHNldCA9IHsK
IAkucG11ID0gZ20yMGJfcG11X25ldywKIAkudGltZXIgPSBnazIwYV90aW1lcl9uZXcsCiAJLnRv
cCA9IGdrMTA0X3RvcF9uZXcsCi0JLmNlWzJdID0gZ3AxMDJfY2VfbmV3LAorCS5jZVswXSA9IGdw
MTAwX2NlX25ldywKIAkuZG1hID0gZ2YxMTlfZG1hX25ldywKIAkuZmlmbyA9IGdwMTBiX2ZpZm9f
bmV3LAogCS5nciA9IGdwMTBiX2dyX25ldywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
