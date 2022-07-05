Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B062B58A205
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA176A6F38;
	Thu,  4 Aug 2022 20:37:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 910 seconds by postgrey-1.36 at gabe;
 Tue, 05 Jul 2022 09:58:33 UTC
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 759C910E021
 for <nouveau@lists.freedesktop.org>; Tue,  5 Jul 2022 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vctMm
 aZ2jCBteIBCD7D0uyHlHM+0VSnNr88RsGWlQb4=; b=pUITOL14hlFwwm209DVEZ
 EUktxKrGXxmWZ1GZm5R9a1j1W2kOWuTw6/BBujYn5+40cpltEYBD4Cc14Ws9q9IQ
 Coe8A2wi/6vAoMH6xrHnKV9od0RRf7+9O963QFsLwR2qSqI2tZ/UhHwKippcZero
 O2L6FDEPcFYLL5EFcDQA7A=
Received: from localhost.localdomain (unknown [123.112.69.106])
 by smtp3 (Coremail) with SMTP id G9xpCgAn4GmrB8Ri0an9NQ--.2574S4;
 Tue, 05 Jul 2022 17:43:16 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Tue,  5 Jul 2022 17:43:06 +0800
Message-Id: <20220705094306.2244103-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgAn4GmrB8Ri0an9NQ--.2574S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1kXrWDJF17Xw4DZr13Jwb_yoWDtrg_uF
 4IqF17Wr9Ykrs8tw4qyw1jvFWSkw4kuFWkZF95ta4SqrW7Jw13Wr4UXry3Wry7AFWjgr9x
 ZanYvFyakwnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREs2-3UUUUU==
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/xtbB0RQ1jFzIBxqqrgAAsx
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:15 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/nouveau_bo: fix potential memory leak
 in nouveau_bo_alloc()
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
Cc: nouveau@lists.freedesktop.org, ri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jianglei Nie <niejianglei2021@163.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_bo_alloc() allocates a memory chunk for "nvbo" with kzalloc().
When some error occurs, "nvbo" should be released. But when
WARN_ON(pi < 0)) equals true, the function return ERR_PTR without
releasing the "nvbo", which will lead to a memory leak.

We should release the "nvbo" with kfree() if WARN_ON(pi < 0)) equals true.

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..d0887438b07e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -281,8 +281,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
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
2.25.1

