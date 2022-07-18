Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E790058A27D
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A3A70B5;
	Thu,  4 Aug 2022 20:40:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF41A9CAE;
 Mon, 18 Jul 2022 06:38:51 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id v1so1930409ilg.4;
 Sun, 17 Jul 2022 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RBPMZ8G3w6XBnMU2q+nqilMr7VuIUKBgMzFm84FNO4=;
 b=dMlx/PfZHDfOhKla8BWhTdhmZAObj1zlvXRkKNcDWOogQR17a9ReCax17EE6+Psejl
 q19pmYaO4aaxti9unGx2T4DwCSxw6ybhpIrRXOuVtR1LcM+PozVE6ouNB+9SxyOehBq/
 Nmxcod+8T0FIOCNd3ChZ358DbxPGeyiRq1mJb1WzcI/YS9EhX9GSoHgynGdjJpKZBOEl
 gebLbUrEZfJ6djgOzB3ESrMdBRnsEHy2Qssdjaq+ZsQXHF9sLUPvsjxAP7PkjWNKv84B
 w+avu0cRj8otlLCj3GW+7RcJ33unlvKyauyur9yZobTgTiD26TYykDUKfAEKAMQQNQB4
 NxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RBPMZ8G3w6XBnMU2q+nqilMr7VuIUKBgMzFm84FNO4=;
 b=BvliUtqlVeKryaBHnAeePrI5XvMyaSTtjFx3sruMz4Ou5pT2s2CmXFxy3dwS12wRqC
 w0YHizTLQGACP2gSZPkabw4viFR5sODWIbl9iCFCB64crFDpwu7ksVOe8uiJ4Ev+7saW
 ZIv8B7HQhLxVeyzy+AGm55+Nv8HQN9cfW6fBxyJ1vkW2ap7dtlExTIguw9+OjLDaihBU
 BwcfPgUUT45mUtAqX1ARyjBkRlztj3Wwsno6HiO6C+o7j+n7UyjflLcYflJ6PovDe9ex
 b4WJp5mTkpULhao3BFjo6tyMrYwOgPT75aZPCkEeL5mn+0Eiozt+54WPIzOs7qV0UeH5
 /Ekg==
X-Gm-Message-State: AJIora/349Z4p/bL7tq4DFYO02twVCunR9tr/X+Wd+GDUwByvVykIOOZ
 9HfwgJz5HU79wA/vFOk8imE=
X-Google-Smtp-Source: AGRyM1tIpJnQa5BX/f8539g3QLYRp6mF0vyZqnzqL6K6QRnlTehgAL0NDtRxEn90pRtF68ECzI7awQ==
X-Received: by 2002:a05:6e02:1565:b0:2dc:dee5:c8a9 with SMTP id
 k5-20020a056e02156500b002dcdee5c8a9mr3426436ilu.71.1658126331093; 
 Sun, 17 Jul 2022 23:38:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Date: Mon, 18 Jul 2022 00:36:11 -0600
Message-Id: <20220718063641.9179-28-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:48 +0000
Subject: [Nouveau] [PATCH v3 25/39] drm_print: refine drm_debug_enabled for
 jump-label
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

In order to use dynamic-debug's jump-label optimization in drm-debug,
its clarifying to refine drm_debug_enabled into 3 uses:

1.   drm_debug_enabled - legacy, public
2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
3.  _drm_debug_enabled - pr_debug instrumented, observable

1. The legacy version always checks the bits.

2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
early return unless the category is enabled.  For dyndbg builds, debug
callsites are selectively "pre-enabled", so __drm_debug_enabled()
short-circuits to true there.  Remaining callers of 1 may be able to
use 2, case by case.

3. is 1st wrapped in a macro, with a pr_debug, which reports each
usage in /proc/dynamic_debug/control, making it observable in the
logs.  The macro lets the pr_debug see the real caller, not an inline
function.

When plugged into 1, 3 identified ~10 remaining callers of the
function, leading to the follow-on cleanup patch, and would allow
activating the pr_debugs, estimating the callrate, and the potential
savings by using the wrapper macro.  It is unused ATM, but it fills
out the picture.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  4 ++--
 include/drm/drm_print.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 21b416af0be2..effb95b3c2bf 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -285,7 +285,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -308,7 +308,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f8bb3e7158c6..3c16b00b6d21 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -321,11 +321,39 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+/*
+ * 3 name flavors of drm_debug_enabled:
+ *   drm_debug_enabled - public/legacy, always checks bits
+ *  _drm_debug_enabled - instrumented to observe call-rates, est overheads.
+ * __drm_debug_enabled - privileged - knows jump-label state, can short-circuit
+ */
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
 }
 
+/*
+ * Wrap fn in macro, so that the pr_debug sees the actual caller, not
+ * the inline fn.  Using this name creates a callsite entry / control
+ * point in /proc/dynamic_debug/control.
+ */
+#define _drm_debug_enabled(category)				\
+	({							\
+		pr_debug("todo: maybe avoid via dyndbg\n");     \
+		drm_debug_enabled(category);			\
+	})
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+/*
+ * dyndbg is wrapping the drm.debug API, so as to avoid the runtime
+ * bit-test overheads of drm_debug_enabled() in those api calls.
+ * In this case, executed callsites are known enabled, so true.
+ */
+#define __drm_debug_enabled(category)	true
+#else
+#define __drm_debug_enabled(category)	drm_debug_enabled(category)
+#endif
+
 /*
  * struct device based logging
  *
-- 
2.36.1

