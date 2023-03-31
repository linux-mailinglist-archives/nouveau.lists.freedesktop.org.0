Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF006D298F
	for <lists+nouveau@lfdr.de>; Fri, 31 Mar 2023 22:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEB010E2FE;
	Fri, 31 Mar 2023 20:42:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3FE10E2FE
 for <nouveau@lists.freedesktop.org>; Fri, 31 Mar 2023 20:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680295335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
 b=haFJkNwPItkcxwZgeXKoN0CaBppjIeYBoBJQP0JRgurjTGlWmGZAtEws4/8X5DeOc30jd1
 eq/32GGWMuqjOhJGBN05HRQ6J3Etstki4hwh9le7cT/85MD7p+YUbjFQSCgBIqzE3n4Tmr
 JyMW30wKH+wE0kIO0cCs++er/Ls2FeY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-WOs-mkuTMBSnASPO6qrdTg-1; Fri, 31 Mar 2023 16:42:14 -0400
X-MC-Unique: WOs-mkuTMBSnASPO6qrdTg-1
Received: by mail-qk1-f198.google.com with SMTP id
 187-20020a3707c4000000b007468d9a30faso11049072qkh.23
 for <nouveau@lists.freedesktop.org>; Fri, 31 Mar 2023 13:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680295333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dpVbBRCiJ4We7LHm9u8gIxfqs0WEGOfu+33bncRZNio=;
 b=kcZhfptfQ5yTPlDcdI+Dfh/G5oS8ceyEIPIFbtupfctw5bZf/eObSfBLYRqchVLO0q
 UMUSQh+dadK0eZdtHs5Qt0HC6ktw5YTBX1WhpLzMFvGwC0hXtHtuIDU9LIgHITxSL9kq
 kdgHkJ0dWDHIt2P/Jg+Fx97SJjcdk5K1MzF975/VStNH/hChSzqbOzU3NQLtKnCWsZub
 i8RerADgpTqG78RJzYh/yB+6hzNvqNOaqQr5m/XN96AbaGCC5t4glMSgKoT8wLLBm6xo
 Y+KBVx98jpLiy6t1asuLSyQWFWhBu6QORRa8DDSntnVE0jJK3RHMtnj6ilBBVRn3REoC
 oGwA==
X-Gm-Message-State: AO0yUKVD1TtCnUMmcZ1DUvzV2r+jzDXuVt9iULpyTlkziMmKsiRWQVag
 GNKoSXAVzKULGt7BB5hpmFEwV3L1aBL/r9KlEM2Id0WC/OGxSIuPR9pq2hSqu0kk7pWkn6B9I9K
 CJUL3IiPqDMyAURFkNxiX4FkTzA==
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id
 t21-20020a05622a01d500b003b86ae9b107mr45596237qtw.17.1680295333576; 
 Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mIthcjf+qNMnYSZIwwm7EuAYx4smtbfumckwe21E1gR7bqyHXH49VRfud0h3afzJGf56gqA==
X-Received: by 2002:a05:622a:1d5:b0:3b8:6ae9:b107 with SMTP id
 t21-20020a05622a01d500b003b86ae9b107mr45596209qtw.17.1680295333331; 
 Fri, 31 Mar 2023 13:42:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 r194-20020a3744cb000000b007465ee178a3sm910309qka.96.2023.03.31.13.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 13:42:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, gsamaiya@nvidia.com
Date: Fri, 31 Mar 2023 16:42:09 -0400
Message-Id: <20230331204209.1863060-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/acr: remove unused loc variable
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
Cc: nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
  'loc' set but not used [-Werror,-Wunused-but-set-variable]
                u32 loc, sig, cnt, *meta;
                    ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index f36a359d4531..bd104a030243 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		const struct firmware *hsbl;
 		const struct nvfw_ls_hsbl_bin_hdr *hdr;
 		const struct nvfw_ls_hsbl_hdr *hshdr;
-		u32 loc, sig, cnt, *meta;
+		u32 sig, cnt, *meta;
 
 		ret = nvkm_firmware_load_name(subdev, path, "hs_bl_sig", ver, &hsbl);
 		if (ret)
@@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subdev *subdev,
 		hdr = nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
 		hshdr = nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->header_offset);
 		meta = (u32 *)(hsbl->data + hshdr->meta_data_offset);
-		loc = *(u32 *)(hsbl->data + hshdr->patch_loc);
 		sig = *(u32 *)(hsbl->data + hshdr->patch_sig);
 		cnt = *(u32 *)(hsbl->data + hshdr->num_sig);
 
-- 
2.27.0

