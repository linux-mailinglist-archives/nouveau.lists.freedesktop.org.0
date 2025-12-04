Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D33CBAB9E
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE6B10EB02;
	Sat, 13 Dec 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/NL346l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3AA10E898
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 12:08:31 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-29586626fbeso10441785ad.0
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764850111; x=1765454911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9KaknhTYA7we8L7tbWOYdBApVf4+OuKI4DN15w2EF0=;
 b=O/NL346llEEJ3l11qc4fYxr6+2NcOsGOIdNbF3aKc1o3o4ShBQJ8XUs9ixmx4whyy0
 7OnBz/NyH/yMiq7HDyhLVOM+jSRC1lRKLofPj5BVTvTBEeXfaJAB3ruzWr6B9FdDmM7Q
 WMUTUbeghO2LWPr72aUqKgE62V75CRHjW5bd6R8Eb2i3/MhiJOZAS1C7HsI5V6PsQIgh
 9B0tbi6ArA9SWNvs35wqBGdecFE59b66zfv2qj2jqc8sZJhKcIcD0mi8Q6JpM5OLDAB3
 PrUcxs7teJstegh6W5dy59gEESIYDf1AzuUb8XZsuh+YBold4oevvFzB4vZTedlrTyhB
 ElfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764850111; x=1765454911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b9KaknhTYA7we8L7tbWOYdBApVf4+OuKI4DN15w2EF0=;
 b=b1cIS8hUN51dl92VwrnkmJHYa1HLHDigCH+E07qFf23DC39JT7DzQcTtmsxXzK3ZSl
 TK7CXZ1Xq6jlPqozeJCf+0pElCL2OkwYwoQdoPMjmKRqln03d23eBfosUNYOppG4Dvp5
 l1om7nh62jNfias25EBtma/xsaTmQc6Ksynwu2kZkYCatW935/PDPHxXhG5V6NTyvrV/
 NOMhpxBQd9oH9iC8WXy/3Sei3t4n8B9+dQlFtSa1yXBaoGROCKn3xQmdy4K3Kn1ljq6u
 YGfiC/3bW9l9BudwW9g8GXlG7jhqCwVYJrTfXIjMYDUD9WYTupq6oc6dL9vm2zboOeuh
 H/WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdL+h6TkDQ+3rYG67+Qc7jD6NLt7V/Zb15VCyvv5v8yD2Q7yLYocJowAY5Q14n/iGWbKb7DFYd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpH9vdP4Xnm3fpql32EbRIo0J5Hu3eFroLdVprGg+8ra43lKli
 31QiR5X9YXpuL+FLv/OVWd1pE0U/AvP2OWgg+PhhfPiqT160U2A1YWT1
X-Gm-Gg: ASbGncvjpZX5c7djH7L7gR7tCfk67l9DGRldEdJg4STA5fjfZS9+xilgjlO7IOHcvrI
 rLlkqHUihronZpiHejE2YH7cekt1wD2nUYG+DVatOjD87ETvQVzNK6GgpkSIQcVWflB5K4yJCB1
 EU38Xs362Z54Du37bL22JZ0CAddbVtUmGeoP7I/uQcisKJMJoOv9b8bnkwKfxlk8Ny3IuyqPtKB
 syS4snfCprUGYZDQhRf85k8ekgm4POSyieQlnK8UU36Au0RjWdrBcJ46CV1Vy1Nb/woUSZsViHP
 6jdCK+XsFqqNKGpvBRoDzsoqkH1kbIlwWs5F/2R9vstyyonQW+FAPxMfDD8bjZ0RlzXW8lT56Li
 ltbJ/hRNO9vryEq3M4iHLdu4DuNZy0MQrUf31yV+IhtNS4UY5otPcxHPUzvp5vjA3/NZzGrLEf/
 Sbx3ASURQy0hvg
X-Google-Smtp-Source: AGHT+IGgnfLkR8h/ZDEH0zcyut45P3flGlGTcJqAlGQmerA42Y/lhM13y2pCi+VHgv7Q5gX7l8a4rQ==
X-Received: by 2002:a17:903:1ae8:b0:295:7b8c:661c with SMTP id
 d9443c01a7336-29d683131e9mr77831675ad.26.1764850111169; 
 Thu, 04 Dec 2025 04:08:31 -0800 (PST)
Received: from archlinux ([36.255.84.61]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeaaba2dsm18586635ad.69.2025.12.04.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 04:08:30 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH v2] drm/nouveau : refactor deprecated strcpy
Date: Thu,  4 Dec 2025 17:38:22 +0530
Message-ID: <20251204120822.17502-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204114021.36719-1-madhurkumar004@gmail.com>
References: <20251204114021.36719-1-madhurkumar004@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

strcpy() has been deprecated because it performs no bounds checking on the
destination buffer, which can lead to buffer overflows. Use the safer
strscpy() instead.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
changes in v2:
 - Remove the size parameter from strscpy

 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..4a193b7d6d9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -183,11 +183,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
 
 	if (chan == drm->cechan)
-		strcpy(fctx->name, "copy engine channel");
+		strscpy(fctx->name, "copy engine channel");
 	else if (chan == drm->channel)
-		strcpy(fctx->name, "generic kernel channel");
+		strscpy(fctx->name, "generic kernel channel");
 	else
-		strcpy(fctx->name, cli->name);
+		strscpy(fctx->name, cli->name);
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.52.0

