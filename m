Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78A5F946D
	for <lists+nouveau@lfdr.de>; Mon, 10 Oct 2022 01:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29110E5D7;
	Sun,  9 Oct 2022 23:56:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CBE10E5D8;
 Sun,  9 Oct 2022 23:56:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DF79B80DE2;
 Sun,  9 Oct 2022 23:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A59C433B5;
 Sun,  9 Oct 2022 23:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359768;
 bh=+AaMpEEtbRsAd0445XliC1VO8cMNV1cNMNF7QtsWu+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=geDk/LcmP/PU1i85xStmOqWaEqcWeKeh/ry5HjqItxtmZhdIB8daZC878ja0PstfE
 dhGWFggVnkNJ66J8AA/dyPtlDD/FhIE3YJ5Jvowzh2n/r/HQZuKTy5o+yc3FF5TAnm
 9b9wRr9z8ZFEVAVpz48xgL4jLpDzFZyVvLyrr/LNEMf1Jd4DlPFa9pG2kMV5XkvPGR
 F3QYL7cEcMx9y0hTOIJeNMJMoGntRa5pEdFGcI2LmVlyENtCrGTo76S9dLtxSVzkMf
 yo1rM+jMJrywvLnmfLh4rEn05vP3UXzLfptgeH0sXquCFV2KL+0ulSipzcaFpYblkt
 0vvDDCnioFrVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun,  9 Oct 2022 19:55:19 -0400
Message-Id: <20221009235540.1231640-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH AUTOSEL 5.10 01/22] drm/nouveau/nouveau_bo: fix
 potential memory leak in nouveau_bo_alloc()
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
Cc: Sasha Levin <sashal@kernel.org>, daniel@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, Jianglei Nie <niejianglei2021@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Jianglei Nie <niejianglei2021@163.com>

[ Upstream commit 6dc548745d5b5102e3c53dc5097296ac270b6c69 ]

nouveau_bo_alloc() allocates a memory chunk for "nvbo" with kzalloc().
When some error occurs, "nvbo" should be released. But when
WARN_ON(pi < 0)) equals true, the function return ERR_PTR without
releasing the "nvbo", which will lead to a memory leak.

We should release the "nvbo" with kfree() if WARN_ON(pi < 0)) equals true.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220705094306.2244103-1-niejianglei2021@163.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index b4946b595d86..b57dcad8865f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -279,8 +279,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			break;
 	}
 
-	if (WARN_ON(pi < 0))
+	if (WARN_ON(pi < 0)) {
+		kfree(nvbo);
 		return ERR_PTR(-EINVAL);
+	}
 
 	/* Disable compression if suitable settings couldn't be found. */
 	if (nvbo->comp && !vmm->page[pi].comp) {
-- 
2.35.1

