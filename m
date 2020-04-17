Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEE1AE451
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 20:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248946E484;
	Fri, 17 Apr 2020 18:10:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2F96E439
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587147041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZVHaielihZDEGIaWLpJhfxJgGD5bvHlKIGPYHp8/+0=;
 b=FBFo4+KIybgKZxEBc37LK3/ouV84KbZzzZ3uO5SCGyOCETUtv5YT4oLYVU4oRJtlw/m3dk
 rA24mtBQg+ZUuk1ztKzEyfVHvMkbiEICIKg6oIsTCkSU85T50JviB29sRUg2yzFiYdiaiV
 o46dlkgRrcOlsYJJDkJIbh0pwZPeIXs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-0Cfu05vVNn-dWpe0zpRqxw-1; Fri, 17 Apr 2020 14:10:37 -0400
X-MC-Unique: 0Cfu05vVNn-dWpe0zpRqxw-1
Received: by mail-wr1-f71.google.com with SMTP id j16so1409174wrw.20
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 11:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+8uMdLriAqVJmmYr+OGkqM7SN5QNtviUiePCstFpzs=;
 b=h9xc3NPaznUHqjnFrvFP8PwOU+rxtFmK9uzegRME9icPtzBeYgvlS5SuOMBerMTLWQ
 K4xKpVbLWPyhf649IPfGaD+hJ81Zf99nAMCZOJWv8t2esFeiaovMKq0QdrZCx6gZ3k6c
 NVVp+H1XV+7ao0gZD9aymEppYlm0uHwpaTsSS5cYY2Mzygr5rbTrbRZWaQDDE90Q1JMG
 kgQxaltp28AgvO0DD51ea2Aey8pfalrf5rU2LBqfBWQxuLaAT3PgFMdo8+ARrvqVRA8i
 WlPLmKAuAfJvPCU+nrJsOqJ3LOlgjGqyh7Mum3oHF4jN+eD+r8HBxlDii+sVh9cKqlDm
 qyUw==
X-Gm-Message-State: AGi0PuY1BCBAwNfg2uViUkPr0E4Q6TYCLnjB/t//kS8JoSpVA9TdONyz
 EK4vvIgkoWESE/LQFDbOQ6nb3TYw1XAHvAIDZre4mq1a5Lo0eR9oWQAE4e8DEWvCoqQdJXM6OaT
 W6SRaq+PJsbAB4KKwKyGsUyNLsQ==
X-Received: by 2002:adf:b35c:: with SMTP id k28mr5191597wrd.61.1587147036085; 
 Fri, 17 Apr 2020 11:10:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypIg7AzAkTt6vFTkZt4XIzkOjQ9Mkt/5+etz3CLspRacP7EGAOV7EnlHv/fl+y6Cr+xMD7RXmA==
X-Received: by 2002:adf:b35c:: with SMTP id k28mr5191584wrd.61.1587147035926; 
 Fri, 17 Apr 2020 11:10:35 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id e5sm33878381wru.92.2020.04.17.11.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:10:35 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 20:09:31 +0200
Message-Id: <20200417180932.111335-2-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200417180932.111335-1-kherbst@redhat.com>
References: <20200417180932.111335-1-kherbst@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 2/3] device: detect if changing endianness
 failed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

v2: relax the checks a little

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 17676c75a..ddaa96a75 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2924,6 +2924,20 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	}
 }
 
+static inline bool
+nvkm_device_endianness(void __iomem *pri)
+{
+	u32 boot1 = ioread32_native(pri + 0x000004) & 0x01000001;
+#ifdef __BIG_ENDIAN
+	if (!boot1)
+		return false;
+#else
+	if (boot1)
+		return false;
+#endif
+	return true;
+}
+
 int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
@@ -2968,13 +2982,15 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			goto done;
 
 		/* switch mmio to cpu's native endianness */
-#ifndef __BIG_ENDIAN
-		if (ioread32_native(map + 0x000004) != 0x00000000) {
-#else
-		if (ioread32_native(map + 0x000004) == 0x00000000) {
-#endif
+		if (!nvkm_device_endianness(map)) {
 			iowrite32_native(0x01000001, map + 0x000004);
 			ioread32_native(map);
+			if (!nvkm_device_endianness(map)) {
+				nvdev_error(device,
+					    "GPU not supported on big-endian\n");
+				ret = -ENOSYS;
+				goto done;
+			}
 		}
 
 		/* read boot0 and strapping information */
-- 
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
