Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349FB65CA88
	for <lists+nouveau@lfdr.de>; Wed,  4 Jan 2023 00:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE9410E416;
	Tue,  3 Jan 2023 23:48:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AF10E416
 for <nouveau@lists.freedesktop.org>; Tue,  3 Jan 2023 23:48:39 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id b2so34286912pld.7
 for <nouveau@lists.freedesktop.org>; Tue, 03 Jan 2023 15:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDnfWPh2h9/FS+QZS/MSOgsNnMP44C24NODsrzRFUuM=;
 b=JZ8UC9FMNChsjAjclGrQ6PEw9HlE0aeBAxKyAg+tRtQ71C1VRJ9l24kwhapJ7z+l0K
 QAVCJW+NtLO9X/viSTN5RnZV/oz8FFoCixVq1PpSxuniK7kmSWvjcy3oe0GiXLg0WJq9
 54x6qhh/PtzWp3DntyqNr3zplvC2uTHtSQIAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDnfWPh2h9/FS+QZS/MSOgsNnMP44C24NODsrzRFUuM=;
 b=MADGAgqh8xmTQ/MQHQ3Ql7sYkc+ArUl8FUAw6WmBVRXFaxaF5ovXwRPESXCfuT2yoC
 R/t33lRNuCdkdA4wwox2ZB/AVSG59slfvNFDBVAInlub44Jhlmk6U1bJdZ/Zfrqq3JX7
 X0L7uiOnYBktGx/u4+z8nFZ+U4CP4wMpWZ17YULBEbgpXykO+p1i92kCannjbxMZxd0G
 5VT40RfCocTRa7vsyKYFzRQFMunyKV5qD5udpu0UnUIihSrHm2QFC0OzgLY7144e5cBV
 S4klRuIZZGw3awtFQEXLaj/ZKnqWELFjoopbKE5gdYeNtVepLE/Cr0FA4NdWoWzuHxgz
 FfLQ==
X-Gm-Message-State: AFqh2koD2x/vKE3hERL2SJVUrlOy2Af+sEZMVhMSxuObXGUfXDZGSu0d
 eN/ZFevlmdyt4bOO65Bm5KDxVA==
X-Google-Smtp-Source: AMrXdXuepV8mNjVcT1jIuOIjLZRa7GtnpsPXc2zlWgD4hMVRlZuIUNt/EGTz5ehdWZmXD6nTu/ZW9Q==
X-Received: by 2002:a17:90b:1bc2:b0:212:daa7:590 with SMTP id
 oa2-20020a17090b1bc200b00212daa70590mr64679889pjb.7.1672789719104; 
 Tue, 03 Jan 2023 15:48:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a17090aa61500b00219463262desm19148364pjq.39.2023.01.03.15.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 15:48:38 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  3 Jan 2023 15:48:36 -0800
Message-Id: <20230103234835.never.378-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; h=from:subject:message-id;
 bh=yNDAQz5L/StW+b14k9XOZhzSrABBg07i4qvrOt4rnsQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjtL7UV5oPZ4aSWc790jMdrk79oP2SuDFrhpYN3dAV
 U45tjoCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY7S+1AAKCRCJcvTf3G3AJjfoD/
 9eZAMC/zIpdWOvrTeGfrphFv3DowrWpQpy2/jYIqQfGi7/r2Yp9ZLfiIgpABUIQFOEBtxRI6DBYzhn
 j2Jnr9dC8QT94UIJBjmGYn3FGybpbB9n0xlQs+FvSs+RF9gvvOqA8Eue8I+8S5KCW5gjQOB3zOXP30
 A82/LDSd9t6zwmSrjqJ/bDzpZ5W1zZxLIBlE+lkIoo4olaSzK2DQ6Kn78aGPoICV2Rs6a4kduTTT+/
 CYX/w+1ba6iK7n/cA0x8z8HNR6BPGBhedyeSQsU0PkxyYKBnJ7+lOeRozCD0mtCrCvCIB8ZCZ3xUov
 85+IMnp6earP8cWAh0GGqEJUlZ/R2OaiB7eLG4QqsMZQfcoFe6s6VJUiqqf2F+qI3NjgzfB4aIfFEx
 zXVZdNH04Mpb/k0nl/PtHO2Uj42hp9eenr6zjMPDBsQl4oMUn6nemlkNrfw6pnJncakLLH00TjFkCY
 ObgbCLGQDpYqt1sNj3Ogv1CDBgNtNAgXyOfLVbwKxUr/widlNwnCPLvMdGkW+vhkg6mpiFdA9Bzo6Y
 3lYANl81UelN34Y7TmyIWAEYr6Hr1XMKAUuubdA3tlCoQLPP0sXfgFv5S3Z3fAeRp4tRqLAMDVJVKW
 RIHhb0ND8kYXODJQU314xcLTgpvXoaSamYHoUlD6hP8snaFkWc9XRjhuWaMg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [RESEND][PATCH] drm/nouveau/fb/ga102: Replace zero-length
 array of trailing structs with flex-array
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Zero-length arrays are deprecated[1] and are being replaced with
flexible array members in support of the ongoing efforts to tighten the
FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.

Replace zero-length array with flexible-array member.

This results in no differences in binary output.

[1] https://github.com/KSPP/linux/issues/78

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Gourav Samaiya <gsamaiya@nvidia.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
---
 drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
index 8c4cd08a7b5f..8b58b668fc0c 100644
--- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
+++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
@@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
 	struct {
 		u32 offset;
 		u32 size;
-	} app[0];
+	} app[];
 };
 
 const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
-- 
2.34.1

