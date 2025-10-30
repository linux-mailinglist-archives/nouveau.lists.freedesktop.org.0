Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0EC22A1B
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 00:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B849510EA74;
	Thu, 30 Oct 2025 23:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PliAInOq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CC310EA7D
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so6507795e9.3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865482; x=1762470282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=PliAInOqOrxQS+ImCg8kjzwaCTrWJ9pDv9fGOzI0WhAu4Uwzti5nGL0GCDcws2RPET
 6+cfEBcw2CQVg9uWr5DyE67WdhITplTm3PJBzljr1XJ8WIvngG3rLblywEM1EPZSX/Wj
 B8i2cqkyQpsRzb55gYFW3KND2QxDu7Kn5clP0eYInP7CU1BxabGWPRH9Lm7c5eSF8FK2
 H4MEQx4anaxy6pSaZpsn1eL27jCW+uOFPZWZu8l0/hwiuYuFgspV2ro5LuCofBnv/5Qv
 iO6Y2M623PNwIlAUd097+yipjs8EG4JSxZXVVeGjOi5ezmX5SaiMXvTES1XGSpE1kRW3
 WUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865482; x=1762470282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=eZK4ibGpHNze9gTQS3XtR0hJRPoe3NMawOuLDJohVii5AGog9t7rap6LRnKwyQrZ8N
 5Y05ds21oYcZHh+X6uzcGy1wldO0EtfsCXsc096Q/Xo9vOwpFgWX8gVYealDaWtn8ngI
 7xZP+maaGKmRMin69dDUSZMlXwjDzkRTe94C8apl/ta+ZFhf1txbHxiK9wUkvevKTjHU
 OdYdskhJMK2xpd+oK/nA5UVXxwUZXWJZ6KrwFU1RnJnVv2j0ytDpb6YcMGdLSyccrDy0
 Uy/jm9Zx+/n2zgzlH2A79R+GmpBSVZr4SyiDgcp/J5CP59TxY1TGK5YICsJXAb1kW6qH
 MUEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxEjzGKSHHI/MEN7ZAsHsLorb+TjSNPnkgK+M7GT6Tqx9deO18V3Db0754E4zkwnXmAxDscDx8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+Pd5KCWPj5YIEhrPeVPZWD9JYt1V7zRJHk4gOcyoMv/q+Jug+
 fOpROxS0xvt34AW4iJXXqVeUy7N6GJue1sdqp4SVmGvDtolAhr7Qe+zN
X-Gm-Gg: ASbGncuUC03weVMdPxPICc/lFH7AfMzd+XGOu+DNV89CS/lnda1FgpDt2o60MJNcem2
 W/4XKaPvEK5xBdDp2b99AzuTPx1wXGjyAPZuYf0/+t0RkTKAwA3xOurQpAB0Q8WBQvnTCC8rnhe
 FS9OtLGMsgq3AQm/prEulEerRjKP9J1mf47fJq2Lvt6aj1mAFlEEor1f75igo7yUcjDYyGqd2EO
 rOCTDT8IHI9ik4LGBr8nasxaFM1P4CU/FDt6RgKtTMnNA25gvaSZVJQNeSrZlxzRhkmelqQcgG7
 EEfBrVpk5su/1e1XbwMZ3Ageb/cOrdFRmY3Ttf3eSYcprF+Bo2iwbxxXh40UDHF5GUhfIp+c0k1
 xGkPjRwtyABi8BhEKvq0qXzXsAZTnMmNEjpLJBixwGgEJ6H5fEu1k9t5fm0wtw0yYb4kRyhTwQv
 E+tUM79X38CoX1WTeGnPv6ng==
X-Google-Smtp-Source: AGHT+IGyCOmFhRjPi1dA9EmPXnKmiW9faJgiGLkzd27O/GNIxvB0MswqzLd3bUuGjgqJLB4E+1ldgQ==
X-Received: by 2002:a05:600c:1c1d:b0:46e:39e1:fc27 with SMTP id
 5b1f17b1804b1-477307d740cmr11913775e9.5.1761865481989; 
 Thu, 30 Oct 2025 16:04:41 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:39 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v3 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Fri, 31 Oct 2025 01:03:57 +0200
Message-ID: <20251030230357.45070-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.1

