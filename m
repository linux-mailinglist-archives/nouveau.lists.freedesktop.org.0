Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA34449D196
	for <lists+nouveau@lfdr.de>; Wed, 26 Jan 2022 19:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DE010E5C0;
	Wed, 26 Jan 2022 18:21:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1F089E59;
 Wed, 26 Jan 2022 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189988; x=1674725988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KcRtycUl4lDfGh110lR4XASfjxvG1FP1xhGR1aDDOAA=;
 b=PU2lSpTH4Jxo20A5ScDL5pHTrTTsqIpsypv05LFpK+HDHL7LQpFL6ip+
 MbMuekP0YZIr/BiSPpjPXCzhnVFyJmyedSnQ7CL6sIm3eIuVHee8vYmAi
 PAnzXaUUEaGckofJnc0hX1mIC9xVeUMTG0eYeyvGu/PD4KZ/n0BkE1rTa
 iccbe6/mDgx37tITfuFuJ1oFuuUTwCHhFKmWaJryef/x73RqQtZTE0t90
 dAKcQYBAQn3z95HsQGCq39ByVhq8/lHZ9AjE/ohbZZS/YR1KY+8HeSt47
 R9mm2Abp6wpxR/uwZT2yW5WgsHgk+hiQwb/MLppW/1tppfWXKf5M9xdol Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246293754"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246293754"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433109"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Wed, 26 Jan 2022 01:39:50 -0800
Message-Id: <20220126093951.1470898-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 18:21:14 +0000
Subject: [Nouveau] [PATCH v2 10/11] tomoyo: Use str_yes_no()
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
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove the local yesno() implementation and adopt the str_yes_no() from
linux/string_helpers.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 security/tomoyo/audit.c  |  2 +-
 security/tomoyo/common.c | 19 +++++--------------
 security/tomoyo/common.h |  1 -
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/security/tomoyo/audit.c b/security/tomoyo/audit.c
index d79bf07e16be..023bedd9dfa3 100644
--- a/security/tomoyo/audit.c
+++ b/security/tomoyo/audit.c
@@ -166,7 +166,7 @@ static char *tomoyo_print_header(struct tomoyo_request_info *r)
 		       "#%04u/%02u/%02u %02u:%02u:%02u# profile=%u mode=%s granted=%s (global-pid=%u) task={ pid=%u ppid=%u uid=%u gid=%u euid=%u egid=%u suid=%u sgid=%u fsuid=%u fsgid=%u }",
 		       stamp.year, stamp.month, stamp.day, stamp.hour,
 		       stamp.min, stamp.sec, r->profile, tomoyo_mode[r->mode],
-		       tomoyo_yesno(r->granted), gpid, tomoyo_sys_getpid(),
+		       str_yes_no(r->granted), gpid, tomoyo_sys_getpid(),
 		       tomoyo_sys_getppid(),
 		       from_kuid(&init_user_ns, current_uid()),
 		       from_kgid(&init_user_ns, current_gid()),
diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index 5c64927bf2b3..ff17abc96e5c 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -8,6 +8,7 @@
 #include <linux/uaccess.h>
 #include <linux/slab.h>
 #include <linux/security.h>
+#include <linux/string_helpers.h>
 #include "common.h"
 
 /* String table for operation mode. */
@@ -174,16 +175,6 @@ static bool tomoyo_manage_by_non_root;
 
 /* Utility functions. */
 
-/**
- * tomoyo_yesno - Return "yes" or "no".
- *
- * @value: Bool value.
- */
-const char *tomoyo_yesno(const unsigned int value)
-{
-	return value ? "yes" : "no";
-}
-
 /**
  * tomoyo_addprintf - strncat()-like-snprintf().
  *
@@ -730,8 +721,8 @@ static void tomoyo_print_config(struct tomoyo_io_buffer *head, const u8 config)
 {
 	tomoyo_io_printf(head, "={ mode=%s grant_log=%s reject_log=%s }\n",
 			 tomoyo_mode[config & 3],
-			 tomoyo_yesno(config & TOMOYO_CONFIG_WANT_GRANT_LOG),
-			 tomoyo_yesno(config & TOMOYO_CONFIG_WANT_REJECT_LOG));
+			 str_yes_no(config & TOMOYO_CONFIG_WANT_GRANT_LOG),
+			 str_yes_no(config & TOMOYO_CONFIG_WANT_REJECT_LOG));
 }
 
 /**
@@ -1354,8 +1345,8 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
 	case 3:
 		if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
 			tomoyo_io_printf(head, " grant_log=%s",
-					 tomoyo_yesno(cond->grant_log ==
-						      TOMOYO_GRANTLOG_YES));
+					 str_yes_no(cond->grant_log ==
+						    TOMOYO_GRANTLOG_YES));
 		tomoyo_set_lf(head);
 		return true;
 	}
diff --git a/security/tomoyo/common.h b/security/tomoyo/common.h
index 85246b9df7ca..ca285f362705 100644
--- a/security/tomoyo/common.h
+++ b/security/tomoyo/common.h
@@ -959,7 +959,6 @@ char *tomoyo_read_token(struct tomoyo_acl_param *param);
 char *tomoyo_realpath_from_path(const struct path *path);
 char *tomoyo_realpath_nofollow(const char *pathname);
 const char *tomoyo_get_exe(void);
-const char *tomoyo_yesno(const unsigned int value);
 const struct tomoyo_path_info *tomoyo_compare_name_union
 (const struct tomoyo_path_info *name, const struct tomoyo_name_union *ptr);
 const struct tomoyo_path_info *tomoyo_get_domainname
-- 
2.34.1

