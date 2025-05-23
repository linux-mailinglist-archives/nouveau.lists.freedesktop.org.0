Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72DAC2719
	for <lists+nouveau@lfdr.de>; Fri, 23 May 2025 18:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0E210E82B;
	Fri, 23 May 2025 16:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EiYIPu8i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C8610E82C
 for <nouveau@lists.freedesktop.org>; Fri, 23 May 2025 16:03:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so77926805e9.1
 for <nouveau@lists.freedesktop.org>; Fri, 23 May 2025 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016221; x=1748621021; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZROelaUJIco0HUKcL0fQmEX3Sg2E9R/eSWRDiQ8LoKI=;
 b=EiYIPu8iEZFiAGA+P1F9xbFL8QoiTWJvjy/lBeRRkU4U6283EuyfkE9eKJnH/kscAJ
 3crU0stKPDNhpn1SvjVr0EQNFBtfwFc+zUT1vQDbD/v9gezPvqX5YBlmxPRxGW8qpEGA
 yZRVsXUHUwLk8p73uwK3Y2ofntgYW92OltW5Sui4VwdE0DTZsCzzCaJK0pEuBcgaWjLq
 5NFGboqM98wWzJdVukKcbqAf7hEaC1X8b6of5mfjqZ2IgOVcNTlkL8p0x+wqz0i4/p73
 q+QsYXNnAjZnupose72dI6gJF4z70JYpMUkvF7nVTs4yUCQVhBGDr1Q+DbUExY8hJ3JO
 LdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016221; x=1748621021;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZROelaUJIco0HUKcL0fQmEX3Sg2E9R/eSWRDiQ8LoKI=;
 b=l/uJAzG72Wp+QO17bEFvOMyg06qM+V342mAzHogKCSyiM5m5h6uNs+CIExcKP++/P+
 WBPcVEEp+gFLDpLBCLGVnf4RW2lTLy+PfTmr5CQaduu0EB0irWVAtyN2QvHkx8L2Vxoq
 GPl5m1pecYWPtQ3Htr6n1+d4yfdxmmAn+90vS0wWDz+nY0uM2tNQDhrIrqdT1vD1dylq
 jyhP57T2glt2kCWzDtSnDTcDb1T5ftTu8biN85CebVjLCLglBTKpzcD/gy2i38KE99Dd
 AOvWAIjRMCjmzGHHEVhLeTDQDgbt/s0PtO2UNjSBfsZx1ShYPCryACWlG4rZ1+YgcKTw
 4m+w==
X-Gm-Message-State: AOJu0Ywl6pp0sRO3xnbEzgOP7YZKMJLL5M3lKc5CoSero6mo1dSxXFwY
 Bg9IBTZO9mEpEOcqHUqJKn434g/1Fdp/Q6fcPH6Gyoo5jh2+gcHMhTGCJn9OSC4EErg=
X-Gm-Gg: ASbGncs3TlX1z2iZtWuEq7osZUVs7IMfBEN9hwaddvzsqBpuDmm2K0761n/+mLpYdMb
 izIIn7zdoJj9VqdVMgRd4DIKyXb5iVhd1oSbZUp6aGgF9eUDIp8jP9nb3IYfe+l1tSABAmJPw3V
 4O8adAqBY8dyllTss1BUAxlZhPEBDc6oESFGeL5y2gEh6b7hdHv1S6P9DP//G8/dPVHgFxr23ct
 nER0obdw1xY+7S2zXRv5kEE9UCULT/kFJyJbvz/q27jxI0EvYXBF1WGM8b1gME+8lTLXUGpkZGv
 Awd2OHcWezn6b2VyJEm9oZQJd8/Ads0J9+6lKQC9mrdqIIuJ7E5OdORO
X-Google-Smtp-Source: AGHT+IG6kOl3RVAT5DyDXYpDd+GUAi7WWd4eDFNNwNZfJgeSTGXWXYhiCHD3NZIxnrY8AG1MKkk+jA==
X-Received: by 2002:a05:600c:4688:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-44b6d2cc4a9mr53872855e9.10.1748016220418; 
 Fri, 23 May 2025 09:03:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442ebd6fe86sm259383565e9.0.2025.05.23.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:03:39 -0700 (PDT)
Date: Fri, 23 May 2025 19:03:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: [bug report] drm/nouveau/gsp: add hal for gsp.get_static_info()
Message-ID: <aDCcWNFvrxtx8cXE@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

[ Did these files get renamed or something?  No idea why the warnings
  are showing up as new now. ]

Hello Ben Skeggs,

Commit 7bb77eacdb85 ("drm/nouveau/gsp: add hal for
gsp.get_static_info()") from Nov 14, 2024 (linux-next), leads to the
following Smatch static checker warning:

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c:47 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c:223 r535_gsp_get_static_info() warn: 'rpc' can also be NULL
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c:90 r570_gsp_get_static_info() warn: 'rpc' can also be NULL

drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
    212 static int
    213 r535_gsp_get_static_info(struct nvkm_gsp *gsp)
    214 {
    215         GspStaticConfigInfo *rpc;
    216 
    217         rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
    218         if (IS_ERR(rpc))
    219                 return PTR_ERR(rpc);
    220 
    221         gsp->internal.client.object.client = &gsp->internal.client;
    222         gsp->internal.client.object.parent = NULL;
--> 223         gsp->internal.client.object.handle = rpc->hInternalClient;
                                                     ^^^^^

The nvkm_gsp_rpc_rd() function returns a mix of error pointers and NULL but
if it returns NULL then obviously this dereference will crash.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

regards,
dan carpenter
