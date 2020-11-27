Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7892C6BA9
	for <lists+nouveau@lfdr.de>; Fri, 27 Nov 2020 19:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21A36EE9D;
	Fri, 27 Nov 2020 18:39:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825B16EE9D
 for <nouveau@lists.freedesktop.org>; Fri, 27 Nov 2020 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606502375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ou0ihm1ZRJ4jAkiF1iCHhrbt5Qjc5Z5KkD4Hf0ZuyHI=;
 b=cmc1mrTE+lsw65u8DuTyeOz9eUKhxyGA+Iba64yX5MmrNphlrxbdru73EoyQr71/ScP01M
 hmxsvWbFKZFar2ZtnJPtoylnPhycHdL9C7PFMNtvY4BWjtT6ByTJGCb2x/i6ItHytK9+p9
 tMplG/GSunwZlGT3DL/5USbE2qTPdHk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-8ApWUzKiO3q-Ncq9h8xI9Q-1; Fri, 27 Nov 2020 13:39:33 -0500
X-MC-Unique: 8ApWUzKiO3q-Ncq9h8xI9Q-1
Received: by mail-ed1-f71.google.com with SMTP id b13so2769679edy.8
 for <nouveau@lists.freedesktop.org>; Fri, 27 Nov 2020 10:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou0ihm1ZRJ4jAkiF1iCHhrbt5Qjc5Z5KkD4Hf0ZuyHI=;
 b=ADYU7Y1MzS5zGXTFR1nNIaUdCwUR4ifjL+AjSvXldhJpHhcb3eiRovGV/27XN98DHE
 QdPSs3C2qlrGW++mUj3QD88aPJJlgy43GobTYJ97bW1Seb+QF3r86nbCgcngHTwl2bg5
 PMeDZtzauGfXnahmXOM+N5e1Mg2LByj25tiraKtfQ4JwguKdLnaWcCAHLlsLFyktu4aK
 15Aux+Ny1zIlqQnerSXhQcMlzp8QcADbl3D4IqT0bTEIaVvtwcT9WJ43vu/ZUWhsBNRi
 FmVi2Qhy8tYkL6SaofeXeqJy6Dg+sMvT+8whZsAxCC25eX38cp5NmCQAIDHogjE+VXtG
 a9Zg==
X-Gm-Message-State: AOAM531jjFcEI4KQ+nCLcvVo9tt61WDPZcgtco/VHOAswCmGXGRfEIuz
 7AsjRsnp9ZK1pViSIG3zYXSYoDlADusjn5D93ZTMXTCeFA+keDQjg7itxMDkRSFEOxPTdKc+74y
 lhcSyVuSPIqOyCp1Ij49Nx2VK+8LzFrNJcF1j3Ie8yU+yuhRAHLY2PeIM03HOCLMO8fg0yr34Ol
 hq
X-Received: by 2002:aa7:c904:: with SMTP id b4mr6985022edt.172.1606502372242; 
 Fri, 27 Nov 2020 10:39:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkC3Xbd/F8jXTqnu8Pk3oYFYI/QqYutxzTOWWhOtVlAUxDjUzKUNCD5oqIgPKX1Dx8fwIt/A==
X-Received: by 2002:aa7:c904:: with SMTP id b4mr6985003edt.172.1606502372082; 
 Fri, 27 Nov 2020 10:39:32 -0800 (PST)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:e1c8:454f:b858:87a5])
 by smtp.gmail.com with ESMTPSA id l22sm1003900ejk.14.2020.11.27.10.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 10:39:31 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:39:09 +0100
Message-Id: <20201127183909.2089734-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] drm/nouveau/kms: handle mDP connectors
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
Cc: Mark Pearson <markpearson@lenovo.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In some cases we have the handle those explicitly as the fallback
connector type detection fails and marks those as eDP connectors.

Attempting to use such a connector with mutter leads to a crash of mutter
as it ends up with two eDP displays.

Information is taken from the official DCB documentation.

Cc: stable@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Reported-by: Mark Pearson <markpearson@lenovo.com>
Tested-by: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
index f5f59261ea81..d1beaad0c82b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/conn.h
@@ -14,6 +14,7 @@ enum dcb_connector_type {
 	DCB_CONNECTOR_LVDS_SPWG = 0x41,
 	DCB_CONNECTOR_DP = 0x46,
 	DCB_CONNECTOR_eDP = 0x47,
+	DCB_CONNECTOR_mDP = 0x48,
 	DCB_CONNECTOR_HDMI_0 = 0x60,
 	DCB_CONNECTOR_HDMI_1 = 0x61,
 	DCB_CONNECTOR_HDMI_C = 0x63,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 8b4b3688c7ae..4c992fd5bd68 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1210,6 +1210,7 @@ drm_conntype_from_dcb(enum dcb_connector_type dcb)
 	case DCB_CONNECTOR_DMS59_DP0:
 	case DCB_CONNECTOR_DMS59_DP1:
 	case DCB_CONNECTOR_DP       :
+	case DCB_CONNECTOR_mDP      :
 	case DCB_CONNECTOR_USB_C    : return DRM_MODE_CONNECTOR_DisplayPort;
 	case DCB_CONNECTOR_eDP      : return DRM_MODE_CONNECTOR_eDP;
 	case DCB_CONNECTOR_HDMI_0   :
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
