Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C951CBAE67
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016B610EC0D;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+r6yDhd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4090710EA98
 for <nouveau@lists.freedesktop.org>; Fri,  5 Dec 2025 09:18:13 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-299d40b0845so32739855ad.3
 for <nouveau@lists.freedesktop.org>; Fri, 05 Dec 2025 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764926293; x=1765531093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0j0YJCbS6oQYnQ2L4OupANlWwp/+4TrkKlZ23ssyQ04=;
 b=O+r6yDhdweVnicUXtlEOyblrDfoSSYgXfjVfNXr2zWT9/yGGg9lKSgYnpwiZzdAVki
 AdRWsJs/FhF/FK1FtLV1jaHimjE2vKy8kg0cYZAB3ruF0PF9BUPX5YxYTu0eYSGHsJuP
 zNWlL1M+CkGwUInbDeZcuLzr8tksosZjEAQH/zzvWovrJ8w0p5jBvJd5MUhHvdaHpGMu
 pLJdQF6ub0Dg3J4iXca2+qIryDtjLmUhKZUnOmkDXh9u6CDrX0x9v35otUEeKpapqpD7
 DZeDkfyLBLE0V2CcLUtndrbuGZBo0/Ya7OfR838JGPC7Ox7MXAOtCFi9yI9oCHuQnqYg
 u82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764926293; x=1765531093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0j0YJCbS6oQYnQ2L4OupANlWwp/+4TrkKlZ23ssyQ04=;
 b=gt0Z7pEfjfAJtL9ImtabcH6AGd2h+S6S49uZdUnY82xFyRhIJdTZGb6RoiE8og3hjG
 Pl4Cq7upkbJst1cGvkA+WbiIYQv6Vci5ppsmFh66SBuFQg+bNhSWWIEavsA5a1M4gLTA
 xun8zNluWRadS10nsfnazTFHkrhss6Tai4nZ2WSL0C4K2GjGxoBclEh4ux32JV1xqkkP
 KsAYMjVndc/aRF6Xja+Fqt49Sshr385p2xBA2SKropW0vSb+GPBtr0hO0wJtZ4eGGXyd
 o8cVQSKCpSwdlK1Tg/sjuEcFkmQmSiO9V+cIAazniAvX0YZODq49A4g9hy5LVGeM5wB1
 ChLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMU7LIxXKPSRPAUrnyUREohDX8E9fQdcaYXamPBJnYPMEBRT1xGjfww2BzVa4Skq/ZB7bS0OMO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVYxrrl6ouUZUbM6HLulQRFj+ktB/1Csk10JKo3XHMAaQBK9Ie
 WKugENeJUSEjFxeBcawDy98BM2KFvbaI5yewP6W6Y48twyFvoRI3zR25
X-Gm-Gg: ASbGncvmoVsSC1eYzE8xgDFdZ/WlYyYueYU8gPfOZyuiNJyhxS6uoTvFBUXnhYCwkIU
 L0YWaCecah0P0sY/tf9ujqHOXdeKyVv/rNfZzHc8ApguKFbUGcXqd5U6sZ0yKt0xKwu/PK/Ene5
 84o8DTFS7+gkT9SlFq9afQyrnfYNofHZzHAcBS5unUtOjlrgF+r5lgXa3Cqu8tu5j5vGv2DETSf
 yr1yhndvwfJwacmh5/lGbNNKpzBxwDmiqhwUv9GHw8ANmzN5rzhcpq/uCpGpPU5pUzZ0zkAQXsT
 Vi6ObV5MYJ+jCbZQM6eFN/yH4Xy7EhqTCYS6apNsWSpkoKjUmHskPV1KRDsnpU3oR/XMz7wBEr1
 xNxYQedXL4UTJNU+3AkMs38GDDsZnJ9P/NUxf0IEz5EGIC8t8AR/tWtElDxqRfv1JWQj+cQXDeE
 ZXw1q6KRlQHDF2
X-Google-Smtp-Source: AGHT+IGCOUoLvA3u5zLY6BxBk1fzKosrU8MdBnpKcDdVzvznTiuHWoSBQRGAkD5ryaGh3mzYwWxshQ==
X-Received: by 2002:a17:902:eccb:b0:297:fc22:3ab2 with SMTP id
 d9443c01a7336-29da1ebb0bamr71800185ad.36.1764926292730; 
 Fri, 05 Dec 2025 01:18:12 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29dae33c2e2sm42761615ad.0.2025.12.05.01.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 01:18:12 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm: nouveau: Replace sprintf() with sysfs_emit()
Date: Fri,  5 Dec 2025 14:48:04 +0530
Message-ID: <20251205091804.317801-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

Replace sprintf() calls with sysfs_emit() to follow current kernel
coding standards.

sysfs_emit() is the preferred method for formatting sysfs output as it
provides better bounds checking and is more secure.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 5c07a9ee8b77..34effe6d86ad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -125,7 +125,7 @@ nouveau_hwmon_get_pwm1_max(struct device *d,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%i\n", ret);
+	return sysfs_emit(buf, "%i\n", ret);
 }
 
 static ssize_t
@@ -141,7 +141,7 @@ nouveau_hwmon_get_pwm1_min(struct device *d,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%i\n", ret);
+	return sysfs_emit(buf, "%i\n", ret);
 }
 
 static ssize_t
-- 
2.52.0

