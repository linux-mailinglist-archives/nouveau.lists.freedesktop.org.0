Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D490A99F
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 11:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262A010E29E;
	Mon, 17 Jun 2024 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m4jQs6zQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D310E29E
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 09:33:14 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ead2c6b50bso45912771fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718616792; x=1719221592; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XR5GYB9eKu58vQFoGUBee/KjF/Xw+p5AvKjlrAjbe4E=;
 b=m4jQs6zQ7b1lx1xaoBKT+UIxpaz+q3cmk18F5TzxXSlKcQUXi9NBjkEbZDfy17OtwG
 /gzqHsZPLJgndA/cGHK3/wzvH74miLmyxLAxjKCPqyrnR6ARWy2m3e9dPTzgbTbZ6Zfc
 64mkg7KjLkuqkNpda5XzhF8OjX/uTmrOM2X87Ve6JIt86+d0g76qoaLBnL50tjD04Fhm
 0YpX6Hn4g3pMEC0c1KJqD7NUomvR1fExU6MQ2rzx6TDR1xjn19vwn9gN6G/wGpAXuayT
 sSezvLrORO5trArJ2sA6QIpyOVKTuVGpWjEws6cRTheSzmjnz0wmekagqK9pi4GKuDec
 vVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616792; x=1719221592;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XR5GYB9eKu58vQFoGUBee/KjF/Xw+p5AvKjlrAjbe4E=;
 b=XIVhRQM6nssg47xIxi22iqLeoWVvBXhZn1crY/WP6qTdyMS8CR5WJ3p8kbMaMuTBkb
 3PalsPeMxZn0TEcxe/TUH+AVbnlaq/GXFxGHYGVEGCPqwgw0p+ujmgiEUvkPa6/11FIu
 kflESqcmdzzhY6gnW9v8U+N3KTxJ/n6543lKxF45nsU24jjxG9nDOiC4WC1eyg/AqvhJ
 pKY/Vcy/9mcwKihAWFNDROqgVYUY0sAZ/hm6x8GtkfEK4DQZOvSaP1PNM7DQBcYVAsG/
 oOglmeEFX0s3S5zpLazFxWvLeQ3ABNfXRsamIngBMNUOY1SAZABaz4PrVhDQY5LWyGOM
 MmRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWx5r9Nbsa8+hIRur09pG9wE0/uVupewcBWZ+0Mn1Tfb+CsjZPbWe6QYOWIA1Xh/rawHlzynCz+ebVNoAGaxBtYJLLTgbIQK5xvcFFmg==
X-Gm-Message-State: AOJu0YwQXDMvcPSnZU5aPNSg638+yI6bXfPg1g5fYlYkptvpuobXGf/G
 JXlqPvsoyGBaudvsmnzJ5cjoZ7tmeBGKSc4iVmOvFavrGQqVHxPnEP2NKHPpHFs=
X-Google-Smtp-Source: AGHT+IEa3K7XWz/lzC+j+im6KTvLDjDG7zCAkU3RZRrqaUfwf+xaegKVQs8z15qdzYiqFHNsN+qEbw==
X-Received: by 2002:a2e:9f44:0:b0:2ea:e98e:4399 with SMTP id
 38308e7fff4ca-2ec0e5ffc00mr63770771fa.36.1718616792269; 
 Mon, 17 Jun 2024 02:33:12 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bfdsm153872995e9.37.2024.06.17.02.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:33:11 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
Message-ID: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

Use kmemdup_array() because we're allocating an array.

The main difference between kmemdup() and kmemdup_array() is that the
kmemdup_array() function has integer overflow checking built it.  The
"args->in_sync.count" variable is a u32 so integer overflows would only
be a concern on 32bit systems.  Fortunately, however, the u_memcpya()
function has integer overflow checking which means that it is not an
issue.

Still using kmemdup_array() is more appropriate and makes auditing the
code easier.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..53d8b0584a56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -45,10 +45,10 @@ nouveau_job_init(struct nouveau_job *job,
 		if (job->sync)
 			return -EINVAL;
 
-		job->in_sync.data = kmemdup(args->in_sync.s,
-					 sizeof(*args->in_sync.s) *
-					 args->in_sync.count,
-					 GFP_KERNEL);
+		job->in_sync.data = kmemdup_array(args->in_sync.s,
+					args->in_sync.count,
+					sizeof(*args->in_sync.s),
+					GFP_KERNEL);
 		if (!job->in_sync.data)
 			return -ENOMEM;
 	}
@@ -60,10 +60,10 @@ nouveau_job_init(struct nouveau_job *job,
 			goto err_free_in_sync;
 		}
 
-		job->out_sync.data = kmemdup(args->out_sync.s,
-					  sizeof(*args->out_sync.s) *
-					  args->out_sync.count,
-					  GFP_KERNEL);
+		job->out_sync.data = kmemdup_array(args->out_sync.s,
+					args->out_sync.count,
+					sizeof(*args->out_sync.s),
+					GFP_KERNEL);
 		if (!job->out_sync.data) {
 			ret = -ENOMEM;
 			goto err_free_in_sync;
-- 
2.43.0

