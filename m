Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A32875E0C6
	for <lists+nouveau@lfdr.de>; Sun, 23 Jul 2023 11:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF6E10E1A2;
	Sun, 23 Jul 2023 09:23:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8178310E11D
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jul 2023 05:21:25 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2KZp687fzBR9sk
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jul 2023 13:21:22 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689312082; x=1691904083; bh=7scmTbQs/wsjbW5FBE+Ka8Is++h
 9WlnkMEr/CtGidh8=; b=cFZG1dXUYbwthyU8KAwnnjyKMoFPv8SYl8iJ9XuQRRZ
 FdcoYJpsx0yyDaiZhNIQ25XPr9iH0kvY4VOA+yXQkt7nfktYTQJ0Y9NzYJ5/d9Vr
 DaVmgsBxGj/kw+XgwJlNdBLEjaFpLFS1Sm3WFuYiXRav3Iu7X9EtlaDtVX5lhDIe
 tHxDrfKBXGb/JBq88QJYi0sCGQMCQ0TYXEFf3TowxOfHEWvOdoPZQymojfE8af/s
 iciuDn0LAwc2rMe9xXBFKr6FS7+Zo6XPR17yKAfjxCEMkVUxGUh9L6H+KageMXp1
 WtQoDIqwMqSY5qEub/qRE8L0BfX2Kr8CKafo11SYj2A==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xZItqFMqLlvY for <nouveau@lists.freedesktop.org>;
 Fri, 14 Jul 2023 13:21:22 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2KZp226wzBHXhS;
 Fri, 14 Jul 2023 13:21:22 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 13:21:22 +0800
From: huzhi001@208suo.com
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <tencent_0FA6AE16A21AAA2E9481C6FE598BA70CC405@qq.com>
References: <tencent_0FA6AE16A21AAA2E9481C6FE598BA70CC405@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <d0d767fb0dd3a9b7642559f379dbb0d6@208suo.com>
X-Sender: huzhi001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 23 Jul 2023 09:23:50 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of the
 gk104.c error: ERROR: : trailing statements should be on next line
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: ZhiHu <huzhi001@208suo.com>
---
  .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++-----
  1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c 
b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index d8a4d773a58c..b99e0a7c96bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct 
nvkm_cctx *cctx, struct nvkm_chan
      u64 addr = 0ULL;

      switch (engn->engine->subdev.type) {
-    case NVKM_ENGINE_SW    : return;
-    case NVKM_ENGINE_GR    : ptr0 = 0x0210; break;
-    case NVKM_ENGINE_SEC   : ptr0 = 0x0220; break;
-    case NVKM_ENGINE_MSPDEC: ptr0 = 0x0250; break;
-    case NVKM_ENGINE_MSPPP : ptr0 = 0x0260; break;
-    case NVKM_ENGINE_MSVLD : ptr0 = 0x0270; break;
-    case NVKM_ENGINE_VIC   : ptr0 = 0x0280; break;
-    case NVKM_ENGINE_MSENC : ptr0 = 0x0290; break;
-    case NVKM_ENGINE_NVDEC :
+    case NVKM_ENGINE_SW:
+        return;
+    case NVKM_ENGINE_GR:
+        ptr0 = 0x0210;
+        break;
+    case NVKM_ENGINE_SEC:
+        ptr0 = 0x0220;
+        break;
+    case NVKM_ENGINE_MSPDEC:
+        ptr0 = 0x0250;
+        break;
+    case NVKM_ENGINE_MSPPP:
+        ptr0 = 0x0260;
+        break;
+    case NVKM_ENGINE_MSVLD:
+        ptr0 = 0x0270;
+        break;
+    case NVKM_ENGINE_VIC:
+        ptr0 = 0x0280; break;
+    case NVKM_ENGINE_MSENC:
+        ptr0 = 0x0290;
+        break;
+    case NVKM_ENGINE_NVDEC:
          ptr1 = 0x0270;
          ptr0 = 0x0210;
          break;
@@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct 
nvkm_memory *memory, u32 start,
      int target;

      switch (nvkm_memory_target(memory)) {
-    case NVKM_MEM_TARGET_VRAM: target = 0; break;
-    case NVKM_MEM_TARGET_NCOH: target = 3; break;
+    case NVKM_MEM_TARGET_VRAM:
+        target = 0;
+        break;
+    case NVKM_MEM_TARGET_NCOH:
+        target = 3;
+        break;
      default:
          WARN_ON(1);
          return;
