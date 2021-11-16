Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E584596FF
	for <lists+nouveau@lfdr.de>; Mon, 22 Nov 2021 22:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259F89D9B;
	Mon, 22 Nov 2021 21:52:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 16 Nov 2021 07:15:33 UTC
Received: from mx2.ucr.edu (mx.ucr.edu [138.23.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B7E6E910
 for <nouveau@lists.freedesktop.org>; Tue, 16 Nov 2021 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1637046933; x=1668582933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VO2ps4lqNewVdq22Zvj/a2S0OmORg6rzuJt+A60klUs=;
 b=q0Aa2HlnxLQ7JzHW7Bb1D7mKP5Fo/rt2aXU+VaoZgiqPFj/kzYeQSROk
 lmeg5b+Fu4XQ7F/tJI2XLEuoOh3+bUoo47Pfg5yPsK7RT2OuougvuIZjW
 j8805uiiS5snEV8cFLTCh68c1Nr+da9d3reJumUpKpMNvHqMr+G3gkK/5
 +o5mpeNJQaDmNAP2H3QFsJ23NjccPTkzkcyM8vH7GUoE5nh/8N9W20hm6
 SwOADv6VP9KMp9auRgrFbxceEp9w8FyFfAGjuApwWWUScuHS2iKOVXjOS
 2xPAUnqdQr79JohiPkD+jnkR168UTsHb6MOImc68i2L7jp9uxZ4p+HLHs g==;
IronPort-SDR: ZXGEB/vQ/iTJ0WEFv+fxDO84Y+ot2EjZb9WG4U6UGU4K0aPHCVH8vW0ibLCbru89D5qB6tcFrT
 EGGDVWwyaX7ug89oiGYesiRl4vKEDjCJftOImV+pEfZXe0u2BOwHjt2TCJf1p9Uj+TJex6UfiG
 CgIuczlf7Gx2tQgvfAyI2rASzyXOzrFlGQh91hU3DxUht06U9UZL2ZxyPqg2qT1ROTBzintubI
 IS8IWBTgwnrgLH48qc2iEd9OsEHEJTB0PTzZuCTF3gf60Gr5AglrAAspGGm6X6c7uskWS+H8de
 FPRya/RR9UoUr663p+waKwSQ
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; d="scan'208";a="197345624"
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2021 23:08:26 -0800
Received: by mail-qv1-f72.google.com with SMTP id
 dz17-20020ad45891000000b003bbb4aba6d7so18405876qvb.12
 for <nouveau@lists.freedesktop.org>; Mon, 15 Nov 2021 23:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=GTwP4sC0lF0Nu4knrINh27vw5wfFRisKOITj8cPSjtfYQq9hjSO2crPj3dJH52NAxD
 Xsk5ANQ7ZKFYCveEzMIh7H+vrcaWGRxnLLueKLPqdXLSgAN66gYOwmPW+LSjmlDv5ehZ
 hv3TXuUyxOaqP1EhLfwrnsl6VhgzuNAC73d7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3HI54mJH/tMRV5CdW0GGK2Uj3sS8rXd01TKP0agSfQ=;
 b=lQHhdQNyPXrlyFEckjftWZwgfpuy8VpwANUGxf0Dzm0xmtmAeBjKd/AkrnKj/DAg3W
 lty6wImzRBURHdO29w+yzYImxp97KSlFwkvIjc7yoS9RWRpiM/U11xZ8yQBQMt5AedYR
 FB62Kg9wQXXkW8CkAnZN7FysYAjoyclnnRS+Hoi9O5RW+MCv9LcdIjqrF/y9hSBfvTnF
 3gRyohC6Rou5by6cO30/vYx2MJjaHV4/kzPW2E5VK1Wq2Pxj+8oas4DYpgM9Evthvz60
 H6JEdrpUpMdHNAEvxwFzeHwnAmsHfd3VsqJ97sqAwBkRpM2yF42gmMeKYPsgsALgKAvV
 ny5w==
X-Gm-Message-State: AOAM532u1Oq//ig3OHZpUrDxRnogSamB5v+t1QjJkdJmieQAJg0YFMGl
 yaqGX/fZYnTRIlhcXtR3cF9i8Ce2xZcXeVXu/vjzUUAspfxpd4lg+tpXeVwMiEApcIgI70U/iUt
 aCk4XNLFLNHGAcWYAjTlj9xmpaIA=
X-Received: by 2002:a37:b5c4:: with SMTP id e187mr4262982qkf.27.1637046505204; 
 Mon, 15 Nov 2021 23:08:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb3aSuqiN7aOqI9nXkfty0FhMxgFyD4ABCEt+11IBb/1fmKrOrRX6A5Su3hDTXUShP/OaowA==
X-Received: by 2002:a37:b5c4:: with SMTP id e187mr4262967qkf.27.1637046505050; 
 Mon, 15 Nov 2021 23:08:25 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id w10sm7205942qtj.37.2021.11.15.23.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 23:08:24 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Date: Mon, 15 Nov 2021 23:07:05 -0800
Message-Id: <20211116070708.429432-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116070708.429432-1-yzhai003@ucr.edu>
References: <20211116070708.429432-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 21:52:42 +0000
Subject: [Nouveau] [PATCH] In function nvkm_ioctl_map(),
 the variable "type" could be uninitialized if "nvkm_object_map()"
 returns error code, however,
 it does not check the return value and directly use the "type" in the if
 statement, which is potentially unsafe.
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
 Yizhuo Zhai <yzhai003@ucr.edu>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes:01326050391ce("drm/nouveau/core/object: allow arguments to
be passed to map function")
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 735cb6816f10..4264d9d79783 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -266,6 +266,8 @@ nvkm_ioctl_map(struct nvkm_client *client,
 		ret = nvkm_object_map(object, data, size, &type,
 				      &args->v0.handle,
 				      &args->v0.length);
+		if (ret)
+			return ret;
 		if (type == NVKM_OBJECT_MAP_IO)
 			args->v0.type = NVIF_IOCTL_MAP_V0_IO;
 		else
-- 
2.25.1

