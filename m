Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25D710202
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860810E6A4;
	Thu, 25 May 2023 00:31:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58F10E6A4
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:35 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d1a0d640cso1221255b3a.1
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974694; x=1687566694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lScq8HklhhegI4KLeP/RjSXh6KfRvph6zFeVtXDr/h4=;
 b=J7MmY1zH3wOy/w3Gr+ozQSTfRxWyLoWdVXGzxMNRDYk3/ub+EBZt6JTTn5lmRqxzVF
 +OfsASWEu0NtORqh18PWp83Or9Z4qKn6NW4pqe9GqNgKyAAd5rdW6GfSY3oc9IJHMbhi
 1e2k/3tzm577+9aoiFmFCylSgrGG5MKFfq1EeIFSDjuSaR14QA+CVXCaLCBxKS5Gn4M1
 TOCFhAunlU3F25O/RB/yY+xvmQcV31bBEh187S/LNGPntQLiWpVx7JiK16kiuaYvv3Ak
 gyXUjvXVtN21H2H1rWy9arL9jXPG2nNC/u8rrhEXwNvQSqab1QSIDpjOpHCnhosW3lPg
 gtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974694; x=1687566694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lScq8HklhhegI4KLeP/RjSXh6KfRvph6zFeVtXDr/h4=;
 b=QayJxv2Qp0ZERZXpvrvkTF0ndhWKN3t54THhvT2AJHdicY+XT7v5YBMfbbSR48ybRG
 RBUmhKx+UTmh6oyKpm70NBAiX7Nyddrh1HpZ6acojIvL9dojrlMxOYH/m0X5M7aW+VRi
 X7Kg37VAQNxo9eVYlmpYuT5p85AHbgBK+0pdRhKDpDUeYf3zahX2FuHwlsi+DZJQbpyT
 2/CcXvh7hb0VzT15zfoq9ycLgNT2IkYW8ZA8MpYlBBvyOWKb+5TwuxAYg3z1vOa8SlFJ
 6rIjWPq7g9GUYnmE2ODDJqMeDmycgASYrhFftEvxt/92od6bI1V9WSWWHv98NM4VIOQz
 sFcQ==
X-Gm-Message-State: AC+VfDykZljcU7UPUPhM9QIQQqg9bEAUsO5BRREX4W3Ik6jTZJYUFw/y
 9CPVaBOCry2HdQMmqUtUXqYU7AIke2I=
X-Google-Smtp-Source: ACHHUZ4xCeg3QZriRzAxMq1BlBqMk92wYZuV6S+fvxu+8aew6Qdrur0iUb66D+YAm21vi+PH8GJZJw==
X-Received: by 2002:a05:6a20:3d8a:b0:10b:e88f:597c with SMTP id
 s10-20020a056a203d8a00b0010be88f597cmr11872807pzi.44.1684974694496; 
 Wed, 24 May 2023 17:31:34 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:34 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:05 +1000
Message-Id: <20230525003106.3853741-9-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 09/10] drm/nouveau/nvif: fix potential double-free
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

DRM cleanup paths unconditionally call nvif_mmu_dtor() for clients,
which would result in a double-free if nvif_mmu_ctor()'d previously
failed.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvif/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index 3709cbbc19a1..c9dd3cff49a0 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -27,6 +27,9 @@
 void
 nvif_mmu_dtor(struct nvif_mmu *mmu)
 {
+	if (!nvif_object_constructed(&mmu->object))
+		return;
+
 	kfree(mmu->kind);
 	kfree(mmu->type);
 	kfree(mmu->heap);
-- 
2.40.1

