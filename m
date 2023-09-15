Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480C7A1F5F
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 14:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B84710E623;
	Fri, 15 Sep 2023 12:59:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7E10E623
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 12:59:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31ff2ce9d4cso583293f8f.0
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694782765; x=1695387565; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
 b=Lqvt59pK4DG+KfVGRh7Lg+tphk3Ao9wRQPCSmicp4+1HFkjnfA65PnG7fDyXQGb7QC
 scrDsn4XtuCEYGMtzCAS06QYu7OLm4kCn553wbF9jedyZCqp4+3WgJIjodnUyKY31Aou
 psaCDS1X6+nwr7qUK+EfzMy7hGYlSG5udO9EI/kuL1LolbZ3jOqqBWIHXiIVft5/d7gY
 /e02Y14drOyKp3n+EAIVW3sevWk1hoBTYomOSvXnzVgdBmBtSzKGmlU2CyKch8+tg7/O
 9isjj8qKPluOyVO/91qWCAgzI1i4M2IIlWse3H2JuJwNHnkGP8k36OjlNuRGYm2bRH2O
 VV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694782765; x=1695387565;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thYoe0BNHvEOMDMTZOyxjv7HxezTMf3wBNBDqm2Ezmw=;
 b=erF8Tld9zo3iVOZk3TtBroXKJseIJnHvuNeSCPIuMEgnCpTb29DtCZBs0XgGHZ9s3j
 WFFlfcntgkBf7lD/9uDKShXE9xiPWiRcTe/pi7P4Hyy74+KS/83M0VHa7Ej8w3jXTc42
 5lsXO9/KycxdLks7nAwQwc9H0FefLNaOefdPyURPC3kyePIrLqeN5EwfB66A5kMqQAGw
 odFJhbOiRGqwmqC4sKr/SZlnKrm2/TBTTLunXzI4MVEDU7q+7yrhcP0tMaQsBTKhQGJz
 zhPTdeK569EhFuQTjZ/9aNut6OJrbWFjsX8cdYm0WcdgeY8EBmrDzB+vOgy+qlGwqNoL
 rkzg==
X-Gm-Message-State: AOJu0YxQPRZ3ewyLVNcoRP0/Jmo/9t1DMsAqdWYuruwZJ5Pukf0lV8z+
 prBDZgQbAKGDXW4eIPEowGYspQ==
X-Google-Smtp-Source: AGHT+IHDdih5KavdMKTqMTv6Tmh6hfVUdgWGAPg7mzToh5I5IaoOvsPv/APF1zZtGBwwQ9m0ia1rNg==
X-Received: by 2002:adf:f5ca:0:b0:31a:d4d0:6e98 with SMTP id
 k10-20020adff5ca000000b0031ad4d06e98mr1282751wrp.8.1694782765099; 
 Fri, 15 Sep 2023 05:59:25 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n4-20020a1c7204000000b00402f713c56esm4566639wmc.2.2023.09.15.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 05:59:24 -0700 (PDT)
Date: Fri, 15 Sep 2023 15:59:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@redhat.com>
Message-ID: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The u_memcpya() function is supposed to return error pointers on
error.  Returning NULL will lead to an Oops.

Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3666a7403e47..52a708a98915 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 	size_t bytes;
 
 	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	return vmemdup_user(userptr, bytes);
 }
 
-- 
2.39.2

