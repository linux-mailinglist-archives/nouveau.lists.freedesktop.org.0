Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 145FC59A6D9
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 22:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6678810E36E;
	Fri, 19 Aug 2022 20:09:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB23010E8E4
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660939777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4WKsTj80+KlAOcyLxVq2MH02vD1fdMO95DXY/VPgDU4=;
 b=N3eVlCeFh9tB7G/XEZyNDE+UJLZZnQyz/pkFHetLhOSCMMRUkjWM7CIU/qcZ/YYNaP2AT3
 /LUZjqj2O+8lxhbxKef/K20XysqVAs6oV5VtlyFuuN6xrWUtJ3B/Ai7lt8vISTFXBzf6/K
 6zcjp+XeOc0x7d0ZDM4u5sGTtd/wXvQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-8nc5UunaPlima6Kitr_PBQ-1; Fri, 19 Aug 2022 16:09:36 -0400
X-MC-Unique: 8nc5UunaPlima6Kitr_PBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so4778137wmq.0
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 13:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4WKsTj80+KlAOcyLxVq2MH02vD1fdMO95DXY/VPgDU4=;
 b=Ephqjwk2DCAYQGr0ZlrCxUxexVhVJbGBBiYpKWIq0b9vpj5ojoPXqAxYV1VGoodnw8
 51R/JqvpSKvG3vqHPhcR3tOPQY3q0Q3iruMdHB8cRopd6lROlamRVuCWsGxpb2pcDX+T
 YfMS7/vvCqbwqJT5CHE406ppwvBgKZ5rCbTG5BqeK67eEw8QmgyMOcfHjRLpd7lH3ZlW
 HWzTJ/PICKs3k6tkP+ngV/UhF/jL8gnAc2aDRebatb49zSd6botrl4dDhDVN2z6qfBPd
 t2a69vqU3toEwrUglmyY9vfFGHgV5jKw9Edni+YIp1rfRoAYHaaPwmxqu+cuIzJGUXP0
 1Awg==
X-Gm-Message-State: ACgBeo1aTDT8IV//Id/VELKqZQ/pofMGGDm9XgUA+LNag2GNYEyTt0qP
 XBrVcRku83oiZ4LxskXUS9BwWs5dl5ngXGQI/ugaKuB1YHPbexOjwWrLDDaBWuFbpLJCexS4yOH
 /U5z0pU5ideEhpJHNVV+M/8nZ2A==
X-Received: by 2002:a05:6000:18c:b0:21f:170d:446e with SMTP id
 p12-20020a056000018c00b0021f170d446emr5029338wrx.304.1660939775733; 
 Fri, 19 Aug 2022 13:09:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41MvAqMhAqH36jAsYe/x4lLfhc9bERm3BktAuEeK79ImvBnIv/1szPfEWDOHxRsmuy+tKIGA==
X-Received: by 2002:a05:6000:18c:b0:21f:170d:446e with SMTP id
 p12-20020a056000018c00b0021f170d446emr5029327wrx.304.1660939775474; 
 Fri, 19 Aug 2022 13:09:35 -0700 (PDT)
Received: from kherbst.pingu.com ([31.16.187.72])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdb92000000b0021eaf4138aesm5991920wri.108.2022.08.19.13.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 13:09:34 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Aug 2022 22:09:28 +0200
Message-Id: <20220819200928.401416-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

It is a bit unlcear to us why that's helping, but it does and unbreaks
suspend/resume on a lot of GPUs without any known drawbacks.

Cc: stable@vger.kernel.org # v5.15+
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 35bb0bb3fe61..126b3c6e12f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 		if (ret == 0) {
 			ret = nouveau_fence_new(chan, false, &fence);
 			if (ret == 0) {
+				/* TODO: figure out a better solution here
+				 *
+				 * wait on the fence here explicitly as going through
+				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
+				 *
+				 * Without this the operation can timeout and we'll fallback to a
+				 * software copy, which might take several minutes to finish.
+				 */
+				nouveau_fence_wait(fence, false, false);
 				ret = ttm_bo_move_accel_cleanup(bo,
 								&fence->base,
 								evict, false,
-- 
2.37.1

