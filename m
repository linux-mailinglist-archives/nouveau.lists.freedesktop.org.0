Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98082C017
	for <lists+nouveau@lfdr.de>; Fri, 12 Jan 2024 13:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443E810EB71;
	Fri, 12 Jan 2024 12:52:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B1410EB5D;
 Fri, 12 Jan 2024 12:52:05 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5578485fc0eso5383205a12.1; 
 Fri, 12 Jan 2024 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705063924; x=1705668724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JcwEdCpsb2PYZC6jk3i+tru071xEJGYZ85L2FE92gSc=;
 b=M5SHBj8mdGJMQ0PacIMbFbvHi6OBguKIJsTGTTFPjhPeCivs9iVivXwAmqXskrN4Q1
 yNjlxYgK16Pw9FNATka+nSHW+eBmBUjhyewCqRYDPE+UsJDiknGnZSJFje5i9t/7G4rK
 IBFba3origSKK1lM1Nv9z5wGhWJ0BuocFymFnpB7CuSp9eR7bPBNJzaoH++zRMUf7iNI
 zQdDAzGjkf4kQTUnnyh+tyj4KR3O/aX+pi+4QgSORDn3WPsRue/0kJfh+Kf4YPyaMQO0
 GATuZs6fwNeyNIVp9InmnVG5h4l0h+a8VkFgM6o8z3rPcdIrc5/6IVNGTPZCjYPtAYQl
 gEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705063924; x=1705668724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JcwEdCpsb2PYZC6jk3i+tru071xEJGYZ85L2FE92gSc=;
 b=VWAzgRTOUcMAvKxuJhSJV0OpoV2BEvelL0idjLZNvJAMjCVHWr0iTUWuGNRj0kWEI2
 8Tt7J224xijgh3qExE2m//h4zbAbtnOSjRXeU6X+26aVPKyvI0gS3BU3ipnHD/Bgihoq
 J8Lp34cySiUM0WYqp3ybxN2oSHg21o/6rpZGz5DEOKAp7xwjhRM6uaVw5iioQRj31d4d
 iQwmWLjEwt0dNWInF1NIQ1vcnjYc2ydQg/9lGSKxh7BZJhoSnK3nyIC3c/kclyWon9WP
 q7ru5l2dhVxVyQ1s5hENuKHKpSRm7zzfudQ7HUYyVsy4M7VK+L+geCnUucPCSBuLgY2F
 /uUQ==
X-Gm-Message-State: AOJu0YzysiVCwRClD3tbh2innRdsvtYLYcuqgntOmq6gNgiayrjV6UYq
 SqVgt6hWRnb7PwSuu5IPElUItdqTeNfy1w==
X-Google-Smtp-Source: AGHT+IExJYFc8T0in7MDlVlo12iDMyvcYxhNxMABO0KYDHed20bdxdGHdidG0M8zB6GHqIq4h0BKKg==
X-Received: by 2002:a05:6402:31fa:b0:558:e8e1:b087 with SMTP id
 dy26-20020a05640231fa00b00558e8e1b087mr2606edb.41.1705063923989; 
 Fri, 12 Jan 2024 04:52:03 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:5d00:a6e1:95b5:7596:5333])
 by smtp.gmail.com with ESMTPSA id
 y10-20020aa7ccca000000b005572a1159b9sm1752427edt.22.2024.01.12.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 04:52:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com, michel.daenzer@mailbox.org
Subject: [PATCH 2/5] drm/ttm: return ENOSPC from ttm_bo_mem_space
Date: Fri, 12 Jan 2024 13:51:55 +0100
Message-Id: <20240112125158.2748-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112125158.2748-1-christian.koenig@amd.com>
References: <20240112125158.2748-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only convert it to ENOMEM in ttm_bo_validate.

This allows ttm_bo_validate to distinct between an out of memory
situation and just out of space in a placement domain.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b..8c1eaa74fa21 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			goto error;
 	}
 
-	ret = -ENOMEM;
+	ret = -ENOSPC;
 	if (!type_found) {
 		pr_err(TTM_PFX "No compatible memory type found\n");
 		ret = -EINVAL;
@@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		return -EINVAL;
 
 	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	/* For backward compatibility with userspace */
+	if (ret == -ENOSPC)
+		return -ENOMEM;
 	if (ret)
 		return ret;
 
-- 
2.34.1

