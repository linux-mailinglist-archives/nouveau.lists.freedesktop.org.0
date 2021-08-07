Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884A3E3CF7
	for <lists+nouveau@lfdr.de>; Mon,  9 Aug 2021 00:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA895899F2;
	Sun,  8 Aug 2021 22:14:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88A66E08C
 for <nouveau@lists.freedesktop.org>; Sat,  7 Aug 2021 03:22:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so25469280pjr.1
 for <nouveau@lists.freedesktop.org>; Fri, 06 Aug 2021 20:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh+LyNoJn+/C2qxN/x3CP3dUbi+uecXz/MsGDySkhoA=;
 b=ezLH8i5/yWdbUs21lSN0rKfxHZB7O7tAd5eQJQRyAobRiL66KcFjnL2ZBGXl8YWgv7
 PXBk6Ycu0WMVWrKYmXQ3nbaI5JuPCWaRNxpw69i4fCdhMW0oBaL0R3WJDDSbCesgT0MJ
 KoDluNQr2axDHrchi654p8etEwXWUkUQgWoGq4cV51KW9zz+3V3GgEtHVWVtCACj3R3N
 L0JsaoafAt2PKsHwkDfRSzOUbB068bK6Y692e7e/o/PFLfVoRMyHnyf/kqM/F7VuSkIj
 Hk+Q7p4qV+a2zyYHwUoIENDULn7l1DL8z10Pw2E7FbM8RtGv4+7VFlejmUa6ZqGVmW08
 vHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uh+LyNoJn+/C2qxN/x3CP3dUbi+uecXz/MsGDySkhoA=;
 b=KSyz3FK3bmaj0U6pTGN0mPbTVhVomIfdOB2kF2nQtH8SGZrzOvNqUai8jx/TIeAt/p
 ZQdX69fEBU96+eE/WWSz61FCymhJATeZ8/zAGvJCOja6MhpoF8oMAjGFTpxY5onQ+Mne
 Lv5O2uGy4lROlv+HbbWbYSogprLxafEmob/0S71bcAHXOgQQ2+N6Ls/sc5jYkBCdy/Vq
 2WzVCRagUKc9C/qVUFA2Orh3pZxa9KeVPo7UEIzkiQDpBfJqbkIKy7LqkNoGMIRSBPLt
 1jqb7rdRgi2iI+2gN9rX4rC8rjhPraVVMZgW7+GRAMOvz3nxicA4cneWTQNW0SgWQu6d
 PoNw==
X-Gm-Message-State: AOAM533gJu5r0ztPzGgoJFzLoLurz620Xk7Vf0yZwxkiJxRI0m8Dya68
 RvteF1GT4+jvzsK+3bARkvQ=
X-Google-Smtp-Source: ABdhPJxYlV/B6KQ8XIFc8KckV2s869t7rvEHWhyHYWJ9BNBFNeTGgIQEAzTbbrEFuEuK4aEgh7D6Zg==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr626970pgb.55.1628306539357; 
 Fri, 06 Aug 2021 20:22:19 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id t8sm13950866pgh.18.2021.08.06.20.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 20:22:19 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yong.yiran@zte.com.cn
To: bskeggs@redhat.com
Cc: yong.yiran@zte.com.cn, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Date: Fri,  6 Aug 2021 20:20:54 -0700
Message-Id: <20210807032054.642867-1-yong.yiran@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:14:04 +0000
Subject: [Nouveau] [PATCH linux-next] drm/nouveau/nvenc: remove duplicate
 include in base.c
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

From: yong yiran <yong.yiran@zte.com.cn>

'priv.h' included in 'base.c' is duplicated.
Remove all but the first include of priv.h from base.c.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: yong yiran <yong.yiran@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index c39e797dc7c9..cf5dcfda7b25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -21,7 +21,6 @@
  */
 #include "priv.h"
 
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.25.1

