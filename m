Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D86771065
	for <lists+nouveau@lfdr.de>; Sat,  5 Aug 2023 18:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A1010E16F;
	Sat,  5 Aug 2023 16:00:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA1010E16F
 for <nouveau@lists.freedesktop.org>; Sat,  5 Aug 2023 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691251235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=94zmfgo0irut0mqrSKRpC00gDlp8lHtPNk77GMVRJ94=;
 b=GLQDichAVSrMwwxNionJ8KFvg2UlWdCVigW2txAGwdX6B1E8D2vC96n/qgGB6zLIAR882r
 Rn2SDyKpXp1dMN+MXvE7cgo03fKSYCmhBVjXnbivCdTYd3a5Z1DPbV9sYKRQIlUDCij9mm
 lCbxN7S7yP47vlqid5ZwIINO0sshOvY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-c4iFpU8bO2255Ka9BHiL9A-1; Sat, 05 Aug 2023 12:00:33 -0400
X-MC-Unique: c4iFpU8bO2255Ka9BHiL9A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a355cf318so207267066b.2
 for <nouveau@lists.freedesktop.org>; Sat, 05 Aug 2023 09:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691251232; x=1691856032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=94zmfgo0irut0mqrSKRpC00gDlp8lHtPNk77GMVRJ94=;
 b=TrQqvJyrFyQ/9W6L4FcX0nsEsyBc+EXrSmVF1KwVAD3YP0JqlYXH53hRxCtqDrStnX
 W7Zm2kfq3nt0KO/kDNytoTXnIdT2HSsop0ZlsxIUE5OI+LQKBJ3exku4psyaLYlzIq+w
 rIb5/JvgjccVewn8u5Tw+a38MBV2L/di7VurpmcJgJYz/arP8rjJQWRzxLipjd31Zhhb
 n38BPEubrWqGRZ3eIfmj3OcSthxZwWJzhFZFKfdILBPdh0SGlUvzFPyIz6mZ/hQl8/Nc
 YHl4bDai307wKjwMo1LfIiyC/GgPgjKlcSm8pc+rWMNkEKLuYvKdTyC5bzMEEeoEKOPv
 rCHQ==
X-Gm-Message-State: AOJu0YwX8L19yIfXFTor8waMvNzXEYQ87iRib4hJq+NBouyczXBT2zIo
 pEaZCA5NUkukzdBkzLLnYraDN4GRMMgtxnNUVWAM1KQsVlaIfqKkdVsJS7vbxx+hywXm4s0BGJN
 QUQCKns7+XlMdRJvPfyMswOZegWd7oFdvDw==
X-Received: by 2002:a17:906:51d7:b0:994:9ed:300b with SMTP id
 v23-20020a17090651d700b0099409ed300bmr4797608ejk.16.1691251232459; 
 Sat, 05 Aug 2023 09:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlgipzP1IYg7V0bplG+SRR8mHBM0tv5PNbAHj2TUpHdzAhtZ4nJ+lrwfRjJt+2AhCBvJ0oSg==
X-Received: by 2002:a17:906:51d7:b0:994:9ed:300b with SMTP id
 v23-20020a17090651d700b0099409ed300bmr4797582ejk.16.1691251232105; 
 Sat, 05 Aug 2023 09:00:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1709060a4200b00993b381f808sm2856900ejf.38.2023.08.05.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 09:00:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com
Date: Sat,  5 Aug 2023 18:00:15 +0200
Message-ID: <20230805160027.88116-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next] nouveau/dmem: fix copy-paste error
 in nouveau_dmem_migrate_chunk()
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

Fix call to nouveau_fence_emit() with wrong channel parameter.

Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 4ad40e42cae1..61e84562094a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -678,7 +678,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	}
 
 	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
+		nouveau_fence_emit(fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);

base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

