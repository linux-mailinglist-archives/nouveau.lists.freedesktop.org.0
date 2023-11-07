Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5F7E41E3
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 15:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423310E0BC;
	Tue,  7 Nov 2023 14:34:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFBD10E0BC
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 14:34:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9de7a43bd1aso473866066b.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 06:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699367693; x=1699972493; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IuEt3mfpHmJhddvHKOq4iDWL/TbxXgnb9qqLZMA+q8o=;
 b=EcQVJ1SBjvdHbA6vNevSQfc0UgS0yCVzdK5ghhuSzHbQ6egLG6FsgvQAmze1ZOzaGl
 uFf6DP8trxZOZ0UKjwBeOUPlP5SsP830i7DHIFoYLsi0rYOCM4AB29/P42pyEttc9VeH
 FaSn/c6PQleQJzIrEwTACv8d5bKkjDlbX3QZgikZGI9/lr/GqARXYAlnXa4pY4HGsAU0
 Cu3qTUUKmc45xrDHbkvM+z/s6+p9hZuK8h7vvk+Ikbg0K5EhlmmgTGtWyQBNCjeihjAd
 wX1KPyTWTqv2oBUyVJAec0oMl3brXm5OfAp408uoDT/fWyS48Qc361c58b5KpSDYV9pA
 WeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699367693; x=1699972493;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IuEt3mfpHmJhddvHKOq4iDWL/TbxXgnb9qqLZMA+q8o=;
 b=j/6xDsLamdqFVWhuZzOARQD+pEmADxSvtaHx+aXbm9J9hivjk2RRfZDVhaH8pIVmGS
 Oh50BjjDHai+wFnhNUz1mMR+RIvXPw0SD045ap8tEOa2FYbDWahY5LS+pj4Wm3izXhi5
 xtUh+monwHsUDeeKKxMWATwlY6oUVIa5NJNZSwFRMNYWZxoD8igSFeXsoTWZIf7xWV/k
 QwdH41kWZoLWX4GG/dbB8kChoenfOTgjVZwBVRfG/yARdzjXpRfiERCVwf49KdP+neqU
 mTchXf5BKC0KYSMWsp9++T2IWW+R11z57AeL/wGkmW7BLj9daT5FATqMOxxVqW4Hz1xj
 Ewng==
X-Gm-Message-State: AOJu0YwW7NcxbXRqFUjxKjogriFXseCn6yyxd6cDN/W/EOo2H9eCz6w4
 HMQW1Cjck5P1QdK54OPWW1yFQEQj1Py+44lUzDpQKrYh
X-Google-Smtp-Source: AGHT+IG2WKtDA8el3jxxer2BQ5NiVDDZctWYh/gFItM3PJhuEt2pDa2/nufZBeEmnVzHHqUa4Pyczg==
X-Received: by 2002:a17:907:7f07:b0:9c6:3c94:69de with SMTP id
 qf7-20020a1709077f0700b009c63c9469demr18338662ejc.53.1699367693098; 
 Tue, 07 Nov 2023 06:34:53 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a1-20020a170906190100b009b913aa7cdasm1100482eje.92.2023.11.07.06.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 06:34:52 -0800 (PST)
Date: Tue, 7 Nov 2023 17:34:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: bskeggs@redhat.com
Message-ID: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Ben Skeggs,

The patch 176fdcbddfd2: "drm/nouveau/gsp/r535: add support for
booting GSP-RM" from Sep 19, 2023 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1016 r535_gsp_rpc_unloading_guest_driver()
	warn: 'rpc' isn't an ERR_PTR

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
    1010 static int
    1011 r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
    1012 {
    1013         rpc_unloading_guest_driver_v1F_07 *rpc;
    1014 
    1015         rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER, sizeof(*rpc));

nvkm_gsp_rpc_get() returns NULL on error.

--> 1016         if (IS_ERR(rpc))
    1017                 return PTR_ERR(rpc);
    1018 
    1019         if (suspend) {
    1020                 rpc->bInPMTransition = 1;
    1021                 rpc->bGc6Entering = 0;
    1022                 rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
    1023         } else {
    1024                 rpc->bInPMTransition = 0;
    1025                 rpc->bGc6Entering = 0;
    1026                 rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
    1027         }
    1028 
    1029         return nvkm_gsp_rpc_wr(gsp, rpc, true);
    1030 }

regards,
dan carpenter
