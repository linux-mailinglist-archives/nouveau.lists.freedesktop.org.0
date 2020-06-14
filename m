Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C3203A5A
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0B6E822;
	Mon, 22 Jun 2020 15:09:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7BE89E3B
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:48:41 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49ky6c6dnpz9vK05
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mom4ZFRWx9Yc for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:48:40 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49ky6c4tpfz9vJyw
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 20:48:40 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49ky6c4tpfz9vJyw
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49ky6c4tpfz9vJyw
Received: by mail-io1-f72.google.com with SMTP id l204so8946218ioa.4
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwS4iBH2TfaLSm/U9G8+/YZNlczPHmpLDZOOCLUssn4=;
 b=RAyZt079t6nAq4cI1GjMxaPYT9VqopIavYteGGrGjDji87vThIRg/BA0tMYwaPtsu+
 tYxd0WIABoM2N1EnOJoz9izoR1COivh5fagyr2hqq/4//15ubkqcuDEV8JHMEMvzNr1e
 WmwI0+9W/XP2V1LCMXiiwYciZVYKUhKGVvMAR7p0WXg9A3SclX5t11hlSWgOGjlONrt6
 q06KQtiSE6yYuT3xfPzvWWzWP56aIpRgfpWgBlL4DGlRkZOjSiTBp2Jdkw9gvr9ce9Ui
 QQkgtZC3UkO3J2zyUO2yK6ydDDQelAtrpY7YL48bv8PpRYSbhDkHJ+3DHrwnYMy0Jf+N
 DP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwS4iBH2TfaLSm/U9G8+/YZNlczPHmpLDZOOCLUssn4=;
 b=olaaIh2/AEauHMUIGMwjjJ7gTIRbam4u3YtyxKTC5WazSJm/pDPwqDnABQkEZFbQdM
 Nv3eioorv8BmS2csONdvnmc/9+DB/D2hlauKRikKY67WG/sYt1LY8Ja+7G2gmLBkgaH0
 ZhoBi9d6Y2nymxRUfxB0Fs9BjanABPtD5r7NWuDFnjcG2X60WSDXsPDWl0tRqT1fKfsy
 GON1jiym+nCNMXxm3XOEF+zYebrAp7jfY4Rjfia7ZWf0utE4U6FdQRn7rDtr+9DqqegX
 tbJOczzds5X40CcEY9BdlMEu4dJmEn92VwUuHRjVPQf9u52OyMb6P2Q0xe6yqrI/F9Ca
 T6vQ==
X-Gm-Message-State: AOAM533quo2xcG1jwoEW2EVD6SfLCLsyFwu8N7kkJooVS+q+N3kylm3I
 qQq8qNQ1zs7ECv+iYimhc6RmCC+smczTLoENQjN3mLbUGmUZhYNvWgeKJUQt44gcvY04rPRT6LD
 NUMK6ghoSkFZ07+NBsBb2b4DO59vODw==
X-Received: by 2002:a02:8529:: with SMTP id g38mr15074447jai.143.1592099320351; 
 Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQlNEPoOQIOiFAjrDKzToAN2cpikujTxQg4Kn8KjyoM4aKnt/Ueavi58mg3qK8fmxA97Jk3Q==
X-Received: by 2002:a02:8529:: with SMTP id g38mr15074434jai.143.1592099320183; 
 Sat, 13 Jun 2020 18:48:40 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id n21sm5598507ioj.43.2020.06.13.18.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:48:39 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sat, 13 Jun 2020 20:48:37 -0500
Message-Id: <20200614014838.123171-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 15:09:59 +0000
Subject: [Nouveau] [PATCH] drm/noveau: fix reference count leak in
 nouveau_debugfs_strap_peek
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_debugfs_strap_peek() calls pm_runtime_get_sync() that
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 63b5c8cf9ae4..8f63cda3db17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -54,8 +54,10 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	int ret;
 
 	ret = pm_runtime_get_sync(drm->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(drm->dev->dev);
 		return ret;
+	}
 
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->client.device.object, 0x101000));
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
