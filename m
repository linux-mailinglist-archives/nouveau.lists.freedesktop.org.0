Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA310362288
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 16:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C116EC0E;
	Fri, 16 Apr 2021 14:37:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC526EC0E
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h10so32525578edt.13
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=HIAesytEg5S3sduMFPZ6ZtYIe1kNf+o5CbxfxLRVidE4pbMb2kNGB64UxIGQU2qRyM
 enc++rAblmvxbBCHBLncASVRGti1rSEsilx9FwhuOehh6gVuXXsI6Re/bG3gJuv+y+in
 CSCstZfPkCUC7FIEyTX+0I7CB1NSsmmH1fDey0abB0EpwuZKW6ueLNv/XdiZ2V2UEJn4
 NQlDG1UkwPm+gpcJ6bieuV8UmL8z8ZF5GAWLN11J0ywRM/zGDAJQ0Cf9a8fI/BrQfWR+
 FtPDM926uNLX5X90uAItZowa8ttUBbcgMOz/r7cf9oZZHYVBD/Bl8g0a8NvPX7M/jDkE
 Lu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BenSWVQP2zN1koiPW0t4kws5hTFRiEoau/BE1y9GfNM=;
 b=txIlNdK5pUggM8UCoK+/qBRC4MFjqJ1p1G0EcKaw7T0WfkPwLMhmwqaofe3yeP5wkP
 oY+tPZHTiQFnbF5VIWqdAQBnoy+zsJpaBc8LTvm15mE6LAvvPI13mxQFizPzPcnSB7F9
 gVOhLmboAU0eNqxcdA8LaBeyUw50GFeSJ8lHRIZgHE79ufRvbDCv5bjZe8q7yqI+QSNV
 3bOBTd6mk/HxktxhjlAHOXa1RbFuCcLCM8uUj4M3EbE1OOQ/y9H9Ae/KDyNrCUh/jdGp
 m3d5fUeTE4EN13P+HbLxi8yjTQ6jLtpeqFeNS22K3ZsQ8l2L5HWcuN7JMBDgUIDRNJ6Z
 2ADw==
X-Gm-Message-State: AOAM531+lR4MjJTK/td4zy8sGHQxdTXqGNq/cZV/KW31nl6clGZ0p7qp
 FESeTiWOGk3HnEkEQhdk92JORg==
X-Google-Smtp-Source: ABdhPJy03x/bQOosuLTJJIEEGcLYhuxCxgQFnP3tHnQy4iOpxU3Fu9WUEZt8yiBzKt28dhZZF24//Q==
X-Received: by 2002:a05:6402:518b:: with SMTP id
 q11mr10396198edd.151.1618583867088; 
 Fri, 16 Apr 2021 07:37:47 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:37:01 +0100
Message-Id: <20210416143725.2769053-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 16/40] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
