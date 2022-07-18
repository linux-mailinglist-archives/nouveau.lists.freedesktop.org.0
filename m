Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780758A23A
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092A8A6FC4;
	Thu,  4 Aug 2022 20:38:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A9A9C52;
 Mon, 18 Jul 2022 06:38:12 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id c16so4316828ils.7;
 Sun, 17 Jul 2022 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JV345slmDZGXvnPNyaFUVDSwkXdPTptctgGFHiASs/s=;
 b=B95+rQ8xvCf7B5mUDXwdxwm5RCb1M752+sQlXf1jBmqCumiYDdl0yAgKCrQXQLl1eX
 2DIcI71InCiCH5gHRayGzLq75h4GTDv58nacLLIAIKXbXO534EplYkNo3qV09nOgr12S
 1JzmeXAFJdmMFj6ZDiaiI5uQp9jHiUMPoRQ9xCLBjd6JznZ8iGdujB6xkVvIN0L6yxJM
 sTkAxs29CIxWPqkJx4D5qPHM9b8sZxY8KSqGx9A3m2hkjz/qO3uJjxITaqwgR7NZ9St1
 4jEwmHLxoIlVhEyDTOy46pyQOzWG+IybXE3WzkIfEbEEVBIzLlTvR7vWzhotWyUqWmRX
 6Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JV345slmDZGXvnPNyaFUVDSwkXdPTptctgGFHiASs/s=;
 b=EBmEZuI9CHrCPIzg27Gj3oDmbO1mb6KyV55JsVpGqABL/QZzMUqmkWdE7vJyTVDCQA
 DxOWAa/U7dNyrCbTWlD9mO/8RpYVEjGgtnVLiZ0yFaaa0JBToh0C18JURc1iI6f+mKrA
 C8Rv3WufCbaz/OnWhq9ErF338CJxZb+382VtcEOfBU+irW85rg61/VZv3C+EomAwPhSr
 j+lJUsWdczVkfcLQ5ZtWLNo/KdNh/MLJ8oNRWQNBX1lzhqJcEJqb5XPkvn3ZiZatG4Ak
 +p+V7aH0agDP3PKUm+GJeo7+w0AdgAjADFruZ33KUsSUJxijvAUXSe9dkl4L+FnpXRkH
 uGCw==
X-Gm-Message-State: AJIora+dS3CuTesQbEFM1gp+jAa62AvSqEAQ9q7kd2pTtg971DMB+dwS
 rlkeTpeSf+oV/2DjBYUojUc=
X-Google-Smtp-Source: AGRyM1tHeJuf6PIHh2sQDkairQglmrZn6c1PexiEuFtTIyhdqlIRTkLR9ZcEkNdNLlx1EseYrRxhIw==
X-Received: by 2002:a05:6e02:10d1:b0:2dc:2443:f651 with SMTP id
 s17-20020a056e0210d100b002dc2443f651mr13068007ilj.172.1658126291313; 
 Sun, 17 Jul 2022 23:38:11 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Date: Mon, 18 Jul 2022 00:35:47 -0600
Message-Id: <20220718063641.9179-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:46 +0000
Subject: [Nouveau] [PATCH v3 03/41] dyndbg: show both old and new in
 change-info
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
Cc: Jim Cromie <jim.cromie@gmail.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

print "old => new" flag values to the info("change") message.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a56c1286ffa4..8faf584f2f4b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -156,7 +156,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -217,11 +217,12 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
+			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
+				  trim_prefix(dp->filename), dp->lineno,
+				  dt->mod_name, dp->function,
+				  ddebug_describe_flags(dp->flags, &fbuf),
+				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
-			v4pr_info("changed %s:%d [%s]%s =%s\n",
-				 trim_prefix(dp->filename), dp->lineno,
-				 dt->mod_name, dp->function,
-				 ddebug_describe_flags(dp->flags, &fbuf));
 		}
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.36.1

