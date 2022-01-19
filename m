Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BE4953FA
	for <lists+nouveau@lfdr.de>; Thu, 20 Jan 2022 19:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39AF10E63D;
	Thu, 20 Jan 2022 18:16:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEA010E18C;
 Wed, 19 Jan 2022 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642577067; x=1674113067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D8Hcj6/0idCaGqbYLAjOwo8mGw2XLo6q3lh1A6mM9gI=;
 b=VD0HKivQ+g/aP/dYr6XIscnvTqiDjRpua+QDcUwsPnE/8itfG6sCdJGv
 61iBIG2A3cbXQnH0gzuydaT2rwmuhzQ7DSmGOVEWpzkX6j6u3WEnAyufQ
 JG3opJ7UNv0xz5w8sljT+ak6LtUzSDfrftaQ1eTdIG7wxd+pCUqeYr6w8
 AVqBi0K2HvJn6R6ExY2q/lowWjHa799NjSk6Sh502nvzIYGCOEJJZwAjZ
 LiFyPCHOjXo/h9XfUQPsPC5aYMD75q8ozwoY8zl8PZYpycfdDsDbffAlD
 kYZ/T50jHuAGNFolsX1XrmScpaA0wE7LKKb5mRo5fH6s2ne7lI3dElRAf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244799930"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="244799930"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:24:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="530544508"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:24:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Tue, 18 Jan 2022 23:24:49 -0800
Message-Id: <20220119072450.2890107-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119072450.2890107-1-lucas.demarchi@intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jan 2022 18:16:51 +0000
Subject: [Nouveau] [PATCH 2/3] lib/string_helpers: Add helpers for
 enable[d]/disable[d]
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Follow the yes/no logic and add helpers for enabled/disabled and
enable/disable - those are not so common throughout the kernel,
but they give a nice way to reuse the strings to log things as
enabled/disabled or enable/disable.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_utils.h | 10 ----------
 include/linux/string_helpers.h    |  2 ++
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 2a8781cc648b..cbec79bae0d2 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -419,16 +419,6 @@ static inline const char *onoff(bool v)
 	return v ? "on" : "off";
 }
 
-static inline const char *enabledisable(bool v)
-{
-	return v ? "enable" : "disable";
-}
-
-static inline const char *enableddisabled(bool v)
-{
-	return v ? "enabled" : "disabled";
-}
-
 void add_taint_for_CI(struct drm_i915_private *i915, unsigned int taint);
 static inline void __add_taint_for_CI(unsigned int taint)
 {
diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index e980dec05d31..e4b82f364ee1 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -103,5 +103,7 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 void kfree_strarray(char **array, size_t n);
 
 static inline const char *yesno(bool v) { return v ? "yes" : "no"; }
+static inline const char *enabledisable(bool v) { return v ? "enable" : "disable"; }
+static inline const char *enableddisabled(bool v) { return v ? "enabled" : "disabled"; }
 
 #endif
-- 
2.34.1

