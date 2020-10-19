Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2F2932E5
	for <lists+nouveau@lfdr.de>; Tue, 20 Oct 2020 03:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656196F3F4;
	Tue, 20 Oct 2020 01:54:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6C56E9EA
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603125095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=LpnhnrtYzrTCJy3i8KObDi/AapzpryDouhoDtyAluxc=;
 b=J24YWRKLstT8+UGw45G6qWtqnZHgzazkiA8NOBMDA6Wf1CFR8Ia+XAL4NlC17T6kzcYfol
 997lIPqANSRTWKqI214HP1NiLnz9iUPd1wYEoloCAD29TAFpMG2JDyXR1Uls1ykyosWp5y
 msZOCPFYv4ap8f/56VziOiyu0HBmk5s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-_3Py47IKN26VE6PoQeOmvA-1; Mon, 19 Oct 2020 12:31:27 -0400
X-MC-Unique: _3Py47IKN26VE6PoQeOmvA-1
Received: by mail-qk1-f198.google.com with SMTP id d124so42644qke.4
 for <nouveau@lists.freedesktop.org>; Mon, 19 Oct 2020 09:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LpnhnrtYzrTCJy3i8KObDi/AapzpryDouhoDtyAluxc=;
 b=Zi2KSzVTy4VPNrEJahmzPLxoj3iQoLkvtVgddxVuCjuSEfY89PkHS+53hsZIqJfiS9
 jjRvnyZ2I8rFt+yaAD7um9nKSJNLi1iDpXaMwSFcTpkow6NfweBHhvuNGo0CiCS/i2B5
 wXusD3IM+6M/FBO7VCYKsIUszEvUcT2W2lgrnrRguwIwK2qnzATkJaMmCiKFVAbL4e3A
 eIJLARYsEktdI6v4VB29gyMnhQnAlOGHG9oMAZiTOYtBWXCLVfmYzB2TWxvRecIwg/No
 VLTkW8H4euLSEcJkqcko48soKjk6CHSaKDsURXC9BYJz971vy0Yjwd9RINTWMGt8WmHe
 8Gcg==
X-Gm-Message-State: AOAM533qC0tVk0eLhSORhqCX10rfdSgxZ+Em6fq+gpAatXxi0WkSpfKB
 j2R/jlUI2KzQROJcgxNuqowm02h1ONh521PElYuQXTad71l5+yleBi98SxT/CP36CsgLvx12kwx
 +m9Ul9Mz+nbvVWlpNpT13Y5FAww==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr436816qki.38.1603125086094;
 Mon, 19 Oct 2020 09:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDaqr3WO9m6PHgyGJrH9ZpAecy65bRCQBDG9pExuCA3UA+eaazh0XFo1qMoM9NaIFuQxjMug==
X-Received: by 2002:a37:dc45:: with SMTP id v66mr436599qki.38.1603125081657;
 Mon, 19 Oct 2020 09:31:21 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x5sm214149qkf.44.2020.10.19.09.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 09:31:20 -0700 (PDT)
From: trix@redhat.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 bskeggs@redhat.com, kraxel@redhat.com, gustavoars@kernel.org
Date: Mon, 19 Oct 2020 09:31:15 -0700
Message-Id: <20201019163115.25814-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Tue, 20 Oct 2020 01:54:46 +0000
Subject: [Nouveau] [PATCH] drm: remove unneeded break
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Tom Rix <trix@redhat.com>, spice-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return or break

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c           | 5 -----
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c   | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c  | 3 ---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c  | 1 -
 drivers/gpu/drm/qxl/qxl_ioctl.c                  | 1 -
 6 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 38672f9e5c4f..bbe4e60dfd08 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -794,21 +794,16 @@ static int mgag200_crtc_set_plls(struct mga_device *mdev, long clock)
 	case G200_SE_A:
 	case G200_SE_B:
 		return mga_g200se_set_plls(mdev, clock);
-		break;
 	case G200_WB:
 	case G200_EW3:
 		return mga_g200wb_set_plls(mdev, clock);
-		break;
 	case G200_EV:
 		return mga_g200ev_set_plls(mdev, clock);
-		break;
 	case G200_EH:
 	case G200_EH3:
 		return mga_g200eh_set_plls(mdev, clock);
-		break;
 	case G200_ER:
 		return mga_g200er_set_plls(mdev, clock);
-		break;
 	}
 
 	misc = RREG8(MGA_MISC_IN);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
index 350f10a3de37..2ec84b8a3b3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
@@ -123,7 +123,6 @@ pll_map(struct nvkm_bios *bios)
 	case NV_20:
 	case NV_30:
 		return nv04_pll_mapping;
-		break;
 	case NV_40:
 		return nv40_pll_mapping;
 	case NV_50:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
index efa50274df97..4884eb4a9221 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c
@@ -140,17 +140,14 @@ mcp77_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
 		break;
 	case nv_clk_src_mem:
 		return 0;
-		break;
 	case nv_clk_src_vdec:
 		P = (read_div(clk) & 0x00000700) >> 8;
 
 		switch (mast & 0x00400000) {
 		case 0x00400000:
 			return nvkm_clk_read(&clk->base, nv_clk_src_core) >> P;
-			break;
 		default:
 			return 500000 >> P;
-			break;
 		}
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c
index 2ccb4b6be153..7b1eb44ff3da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramnv50.c
@@ -171,7 +171,6 @@ nv50_ram_timing_read(struct nv50_ram *ram, u32 *timing)
 		break;
 	default:
 		return -ENOSYS;
-		break;
 	}
 
 	T(WR) = ((timing[1] >> 24) & 0xff) - 1 - T(CWL);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
index e01746ce9fc4..1156634533f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
@@ -90,7 +90,6 @@ gk104_top_oneinit(struct nvkm_top *top)
 		case 0x00000010: B_(NVDEC ); break;
 		case 0x00000013: B_(CE    ); break;
 		case 0x00000014: C_(GSP   ); break;
-			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 5cea6eea72ab..2072ddc9549c 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -160,7 +160,6 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	default:
 		DRM_DEBUG("Only draw commands in execbuffers\n");
 		return -EINVAL;
-		break;
 	}
 
 	if (cmd->command_size > PAGE_SIZE - sizeof(union qxl_release_info))
-- 
2.18.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
